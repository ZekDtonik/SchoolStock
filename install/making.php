<?php
/**
 * Created by MarxMedia.
 * Author: Kevin Marques
 * Date: 05/09/2018 - 13:51
 * Grh : making.php
 */
session_start();
include "../Templates/symbolic_link.php";
include "../AppRoot.php";
include "../Core/Assembly.inc";
include "../Core/DefSet.php";
include "../Core/Engine.module";
include "../Core/Core.php";
include "Installer.inc";


$installer = new \Grh\System\Installer\Installer();
switch ($_GET['level1']){
    case '03':
        if($installer->checkGrantInstall()){
            $installer->controlStep03();
        }
        break;
    case '02':
        if($installer->checkGrantInstall()){
            $installer->controlStep02();
        }
        break;
    case '01':
        if($installer->checkGrantInstall()){
            $installer->controlStep01();
        }
        break;
    default:

        break;
}
?>