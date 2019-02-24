/**
 * Created by AlbaFox Solutions.
 *     Author: Kevin Marques
 *    Date: 1/07/2017 - 10:18
 *        File: main.js
 *
 */

(function(){
    //Construtor da Classe Main
    var Main = function (arg) {
        //Verificação de instancia de objeto
        if(!(this instanceof Main )){
            //Chamada recursiva
            return new Main(arg);
        }
        //Atribuição para objeto de argumento
        this.arg = arg;
    };
    //Adição de funcionalidades utilizando prototype
    Main.fn = Main.prototype = {
        //Definições de sistema
        system: {
            arg: this.arg,
            init: function () {
                Main.fn.dataSend();
                Main.fn.dataPrompt();
                Main.fn.system.checkSession();
                Main.fn.dataMake();
            },
            checkBase64: function (string) {
                try {
                    //Para evitar falsos positivos, é importando checar a mesma sentença
                    //imagine um checksun, preciso verificar o valor descriptografado da
                    //propria string recebida ex: a sentença "string" que logicamente
                    //não é uma criptografia base64 retorna algo semelhante a "²Úâ"
                    //passando a ser um falso-positivo e retornando true, quando
                    //obviamente é false
                    return btoa(atob(string)) === string ? true : false;
                } catch(e) {
                    return false;
                }
            },
            isJSON: function (string) {
                try {
                    /** !!JSON.parse(string) é o mesmo que:
                     * JSON.parse(string) ? true : false;
                     * ou
                     * if(JSON.parse(string)) true; else false;
                     * */
                    return !!JSON.parse(string);
                } catch(e) {
                    return false;
                }
            },
            redirect: function (place,timeout) {
                let timing = timeout === undefined || isNaN(timeout) ? 0 : timeout;
                if(timing !== -1){
                    setTimeout(function timerRedirect(){
                        window.location.replace(place);
                    },timing * 1000);
                }
            },
            checkSession: function () {
                console.log("CheckSession Started");
                var intervalCheck = setInterval(function () {
                    Main.fn.ajax('/Grh/system/session/','GET',null,function (returns) {
                        if(Main.fn.system.isJSON(returns)){
                            let data = JSON.parse(returns);
                            let information = data.information !== undefined ? JSON.parse(data.information) : null;
                            let result = data.result === undefined ? false : data.result;
                            let redirect  = data.redirect === undefined ? null : data.redirect;
                            if(result === false){
                                clearInterval(intervalCheck);
                                Main.fn.system.prompt({
                                    type: 'basic',
                                    method:'GET',
                                    title: information.title,
                                    msg: information.msg,
                                    overlay: true,
                                    action: function () {
                                        Main.fn.system.redirect(redirect,0);
                                    }
                                })
                            }
                        }
                    });
                },60000);
            },
            notify: {

                show: function (type,title,msg,redirect) {
                    var $this = this;
                    /**
                     * @return {string}
                     */
                    var ID = function () {
                        // Math.random should be unique because of its seeding algorithm.
                        // Convert it to base 36 (numbers + letters), and grab the first 9 characters
                        // after the decimal.
                        return '_' + Math.random().toString(36).substr(2, 9);
                    };
                    let body = document.body;
                    if(body.querySelector(".notify")){
                        let newid = ID();
                        let selectedMsgBox = body.querySelector(".notify");
                        selectedMsgBox.setAttribute("class","notify "+type);
                        selectedMsgBox.setAttribute("data-uq",newid);
                        let selectedTitle = selectedMsgBox.getElementsByClassName("title")[0];
                        selectedTitle.innerHTML = title;
                        let selectedMsg = selectedMsgBox.getElementsByTagName("p")[0];
                        selectedMsg.innerHTML = msg;
                        let timer = setTimeout(function timingToShowNotify() {
                            selectedMsgBox.classList.add("nShow");
                            //Apos criar ou reapresentar o elemento, define um tempo de ocultação
                            $this.hide(this,newid);
                        },500);

                    }
                    else{
                        let newid = ID();
                        let msgBox = document.createElement("div");
                        msgBox.setAttribute("class","notify "+type);
                        msgBox.setAttribute("data-uq",newid);
                        let closeBox = document.createElement("div");
                        closeBox.setAttribute("class","close");

                        let titles = document.createElement("h4");
                        titles.setAttribute("class","title");
                        titles.innerHTML = title;
                        let message = document.createElement("p");
                        message.innerHTML = msg;

                        msgBox.appendChild(closeBox);
                        msgBox.appendChild(titles);
                        msgBox.appendChild(message);

                        body.appendChild(msgBox);

                        let timer = setTimeout(function timingToShowNotify() {
                            msgBox.classList.add("nShow");
                            //Apos criar ou reapresentar o elemento, define um tempo de ocultação
                            $this.hide(this,newid);
                        },500);

                    }
                    if(redirect){
                        console.log("Redirect Detected, Redirecting...",redirect);
                        Main.fn.system.redirect(redirect.url,redirect.time);
                    }
                },
                hide: function (timer,idSearch) {
                    var msgBox = document.getElementsByClassName("notify")[0];

                    let closeButton = msgBox.getElementsByClassName("close")[0];
                    closeButton.addEventListener("click",function (ev) {
                        clearTimeout(timer);
                        if(msgBox.getAttribute('data-uq') === idSearch){
                            //Oculto o objeto
                            msgBox.classList.remove("nShow");
                        }
                    });

                    timer = setTimeout(function timingToHideNotify() {
                        clearTimeout(timer);
                        /*
                        * Explicando: o setTimeOut funciona assincronamente,
                        * essa condição corrige a ocultação incorreta do elemento
                        * apois ele ter sido recriado ao ser disparado novamente
                        * pelo usuário em um "SpamClick" por exemplo.
                        * Mesmo o objeto sendo atualiza e um novo setTimeOut criado,
                        * o anterior nao é removido por que nao está no mesmo escopo
                        * de execução do metodo, e sim, no Event-Queue, fazendo com
                        * que o evento, quando retornado ao CallStack execute inapropriadamente
                        * a ocultação do objeto precocemente mesmo depois de atualizado o
                        * intervalo de ocultamento.
                        * */
                        if(msgBox.getAttribute('data-uq') === idSearch){
                            //Oculto o objeto
                            msgBox.classList.remove("nShow");
                        }
                    },5500);
                }
            },
            prompt: function (options) {
                let jsonPrep;
                if( typeof options !== "object"){
                    let opt = options === undefined || options === '' || !this.isJSON(options) ? JSON.stringify({}) : options;
                    jsonPrep = JSON.parse(opt);
                }
                else{
                    jsonPrep = options;
                }

                let body = document.body;
                //variaveis padrão
                let titlePrompt = jsonPrep.title === undefined ? 'Nada a Informar' : jsonPrep.title;
                let typePrompt = jsonPrep.type === undefined ? 'basic': jsonPrep.type;
                let txtOk = jsonPrep.txtOk === undefined ? 'OK' : jsonPrep.txtOk;
                let txtCancel = jsonPrep.txtCancel === undefined ? 'Cancelar' : jsonPrep.txtCancel;
                let msgPrompt = jsonPrep.msg === undefined ? 'Nenhuma Informação Útil' : jsonPrep.msg;
                let url = jsonPrep.url === undefined ? null : jsonPrep.url;
                let method = jsonPrep.method === undefined ? null : jsonPrep.method;
                let action = jsonPrep.action === undefined ? function(){} : jsonPrep.action;
                let overlay = jsonPrep.overlay === undefined ? false : jsonPrep.overlay;
                if(!body.querySelector(".prompt")){
                    //------------------- Elementos Padrões -------------//
                    //overlay
                    if(overlay){
                        var overlayPromptBox = document.createElement('div');
                        overlayPromptBox.setAttribute("class","overlay");
                    }
                    ///caixa de prompt principal
                    let promptBox = document.createElement("div");
                    promptBox.setAttribute("class","prompt");
                    //Elemento de titulação
                    let title = document.createElement("div");
                    title.setAttribute("class",'title pd-b-1');
                    title.innerHTML = titlePrompt;
                    //Corpo da mensagem ou aviso
                    let msg = document.createElement("div");
                    msg.setAttribute("class","msg");
                    msg.innerHTML = msgPrompt;
                    //Separador de block estilizado
                    let separator = document.createElement("div");
                    separator.setAttribute("class","separator mg-tb-1");
                    //Caixa de botões
                    let boxFolder = document.createElement("div");
                    let jc = typePrompt == 'basic' ? 'jc-center' :'jc-between';
                    boxFolder.setAttribute("class","dFlex "+jc);
                    //---------------------------------------------------//
                    //----------------- Tipos de prompts ----------------//
                    //---------------------------------------------------//

                    //Botão OK padrão
                    let btnOk = document.createElement("button");
                    btnOk.setAttribute("class","bgGreen ais-ok");
                    btnOk.setAttribute("id","ok");
                    btnOk.innerHTML = txtOk === undefined ? "OK" : txtOk;
                    btnOk.addEventListener('click',function dispatchEventInPrompt(ev){
                        //Ação
                        action();
                        //
                        if(url !== null){
                            Main.fn.ajax(url,method,null,function responseDispatch(response){
                                if(Main.fn.system.isJSON(response)){
                                    let responseDispatch = JSON.parse(response);
                                    let type = responseDispatch.type === undefined ? null : responseDispatch.type;
                                    let title = responseDispatch.title === undefined ?null : responseDispatch.title;
                                    let msg = responseDispatch.msg === undefined ? null : responseDispatch.msg;
                                    let redirect = responseDispatch.redirect === undefined ? null : responseDispatch.redirect;
                                    Main.fn.system.notify.show(type,title,msg,redirect);
                                }
                                else{
                                    Main.fn.system.notify.show('error','Erro Interno',"Nenhuma resposta vinda do servidor.");
                                }
                            });
                        }
                        setTimeout(function timingToShowNotify() {
                            if(overlay){
                                overlayPromptBox.classList.remove('oShow');
                            }
                            promptBox.classList.remove("pShow");
                            //Apos criar ou reapresentar o elemento, define um tempo de ocultação
                        },500);
                    });
                    boxFolder.appendChild(btnOk);
                    //Botão cancelar existente em prompts de confirmação
                    if(typePrompt == 'confirm'){
                        let btnCancel = document.createElement("button");
                        btnCancel.setAttribute("class","bgBlue ais-cancel");
                        btnCancel.setAttribute("id","cancel");
                        btnCancel.innerHTML = txtCancel === undefined ? "Cancelar" : txtCancel;
                        btnCancel.addEventListener("click",function (ev) {
                            if(overlay){
                                overlayPromptBox.classList.remove('oShow');
                            }
                            promptBox.classList.remove('pShow');
                        });
                        //Append ao box caso do tipo
                        boxFolder.appendChild(btnCancel);
                    }
                    setTimeout(function timingToShowNotify() {
                        if(overlay){
                            overlayPromptBox.classList.add('oShow');
                        }
                        promptBox.classList.add("pShow");
                        //Apos criar ou reapresentar o elemento, define um tempo de ocultação
                    },500);
                    //------------------------------//



                    promptBox.appendChild(title);
                    promptBox.appendChild(msg);
                    promptBox.appendChild(separator);
                    promptBox.appendChild(boxFolder);
                    if(!overlay)
                        body.appendChild(promptBox);
                    else{
                        overlayPromptBox.appendChild(promptBox);
                        body.appendChild(overlayPromptBox);
                    }
                }
                else{
                    if(overlay){
                        let overlaySelect  = document.getElementsByClassName("overlay")[0];
                    }
                    let promptSelect = document.getElementsByClassName("prompt")[0];
                    let title = promptSelect.getElementsByClassName("title")[0];
                    let msg = promptSelect.getElementsByClassName("msg")[0];
                    let btnOk = promptSelect.querySelector("#ok");
                    if(typePrompt === 'confirm'){
                        let btnCancel = promptSelect.querySelector("#cancel");
                        btnCancel.innerHTML = txtCancel;
                    }
                    title.innerHTML = titlePrompt;
                    msg.innerHTML = msgPrompt;
                    btnOk.innerHTML = txtOk;


                    setTimeout(function timingToShowNotify() {
                        if(overlay){
                            overlaySelect.classList.add('oShow');
                        }
                        promptSelect.classList.add("pShow");
                        //Apos criar ou reapresentar o elemento, define um tempo de ocultação
                    },500);
                }
            },
            tabs: function () {
                let findTabs = document.querySelectorAll(".tabs");
                if(findTabs !== null){
                    findTabs.forEach(function (element) {
                        
                    });
                }

            }
        },
        dataPrompt: function (){
            /** Sistema semi-auditivo automatizado, a verificação de padrão [data-prompt]
             * só ocorre no carrrega */
            try{
                //O escopo do this altera baseado de onde eu estou
                let $this = this;
                let promptObject = document.querySelectorAll("[data-prompt]");
                //Execução de dados
                promptObject.forEach(function forEachPrompt(a){
                    a.addEventListener('click',function promptEventDispatch(ev){
                       let dataPromptObject = ev.target.attributes.getNamedItem("data-prompt").value;
                       let wrong = 0;
                       //Verifica se o valor recebido é base64
                       if($this.system.checkBase64(dataPromptObject)){
                           let decryptData = atob(dataPromptObject);
                           if($this.system.isJSON(decryptData)){
                               let getObj = JSON.parse(decryptData);
                               $this.ajax(getObj.url,getObj.method,null,function recoverPromptInfo(response){
                                   //console.log(response);
                                   $this.system.prompt(response);
                               });
                           }
                           else{
                               wrong++;
                           }
                       }
                       else{
                           wrong++;
                       }
                       if(wrong > 0){
                           $this.system.notify.show('error','Erro Interno','Não é possivel recuperar os dados do aviso!');
                       }
                    });
                });
            }
            catch(e){

            }
        },
        //Envio de dados localizador de padrão
        dataSend: function () {
            try{
                /** @function dataSend - Método utilizado para envio de dados via ajax personalizados e
                 * automatizados, para o seu funcionamento basico o sistema tenta detectar um padrão em elementos comuns.
                 * a propriedade data-send, guarda valores codificados em base 64 para proteção básica e JSON para tratamento de dados
                 * */
                    //Como o magic this altera seu comportamento baseado no escopo, defino uma
                    //variavel que guarda seu estado antes da alteração de escopo.
                let $this = this;//referente ao Objeto Prototype Main.fn
                //--------------------------------
                //A função checa novas atribuidores a cada ação de clique do usuário
                //Salva em vetor a lista de objetos que possui o atributo data-send
                let ObjsListered = document.querySelectorAll("[data-send]");
                //Para cada objeto cria um novo evento para o usuário
                ObjsListered.forEach(function(a,b){
                    //1. Por definição caso o objeto seja do tipo form o evento é submit
                    //2. caso seja qualquer outro tipo de elemento o tipo de evento é click
                    //recupera o valor aplicado do data-send
                    //Obrigatoriamente deve ser codificado em JSON com encryptação base64
                    //para nao deixar diretamente explicito no html (nenhum valor importante,
                    // que ameace a segurança deve ser aplicado)
                    let DataRead = a.attributes.getNamedItem("data-send").value;
                    if($this.system.checkBase64(DataRead)){
                        let uncryptData = atob(DataRead);
                        if($this.system.isJSON(uncryptData)){
                            let elementType = a.nodeName;
                            let opts = JSON.parse(uncryptData);
                            //Valores padrão
                            let method = null;
                            if(opts.method === undefined){
                                if(elementType === "FORM")
                                    method = "POST";
                                else
                                    method = "GET";
                            }
                            else{
                                method = opts.method === undefined ? opts.type : opts.method;
                            }
                            //funcção para BeforeSend
                            let beforeSend ={};
                            beforeSend.animate = function (element) {
                                let button = element.querySelector("button:not([type])") !== null ? element.querySelector("button:not([type])") : element.querySelector("button[type=submit]") ;
                                if(button != null){
                                    button.setAttribute('disabled',"disabled");
                                    button.classList.add('ais-ani-loading');

                                }
                            };
                            beforeSend.stop = function(element){
                                let button = element.querySelector("button:not([type])") !== null ? element.querySelector("button:not([type])") : element.querySelector("button[type=submit]") ;
                                if(button != null){
                                    button.removeAttribute("disabled");
                                    button.classList.remove('ais-ani-loading');
                                }
                            };
                            if(elementType === "FORM"){
                                a.addEventListener("submit",function dataSendBySubmit(event) {
                                    event.preventDefault();
                                    let form = event.target;
                                    let formData = new FormData(form);
                                    $this.ajax(opts.url,method,formData,function (response) {
                                        //console.log(response);
                                        if($this.system.isJSON(response)){
                                            let jsonAnswer = JSON.parse(response);
                                            //console.log(jsonAnswer);
                                            let type = jsonAnswer.type === undefined ? 'warning' : jsonAnswer.type;
                                            let title = jsonAnswer.title === undefined ? "Erro na Resposta!" : jsonAnswer.title;
                                            let msg = jsonAnswer.msg === undefined ? "Resposta vindo do servidor não é do tipo correto para a apresentação" : jsonAnswer.msg;
                                            let redirect = jsonAnswer.redirect === undefined ? null : jsonAnswer.redirect;
                                            $this.system.notify.show(type,title,msg,redirect);
                                            if(jsonAnswer.callback !== undefined){
                                                let fnc = new Function(jsonAnswer.callback);
                                                fnc();
                                            }
                                            
                                        }
                                        else{
                                            $this.system.notify.show('warning','Resposta Generica!', response);
                                        }
                                        beforeSend.stop(a);

                                    },beforeSend.animate(this));

                                })
                            }
                            else{
                                if(opts.typeAction === undefined){
                                    a.addEventListener("click",function dataSendByClickBasic(event) {
                                        //event.preventDefault();
                                        let form = event.target;
                                        $this.ajax(opts.url,method,null,function (response) {
                                            if($this.system.isJSON(response)){
                                                let jsonAnswer = JSON.parse(response);
                                                let type = jsonAnswer.type === undefined ? 'warning' : jsonAnswer.type;
                                                let title = jsonAnswer.title === undefined ? "Erro na Resposta!" : jsonAnswer.title;
                                                let msg = jsonAnswer.msg === undefined ? "Resposta vindo do servidor não é do tipo correto para a apresentação" : jsonAnswer.msg;
                                                let redirect = jsonAnswer.redirect === undefined ? null : jsonAnswer.redirect;
                                                $this.system.notify.show(type,title,msg,redirect);
                                                if(jsonAnswer.callback !== undefined){
                                                    let fnc = new Function(jsonAnswer.callback);
                                                    fnc();
                                                }

                                            }
                                            else{
                                                $this.system.notify.show('warning','Resposta Generica!', response);
                                            }
                                            beforeSend.stop(a);

                                        },beforeSend.animate(this));
                                    })
                                }
                                else if(opts.typeAction === 'check' || opts.typeAction === 'mark'){
                                    var noPrevent =false;
                                    a.addEventListener("click",function dataSendByClickCheckType(event) {
                                        if(noPrevent == false){
                                            event.preventDefault();
                                            let form = event.target;
                                            $this.ajax(opts.url,method,null,function (response) {
                                                if($this.system.isJSON(response)){
                                                    let jsonAnswer = JSON.parse(response);
                                                    let type = jsonAnswer.type === undefined ? 'warning' : jsonAnswer.type;
                                                    let title = jsonAnswer.title === undefined ? "Erro na Resposta!" : jsonAnswer.title;
                                                    let msg = jsonAnswer.msg === undefined ? "Resposta vindo do servidor não é do tipo correto para a apresentação" : jsonAnswer.msg;
                                                    let redirect = jsonAnswer.redirect === undefined ? null : jsonAnswer.redirect;
                                                    let success =jsonAnswer.success === undefined ? false : jsonAnswer.success;
                                                    $this.system.notify.show(type,title,msg,redirect);

                                                    if(jsonAnswer.callback !== undefined){
                                                        let fnc = new Function(jsonAnswer.callback);
                                                        fnc();
                                                    }
                                                    if(success){
                                                        //Alterado o tipo de resolução de evento
                                                        //O evento de disparo simulado
                                                        //Varia de acordo aos navegadores
                                                        //recupera o id do Label pelo FOR
                                                        let spcId = event.target.getAttribute('for');
                                                        //Chama o checkBox com o id especificado
                                                        let chkBox = document.getElementById(spcId);
                                                        //Condição Toggle de Check Box
                                                        if(chkBox.hasAttribute('checked'))
                                                            chkBox.removeAttribute('checked');
                                                        else
                                                            chkBox.setAttribute('checked','checked');

                                                    }
                                                }
                                                else{
                                                    $this.system.notify.show('warning','Resposta Generica!', response);
                                                }

                                            });
                                        }
                                        else{
                                            noPrevent =false;
                                        }
                                    })
                                }
                            }
                        }

                    }
                })
            }
            catch(e){
                this.system.notify.show('error','Exceção encontrada',e);
            }
        },
        dataMake: function () {
            let findPattern = document.querySelectorAll("[data-make]");
            let counterObjectCreated = 0;
            findPattern.forEach(function (element) {
                element.addEventListener('click',function makeElementEvent(ev){
                    let getAttrDataMake = element.getAttribute('data-make');
                    if(Main.fn.system.checkBase64(getAttrDataMake)){
                        let setAttributes = function (element, attrArrayObj){
                            for (var keys in attrArrayObj){
                                element.setAttribute(keys,attrArrayObj[keys]);
                            }
                        };
                        var uncryptDataMake = atob(getAttrDataMake);
                        if (Main.fn.system.isJSON(uncryptDataMake)) {
                            let counter = 0;
                            let ObjMake = JSON.parse(uncryptDataMake);

                            //===========================================
                            let assign = function forEachArrayConstructor(mkObject,mainObj){

                                let attributes = mkObject['attributes'];
                                let elem = mkObject['element'];

                                if(elem !== undefined && elem !== ''){
                                    let newObject = document.createElement(elem);

                                    if(mkObject !== undefined ){
                                        let attributes = mkObject['attributes'];
                                        setAttributes(newObject,attributes);
                                        //Cria o objeto de remover item
                                        if(counter === 0){
                                            let close = document.createElement('div');
                                            let id = Math.floor(Math.random() * 1000);
                                            close.setAttribute('id','close_'+id);
                                            close.setAttribute('class','close');
                                            newObject.appendChild(close);
                                            close.addEventListener('click', function closeBtnMk(ev){
                                                let remove = document.getElementById('close_'+id);
                                                let former = remove.closest(".former");
                                                let block = remove.parentNode.parentNode.parentNode;
                                                block.removeChild(former);
                                                counterObjectCreated--;
                                            });
                                        }
                                        if(mkObject['append'] !== undefined){
                                            if(mkObject['append'] == 'parent'){
                                                let treeLength = mkObject['parentLength'];
                                                let apd = element;
                                                for(let i = 0; i < treeLength; i++){
                                                    apd = apd.parentNode;
                                                }
                                                apd.appendChild(newObject);
                                            }
                                            else{
                                                document.querySelector(mkObject['append']).appendChild(newObject);
                                            }
                                        }
                                        else{
                                            mainObj.appendChild(newObject);
                                        }
                                        if(mkObject['child'] !== undefined){
                                            let nrArray = mkObject['child'];
                                            nrArray.forEach(function (objects) {
                                                assign(objects,newObject);
                                            });
                                        }
                                    }
                                }
                                counter++;
                            };
                            //
                            ObjMake.forEach(function (objects) {
                                var limit = objects['limit'];
                                let title = objects['title'] === undefined ? "Novo Objeto":objects['title'];
                                let msg = objects['msg'] === undefined ? "Limite alcançado de objetos" : objects['msg'];
                                if(counterObjectCreated < limit){
                                    assign(objects);
                                    counterObjectCreated++;
                                }
                                else{Main.fn.system.notify.show('info',title,msg);}

                            });
                        }
                        else{
                            console.log("Data Make receive is not in acceptable pattern");
                        }
                    }
                    else{
                        console.info("Data Make receive is not in acceptable encryptation");
                    }

                });
            });
        },
        ajax: function (url, method, postdata, response, beforeSend ) {
            //Checa se o navegador aceita ajax
            beforeSend === undefined ? beforeSend =function () {} : beforeSend;
            let Ajax;
            try{
                //Método recente de instancia de XML
                Ajax = new XMLHttpRequest();
            }
            catch(e){
                try{
                    Ajax = new ActiveXObject("Microsoft.XMLHTTP");
                }
                catch(e){
                    try{
                        Ajax = new ActiveXObject("Msxml2.XMLHTTP");
                    }
                    catch(e){
                        this.system.notify.show("error","Seu navegador não suporta Ajax. Impossível continuar!");
                    }
                }
            }
            Ajax.onreadystatechange = function (ev) {
                if(this.readyState === 1 || this.readyState === 2 ||this.readyState === 3){
                    beforeSend();
                }
                if(this.readyState === 4 && this.status === 200){
                    response(Ajax.responseText);
                }
            };
            Ajax.open(method,url,true);
            Ajax.send(postdata);
        }
        
    };
    window.$ = Main.fn;
}());
/**
 * AVISO!! $ < ISSO NÃO É JQUERY,
 * Apenas atribuo a instancia do meu Objeto
 * Main.fn a uma propriedade qualquer no escopo window
 * observe a linha 623 window.$ = Main.fn, a chave "$" é apenas
 * o nome de uma variavel qualquer, que poderia ser
 * window.MyLib ou window.$$ ou window.variable
 * o framework Jquery utiliza o Cifrão para facilitar
 * o processo, como esta no escopo do window, as funções
 * funcionam corretamente omitindo a palavra window...
 */
$.system.init();
