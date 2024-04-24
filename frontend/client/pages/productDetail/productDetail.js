document.addEventListener('DOMContentLoaded', async () => {
    // Khởi tạo trang
    _init();
    // // Đặt giá trị dinh dưỡng
    // _getNutritionValue();
    // // Đặt danh mục
    // _getCategories();
})

async function _init() {
    var item = await Helper.fetchData(`product&action=find&id=${Helper.getParameterByName("id")}`)

    document.querySelector(".product-info h3").textContent = item.Name
    document.querySelector(".product-info ._Subtitle").textContent = item.Subtitle
    document.querySelector(".product_description_wrap .product_desc").innerHTML = item.Description
    document.querySelector("._imgProduct img").src = Helper.getLink(item.Img)
    document.querySelector("._imgProduct a").href = Helper.getLink(item.Img)
    document.querySelector(".price-box .new-price").textContent = (item.Price * 1000).toLocaleString("vi-VN") + "₫"
    document.querySelector(".add-to-cart").addEventListener("click", (evt) => {
        evt.preventDefault()
        CartManager.setItem(
            item.Name,
            {
                Price: item.Price,
                Img: item.Img,
                Quantity: document.querySelector(".cart-plus-minus input").value,
                ID: item.ID
            })
        alert("Thêm giỏ hàng thành công")
        CartManager.show()
    })
}

async function _getNutritionValue() {
    var items = await Helper.fetchData(`product&action=nutritionalValue&id=${Helper.getParameterByName("id")}`)
    var nutrition = document.querySelector(".product10_value_table tbody")
    nutrition.innerHTML = ""
    items.forEach(item => {
        var nutri = document.createElement("tr")
        nutri.innerHTML = `
            <th scope="row">${item.Value + item.Unit}</th>
            <td>${item.Name}</td>
        `
        nutrition.appendChild(nutri)
    });
}

async function _getCategories() {
    var items = await Helper.fetchData(`product&action=getCategory&id=${Helper.getParameterByName("id")}`)
    var categories = document.querySelector(".tags_item")
    categories.innerHTML = ""
    items.forEach((item, index) => {
        var category = document.createElement("a");
        category.classList.add("me-1");
        category.textContent = (index == items.length - 1) ? item.Name : item.Name + ",";
        categories.appendChild(category);
    });    
}
