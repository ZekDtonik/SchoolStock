<div class="row">
    <div class="col flex-10">
        <div class="box">
            <h1>_{:edit_user_group}</h1>
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
                <div class="row jc-between">
                    <div class="col">
                        <fieldset>
                            <legend>_{:attestation}</legend>
                            <div class="former">
                                <div class="switch">
                                    <input id="ps_viw_att" name="perms[attestation][view]" type="checkbox" value="1" _{checked_v_att}>
                                    <label for="ps_viw_att" data-on="ON" data-off="OFF"> </label>
                                    <span>_{:view}</span>
                                </div>
                            </div>
                            <div class="former">
                                <div class="switch">
                                    <input id="ps_add_att" name="perms[attestation][add]" type="checkbox" value="1" _{checked_a_att}>
                                    <label for="ps_add_att" data-on="ON" data-off="OFF"> </label>
                                    <span>_{:add}</span>
                                </div>
                            </div>
                            <div class="former">
                                <div class="switch">
                                    <input id="ps_edt_att" name="perms[attestation][edit]" type="checkbox" value="1" _{checked_e_att}>
                                    <label for="ps_edt_att" data-on="ON" data-off="OFF"> </label>
                                    <span>_{:edit}</span>
                                </div>
                            </div>
                            <div class="former">
                                <div class="switch">
                                    <input id="ps_del_att" name="perms[attestation][del]" type="checkbox" value="1" _{checked_d_att}>
                                    <label for="ps_del_att" data-on="ON" data-off="OFF"> </label>
                                    <span>_{:delete}</span>
                                </div>
                            </div>
                            <div class="former">
                                <div class="switch">
                                    <input id="ps_lst_att" name="perms[attestation][list]" type="checkbox" value="1" _{checked_l_att}>
                                    <label for="ps_lst_att" data-on="ON" data-off="OFF"> </label>
                                    <span>_{:list}</span>
                                </div>
                            </div>
                        </fieldset>
                    </div>
                    <div class="col">
                        <fieldset>
                            <legend>_{:audit}</legend>
                            <div class="former">
                                <div class="switch">
                                    <input id="ps_viw_adt" name="perms[audit][view]" type="checkbox" value="1" _{checked_v_adt}>
                                    <label for="ps_viw_adt" data-on="ON" data-off="OFF"> </label>
                                    <span>_{:view}</span>
                                </div>
                            </div>
                            <div class="former">
                                <div class="switch">
                                    <input id="ps_add_adt" name="perms[audit][add]" type="checkbox" value="1" _{checked_a_adt}>
                                    <label for="ps_add_adt" data-on="ON" data-off="OFF"> </label>
                                    <span>_{:add}</span>
                                </div>
                            </div>
                            <div class="former">
                                <div class="switch">
                                    <input id="ps_edt_adt" name="perms[audit][edit]" type="checkbox" value="1" _{checked_e_adt}>
                                    <label for="ps_edt_adt" data-on="ON" data-off="OFF"> </label>
                                    <span>_{:edit}</span>
                                </div>
                            </div>
                            <div class="former">
                                <div class="switch">
                                    <input id="ps_del_adt" name="perms[audit][del]" type="checkbox" value="1" _{checked_d_adt}>
                                    <label for="ps_del_adt" data-on="ON" data-off="OFF"> </label>
                                    <span>_{:delete}</span>
                                </div>
                            </div>
                            <div class="former">
                                <div class="switch">
                                    <input id="ps_lst_adt" name="perms[audit][list]" type="checkbox" value="1" _{checked_l_adt}>
                                    <label for="ps_lst_adt" data-on="ON" data-off="OFF"> </label>
                                    <span>_{:list}</span>
                                </div>
                            </div>
                        </fieldset>
                    </div>
                    <div class="col">
                        <fieldset>
                            <legend>_{:cid}</legend>
                            <div class="former">
                                <div class="switch">
                                    <input id="ps_viw_cid" name="perms[cid][view]" type="checkbox" value="1" _{checked_v_cid}>
                                    <label for="ps_viw_cid" data-on="ON" data-off="OFF"> </label>
                                    <span>_{:view}</span>
                                </div>
                            </div>
                            <div class="former">
                                <div class="switch">
                                    <input id="ps_add_cid" name="perms[cid][add]" type="checkbox" value="1" _{checked_a_cid}>
                                    <label for="ps_add_cid" data-on="ON" data-off="OFF"> </label>
                                    <span>_{:add}</span>
                                </div>
                            </div>
                            <div class="former">
                                <div class="switch">
                                    <input id="ps_edt_cid" name="perms[cid][edit]" type="checkbox" value="1" _{checked_e_cid}>
                                    <label for="ps_edt_cid" data-on="ON" data-off="OFF"> </label>
                                    <span>_{:edit}</span>
                                </div>
                            </div>
                            <div class="former">
                                <div class="switch">
                                    <input id="ps_del_cid" name="perms[cid][del]" type="checkbox" value="1" _{checked_d_cid}>
                                    <label for="ps_del_cid" data-on="ON" data-off="OFF"> </label>
                                    <span>_{:delete}</span>
                                </div>
                            </div>
                            <div class="former">
                                <div class="switch">
                                    <input id="ps_lst_cid" name="perms[cid][list]" type="checkbox" value="1" _{checked_l_cid}>
                                    <label for="ps_lst_cid" data-on="ON" data-off="OFF"> </label>
                                    <span>_{:list}</span>
                                </div>
                            </div>
                        </fieldset>
                    </div>
                    <div class="col">
                        <fieldset>
                            <legend>_{:global_credentials}</legend>
                            <div class="former">
                                <div class="switch">
                                    <input id="ps_viw_crs" name="perms[credentials][view]" type="checkbox" value="1" _{checked_v_crs}>
                                    <label for="ps_viw_crs" data-on="ON" data-off="OFF"> </label>
                                    <span>_{:view}</span>
                                </div>
                            </div>
                            <div class="former">
                                <div class="switch">
                                    <input id="ps_add_crs" name="perms[credentials][add]" type="checkbox" value="1" _{checked_a_crs}>
                                    <label for="ps_add_crs" data-on="ON" data-off="OFF"> </label>
                                    <span>_{:add}</span>
                                </div>
                            </div>
                            <div class="former">
                                <div class="switch">
                                    <input id="ps_edt_crs" name="perms[credentials][edit]" type="checkbox" value="1" _{checked_e_crs}>
                                    <label for="ps_edt_crs" data-on="ON" data-off="OFF"> </label>
                                    <span>_{:edit}</span>
                                </div>
                            </div>
                            <div class="former">
                                <div class="switch">
                                    <input id="ps_del_crs" name="perms[credentials][del]" type="checkbox" value="1" _{checked_d_crs}>
                                    <label for="ps_del_crs" data-on="ON" data-off="OFF"> </label>
                                    <span>_{:delete}</span>
                                </div>
                            </div>
                            <div class="former">
                                <div class="switch">
                                    <input id="ps_lst_crs" name="perms[credentials][list]" type="checkbox" value="1" _{checked_v_crs}>
                                    <label for="ps_lst_crs" data-on="ON" data-off="OFF"> </label>
                                    <span>_{:list}</span>
                                </div>
                            </div>
                        </fieldset>
                    </div>
                    <div class="col">
                        <fieldset>
                            <legend>_{:employee}</legend>
                            <div class="former">
                                <div class="switch">
                                    <input id="ps_viw_emp" name="perms[employee][view]" type="checkbox" value="1" _{checked_v_emp}>
                                    <label for="ps_viw_emp" data-on="ON" data-off="OFF"> </label>
                                    <span>_{:view}</span>
                                </div>
                            </div>
                            <div class="former">
                                <div class="switch">
                                    <input id="ps_add_emp" name="perms[employee][add]" type="checkbox" value="1" _{checked_a_emp}>
                                    <label for="ps_add_emp" data-on="ON" data-off="OFF"> </label>
                                    <span>_{:add}</span>
                                </div>
                            </div>
                            <div class="former">
                                <div class="switch">
                                    <input id="ps_edt_emp" name="perms[employee][edit]" type="checkbox" value="1" _{checked_e_emp}>
                                    <label for="ps_edt_emp" data-on="ON" data-off="OFF"> </label>
                                    <span>_{:edit}</span>
                                </div>
                            </div>
                            <div class="former">
                                <div class="switch">
                                    <input id="ps_del_emp" name="perms[employee][del]" type="checkbox" value="1" _{checked_d_emp}>
                                    <label for="ps_del_emp" data-on="ON" data-off="OFF"> </label>
                                    <span>_{:delete}</span>
                                </div>
                            </div>
                            <div class="former">
                                <div class="switch">
                                    <input id="ps_lst_emp" name="perms[employee][list]" type="checkbox" value="1" _{checked_l_emp}>
                                    <label for="ps_lst_emp" data-on="ON" data-off="OFF"> </label>
                                    <span>_{:list}</span>
                                </div>
                            </div>
                        </fieldset>
                    </div>
                </div>
                <div class="row jc-between">
                    <div class="col">
                        <fieldset>
                            <legend>_{:medics}</legend>
                            <div class="former">
                                <div class="switch">
                                    <input id="ps_viw_med" name="perms[medic][view]" type="checkbox" value="1" _{checked_v_med}>
                                    <label for="ps_viw_med" data-on="ON" data-off="OFF"> </label>
                                    <span>_{:view}</span>
                                </div>
                            </div>
                            <div class="former">
                                <div class="switch">
                                    <input id="ps_add_med" name="perms[medic][add]" type="checkbox" value="1" _{checked_a_med}>
                                    <label for="ps_add_med" data-on="ON" data-off="OFF"> </label>
                                    <span>_{:add}</span>
                                </div>
                            </div>
                            <div class="former">
                                <div class="switch">
                                    <input id="ps_edt_med" name="perms[medic][edit]" type="checkbox" value="1" _{checked_e_med}>
                                    <label for="ps_edt_med" data-on="ON" data-off="OFF"> </label>
                                    <span>_{:edit}</span>
                                </div>
                            </div>
                            <div class="former">
                                <div class="switch">
                                    <input id="ps_del_med" name="perms[medic][del]" type="checkbox" value="1" _{checked_d_med}>
                                    <label for="ps_del_med" data-on="ON" data-off="OFF"> </label>
                                    <span>_{:delete}</span>
                                </div>
                            </div>
                            <div class="former">
                                <div class="switch">
                                    <input id="ps_lst_med" name="perms[medic][list]" type="checkbox" value="1" _{checked_l_med}>
                                    <label for="ps_lst_med" data-on="ON" data-off="OFF"> </label>
                                    <span>_{:list}</span>
                                </div>
                            </div>
                        </fieldset>
                    </div>
                    <div class="col">
                        <fieldset>
                            <legend>_{:role}</legend>
                            <div class="former">
                                <div class="switch">
                                    <input id="ps_viw_rol" name="perms[role][view]" type="checkbox" value="1" _{checked_v_rol}>
                                    <label for="ps_viw_rol" data-on="ON" data-off="OFF"> </label>
                                    <span>_{:view}</span>
                                </div>
                            </div>
                            <div class="former">
                                <div class="switch">
                                    <input id="ps_add_rol" name="perms[role][add]" type="checkbox" value="1" _{checked_a_rol}>
                                    <label for="ps_add_rol" data-on="ON" data-off="OFF"> </label>
                                    <span>_{:add}</span>
                                </div>
                            </div>
                            <div class="former">
                                <div class="switch">
                                    <input id="ps_edt_rol" name="perms[role][edit]" type="checkbox" value="1" _{checked_e_rol}>
                                    <label for="ps_edt_rol" data-on="ON" data-off="OFF"> </label>
                                    <span>_{:edit}</span>
                                </div>
                            </div>
                            <div class="former">
                                <div class="switch">
                                    <input id="ps_del_rol" name="perms[role][del]" type="checkbox" value="1" _{checked_d_rol}>
                                    <label for="ps_del_rol" data-on="ON" data-off="OFF"> </label>
                                    <span>_{:delete}</span>
                                </div>
                            </div>
                            <div class="former">
                                <div class="switch">
                                    <input id="ps_lst_rol" name="perms[role][list]" type="checkbox" value="1" _{checked_l_rol}>
                                    <label for="ps_lst_rol" data-on="ON" data-off="OFF"> </label>
                                    <span>_{:list}</span>
                                </div>
                            </div>
                        </fieldset>
                    </div>
                    <div class="col">
                        <fieldset>
                            <legend>_{:user_group}</legend>
                            <div class="former">
                                <div class="switch">
                                    <input id="ps_viw_usg" name="perms[usergroup][view]" type="checkbox" value="1" _{checked_v_usg}>
                                    <label for="ps_viw_usg" data-on="ON" data-off="OFF"> </label>
                                    <span>_{:view}</span>
                                </div>
                            </div>
                            <div class="former">
                                <div class="switch">
                                    <input id="ps_add_usg" name="perms[usergroup][add]" type="checkbox" value="1" _{checked_a_usg}>
                                    <label for="ps_add_usg" data-on="ON" data-off="OFF"> </label>
                                    <span>_{:add}</span>
                                </div>
                            </div>
                            <div class="former">
                                <div class="switch">
                                    <input id="ps_edt_usg" name="perms[usergroup][edit]" type="checkbox" value="1" _{checked_e_usg}>
                                    <label for="ps_edt_usg" data-on="ON" data-off="OFF"> </label>
                                    <span>_{:edit}</span>
                                </div>
                            </div>
                            <div class="former">
                                <div class="switch">
                                    <input id="ps_del_usg" name="perms[usergroup][del]" type="checkbox" value="1" _{checked_d_usg}>
                                    <label for="ps_del_usg" data-on="ON" data-off="OFF"> </label>
                                    <span>_{:delete}</span>
                                </div>
                            </div>
                            <div class="former">
                                <div class="switch">
                                    <input id="ps_lst_usg" name="perms[usergroup][list]" type="checkbox" value="1" _{checked_l_usg}>
                                    <label for="ps_lst_usg" data-on="ON" data-off="OFF"> </label>
                                    <span>_{:list}</span>
                                </div>
                            </div>
                        </fieldset>
                    </div>
                    <div class="col">
                        <fieldset>
                            <legend>_{:users}</legend>
                            <div class="former">
                                <div class="switch">
                                    <input id="ps_viw_usr" name="perms[users][view]" type="checkbox" value="1" _{checked_v_usr}>
                                    <label for="ps_viw_usr" data-on="ON" data-off="OFF"> </label>
                                    <span>_{:view}</span>
                                </div>
                            </div>
                            <div class="former">
                                <div class="switch">
                                    <input id="ps_add_usr" name="perms[users][add]" type="checkbox" value="1" _{checked_a_usr}>
                                    <label for="ps_add_usr" data-on="ON" data-off="OFF"> </label>
                                    <span>_{:add}</span>
                                </div>
                            </div>
                            <div class="former">
                                <div class="switch">
                                    <input id="ps_edt_usr" name="perms[users][edit]" type="checkbox" value="1" _{checked_e_usr}>
                                    <label for="ps_edt_usr" data-on="ON" data-off="OFF"> </label>
                                    <span>_{:edit}</span>
                                </div>
                            </div>
                            <div class="former">
                                <div class="switch">
                                    <input id="ps_del_usr" name="perms[users][del]" type="checkbox" value="1" _{checked_d_usr}>
                                    <label for="ps_del_usr" data-on="ON" data-off="OFF"> </label>
                                    <span>_{:delete}</span>
                                </div>
                            </div>
                            <div class="former">
                                <div class="switch">
                                    <input id="ps_lst_usr" name="perms[users][list]" type="checkbox" value="1" _{checked_l_usr}>
                                    <label for="ps_lst_usr" data-on="ON" data-off="OFF"> </label>
                                    <span>_{:list}</span>
                                </div>
                            </div>
                        </fieldset>
                    </div>
                    <div class="col">
                        <fieldset>
                            <legend>_{:report}</legend>
                            <div class="former">
                                <div class="switch">
                                    <input id="ps_viw_rel" name="perms[report][view]" type="checkbox" value="1" _{checked_v_rel}>
                                    <label for="ps_viw_rel" data-on="ON" data-off="OFF"> </label>
                                    <span>_{:view}</span>
                                </div>
                            </div>
                            <div class="former">
                                <div class="switch">
                                    <input id="ps_add_rel" name="perms[report][add]" type="checkbox" value="1" _{checked_a_rel}>
                                    <label for="ps_add_rel" data-on="ON" data-off="OFF"> </label>
                                    <span>_{:add}</span>
                                </div>
                            </div>
                            <div class="former">
                                <div class="switch">
                                    <input id="ps_edt_rel" name="perms[report][edit]" type="checkbox" value="1" _{checked_e_rel}>
                                    <label for="ps_edt_rel" data-on="ON" data-off="OFF"> </label>
                                    <span>_{:edit}</span>
                                </div>
                            </div>
                            <div class="former">
                                <div class="switch">
                                    <input id="ps_del_rel" name="perms[report][del]" type="checkbox" value="1" _{checked_d_rel}>
                                    <label for="ps_del_rel" data-on="ON" data-off="OFF"> </label>
                                    <span>_{:delete}</span>
                                </div>
                            </div>
                            <div class="former">
                                <div class="switch">
                                    <input id="ps_lst_rel" name="perms[report][list]" type="checkbox" value="1" _{checked_l_rel}>
                                    <label for="ps_lst_rel" data-on="ON" data-off="OFF"> </label>
                                    <span>_{:list}</span>
                                </div>
                            </div>
                        </fieldset>
                    </div>
                </div>


                <div class="txt-right">
                    <a href="_{link_back}"><button class="bgGray ais-return" type="button">_{:return}</button></a>
                    <button class="ais-save">_{:save_group}</button>
                </div>
            </form>
        </div>
    </div>
</div>