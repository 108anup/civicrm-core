<?php
/*
 +--------------------------------------------------------------------+
 | CiviCRM version 4.4                                                |
 +--------------------------------------------------------------------+
 | Copyright CiviCRM LLC (c) 2004-2013                                |
 +--------------------------------------------------------------------+
 | This file is a part of CiviCRM.                                    |
 |                                                                    |
 | CiviCRM is free software; you can copy, modify, and distribute it  |
 | under the terms of the GNU Affero General Public License           |
 | Version 3, 19 November 2007 and the CiviCRM Licensing Exception.   |
 |                                                                    |
 | CiviCRM is distributed in the hope that it will be useful, but     |
 | WITHOUT ANY WARRANTY; without even the implied warranty of         |
 | MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.               |
 | See the GNU Affero General Public License for more details.        |
 |                                                                    |
 | You should have received a copy of the GNU Affero General Public   |
 | License and the CiviCRM Licensing Exception along                  |
 | with this program; if not, contact CiviCRM LLC                     |
 | at info[AT]civicrm[DOT]org. If you have questions about the        |
 | GNU Affero General Public License or the licensing of CiviCRM,     |
 | see the CiviCRM license FAQ at http://civicrm.org/licensing        |
 +--------------------------------------------------------------------+
*/

/**
 *
 * @package CRM
 * @copyright CiviCRM LLC (c) 2004-2013
 *
 * Generated from {$table.sourceFile}
 * {$generated}
 */

namespace {$table.namespace};

require_once 'Civi/Core/Entity.php';

use Doctrine\ORM\Mapping as ORM;
use Civi\API\Annotation as CiviAPI;
use Civi\Core\Annotations\Field as Field;
use JMS\Serializer\Annotation as JMS;

/**
 * {$table.className}
 *
 * @CiviAPI\Entity("{$table.className}")
 * @CiviAPI\Permission()
 * {$table.tableInfo}
 * @ORM\Entity
 *
 */
class {$table.className} extends \Civi\Core\Entity {ldelim}

  /**
   * @var integer
   *
   * @JMS\Type("integer")
   * @ORM\Column(name="id", type="integer", nullable=false, options={ldelim}"unsigned":true{rdelim} )
   * @ORM\Id
   * @ORM\GeneratedValue(strategy="AUTO")
   */
  private $id;
{foreach from=$table.fields item=field}
  {if $field.name eq 'id'}{continue}{/if}

  /**
   * @var {$field.columnType}
   *
   * {$field.jmsType}
   * {$field.columnInfo}
{if $field.fieldAnnotation}
   * {$field.fieldAnnotation}
{/if}
   * {$field.columnJoin}
   */
  private ${$field.propertyName}{if isset($field.default)} = '{$field.default}'{/if};
{/foreach}

  /**
   * Get id
   *
   * @return integer
   */
  public function getId() {ldelim}
    return $this->id;
  {rdelim}
{foreach from=$table.fields item=field}
  {if $field.name eq 'id'}{continue}{/if}

  /**
   * Set {$field.propertyName}
   *
   * @param {$field.columnType} ${$field.propertyName}
   * @return {$table.className}
   */
  public function set{$field.functionName}({$field.setFunctionInput}) {ldelim}
    $this->{$field.propertyName} = ${$field.propertyName};
    return $this;
  {rdelim}

  /**
   * Get {$field.propertyName}
   *
   * @return {$field.columnType}
   */
  public function get{$field.functionName}() {ldelim}
    return $this->{$field.propertyName};
  {rdelim}
{/foreach}

  /**
   * returns all the column names of this table
   *
   * @access public
   * @return array
   */
  public static $_fields = NULL;

  static function &fields( ) {ldelim}
    if ( !self::$_fields) {ldelim}
      self::$_fields = array (
{foreach from=$table.fields item=field}
{if $field.uniqueName}
        '{$field.uniqueName}' => array(
{else}
        '{$field.name}' => array(
{/if}
          'name' => '{$field.name}',
          'propertyName' => '{$field.propertyName}',
          'type' => {$field.crmType},
{if $field.title}
          'title' => ts('{$field.title}'),
{/if}
{if $field.required}
          'required' => {$field.required},
{/if}
{if $field.length}
          'maxlength' => {$field.length},
{/if}
{if $field.precision}
          'precision' => array({$field.precision}),
{/if}
{if $field.size}
          'size' => {$field.size},
{/if}
{if $field.rows}
          'rows' => {$field.rows},
{/if}
{if $field.cols}
          'cols' => {$field.cols},
{/if}
{if $field.import}
          'import' => {$field.import},
          'where' => '{$table.name}.{$field.name}',
          'headerPattern' => '{$field.headerPattern}',
          'dataPattern' => '{$field.dataPattern}',
{/if}
{if $field.export}
          'export' => {$field.export},
{if ! $field.import}
          'where' => '{$table.name}.{$field.name}',
          'headerPattern' => '{$field.headerPattern}',
          'dataPattern' => '{$field.dataPattern}',
{/if}
{/if}
{if $field.rule}
          'rule' => '{$field.rule}',
{/if}
{if $field.default}
          'default' => '{if ($field.default[0]=="'" or $field.default[0]=='"')}{$field.default|substring:1:-1}{else}{$field.default}{/if}',
{/if}
{if $field.FKClassName}
          'FKClassName' => '{$field.FKClassName}',
{/if}
{if $field.html}
          'html' => array(
{foreach from=$field.html key=htmlKey item=htmlValue}
            '{$htmlKey}' => '{$htmlValue}',
{/foreach}
          ),
{/if}
{if $field.pseudoconstant}
{assign var=pseudoOptions value=$field.pseudoconstant}
          'pseudoconstant' => array(
{foreach from=$pseudoOptions key=optionKey item=optionValue}
            '{$optionKey}' => '{$optionValue}',
{/foreach}
          )
{/if}
{if $field.localizable}
          'localizable' => {$field.localizable},
{/if}
        ),
{/foreach}
      );
     {rdelim}
    return self::$_fields;
  {rdelim}
{rdelim}
