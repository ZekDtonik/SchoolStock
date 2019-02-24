<div class="col">
    <fieldset>
        <legend>_{module_name}</legend>
        <div class="former">
            <div class="switch">
                <input id="ps_viw__{id_obj}" name="perms[_{input_name}][view]" type="checkbox" value="1" _{checked_v_obj}>
                <label for="ps_viw__{id_obj}" data-on="ON" data-off="OFF"> </label>
                <span>_{:view}</span>
            </div>
        </div>
        <div class="former">
            <div class="switch">
                <input id="ps_add__{id_obj}" name="perms[_{input_name}][add]" type="checkbox" value="1" _{checked_a_obj}>
                <label for="ps_add__{id_obj}" data-on="ON" data-off="OFF"> </label>
                <span>_{:add}</span>
            </div>
        </div>
        <div class="former">
            <div class="switch">
                <input id="ps_edt__{id_obj}" name="perms[_{input_name}][edit]" type="checkbox" value="1" _{checked_e_obj}>
                <label for="ps_edt__{id_obj}" data-on="ON" data-off="OFF"> </label>
                <span>_{:edit}</span>
            </div>
        </div>
        <div class="former">
            <div class="switch">
                <input id="ps_del__{id_obj}" name="perms[_{input_name}][del]" type="checkbox" value="1" _{checked_d_obj}>
                <label for="ps_del__{id_obj}" data-on="ON" data-off="OFF"> </label>
                <span>_{:delete}</span>
            </div>
        </div>
        <div class="former">
            <div class="switch">
                <input id="ps_lst__{id_obj}" name="perms[_{input_name}][list]" type="checkbox" value="1" _{checked_l_obj}>
                <label for="ps_lst__{id_obj}" data-on="ON" data-off="OFF"> </label>
                <span>_{:list}</span>
            </div>
        </div>
    </fieldset>
</div>