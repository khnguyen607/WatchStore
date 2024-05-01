document.addEventListener('DOMContentLoaded', async () => {
    // Đổ danh sách sản phẩm
    _init();
})

async function _init() {
    var items = await Helper.fetchData("product")
    showProducts(items)
    document.querySelector(".form-search .button-submit button").addEventListener('click', (evt)=>{
        evt.preventDefault()
        filterBy()
    })
}

async function showProducts(items) {
    var dataList = document.querySelector("._productList")
    var data = document.querySelector("._productList .product-item").cloneNode(true)
    dataList.innerHTML = ""
    await items.forEach(item => {
        let cloneData = data.cloneNode(true)
        cloneData.querySelector(".name a").textContent = item.Name
        cloneData.querySelector(".name a").href = `../client/?page=productDetail&id=${item.ID}`
        cloneData.querySelector("img").src = Helper.getLink(item.Img)
        cloneData.querySelector("._productPrice").textContent = (item.Price * 1000).toLocaleString('vi-VN') + "₫"
        cloneData.querySelector("._productSubtitle").textContent = item.Subtitle
        dataList.appendChild(cloneData)
    });
    // filterBy()
}

async function filterBy() {
    console.log(document.querySelector(".form-search .name input"));
    document.querySelectorAll("._productList .product-item").forEach(item => {
        if (
            byName(item.querySelector(".name a").textContent)
        ) {
            item.classList.remove("d-none")
        } else {
            item.classList.add("d-none")
        }
    })

    // Lọc theo tên
    function byName(name) {
        var nameValue = document.querySelector(".form-search .name input").value
        if (name.toLowerCase().includes(nameValue.toLowerCase())) {
            return true
        } else {
            return false
        }
    }
}