document.addEventListener('DOMContentLoaded', async () => {
    // Đổ danh sách sản phẩm
    _init();
})

async function _init() {
    var items = await Helper.fetchData("product")
    showProducts(items)
    // Thêm sự kiện lọc giá khi bấm lọc
    document.querySelector(".price-range-area .text-uppercase").addEventListener('click', () => filterBy())
    document.querySelector(".shop_sidebar_searchbar i").addEventListener('click', () => filterBy())
}

async function filterBy() {
    document.querySelectorAll("#grid_layout .row.g-4 .col-sm-6").forEach(item => {
        if (
            byPrice(item.querySelector(".sale_price"))
            && byName(item.querySelector(".product_title a").textContent)
        ) {
            item.classList.remove("d-none")
        } else {
            item.classList.add("d-none")
        }
    })

    // Lọc theo giá
    function byPrice(value) {
        var str = document.querySelector("#amount").value;
        var cleanedStr = str.replace(/₫/g, '');
        var parts = cleanedStr.split(' - ');
        var minValue = parseFloat(parts[0].replace(/\./g, '').replace(/,/g, '.'));
        var maxValue = parseFloat(parts[1].replace(/\./g, '').replace(/,/g, '.'));
        value = parseFloat(value.textContent.replace(/\./g, '').replace(/,/g, '.'))
        if ((value < minValue) || (value > maxValue)) {
            return false
        } else {
            return true
        }
    }

    // Lọc theo tên
    function byName(name) {
        var nameValue = document.querySelector(".shop_sidebar_searchbar input").value
        if (name.toLowerCase().includes(nameValue.toLowerCase())) {
            return true
        } else {
            return false
        }
    }

}

async function showProducts(items) {
    var dataList = document.querySelector("#grid .row")
    var data = document.querySelector("#grid .row .col-lg-3").cloneNode(true)
    dataList.innerHTML = ""
    await items.forEach(item => {
        let cloneData = data.cloneNode(true)
        cloneData.querySelector(".product-caption a").textContent = item.Name
        cloneData.querySelector(".price-box .new-price").textContent = (item.Price * 1000).toLocaleString('vi-VN') + "₫"
        cloneData.querySelector(".product-thumb a").href += `&id=${item.ID}`
        console.log(Helper.getLink(item.Img));
        cloneData.querySelector(".product-thumb img").src = Helper.getLink(item.Img)
        dataList.appendChild(cloneData)
    });
    document.querySelector(".shop_sidebar_searchbar input").value = Helper.getParameterByName("search")
    filterBy()
}