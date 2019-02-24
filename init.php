<?php
/**
 * Created by AlbaFox.
 * Author: Kevin Marques
 * Date: 11/06/2018 - 11:30
 * Grh : init.php
 */

use Modules\Language;
#----------------------
#  *** Session Data ***
#----------------------
session_set_cookie_params(3600);
session_name("ShoolStock-Session");
session_start();
error_reporting(E_ALL);
#-----------------------------
#  *** Overall Definitions ***
#-----------------------------
//Observação: o dirname(__FILE__) define o link a partir
//do local do arquivo em que a função foi disparada
//Desta forma, esta constante deve
include "AppRoot.php";
include "Templates/symbolic_link.php";
include "Core/DefSet.php";
#----------------------
#  *** Assembly Data ***
#----------------------
include "Core/Assembly.inc";
$Assembly = new \Main\Assembly(true,true);
#----------------------
#  *** MySql Data ***
#----------------------
define("_APPHOST",$Assembly->getCfg('hostname'));
define("_APPPORT",$Assembly->getCfg('port'));
define("_APPDBASE",$Assembly->getCfg('database'));
define("_APPUSER",$Assembly->getCfg('username'));
define("_APPPWD",$Assembly->getCfg('password'));
define("_TYPEDB_",$Assembly->getCfg('typedb'));

//define("_APPHOST",'127.0.0.1');
//define("_APPPORT",3306);
//define("_APPDBASE",'grh');
//define("_APPUSER",'root');
//define("_APPPWD",'');
//define("_TYPEDB_",'MySql');


#-----------------------------
#  *** System Data About ***
#-----------------------------
define("__VERSION","1.0.0");
define("__COPY","AlbaFox Inc.");
define("__AUTHOR","Kevin M. Santana");
define("__LICENSE","proprietary");
#-----------------
#  *** Engine ***
#-----------------
include "Core/Engine.module";
$Engine = new Engine();
$Engine->autoLoad();
#-------------------
#  *** Language ***
#-------------------
$Language = new Language("Core/Modules");
//Atualmente, forçando a reconstrução da sessão de linguagem no desenvolvimento do app
#Em Escopo de Produção, definir forceActive para false ou remover a linha abaixo
$Language->setForceActive(true);
$Language->getContent();


include "Core/Core.php";

?>