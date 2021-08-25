<?php

namespace Emergence\People;

use DB;
use HandleBehavior;

class User extends Person implements IUser
{
    public static $minPasswordLength = 5;
    public static $usernameGenerator = 'flast';
    public static $onPasswordSet;

    public static $classLabel = 'User';

    public static $defaultClass = __CLASS__;
    public static $subClasses = array(__CLASS__);
    public static $singularNoun = 'user';
    public static $pluralNoun = 'users';

    // ActiveRecord configuration
    public static $fields = array(
        'Username' => array(
            'unique' => true
            ,'includeInSummary' => true
        )
        ,'Password' => array(
            'type' => 'string'
            ,'excludeFromData' => true
        )
        ,'AccountLevel' => array(
            'type' => 'enum'
            ,'values' => array('Disabled','Contact','User','Staff','Administrator','Developer')
            ,'default' => 'User'
        )
    );

    public static $searchConditions = array(
        'Username' => array(
            'qualifiers' => array('any','username','uname','user')
            ,'points' => 3
            ,'sql' => 'Username LIKE "%%%s%%"'
        )
        ,'AccountLevel' => array(
            'qualifiers' => array('accountlevel')
            ,'points' => 2
            ,'sql' => 'AccountLevel LIKE "%%%s%%"'
        )
    );

    public static $validators = array(
        'Username' => array(
            'validator' => 'handle'
            ,'required' => true
            ,'errorMessage' => 'Username can only contain letters, numbers, hyphens, and underscores.'
        )
        ,'AccountLevel' => array(
            'validator' => 'selection'
            ,'choices' => array() // filled dynamically in __classLoaded
            ,'required' => false
        )
    );

    public static $dynamicFields = [];

    public static function __classLoaded()
    {
        // merge User classes into valid Person classes, but not again when child classes are loaded
        if (get_called_class() == __CLASS__) {
            Person::$subClasses = static::$subClasses = array_merge(Person::$subClasses, static::$subClasses);
            self::$validators['AccountLevel']['choices'] = self::$fields['AccountLevel']['values'];
        }

        // finish ActiveRecord initialization
        parent::__classLoaded();
    }

    function getValue($name)
    {
        switch ($name) {
            case 'AccountLevelNumeric':
                return static::_getAccountLevelIndex($this->AccountLevel);
            case 'Handle':
                return $this->Username;
            default:
                return parent::getValue($name);
        }
    }

    public function validate($deep = true)
    {
        // call parent
        parent::validate($deep);

        // disallow 'system' username
        if ($this->isFieldDirty('Username') && strtolower($this->Username) === 'system') {
            $this->_validator->addError('Username', "Username 'system' is forbidden");
        }

        // check username uniqueness
        if ($this->isDirty && !$this->_validator->hasErrors('Username') && $this->Username) {
            $ExistingUser = static::getByUsername($this->Username);

            if ($ExistingUser && ($ExistingUser->ID != $this->ID)) {
                $this->_validator->addError('Username', 'Username already registered.');
            }
        }

        // save results
        return $this->finishValidation();
    }

    public function save($deep = true)
    {
        // generate user name if none provided
        if (!$this->Username) {
            $this->Username = static::getUniqueUsername($this->FirstName, $this->LastName);
        }

        // generate password if none provided
        if (!$this->Password) {
            $this->setClearPassword(static::generatePassword());
        }

        return parent::save($deep);
    }

    public function getTitle()
    {
        return sprintf('%s (%s)', $this->Username, $this->AccountLevel);
    }

    public function getHandle()
    {
        return $this->Username;
    }

    public static function getByHandle($handle)
    {
        return static::getByUsername($handle);
    }

    // enable login by email
    public static function getByLogin($username, $password)
    {
        $User = static::getByUsername($username);

        if ($User && is_a($User, __CLASS__) && $User->hasAccountLevel('User') && $User->verifyPassword($password)) {
            return $User;
        } else {
            return null;
        }
    }

    public static function getByUsername($username)
    {
        if (static::fieldExists('Email')) {
            return static::getByWhere(array(
                sprintf('`%2$s` = "%1$s" OR `%3$s` = "%1$s"', DB::escape($username), static::_cn('Username'), static::_cn('Email'))
            ));
        } else {
            return static::getByField('Username', $username);
        }
    }

    public function verifyPassword($password)
    {
        if ($this->Password[0] == '$') {
            return password_verify($password, $this->Password);
        } elseif (SHA1($password) == $this->Password) {
            $wasDirty = $this->isDirty;
            $this->setClearPassword($password);

            if (!$wasDirty) {
                $this->save();
            }

            return true;
        }

        return false;
    }

    public function setClearPassword($password)
    {
        $this->Password = password_hash($password, PASSWORD_DEFAULT);

        if (is_callable(static::$onPasswordSet)) {
            call_user_func(static::$onPasswordSet, $password, $this);
        }
    }

    public function hasAccountLevel($accountLevel)
    {
        $accountLevelIndex = static::_getAccountLevelIndex($accountLevel);

        if ($accountLevelIndex === false) {
            return false;
        } else {
            return ($this->AccountLevelNumeric >= $accountLevelIndex);
        }
    }

    public static function getUniqueUsername($firstName, $lastName, $options = array())
    {
        // apply default options
        $options = array_merge(
            array('suffixFormat' => '%s%u'),
            is_string(static::$usernameGenerator) || is_callable(static::$usernameGenerator) ? array('format' => static::$usernameGenerator) : static::$usernameGenerator,
            $options,
            array('handleField' => 'Username')
        );

        // create seed username
        switch ($options['format']) {
            case 'flast':
                $username = $firstName[0].$lastName;
                break;
            case 'firstl':
                $username = $firstName.$lastName[0];
                break;
            case 'first.last':
                $username = $firstName.'.'.$lastName;
                break;
            default:
                if (is_callable($options['format'])) {
                    $username = call_user_func($options['format'], $firstName, $lastName, $options);
                } else {
                    throw new Exception ('Unknown format format.');
                }
        }

        // use HandleBehavior to transform characters and guarantee uniqueness
        return HandleBehavior::getUniqueHandle(get_called_class(), $username, $options);
    }

    protected static function _getAccountLevelIndex($accountLevel)
    {
        return array_search($accountLevel, self::$fields['AccountLevel']['values']);
    }

    protected static function generatePassword($length = 8)
    {
        $chars = array('2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'j', 'k', 'm', 'n', 'p', 'q', 'r', 's' ,'t', 'u', 'v', 'w', 'x', 'y', 'z');
        $password = '';

        for ($i=0; $i<$length; $i++) {
           $password .= $chars[mt_rand(0, count($chars)-1)];
        }

        return $password;
    }
}