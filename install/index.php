<?php

/**
 * Created by MarxMedia.
 * Author: Kevin Marques
 * Date: 05/09/2018 - 08:16
 * Grh : index.php
 */
session_start();

use Modules\Template\Template;

include "../AppRoot.php";
include "../Templates/symbolic_link.php";
include "../Core/Assembly.inc";
include "../Core/DefSet.php";
include "../Core/Engine.module";
include "../Core/Core.php";
include "../install/Installer.inc";
if (file_exists("../" . CONFIG_FILE_NAME)) {
    header("Location: " . WWW_PATH);
}

$engine = new Engine();
$engine->autoLoad();
$installer = new \Grh\System\Installer\Installer();
$parser = [];
$parser['title'] = 'Instalação GRH';
$parser['linkroot'] = ROOT_LINK;
$parser['content'] = '';
$parser['welcome_installer'] = 'Bem-Vindo ao Sistema de Instalação ';
$parser['follow_steps_to_proceed'] = "Siga os passos orientados para prosseguir com instalação do sistema!";
$parser['li_steps'] = '<li class="_{step_1}">Passo 1</li><li class="_{step_2}">Passo 2</li><li class="_{step_3}">Passo 3</li><li class="_{step_end}">Concluído</li>';
//Lock Vars



switch ($_GET['level1']) {
    case 'concluido':
    case 'Concluido':
    $installer->moveToCurrentStep(3,5,ROOT_LINK . "/Installer/Passo-3",WWW_PATH);
        $parser['step_end'] = 'active';
        $stp = [];
        $stp['linkroot'] = ROOT_LINK . "/Installer";
        $stp['linkroot_system'] = WWW_PATH;
        $step04 = new Template(APP_ROOT . "/Templates/installer/complete.tpl", $stp, true, true);
        $parser['content'] .= $step04->showTemplate();
        $installer->setCurrentStep(0);
        break;
    case 'step-3':
    case 'Passo-3':
    case 'passo-3':
        $installer->moveToCurrentStep(2,4,ROOT_LINK . "/Installer/Passo-2",ROOT_LINK . "/Installer/Concluido");
        //Passo padrão passo 3
        $parser['step_3'] = 'active';
        $stp = [];
        $datasend = [];
        $datasend['url'] = ROOT_LINK . "/setup/03";
        $datasend['post'] = "POST";
        $stp['data_send'] = "data-send='" . base64_encode(json_encode($datasend)) . "'";
        $stp['linkroot'] = ROOT_LINK . "/Installer";
        $step03 = new Template(APP_ROOT . "/Templates/installer/step3.tpl", $stp, true, true);
        $parser['content'] .= $step03->showTemplate();
        break;
    case 'step-2':
    case 'Passo-2':
    case 'passo-2':
        //Passo padrão passo 2
        $installer->moveToCurrentStep(1,3,ROOT_LINK . "/Installer/Passo-1",ROOT_LINK . "/Installer/Passo-3");
        $parser['step_2'] = 'active';
        $stp = [];
        $datasend = [];
        $datasend['url'] = ROOT_LINK . "/setup/02";
        $datasend['post'] = "POST";
        $stp['data_send'] = "data-send='" . base64_encode(json_encode($datasend)) . "'";
        $stp['linkroot'] = ROOT_LINK . "/Installer";
        $step02 = new Template(APP_ROOT . "/Templates/installer/step2.tpl", $stp, true, true);
        $parser['content'] .= $step02->showTemplate();
        break;
    case 'Passo-1':
        $installer->moveToCurrentStep(0,2,ROOT_LINK . "/Installer",ROOT_LINK . "/Installer/Passo-2");
        $installer->grantInstall();
        $parser['step_1'] = 'active';
        $stp = [];
        $datasend = [];
        $datasend['url'] = ROOT_LINK . "/setup/01";
        $datasend['post'] = "POST";
        $stp['data_send'] = "data-send='" . base64_encode(json_encode($datasend)) . "'";
        $stp['linkroot'] = ROOT_LINK . "/Installer";
        $step01 = new Template(APP_ROOT . "/Templates/installer/step1.tpl", $stp, true, true);
        $parser['content'] .= $step01->showTemplate();
        break;
    default:
        //Passo padrão passo 1
        $installer->controlDefault();
        break;
}


$templates = new Template(APP_ROOT . "/Templates/installer/installer.tpl", $parser, true, true);
echo $templates->showTemplate();

?>