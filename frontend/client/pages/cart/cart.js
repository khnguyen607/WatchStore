document.addEventListener('DOMContentLoaded', async () => {
    await Helper.fetchBackendLink()
    // Khởi tạo trang
    _init();

    document.querySelector(".coupon2 input").addEventListener("click", async (evt) => {
        evt.preventDefault();
        let items = await CartManager.getItem();
        CartManager.clear();
        document.querySelectorAll(".table.table tbody tr").forEach(item=>{
            items[item.querySelector(".plantmore-product-name a").textContent]["Quantity"] = parseInt(item.querySelector(".plantmore-product-quantity input").value)
            CartManager.setItem(item.querySelector(".plantmore-product-name a").textContent, items[item.querySelector(".plantmore-product-name a").textContent])
        })
        _init();
    })
})

async function _init() {
    var items = await CartManager.getItem();
    var cartList = document.querySelector(".table.table tbody")
    var cartProduct = cartList.querySelector("tr").cloneNode(true)
    cartList.innerHTML = ""
    var _totalPriceCart = 0
    Object.keys(items).forEach(item => {
        var cloneCartProduct = cartProduct.cloneNode(true)
        cloneCartProduct.querySelector(".plantmore-product-name a").textContent = item
        var itemName = item
        cloneCartProduct.querySelector(".plantmore-product-remove a").addEventListener('click', (evt)=>{
            evt.preventDefault()
            CartManager.delItem(itemName)
            window.location.reload()
            alert('Xóa thành công sản phẩm: '+itemName)
        })
        item = items[item]
        cloneCartProduct.querySelector("img").src = Helper.getLink(item.Img)
        cloneCartProduct.querySelector(".plantmore-product-price span").textContent = (item.Price * 1000).toLocaleString("vi-VN") + "₫"
        cloneCartProduct.querySelector(".plantmore-product-quantity input").value = item.Quantity
        cloneCartProduct.querySelector(".product-subtotal span").textContent = (parseInt(item.Price) * parseInt(item.Quantity) * 1000).toLocaleString("vi-VN") + "₫"
        _totalPriceCart += (parseInt(item.Price) * parseInt(item.Quantity) * 1000)
        cartList.appendChild(cloneCartProduct)
    });
    document.querySelector(".total_price_Total").textContent = _totalPriceCart.toLocaleString("vi-VN") + "₫"
}