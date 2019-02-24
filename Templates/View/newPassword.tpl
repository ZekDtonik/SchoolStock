<div class='login-bg'></div>
<div class='content al-center'>

    <div class='row jc-center'>
        <div class='col'>
            <div class='box w-4'>
                <div class='logo-login'></div>
                <div class='separator'></div>
                <h2 class="txt-center">_{:system_recovery}</h2>
                <form action="#" method='post' enctype='application/x-www-form-urlencoded' rel='recover' _{datasend}>
                    <div class='former'>
                        <label for="scr_code">_{:security_code}</label>
                        <input name='code' id="scr_code" type='number' aria-label='code' placeholder='_{:security_code}'>
                        <i class='ais ais-security'> </i>
                    </div>
                    <div class='former'>
                        <label for="password">_{:password}</label>
                        <input name='password' id="password" type='password' aria-label='code' placeholder='_{:password}'>
                        <i class='ais ais-passwd'> </i>
                    </div>
                    <div class='former'>
                        <label for="password">_{:repeat_password}</label>
                        <input name='repeatPassword' id="password" type='password' aria-label='code' placeholder='_{:repeat_password}'>
                        <i class='ais ais-lock'> </i>
                    </div>
                    <div class="dFlex jc-around">
                        <a href="_{www}" class='wp-30'>
                            <button type="button" class='wp-100 bgGreen ais-return'>_{:return}</button></a>
                        <button class='wp-50 ais-save'>_{:save_new_password}</button>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>
