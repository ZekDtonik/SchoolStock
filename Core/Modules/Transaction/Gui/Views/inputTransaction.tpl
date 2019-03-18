<div class="row">
    <div class="col flex-10">
        <div class="box">
            <h1>_{:transaction_input}</h1>
            <div class="separator"></div>
            <div class="pd-tb-1"></div>
            <form action="#" enctype="application/x-www-form-urlencoded" method="post" _{datasend}>
                <h3>_{:transaction_date_basic}</h3>

                <div class="former">
                    <label for="productName">_{:transaction_product_name}</label>
                    <select name="productName" id="productName" >
                        <option value="none">_{:transaction_product_name}</option>
                        _{products_options}
                    </select>
                    <i class="ais ais-name"></i>
                </div>

                  <div class="dFlex jc-between">

                    <div class="former required">
                      <label for="productQuantity">_{:transaction_qnt}</label>
                      <input type="text" name="productQuantity" id="productQuantity" placeholder="_{:transaction_qnt}  " value="" />
                      <i class="ais ais-name"> </i>
                    </div>

                    <div class="txt-right">
                      <a href="_{link_back}"><button class="bgGray ais-return" type="button">_{:return}</button></a>
                      <button class="ais-save">_{:transaction_register} _{:transaction_input}</button>
                    </div>
              </div>
            </form>
        </div>
    </div>
</div>
