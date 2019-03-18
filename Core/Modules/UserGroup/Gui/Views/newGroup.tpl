<div class="row">
    <div class="col flex-10">
        <div class="box">
            <h1>_{title_user_group}</h1>
            <div class="separator"></div>
            <div class="pd-tb-1"></div>
            <form action="#" enctype="application/x-www-form-urlencoded" method="post" _{datasend}>
                <h3>_{:basic_register}</h3>
                <div class="former">
                    <label for="name">_{:user_group_name}</label>
                    <input type="text" name="name" id="name" placeholder="_{:user_group_name}  " value="_{value_name}">
                    <i class="ais ais-name"></i>
                </div>
                <div class="former">
                    <label for="description">_{:user_group_description}</label>
                    <input type="text" name="description" id="description" placeholder="_{:user_group_description} " value="_{value_description}">
                    <i class="ais ais-description"></i>
                </div>
                <h3>_{:permission_access}</h3>
                <div class="row">
                    <div class="col">
                        <fieldset>
                            <legend>_{:enable_user_group}</legend>
                            <div class="former">
                                <div class="switch">
                                    <input id="active" name="active" type="checkbox" value="1" _{checked_active}>
                                    <label for="active" data-on="ON" data-off="OFF"> </label>
                                    <span>_{:active}</span>
                                </div>
                            </div>
                        </fieldset>
                    </div>
                    <div class="col">
                        <fieldset>
                            <legend>_{:user_system}</legend>
                            <div class="former">
                                <div class="switch">
                                    <input id="system" name="system" type="checkbox" value="1" _{checked_system}>
                                    <label for="system" data-on="ON" data-off="OFF"> </label>
                                    <span>_{:system}</span>
                                </div>
                            </div>
                        </fieldset>
                    </div>
                </div>
                <div class="row">
                    <h3>_{:other_actions}</h3>
                </div>
                _{permissions}

                <div class="txt-right">
                    <a href="_{link_back}"><button class="bgGray ais-return" type="button">_{:return}</button></a>
                    <button class="ais-save">_{button_save}</button>
                </div>
            </form>
        </div>
    </div>
</div>