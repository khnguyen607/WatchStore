document.addEventListener('DOMContentLoaded', async () => {
    // Đổ danh sách sản phẩm
    _init();
})

async function _init() {
    var items = await Helper.fetchData("order")
    showOrders(items)
    document.querySelector(".form-search .button-submit button").addEventListener('click', (evt) => {
        evt.preventDefault()
        filterBy()
    })
}

async function showOrders(items) {
    var dataList = document.querySelector("._ordersList")
    var data = document.querySelector("._ordersList .product-item").cloneNode(true)
    dataList.innerHTML = ""
    await items.forEach(item => {
        let cloneData = data.cloneNode(true)
        cloneData.querySelector(".item.eye").addEventListener('click', () => {
            window.location.href = "./?page=orderDetail&id=" + item.ID;
        })
        cloneData.querySelector(".item.trash").addEventListener('click', () => {
            cloneData.classList.add("d-none")
            Helper.fetchData("order&action=delete&id="+item.ID)
        })
        cloneData.querySelector(".name a").textContent = item.ID
        cloneData.querySelector("._TotalPrice").textContent = (item.TotalPrice * 1000).toLocaleString('vi-VN') + "₫"
        cloneData.querySelector("._GuestName").textContent = item.GuestName

        let _orderStatus = {
            "Chờ duyệt"         : "block-pending",
            "Đã duyệt"          : "block-published",
            "Đang giao hàng"    : "block-tracking",
            "Đã giao hàng"      : "block-available",
            "Hủy đơn"           : "block-not-available",
        }
        cloneData.querySelector("._orderStatus").textContent = item.Status
        cloneData.querySelector("._orderStatus").classList.add(_orderStatus[item.Status])
        dataList.appendChild(cloneData)
    });
}

async function filterBy() {
    console.log(document.querySelector(".form-search .name input"));
    document.querySelectorAll("._ordersList .product-item").forEach(item => {
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