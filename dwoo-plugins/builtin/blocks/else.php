<?php

/**
 * Generic else block, it supports all builtin optional-display blocks which are if/for/foreach/loop/with.
 *
 * If any of those block contains an else statement, the content between {else} and {/block} (you do not
 * need to close the else block) will be shown if the block's condition has no been met
 *
 * Example :
 *
 * <code>
 * {foreach $array val}
 *   $array is not empty so we display it's values : {$val}
 * {else}
 *   if this shows, it means that $array is empty or doesn't exist.
 * {/foreach}
 * </code>
 *
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
class Dwoo_Plugin_else extends Dwoo_Block_Plugin implements Dwoo_ICompilable_Block
{
    public function init()
    {
    }

    public static function preProcessing(Dwoo_Compiler $compiler, array $params, $prepend, $append, $type)
    {
        $preContent = '';
        while (true) {
            $preContent .= $compiler->removeTopBlock();
            $block = &$compiler->getCurrentBlock();
            if (!$block) {
                throw new Dwoo_Compilation_Exception($compiler, 'An else block was found but it was not preceded by an if or other else-able construct');
            }
            $interfaces = class_implements($block['class'], false);
            if (in_array('Dwoo_IElseable', $interfaces) !== false) {
                break;
            }
        }

        $params['initialized'] = true;
        $compiler->injectBlock($type, $params);

        return $preContent;
    }

    public static function postProcessing(Dwoo_Compiler $compiler, array $params, $prepend, $append, $content)
    {
        if (!isset($params['initialized'])) {
            return '';
        }

        $block = &$compiler->getCurrentBlock();
        $block['params']['hasElse'] = Dwoo_Compiler::PHP_OPEN."else {\n".Dwoo_Compiler::PHP_CLOSE.$content.Dwoo_Compiler::PHP_OPEN."\n}".Dwoo_Compiler::PHP_CLOSE;

        return '';
    }
}
