<article class='p-5'>
    <div class="row">
        <div class="col">
            <div class="box">
                <h2>Passo 3 - Definição de Acesso Administrativo </h2>
                <div class="separator"></div>
                <a id='form-area'></a>
                <form action='#' _{data_send} method='post' enctype='application/x-www-form-urlencoded'><br/>
                    <input type='hidden' name='sh' value='true'/>
                    <div class='row'>
                        <div class='col flex-5'>
                            <div class="former">
                                <label>Nome do Super-Usuário</label>
                                <input name='admin_nome' autofocus type="text" class="form-control"  placeholder="Nome do Super-Usuário" >
                                <i class='ais ais-name'> </i>
                            </div>
                            <div class="former">
                                <label >Email do Super-Usuário</label>
                                <input name='admin_email' type="text" class="form-control" placeholder="Email do Super-Usuário" >
                                <i class='ais ais-mail'> </i>
                            </div>
                            <div class="former">
                                <label >Login do Super-Usuário</label>
                                <input name='admin_user' type="text" class="form-control" placeholder="Login do Super-Usuário" >
                                <i class='ais ais-user'> </i>
                            </div>
                            <div class="former">
                                <label>Senha do Super-Usuário</label>
                                <input name='admin_pass' type="password" class="form-control" placeholder="Senha do Super-Usuário" >
                                <i class='ais ais-lock'> </i>
                            </div>
                            <div class="former">
                                <label>Repita a Senha do Super-Usuário</label>
                                <input name='admin_repass' type="password" class="form-control" placeholder="Repita a Senha do Super-Usuário" >
                                <i class='ais ais-lock'> </i>
                            </div>
                        </div>
                        <div class='col flex-5'>
                            <p class="pbase"> O campo de login não aceita palavras como:<br/> <kbd>admin</kbd> <kbd>adm</kbd> <kbd>Super-Usuário</kbd> <kbd>administrator</kbd>.</p>
                            <p class="pbase">O Login deve estar entre 4-16 caracteres podendo conter letras, numeros, ponto(.) e/ou traço-baixo(_) </p>
                            <p class="pbase">A senha deve estar entre 6-22 caracteres podendo conter letras minúsculas e obrigatoriamente deve conter pelo menos uma letra maiúscula, um número e opcionalmente pode conter símbolos.</p>
                        </div>
                    </div>
                    <div class="row jc-right">
                        <a href='_{linkroot}Passo-2/#form-area'><button  type='button' class='ais-arrow-left'>Voltar</button></a>
                        <button class='ais-check bgGreen'>Finalizar</button>
                    </div>

                </form>
            </div>
        </div>
    </div>
   
    
</article>