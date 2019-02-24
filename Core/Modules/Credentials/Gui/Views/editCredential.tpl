<div class="row">
    <div class="col flex-10">
        <div class="box">
            <h1>_{:edit_credential}</h1>
            <div class="separator"></div>
            <div class="pd-tb-1"></div>
            <form action="#" enctype="application/x-www-form-urlencoded" method="post" _{datasend}>
                <h3>_{:basic_register}</h3>
                <div class="former">
                    <label for="username">_{:user_name}</label>
                    <select name="username" id="username" >
                        <option value="none">_{:user_name}</option>
                        _{user_options}
                    </select>
                    <i class="ais ais-profile"></i>
                </div>
                <div class="former">
                    <label for="usergroup">_{:user_group_description}</label>
                    <select name="usergroup" id="usergroup" >
                        <option value="none">_{:user_group}</option>
                        _{user_group_options}
                    </select>
                    <i class="ais ais-description"></i>
                </div>


                <div class="txt-right">
                    <a href="_{link_back}"><button class="bgGray ais-return" type="button">_{:return}</button></a>
                    <button class="ais-save">_{:save_credential}</button>
                </div>
            </form>
        </div>
    </div>
</div>