<?php

/**
 * Truncates a string at the given length
 * <pre>
 *  * value : text to truncate
 *  * length : the maximum length for the string
 *  * etc : the characters that are added to show that the string was cut off
 *  * break : if true, the string will be cut off at the exact length, instead of cutting at the nearest space
 *  * middle : if true, the string will contain the beginning and the end, and the extra characters will be removed from the middle
 * </pre>
 * This software is provided 'as-is', without any express or implied warranty.
 * In no event will the authors be held liable for any damages arising from the use of this software.
 *
 * @author     Jordi Boggiano <j.boggiano@seld.be>
 * @author     David Sanchez <david38sanchez@gmail.com>
 * @copyright  2008-2013 Jordi Boggiano
 * @copyright  2013-2016 David Sanchez
 * @license    http://dwoo.org/LICENSE   Modified BSD License
 *
 * @link       http://dwoo.org/
 *
 * @version    1.2.3
 * @date       2016-10-15
 */
function Dwoo_Plugin_truncate(Dwoo_Core $dwoo, $value, $length = 80, $etc = '...', $break = false, $middle = false)
{
    if ($length == 0) {
        return '';
    }

    $value = (string) $value;
    $etc = (string) $etc;
    $length = (int) $length;

    if (strlen($value) < $length) {
        return $value;
    }

    $length = max($length - strlen($etc), 0);
    if ($break === false && $middle === false) {
        $value = preg_replace('#\s+(\S*)?$#', '', substr($value, 0, $length + 1));
    }
    if ($middle === false) {
        return substr($value, 0, $length).$etc;
    }

    return substr($value, 0, ceil($length / 2)).$etc.substr($value, -floor($length / 2));
}
