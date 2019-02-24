<?php
/**
 * Created by MarxMedia.
 * Author: Kevin Marques
 * Date: 05/09/2018 - 14:02
 * Grh : Installer.inc
 */

namespace Grh\System\Installer;

include "../Core/Modules/Kernel/Class.System.module";

use Main\Assembly;
use Modules\CNN;
use Modules\System;
use PDO;
use PDOException;

class Installer
{
    private $session;
    private $host;
    private $user;
    private $passwd;
    private $database;
    private $port;
    private $noSec;
    private $logfile;
    private $expireTime;
    private $admin_user;
    private $admin_nome;
    private $admin_email;
    private $admin_senha;
    private $admin_resenha;
    private $message;
    private $defaultLocal = ROOT_LINK."/Installer/";

    public function getSession() { return $this->session; }
    public function setSession($session): void { $this->session = $session; }
    public function getDefaultLocal(): string { return $this->defaultLocal; }
    public static function Title() { echo "Instalação do sistema "; }
    public function getHost() { return $this->host; }
    public function setHost($host): void { $this->host = $host; }
    public function getUser() { return $this->user; }
    public function setUser($user): void { $this->user = $user; }
    public function getPasswd() { return $this->passwd; }
    public function setPasswd($passwd) { $this->passwd = $passwd; }
    public function getDatabase() { return $this->database; }
    public function setDatabase($database): void { $this->database = $database; }
    public function getPort() { return $this->port; }
    public function setPort($port): void { $this->port = $port; }
    public function getNoSec() { return $this->noSec; }
    public function setNoSec($noSec): void { $this->noSec = $noSec; }
    public function getLogfile() { return $this->logfile; }
    public function setLogfile($logfile): void { $this->logfile = $logfile; }
    public function getExpireTime() { return $this->expireTime; }
    public function setExpireTime($expireTime): void { $this->expireTime = $expireTime; }
    public function getAdminUser() { return $this->admin_user; }
    public function setAdminUser($admin_user): void { $this->admin_user = $admin_user; }
    public function getAdminNome() { return $this->admin_nome; }
    public function setAdminNome($admin_nome): void { $this->admin_nome = $admin_nome; }
    public function getAdminEmail() { return $this->admin_email; }
    public function setAdminEmail($admin_email): void { $this->admin_email = $admin_email; }
    public function getAdminSenha() { return $this->admin_senha; }
    public function setAdminSenha($admin_senha): void { $this->admin_senha = $admin_senha; }
    public function getAdminResenha() { return $this->admin_resenha; }
    public function setAdminResenha($admin_resenha): void { $this->admin_resenha = $admin_resenha; }
    public function getMessage() { return $this->message; }
    private function setMessage($type, $msg,$arrayRedirect = null, $return =false,$callback =null){
        $useType = null;
        if($type != 'error' && $type != 'warning' &&$type != 'success' && $type != 'info' ){
            $useType = 'info';
        }
        else{
            $useType = $type;
        }

        $pctMsg = [];
        $pctMsg['type'] = $useType;
        $pctMsg['title'] = 'Instalação do Sistema';
        $pctMsg['msg'] = $msg;
        if(!empty($arrayRedirect)){$pctMsg['redirect'] = $arrayRedirect;}
        if(!empty($callback)){$pctMsg['callback'] = $callback;}

        $JSON = json_encode($pctMsg);
        if($return){
            return $JSON;
        }
        else{
            echo $JSON;
        }
    }
    private function goTo($url,$time){
        $correctTime = 0;
        if($time > 10)
            $correctTime = 10;
        else
            $correctTime = $time;
        $toGo = [];
        $toGo['url'] = $url;
        $toGo['time'] = $correctTime;
        return $toGo;
    }
    public function moveToCurrentStep($prev,$next,$toPrev,$toNext){
        if($this->getCurrentStep() <= $prev){
            header("Location: ".$toPrev);
        }
        else if($this->getCurrentStep() >= $next){
            header("Location: ".$toNext);
        }
    }
    private function getCurrentStep(){
        $current = !isset($_SESSION['currentStep']) ? 1 : $_SESSION['currentStep'];
        return $current;
    }
    public function setCurrentStep($sp){
        $_SESSION['currentStep'] = $sp;
    }
    public function __construct() {
        $this->setHost(empty($_POST['host']) ? null : $_POST['host']);
        $this->setUser(empty($_POST['user']) ? null : $_POST['user']);
        $this->setPasswd(empty($_POST['pass']) ? null : $_POST['pass']);
        $this->setDatabase(empty($_POST['db']) ? null : $_POST['db']);
        $this->setPort(empty($_POST['port']) ? null : $_POST['port']);
        $this->setExpireTime(empty($_POST['expTime']) ? null : $_POST['expTime']);
        $this->setNoSec(empty($_POST['passSec']) ? null : $_POST['passSec']);
        $this->setLogfile(empty($_POST['logFile']) ? null : $_POST['logFile']);
        $this->setAdminNome(empty($_POST['admin_nome']) ? null : $_POST['admin_nome']);
        $this->setAdminEmail(empty($_POST['admin_email']) ? null : $_POST['admin_email']);
        $this->setAdminUser(empty($_POST['admin_user']) ? null : $_POST['admin_user']);
        $this->setAdminSenha(empty($_POST['admin_pass']) ? null : $_POST['admin_pass']);
        $this->setAdminResenha(empty($_POST['admin_repass']) ? null : $_POST['admin_repass']);
        !isset($_SESSION['devset']) ? $_SESSION['devset']=[] : null;
        !isset($_SESSION['admset']) ? $_SESSION['admset']=[] : null;
        $this->setSession($_SESSION['devset']);

    }
    //------------------------------------------//
    //              *** BACK-END ***            //
    //------------------------------------------//
    public function checkGrantInstall() {
        if (!isset($_SESSION['accept-install']) && !($_SESSION['install-expire-time'] >= time())) {
            unset($_SESSION['accept-install']);
            unset($_SESSION['install-expire-time']);
            return false;
        } else
            return true;
    }
    public function grantInstall() {
        $_SESSION['accept-install'] = true;
        $_SESSION['install-expire-time'] = time() + (60 * 30);
    }
    //------------------------------------------//
    //      *** BACK-END CONTROL BLOCK ***      //
    //------------------------------------------//
    private function getSql(){
        $host =$_SESSION['devset']['host'];
        $user =$_SESSION['devset']['username'];
        $pass =$_SESSION['devset']['password'];
        $dbase=$_SESSION['devset']['database'];
        $port =$_SESSION['devset']['port'];
        $EspecialPass = $pass == "_empty_" ? '' : $pass;
        return new PDO("mysql:host=" . $host . ";port=" . $port . ";dbname=" . $dbase . ";charset=utf8", $user, $EspecialPass, [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]);
    }
    public function controlDefault() {
        $this->setCurrentStep(1);
        header("Location: ".$this->getDefaultLocal()."Passo-1/");
        return true;
    }
    public function controlStep01() {
        if (empty($this->getUser()) && empty($this->getPasswd()) && empty($this->getHost()) && empty($this->getDatabase()) && empty($this->getPort())) {
            $this->setMessage('error',"Todos os campos dos dados de hospedagem devem ser preenchidos.");
            return false;
        } else if (!preg_match("/[a-z0-9._\-]+/i", $this->getUser())) {
            $this->setMessage('error',"O nome de usuário '" . $this->getUser() . "' não é válido, permitido apenas caracteres e números, ponto(.),underline(_)");
            return false;
        } else if (!is_numeric($this->getPort())) {
            $this->setMessage('error'," O campo de porta de host aceita apenas números!");
            return false;
        } else {
            $tempPassword = $this->getPasswd();
            //especial para area de desenvolvimento
            if ($this->getPasswd() == '_empty_lr'){
                $this->setPasswd('');
                $tempPassword ='';

            }
            if ($this->getPasswd() == '_empty_') $tempPassword ='';
            //Testa as configurações inseridas
            $checkServerDbIsActive = false;
            try {
                $cn = new PDO("mysql:host=" . $this->getHost() . ";port=" . $this->getPort() . ";dbname=" . $this->getDatabase() . ";charset=utf8", $this->getUser(), $tempPassword, [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION, PDO::ATTR_TIMEOUT => 3]);
                $checkServerDbIsActive = true;
            } catch (PDOException $pdo) {
                if($pdo->getCode() == 1049){
                    $checkServerDbIsActive = true;
                }
                else{
                    $checkServerDbIsActive = false;
                }
            }
            if ($checkServerDbIsActive) {
                //Atribui os valores na sessão
                $this->setCurrentStep(2);
                //Atribui as informações recebidas do POST para a sessao de instalação
                $_SESSION['devset']['host'] = $this->getHost();
                $_SESSION['devset']['username'] = $this->getUser();
                $_SESSION['devset']['password'] = $this->getPasswd();
                $_SESSION['devset']['database'] = $this->getDatabase();
                $_SESSION['devset']['port'] = $this->getPort();

                $this->setMessage('info',"Conexão estabelecida com as configurações de servidor inseridas. Seguindo ao proximo passo.",$this->goTo($this->getDefaultLocal()."Passo-2/",3));
                $cn =null;
                return true;
            } else {
                $cn =null;
                $this->setMessage('error',"Tentativa de conexão não foi estabecida com as configurações de servidor inseridas. Verifique suas anotações.");
                return false;
            }
        }
    }
    public function controlStep02() {
        if (empty($this->getExpireTime()) || empty($this->getLogfile())) {
            $this->setMessage('error',"Todos os campos de segurança devem ser preenchidos.");
            return false;
        } else if (!preg_match("/[a-z0-9_. ]+/i", $this->getLogfile())) {
            $this->setMessage('error',"O nome do arquivo de configuração é inválido.");
            return false;
        } else if (!is_numeric($this->getExpireTime())) {
            $this->setMessage('error',"O campo de tempo só aceita números.");
            return false;
        } else {
            //Atribui os valores na sessão
            $this->setCurrentStep(3);
            //Atribui as informações recebidas do POST para a sessao de instalação
            $_SESSION['devset']['expiretime'] = $this->getExpireTime();
            $_SESSION['devset']['crypt_on'] = $this->getNoSec() ? "true" : "false";
            $_SESSION['devset']['logfile'] = $this->getLogfile();
            $this->setMessage('info',"Configurações Aceitas, prosseguindo ao último passo",$this->goTo($this->getDefaultLocal()."Passo-3",3));
            return true;
        }
    }
    public function controlStep03() {
        if (empty($this->getAdminNome()) && empty($this->getAdminUser()) && empty($this->getAdminSenha()) && empty($this->getAdminResenha())) {
            $this->setMessage("error","Todos os campos dos dados de acesso devem ser preenchidos.");
            return false;
        } else if (!preg_match("/[a-z0-9 à-ùá-úâ-ûçãõ.]+/i", $this->getAdminNome())) {
            $this->setMessage("error","O nome inserído não é valido. verifique se possui simbolos ou números. apenas ponto(.) é permitido");
            return false;
        } else if (!preg_match("/[a-z0-9_.]+/i", $this->getAdminUser())) {
            $this->setMessage("error","O login de administrador não é válido, permitido apenas letras e números, ponto(.) e underline(_)");
            return false;
        } else if (!preg_match("/^[a-zA-z0-9\.\_\-]+[@]{1}[a-zA-z0-9\.\_\-]+\.{1}[a-zA-z0-9]{2,4}$/", $this->getAdminEmail())) {
            $this->setMessage("error","O email de administrador não é válido.");
            return false;
        } else if ($this->getAdminUser() == 'admin' || $this->getAdminUser() == 'administrador' || $this->getAdminUser() == 'administrator' || $this->getAdminUser() == 'adm') {
            $this->setMessage("error","Para a sua segurança os nomes [<code>admin, adm, administrador, administrator</code>] não são permitidos");
            return false;
        } else if (strlen($this->getAdminUser()) < 4 || strlen($this->getAdminUser()) > 16) {
            $this->setMessage("error","Login de Administrador deve estar entre <strong>4~16</strong> caracteres.");
            return false;
        } else if ($this->getAdminSenha() != $this->getAdminResenha()) {
            $this->setMessage("error","As senhas inseridas não combinam. Tente novamente.");
            return false;
        } else if (strlen($this->getAdminSenha()) < 6 || strlen($this->getAdminSenha()) > 22) {
            $this->setMessage("error","Senha muito Curta, deve estar entre <strong>6~22</strong> caracteres.");
            return false;
        } else if(!preg_match("/^.*(?=.*\d)(?=.*[a-z]?)(?=.*[A-Z]+)(?=.*[@$#\.&%]*).*$/",$this->getAdminSenha())){
            $this->setMessage("error","Senha muito fraca, deve contar letras minusculas e pelo menos uma letra maiuscula e um número, simbolos também são aceitos.");
            return false;
        } else {
            //Atribui os valores na sessão
            $this->setCurrentStep(4);
            //Atribui as informações recebidas do POST para a sessao de instalação
            $_SESSION['admset']['install-name'] = $this->getAdminNome();
            $_SESSION['admset']['install-user'] = $this->getAdminUser();
            $_SESSION['admset']['install-pass'] = $this->getAdminSenha();
            $_SESSION['admset']['install-email'] = $this->getAdminEmail();
            $_SESSION['devset']['install-createDatabase'] = true;

            $this->controlFinal();
        }
    }
    private function controlFinal() {
        try{
            $Cnn = $this->getSql();
            //File check
            include "SqlParser.inc";
            //Instalando Banco
            if(file_exists("sql/tables.sql")){
                //TABELAS
                $tablesParser = new \SqlParser("sql/tables.sql",$_SESSION['devset']['database']);
                $tables = $tablesParser->getResult();
                $qt = $Cnn->exec($tables);
                
                //ROTINAS
                $indexesParser = new \SqlParser("sql/routines.sql",$_SESSION['devset']['database']);
                $indexesParser->statment();
                //$indexes = $indexesParser->getResult();
                //$qt = $Cnn->exec($indexes);
                //$Cnn->quote($string)

                if($qt === false){
                    Assembly::createLog("Não foi possivel criar as tabelas no banco de dados",1);
                    $this->setMessage("error","Não foi possivel criar as tabelas no banco de dados");
                }
                $password = $_SESSION['admset']['install-pass'];
                $dt = new \DateTime('now',new \DateTimeZone("America/Sao_Paulo"));
                $registerTime =$dt->format("Y-m-d");

                $insertAdminData = $Cnn->prepare("INSERT INTO ".__USERS." (authid, login, password, name, email, registerDate,`status`) VALUES (?,?,?,?,?,?,?)");
                $insertAdminData->bindValue(1,System::createToken(8));
                $insertAdminData->bindValue(2,$_SESSION['admset']['install-user']);
                $insertAdminData->bindValue(3,md5($password,true));
                $insertAdminData->bindValue(4,$_SESSION['admset']['install-name']);
                $insertAdminData->bindValue(5,$_SESSION['admset']['install-email']);
                $insertAdminData->bindValue(6,$registerTime);
                $insertAdminData->bindValue(7,4);
                $insertAdminData->execute();
                $insertAdminData->closeCursor();

                if($insertAdminData){
                    //Cria o arquivo de configuração caso tudo ok
                    $Assembly = new Assembly();
                    $Assembly->setConfigFile($this->getSession(),'w+',"../");

                    Assembly::createLog("Instalação do sistema Completo!",1);
                    $this->setMessage("success","Sucesso! O sistema foi instalado e o super-usuário foi adicionado corretamente ao sistema! Voce será redirecionado agora.",$this->goTo($this->getDefaultLocal()."Concluido/",5));
                }
                else{
                    Assembly::createLog("Falha na instalação do sistema!",1);
                    $this->setMessage("error","Não foi possivel registrar as configurações no momento, neste ponto, será necessário reiniciar a instalação");
                }
            }
            else{
                $this->setMessage("error","Arquivo de instalação não existe! Impossivel continuar!");
            Assembly::createLog("Arquivo de instalação SQL 'install.sql' não existe! Impossivel continuar, por que não é possivel criar as tabelas para o banco.",3);
            }
            //Construindo uma estrutura para SQL

        }
        catch (\Exception $pdoNf){
            $this->setMessage("error",$pdoNf->getMessage());
            Assembly::createLog($pdoNf->getMessage(),3);
        }
    }
    public function clearAll(){
        if($_POST['clear']){

            if(!is_dir("trashbin"))
                mkdir("trashbin",0777,true);
            rename("install.php","trashbin/install.trash");
        }
        unset($_SESSION['devset']);
        unset($_SESSION['admset']);
        header("Location: /");
        ob_end_flush();
    }
}