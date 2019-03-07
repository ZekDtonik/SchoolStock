<div class="row">
    <div class="col flex-10">
        <div class="box">
            <h1>Edição de Produtos</h1>
            <div class="separator"></div>
            <div class="pd-tb-1"></div>
            <form action="#" enctype="application/x-www-form-urlencoded" method="post" _{datasend}>
                <h3>Dados de registro de produtos</h3>
                <div class="former">
                    <label for="name">Produtos</label>
                    <input type="text" name="name" value=_{prod_name}>
                    <i class="ais ais-profile"></i>
                </div>
                <div class="former">
                    <label for="ctgid">_{:user_name}</label>
                    <select name="ctgid" id="ctgid" >
                        <option value="none">Produtos</option>
                        _{category_options}
                    </select>
                    <i class="ais ais-profile"></i>
                </div>

                <div class="txt-right">
                    <a href="_{link_back}"><button class="bgGray ais-return" type="button">_{:return}</button></a>
                    <button class="ais-save">Atualizar</button>
                </div>
            </form>
        </div>
    </div>
</div>