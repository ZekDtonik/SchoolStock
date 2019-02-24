<?php
/**
 *    Created by DevWolf.
 *   Author: Kevin Marques
 *   Date: 25/03/2018 - 15:47
 */

namespace Main;


class Assembly
{
    protected $Configs = [];
    private $ConfigDefsDefault = [];
    private $useSession;

    public function useSession(){return $this->useSession;}
    public function __construct($useSession = false, $forceSessionUpdate = false){
        self::checkInstalled();
        $this->useSession = $useSession;

        $this->ConfigDefsDefault['crypt_on'] = 'false';
        $this->ConfigDefsDefault['username'] = 'root';
        $this->ConfigDefsDefault['password'] = 'root';
        $this->ConfigDefsDefault['hostname'] = '127.0.0.1';
        $this->ConfigDefsDefault['port'] = '3306';
        $this->ConfigDefsDefault['database'] = 'ejdb';
        $this->ConfigDefsDefault['typedb'] = 'MySql';
        $this->ConfigDefsDefault['sessionexpiretime'] = '15';
        $this->ConfigDefsDefault['logfile'] = 'system_log';

        $ConfDefined = [];
        $this->getConfigFile($ConfDefined);
        if($useSession) {
            //Atribui as configurações a sessão se a variavel de sessão nao existir ou forçamento ativado
            if (!isset($_SESSION['configs']) || isset($_SESSION['configs']) && $forceSessionUpdate == true) {
                self::createLog("As definições foram recarregadas forçadamente",1);
                $this->getConfigFile($_SESSION['configs']);
            }
            //Atribui a variavel sessão as Configs
            $this->Configs = $_SESSION['configs'];
        }
        else{
            //Define diretamente caso não utilização de sessões
            $this->getConfigFile($this->Configs);
        }

    }

    public function setConfigFile($arrayData ='', $modWrite = 'a',$prefixFile =''){
        $fileName =$prefixFile."Configs/config.cfg";
        if(file_exists($prefixFile."Configs/")){
            chmod($prefixFile."Configs/",0774);
            chmod($fileName,0774);
        }

        $dirname = dirname($fileName);
        $folderCreated = true;
        if(!is_dir($dirname)){
            $folderCreated = mkdir($dirname,0755,true);
        }
        if($folderCreated){
            if(empty($arrayData))
                $arrayLook =$this->ConfigDefsDefault;
            else
                $arrayLook = $arrayData;

            $fMount = fopen($fileName,$modWrite);
            if($fMount != false){
                $Comment = "##############################################################\r\n";
                $Comment.= "#          Arquivo padrão de configurações de Sistema        #\r\n";
                $Comment.= "#                Created by: Kevin Marques                   #\r\n";
                $Comment.= "#         Mantenha o padrão de definição de configuração     #\r\n";
                $Comment.= "# @Nomeclatura nomeDaConfiguração=ValorEspecificado          #\r\n";
                $Comment.= "# A má escrita deste arquivo acarretará na ñ funcionalidade  #\r\n";
                $Comment.= "# Do sistema. Os valores atribuidos são diretamente usados   #\r\n";
                $Comment.= "# na definição de funcinamento. CUIDADO!                     #\r\n";
                $Comment.= "# Caso não saiba o que definir, apague o arquivo config.cfg  #\r\n";
                $Comment.= "##############################################################\r\n";
                fwrite($fMount,$Comment);
                foreach ($arrayLook as $varName => $value) {
                    $StringStreamToSave = $varName." = ".$value."\r\n";
                    fwrite($fMount,$StringStreamToSave);
                }
                fclose($fMount);
                self::createLog("File Configs Created",0);
                return true;
            }
            else{
                return false;
            }
        }
        else{
            self::createLog("Impossivel criar arquivo de configuração",0);
            return false;
        }
    }
    public function getConfigFile(&$arrayData){
        $fileName ="Configs/config.cfg";
        if(file_exists($fileName)){
            $arraChumk = file($fileName,FILE_SKIP_EMPTY_LINES);
            $arrayFormatted = [];
            foreach ($arraChumk as $varValue ){
                if(preg_match("/^[a-z0-9_\-]+ ?= ?[a-z0-9., ]+/i",$varValue)){
                    $tempStreamIO = explode("=",trim($varValue));
                    $arrayFormatted[trim(strtolower($tempStreamIO[0]))] =trim($tempStreamIO[1]);
                }
            }
            $arrayData = $arrayFormatted;
        }
        //else{
            //self::setConfigFile($fileName);
            //self::getConfigFile($arrayData);
        //}
    }
    public function getCfg($cfgNameParameter){

        $cfgName = trim($cfgNameParameter);
        if(empty($this->Configs[$cfgName])){
            if(empty($this->ConfigDefsDefault[$cfgName])){
                self::createLog("Tentativa de uso de configuração '".$cfgName."' não existente abortado! ",3);
                exit("Nome de Configuração Definida não existe!");
            }
            else{
                self::createLog("Valor '".$cfgName."' não encontrado nas configurações! Valor legado utilizado. Verifique suas Definições no arquivo de configurações!",1);
                return $this->ConfigDefsDefault[$cfgName];
            }
        }
        else{
            if($this->Configs[$cfgName] == '_empty_')
                return '';
            else
                return $this->Configs[$cfgName];
        }
    }
    public static function cfg($cfgNameParameter){

        $assembler = new Assembly();
        return $assembler->getCfg($cfgNameParameter);
    }
    public static function createLog($descrition,$tipo,$logfile =''){
        $extension = ".log";
        //Setando versao de config diramente para evitar loop Infinito
        $logUse = '';
        if(!empty($logfile))
            $logUse = $logfile;
        else{
            if (empty(self::$Configs['logfile']) && empty(self::$ConfigDefsDefault['logfile']))
                $logUse = 'system_log';
            else if(empty(self::$Configs['logfile']))
                $logUse = self::$ConfigDefsDefault['logfile'] ;
            else
                $logUse = self::$Configs['logfile'];
        }
        $fileName = "logs/".$logUse.$extension;
        $date = new \DateTime();
        //$date->setTimezone(new \DateTimeZone("America/Sao_Paulo"));
        $dt = $date->format("d/m/Y h:i");

        $preText = "INFO";
        if($tipo == 1)
            $preText = "AVISO";
        else if($tipo == 2)
            $preText = "ERRO";
        else if($tipo == 3)
            $preText = "FATAL";

        $StringToSave = $preText.": [".$dt."] - ".$descrition."\r\n";

        if(!file_exists($fileName)){
            $dirname = dirname($fileName);
            if(!is_dir($dirname)){
                mkdir($dirname,0755,true);
            }

            $fcreate = fopen($fileName,"w+",true);
            fclose($fcreate);
            $fMount = fopen($fileName,"a");
            $Comment = "##############################################################\r\n";
            $Comment.= "#          Arquivo de registro de eventos do Sistema         #\r\n";
            $Comment.= "#                Created by: Kevin Marques                   #\r\n";
            $Comment.= "##############################################################\r\n";
            fwrite($fMount,$Comment);
            fwrite($fMount,$StringToSave);
            fclose($fMount);
        }
        else{
            $fLogSave = fopen($fileName,"a+");
            fwrite($fLogSave,$StringToSave);
            fclose($fLogSave);
        }
    }
    public static function checkInstalled(){
        !defined("CONFIG_FILE_NAME") ? define("CONFIG_FILE_NAME","Configs/config.cfg"):null;
        $fileName = CONFIG_FILE_NAME;

        $fileCheck = file_exists($fileName);
        if(!$fileCheck){
            header("Location: ".ROOT_LINK."/Installer/");
        }
        return $fileCheck;
    }
}