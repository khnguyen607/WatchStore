document.addEventListener('DOMContentLoaded', async () => {
    // Khởi tạo trang
    _init();
    _orderDetail();
    _setStatus();
})

async function _init() {
    var item = await Helper.fetchData(`order&action=find&id=${Helper.getParameterByName("id")}`)
    document.querySelector(".main-content-wrap .items-center h3").textContent = "Mã đơn: #" + item.ID
    document.querySelector("._orderSummary ._orderID").textContent = "#" + item.ID
    document.querySelector("._orderSummary ._orderDate").textContent = item.Date
    // document.querySelector("._orderSummary ._orderPrice").textContent = (item.TotalPrice * 1000).toLocaleString("vi-VN") + "₫"
    document.querySelector("._orderSummary ._orderAddress").textContent = item.GuestAddress
    
    if (item.Status=="Hủy đơn") {
        console.log("hitr");
        document.querySelector("button._orderCancel").classList.remove('d-none')
        document.querySelector("div._orderCancel").classList.remove('d-none')
        document.querySelector("button._orderCancel").addEventListener('click', ()=>{
            Helper.fetchData(`order&action=changeStatus&id=${Helper.getParameterByName("id")}&newStaus=Đang giao hàng`)
            location.reload()
        })
    } else {
        document.querySelector("button._orderTracking").classList.remove('d-none')
        document.querySelector("div._orderTracking").classList.remove('d-none')
        document.querySelector("button._orderTracking").addEventListener('click', ()=>{
            Helper.fetchData(`order&action=changeStatus&id=${Helper.getParameterByName("id")}&newStaus=Hủy đơn`)
            location.reload()
        })
        var orderTracking = document.querySelectorAll(".road-map._orderTracking .road-map-item")
        for (const order of orderTracking) {
            order.classList.add("active")
            if (order.querySelector("h6").textContent == item.Status) {
                return
            }
        }
    }
}

async function _orderDetail() {
    var items = await Helper.fetchData("orderDetail&action=getOrderDetail&orderID=" + Helper.getParameterByName("id"))
    var dataList = document.querySelector("._orderList")
    var data = document.querySelector("._orderList .product-item").cloneNode(true)
    dataList.innerHTML = ""
    var totalPrice = 0
    items.forEach(item => {
        let cloneData = data.cloneNode(true)
        cloneData.querySelector(".name a").textContent = item.Name
        // cloneData.querySelector(".name a").href = `../client/?page=productDetail&id=${item.ID}`
        cloneData.querySelector("img").src = Helper.getLink(item.Img)
        cloneData.querySelector("._productPrice").textContent = (item.Price * 1000).toLocaleString('vi-VN') + "₫"
        cloneData.querySelector("._productQuantity").textContent = item.Quantity
        totalPrice += (parseInt(item.Price) * parseInt(item.Quantity))
        dataList.appendChild(cloneData)
    });
    document.querySelector(".cart-totals-item ._subPrice").textContent = (totalPrice * 1000).toLocaleString('vi-VN') + "₫"
    document.querySelector(".cart-totals-item ._totalPrice").textContent = (totalPrice * 1000).toLocaleString('vi-VN') + "₫"
    document.querySelector("._orderSummary ._orderPrice").textContent = (totalPrice * 1000).toLocaleString('vi-VN') + "₫"
}

async function _setStatus() {
    document.querySelector("._buttonChangeStatus.tf-button").addEventListener('click', _changeStatus)
    async function _changeStatus() {
        var items = document.querySelectorAll(".road-map._orderTracking .road-map-item")
        for (const item of items) {
            if (!item.classList.contains("active")) {
                let itemStatus = item.querySelector("h6").textContent
                await Helper.fetchData(`order&action=changeStatus&id=${Helper.getParameterByName("id")}&newStaus=${itemStatus}`)
                item.classList.add("active")
                return
            }
        }
        console.log("full");
    }
}

