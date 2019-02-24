<?php
/**
 * Created by MarxMedia.
 * Author: Kevin Marques
 * Date: 06/09/2018 - 22:40
 * Grh : SqlParser.inc
 */

class SqlParser{
    private $db;
    private $result;
    private $filename;
    private $fileRead;
    public function __construct($sqlFile,$dbName) {
        $this->filename = $sqlFile;
        $this->db =$dbName;
        $sql = file($sqlFile);
        $this->fileRead = $sql;
        $arrayList = array_map(array($this,'clearSql'),$sql);

        $data = implode(' ', $arrayList);
        $this->result = $data;

    }
    private function clearSql($sql){
        if(!preg_match("/(DELIMITER)+/", $sql)){
            $noTrim = trim($sql,"\r\n");
            $removecomments = preg_replace(array("/(#|--)(.*)*/i","/(_dbname_)/"), array(" ",$this->db), $noTrim);
            $checkLength = strlen($removecomments);

            if($checkLength != 0 ){
                return $removecomments;
            }
            else{
                return '';
            }
        }
        return $sql;
    }
    public function statment(){

        //Acumula as querys para serem processadas posteriormente
        $eachQuery =[];
        //Busca a primeira instancia de Delimiter
        for ($i = 0; $i < array_count_values($this->fileRead); $i++){
            //ao encontrar a ocorrencia de DELIMITADOR
            if(preg_match("/(DELIMITER)+/", $this->fileRead[$i])){
                //Itera adicionando ao pacote do query ate alcançando o
                // proximo delimitador de fechamento
                for ($a = $i+1; $a < count($this->fileRead); $a++){
                    if(!preg_match("/(DELIMITER)+/i", $this->fileRead[$a])){
                        $eachQuery['p'.($i+1)] = $this->fileRead[$a] ;
                    }
                    else{
                        $i = $a;
                        break;
                    }
                }
            }
        }

    }
    public function getResult(){
        return $this->result;
    }
}