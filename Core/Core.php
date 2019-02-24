<?php
/**
 * Created by MarxMedia Solutions.
 *    Author: Kevin Marques
 *    Date: 25/09/2017 - 02:08
 *      File: Core.php
 *        Acctos
 */
//namespace Core;

/**
 * @internal IMPORTANTE: ESTA PÁGINA ESTA SENDO INCLUIDA NO INIT.PHP
 *
 */
#Remova essa linha se as classes são carregadas por um autoload

use Modules\Language;
use \Modules\Access;

function _tr($language_text = NULL) {
    $Language = new Language();
    $dataReturn = $Language->_($language_text);
    return $dataReturn;
}

?>
