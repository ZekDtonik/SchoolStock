<div class="row">
    <div class="col flex-10">
        <div class="box">
            <h1>_{:edit_product}</h1>
            <div class="separator"></div>
            <div class="pd-tb-1"></div>
            <form action="#" enctype="application/x-www-form-urlencoded" method="post" _{datasend}>
                <h3>_{:data_for_save_products}</h3>
                <div class="former">
                    <label for="name">_{:products}</label>
                    <input type="text" name="name" value=_{prod_name}>
                    <i class="ais ais-profile"></i>
                </div>
                <div class="former">
                    <label for="ctgid">_{:user_name}</label>
                    <select name="ctgid" id="ctgid" >
                        <option value="none">_{:products}</option>
                        _{category_options}
                    </select>
                    <i class="ais ais-profile"></i>
                </div>

                <div class="txt-right">
                    <a href="_{link_back}"><button class="bgGray ais-return" type="button">_{:return}</button></a>
                    <button class="ais-save">_{:update}</button>
                </div>
            </form>
        </div>
    </div>
</div>