<article>
<div class="row ">
    <div class="col">
        <div class="box">
            <h2>Passo 1 - Definição de Hospedagem </h2>
            <div class="separator"></div>
                <form action='#' _{data_send} method='post' enctype='application/x-www-form-urlencoded'>
                    <div class="row">
                        <div class="col flex-5">
                            <input type='hidden' name='sh' value='true'/>
                            <div class="former">
                                <label>Url da Servidor MySql</label>
                                <input name='host' autofocus type="text" class="form-control" placeholder="Url da Servidor MySql" aria-describedby="basic-addon1">
                                <i class='ais ais-server'> </i>
                            </div>
                            <div class="former">
                                <label>Nome de Usuário</label>
                                <input name='user' type="text" class="form-control" placeholder="Nome de Usuário" aria-describedby="basic-addon1">
                                <i class='ais ais-user'> </i>
                            </div>
                            <div class="former">
                                <label>Senha do Usuário</label>
                                <input name='pass' type="text" class="form-control"  placeholder="Senha do Usuário" aria-describedby="basic-addon1">
                                <i class='ais ais-passwd'> </i>
                            </div>
                            <div class="former">
                                <label>Nome do Banco de Dados</label>
                                <input name='db' type="text" class="form-control" placeholder="Nome do Banco de Dados" aria-describedby="basic-addon1">
                                <i class='ais ais-database'> </i>
                            </div>
                            <div class="former">
                                <label>Porta de acesso (ex: 3306)</label>
                                <input name='port' type="text" class="form-control" placeholder="Porta de acesso (ex: 3306)" aria-describedby="basic-addon1">
                                <i class='ais ais-lock'> </i>
                            </div>
                        </div>
                        <div class='col flex-5'>
                            <p class="pbase">Especifique com cautela as informações de acesso ao seu banco de dados. Definições erradas tera a necessidade de reiniciar a instalação.</p>
                            <p class="pbase">Observe os caracteres maisculos e minusculos dos seus dados. A atribuição de <code>http://</code> ou <code>https://</code> vai de acordo ao seu servidor. Alguns servidores não definem protocolos, deixando o link para o usuário desta forma <code>mysql.server01.com</code> por exemplo.</p>
                            <p class="pbase">Cuidado ao definir a porta, não confunda a sua porta de acesso remoto <kbd>FTP</kbd> <strong>80</strong>(comumente usada) com a sua porta <kbd>MySql</kbd> <strong>3306</strong> usada na maioria das vezes (não é regra).</p>
                        </div>
                    </div>
                    <div class="row jc-right">
                        <button class='ais-arrow-right'>Próximo Passo</button>
                    </div>
                </form>

            </div>
        </div>
    </div>
</article>