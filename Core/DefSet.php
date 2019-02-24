<?php
/**
 * Created by MarxMedia.
 * Author: Kevin Marques
 * Date: 13/06/2018 - 11:26
 * Grh : DefSet.php
 */

define("DS", "/");

define("APP_RROOT", $_SERVER["REQUEST_URI"]);
define("WWW_PATH", "/App/");
define("__DefaultLanguage", "pt-BR");
define("__Language_path", "Languages/");
define("__SETTINGS","settings");
define("__SYSTEM","system");
define("__INTIME","users_online");
define("__USERS","users");
define("__CREDENTIALS","credentials");


define("_system_index","system");
define("_system","/system");
define("_profile","Profile");
define("_page",isset($_GET['page']) ? $_GET['page'] : '');
define("_level1",isset($_GET['level1']) ? $_GET['level1'] : '');
define("_level2",isset($_GET['level2']) ? $_GET['level2'] : '');
define("_level3",isset($_GET['level3']) ? $_GET['level3'] : '');
define("_level4",isset($_GET['level4']) ? $_GET['level4'] : '');
define("_level5",isset($_GET['level5']) ? $_GET['level5'] : '');

//CONFIGURAÇÕES GLOBAIS PADRÃO
define("_MDPREFIX","SchoolStock - ");
define("_EXPIRE_LOGIN_TIME",360);
define("pg_home","Home");
//Definições de pastas
define("_EMPLOYEE_MEDIA_PLACE",APP_ROOT.DS."Documents/photos/");
define("_EMPLOYEE_DOCS_PLACE",APP_ROOT.DS."Documents/");
define("_USER_MEDIA_PLACE",APP_ROOT.DS."assets/imgs/photos/");
define("WWW_PATH_PLACE",ROOT_LINK.DS."assets/imgs/photos/");
?>