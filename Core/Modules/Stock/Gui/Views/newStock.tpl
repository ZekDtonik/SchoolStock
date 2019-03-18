<div class="row">
    <div class="col flex-10">
        <div class="box">
            <h1>_{:stock_new}</h1>
            <div class="separator"></div>
            <div class="pd-tb-1"></div>
            <form action="#" enctype="application/x-www-form-urlencoded" method="post" _{datasend}>
                <h3>_{:stock_date_basic}</h3>

                <div class="former">
                    <label for="productName">_{:product_name}</label>
                    <select name="productName" id="productName" >
                        <option value="none">_{:product_name}</option>
                        _{products_options}
                    </select>
                    <i class="ais ais-name"></i>
                </div>

                  <div class="dFlex jc-between">

                    <div class="former required">
                      <label for="productQuantity">_{:product_quantity}</label>
                      <input type="text" name="productQuantity" id="productQuantity"
                      placeholder="_{:product_quantity}  " value="" />
                      <i class="ais ais-name"> </i>
                    </div>

                    <div class="former required">
                      <label for="productQuantityMin">_{:product_quantity_min}</label>
                      <input type="text" name="productQuantityMin" id="productQuantityMin" placeholder="_{:product_quantity_min}  " value="" />
                      <i class="ais ais-name"> </i>
                    </div>

              </div>


                <div class="txt-right">
                    <a href="_{link_back}"><button class="bgGray ais-return" type="button">_{:return}</button></a>
                    <button class="ais-save">_{:stock_register}</button>
                </div>
            </form>
        </div>
    </div>
</div>
