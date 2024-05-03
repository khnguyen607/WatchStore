document.addEventListener('DOMContentLoaded', async () => {
    // Khởi tạo trang
    _init();
    _sendData()
    _setUserInfo()
    _loginAccount()
})

async function _init() {
    var items = await CartManager.getItem();

    var cartList = document.querySelector("._checkoutProductList tbody")
    var cartProduct = cartList.querySelector("tr.cart_item").cloneNode(true)
    cartList.innerHTML = ""
    var _totalPriceCart = 0
    Object.keys(items).forEach(item => {
        var cloneCartProduct = cartProduct.cloneNode(true)
        cloneCartProduct.querySelector(".product-name span").textContent = item
        item = items[item]
        cloneCartProduct.querySelector(".product-quantity").textContent = "× " + item.Quantity
        cloneCartProduct.querySelector(".product-total span").textContent = (parseInt(item.Price) * parseInt(item.Quantity) * 1000).toLocaleString("vi-VN") + "₫"
        _totalPriceCart += (parseInt(item.Price) * parseInt(item.Quantity) * 1000)
        cartList.appendChild(cloneCartProduct)
    });
    document.querySelector("._checkoutProductList .cart-subtotal .amount").textContent = _totalPriceCart.toLocaleString("vi-VN") + "₫"
    document.querySelector("._checkoutProductList .order-total .amount").textContent = _totalPriceCart.toLocaleString("vi-VN") + "₫"
    cartList.appendChild(trTemp)
}

async function _setUserInfo() {
    var userInfo = await Helper.fetchData("user&action=find&id=" + Helper.getCookie("user_id"))
    userInfo ? document.querySelector(".coupon-accordion").classList.add("d-none") : document.querySelector(".coupon-accordion").classList.remove("d-none")
    var inputs = document.querySelectorAll("#_formCheckout input")
    inputs[0].value = userInfo.Name
    inputs[1].value = userInfo.Address
    inputs[2].value = userInfo.Phone
    inputs[3].value = userInfo.Email
}

async function _sendData() {
    document.querySelector(".payment-method ._btnOrder").addEventListener('click', (event) => {
        event.preventDefault(); // Corrected preventDefault usage
        const formData = new FormData(document.querySelector("#_formCheckout"));
        formData.append('TotalPrice', parseInt(document.querySelector(".total_price").textContent.replace(/[^\d]/g, "")) / 1000);
        formData.append('orderDetails', JSON.stringify(CartManager.getItem()));
        if (Helper.getCookie("user_id")) {
            formData.append('userID', Helper.getCookie("user_id"));
        }
        fetch('../../backend/?controller=order&action=insert', {
            method: 'POST',
            body: formData
        })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(result => {
                console.log(result);
                if (result == true) {
                    alert("Cảm ơn bạn đã tin tưởng mua hàng!")
                    CartManager.clear()
                    window.location.href = "./";
                }
            })
            .catch(error => {
                console.error('Error sending data:', error);
            });
    });
}

async function _loginAccount() {
    document.querySelector("#checkout-login form").addEventListener('submit', (event) => {
        event.preventDefault(); // Corrected preventDefault usage
        const formData = new FormData(document.querySelector("#checkout-login form"));
        fetch('../../backend/?controller=user&action=login', {
            method: 'POST',
            body: formData
        })
        window.location.reload()
    });
}