<article>
    <div class="row">
        <div class="col">
            <div class="box">
                <h2>Passo 2 - Configurações de Segurança </h2>
                <div class="separator"></div>
                <form action='#' _{data_send} method='post' enctype='application/x-www-form-urlencoded'>
                    <div class="row">
                        <div class="col flex-5">
                            <a id='form-area'> </a>
                            <input type='hidden' name='sh' value='true'/>
                            <div class="former form-alt">
                                <label>Tempo Ativo de Sessão</label>
                                <input name='expTime' autofocus type="text" class="form-control" value='15' placeholder="Tempo Ativo de Sessão" aria-describedby="basic-addon1">
                                <i class='ais ais-clock'> </i>
                            </div>
                            <div class="former form-alt">
                                <label>Nome do Arquivo Log</label>
                                <input name='logFile' type="text" class="form-control"  value='system_log' placeholder="Nome do Arquivo Log" aria-describedby="basic-addon1">
                                <i class='ais ais-file'> </i>
                            </div>
                        </div>
                        <div class='col flex-5'>
                            <p class="pbase">O tempo de sessão em <strong>MINUTOS</strong> indica o valor de tempo que poderá ficar ocioso ate o sistema te desconectar. O desconecte não força o redirecionamento da página automaticamente. Mas na próxima vez que tentar realizar qualquer operação fora do limite de acesso. Voce será impedido.</p>

                            <p class="pbase">O arquivo de <kbd>log</kbd> salva algumas informações relevantes sobre o funcionamento do sistema. O nome padrão é <code>system_log.log</code>, mas voce pode ao lado, definir um nome de sua preferência. A pasta continuará sendo <code>/log</code> e também não é possivel alterar a extensão do arquivo que será sempre do tipo <kbd>log</kbd>.</p>
                        </div>
                    </div>

                    <div class="row jc-right">
                        <a href='_{linkback}#form-area'><button type='button' class='ais-return'>Voltar</button></a>
                        <button class='ais-arrow-right bgGreen'>Próximo Passo</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</article>