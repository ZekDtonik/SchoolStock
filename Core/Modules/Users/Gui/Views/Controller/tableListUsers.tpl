<tr>
    <td>_{authid}</td>
    <td>_{name}</td>
    <td>_{login}</td>
    <td>_{email}</td>
    <td class="txt-center">
        <div class="former inline-block tip" >
            <div class="switch " title="_{:active_or_block_user}" >
                <input id="active-_{authid}" name="active" type="checkbox" value="1" _{checked_active}>
                <label for="active-_{authid}" data-on="ON" data-off="OFF" _{data_send_active_user}> </label>
            </div>
        </div>

        <a href='_{link_edit}'><div class='btn-action bgGreen ais-edit' title="_{:edit}"></div></a>
        <div data-prompt="_{data_prompt}" class='btn-action bgRed ais-del inline-block' title="_{:delete}"></div>
    </td>
</tr>

