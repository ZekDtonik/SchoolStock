<div class="row jc-center">
    <div class="col flex-1 dFlex jc-center">
        <div class="box wp-100 mwp-9">
            <div class="profile">
                <div class="row">
                    <div class="col flex-1">
                        <div class="avatar">_{image_avatar}</div>
                    </div>
                    <div class="col flex-9 dFlex al-center">
                        <div id="profile_info">
                            <ul>
                                <li><h1>_{user_name}</h1></li>
                                <li><h3>_{:authid}: _{user_authid}</h3></li>
                                <li><h4>_{:login}: _{user_login}</h4></li>
                                <li><h4>_{:email}: _{user_email}</h4></li>
                                <li><h4>_{:last_edited}: _{user_lastEdited}</h4></li>
                            </ul>
                        </div>

                    </div>
                </div>
                <div class="row">
                    <div class="col wp-100">

                        <h1 class="txt-right">_{:profile_change}</h1>
                        <div class="separator"></div>
                        <div class="pd-tb-1"></div>
                        <form action="#" method="POST" enctype="multipart/form-data" _{data_send}>
                            <div class="former req">
                                <label for="name">_{:name}</label>
                                <input type="text" id="name" name="name" value="_{value_name}" placeholder="_{:name}"/>
                                <i class="ais ais-name"> </i>
                            </div>
                            <div class="former req">
                                <label for="lastname">_{:lastname}</label>
                                <input type="text" id="lastname" name="lastname" value="_{value_lastname}" placeholder="_{:lastname}"/>
                                <i class="ais ais-name"> </i>
                            </div>
                            <div class="former req">
                                <label for="email">_{:email}</label>
                                <input type="text" id="email" name="email" value="_{value_email}" placeholder="_{:email}"/>
                                <i class="ais ais-mail"> </i>
                            </div>
                            <div class="former">
                                <label for="email_alt">_{:email_alt}</label>
                                <input type="text" id="email_alt" name="emailAlt" value="_{value_email_alt}" placeholder="_{:email_alt}"/>
                                <i class="ais ais-mail"> </i>
                            </div>
                            <div class="dFlex dfWrap jc-between ">
                                <div class="former">
                                    <label for="password">_{:password}</label>
                                    <input type="text" id="password" name="password" value="_{value_email_alt}" placeholder="_{:password}"/>
                                    <i class="ais ais-passwd"> </i>
                                </div>
                                <div class="former">
                                    <label for="repeatPassword">_{:repeat_password}</label>
                                    <input type="text" id="repeatPassword" name="repeatPassword" value="_{value_email_alt}" placeholder="_{:repeat_password}"/>
                                    <i class="ais ais-passwd"> </i>
                                </div>
                            </div>
                            <div class="former form-alt">
                                <label for="avatar">_{:photo}</label>
                                <input type="file" id="avatar" name="avatar" value="_{value_avatar}" placeholder="_{:photo}"/>
                                <i class="ais ais-image"> </i>
                            </div>
                            <div class="txt-right pd-tb-1">
                                <a href="_{link_back}"><button class="bgGray ais-return" type="button">_{:return}</button></a>
                                <button class="ais-save">_{:register_group}</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>