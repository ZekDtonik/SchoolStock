<div class="row">
    <div class="col flex-10">
        <div class="box">
            <h1>_{title_user}</h1>
            <div class="separator"></div>
            <div class="pd-tb-1"></div>
            <form action="#" enctype="application/x-www-form-urlencoded" method="post" _{datasend}>
                <h3>_{:personal_data}</h3>
                <div class="former required">
                    <label for="name">_{:name}</label>
                    <input type="text" name="name" id="name" placeholder="_{:name}  " value="_{value_name}">
                    <i class="ais ais-name"> </i>
                </div>
                <div class="former required">
                    <label for="lastname">_{:last_name}</label>
                    <input type="text" name="lastname" id="lastname" placeholder="_{:last_name}  " value="_{value_lastname}">
                    <i class="ais ais-name"> </i>
                </div>
                <h3>_{:access_data}</h3>
                <div class="former required">
                    <label for="email">_{:user_email}</label>
                    <input type="text" name="email" id="email" placeholder="_{:email} " value="_{value_email}">
                    <i class="ais ais-mail"></i>
                </div>
                <div class="former">
                    <label for="email_alt">_{:user_email_alt}</label>
                    <input type="text" name="email_alt" id="email_alt" placeholder="_{:email_alt} " value="_{value_email_alt}">
                    <i class="ais ais-mail"> </i>
                </div>
                <div class="dFlex jc-between">
                    <div class="former required">
                        <label for="login">_{:login}</label>
                        <input type="text" name="login" id="login" placeholder="_{:login} " value="_{value_login}">
                        <i class="ais ais-user"> </i>
                    </div>
                    <div class="former required _{pass_red_in_edit}">
                        <label for="password">_{:user_password}</label>
                        <input type="text" name="password" id="password" placeholder="_{:password} " value="_{value_password}">
                        <i class="ais ais-passwd"> </i>
                    </div>
                </div>
                <h3>_{:permission_access}</h3>
                <div class="row">
                    <div class="col">
                        <fieldset>
                            <legend>_{:enable_user}</legend>
                            <div class="former">
                                <div class="switch">
                                    <input id="active" name="active" type="checkbox" value="1" _{checked_active}>
                                    <label for="active" data-on="ON" data-off="OFF"> </label>
                                    <span>_{:active}</span>
                                </div>
                            </div>
                        </fieldset>
                    </div>
                </div>

                <div class="txt-right">
                    <a href="_{link_back}"><button class="bgGray ais-return" type="button">_{:return}</button></a>
                    <button class="ais-save">_{:register_user}</button>
                </div>


            </form>
        </div>
    </div>
</div>