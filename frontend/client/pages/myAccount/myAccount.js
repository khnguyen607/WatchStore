document.addEventListener('DOMContentLoaded', async () => {
    // Khởi tạo trang
    _init();
    _showOrderHistory()
    _showInfo()
})

async function _init() {
    var item = await Helper.fetchData(`user&action=find&id=${Helper.getCookie("user_id")}`)
    var account = document.querySelector(".account-dashboard")
    account.querySelector(".user-name").innerHTML = `Xin chào <span>${item.Name}</span>`
}

async function _showOrderHistory() {
    var items = await Helper.fetchData("order&action=getOrderForUser&userID=" + Helper.getCookie("user_id"))
    var dataList = document.querySelector("#orders tbody")
    var data = document.querySelector("#orders tbody tr").cloneNode(true)
    dataList.innerHTML = ""
    items.forEach(item => {
        let cloneData = data.cloneNode(true)
        cloneData.querySelector("._orderID").textContent = "#"+item.ID
        cloneData.querySelector("._orderTotalPrice").textContent = (item.TotalPrice * 1000).toLocaleString('vi-VN') + "₫"
        cloneData.querySelector("._orderDate").textContent = item.Date
        cloneData.querySelector("._orderStatus").textContent = item.Status
        dataList.appendChild(cloneData)
    });
}

async function _showInfo() {
    var item = await Helper.fetchData("user&action=find&id=" + Helper.getCookie("user_id"))
    document.querySelector("#address .billing-address").value = item.Address
    document.querySelector("#address .view").addEventListener('click', (evt)=>{
        evt.preventDefault()
        const formData = new FormData();
        formData.append("Address", document.querySelector("#address .billing-address").value)
        fetch("../../backend/?controller=user&action=changeInfo&id=" + Helper.getCookie("user_id"), {
            method: 'POST',
            body: formData
        })
        alert("Lưu địa chỉ thành công")
    })

    document.querySelector("#account-details input[name='Phone']").value = item.Phone
    document.querySelector("#account-details input[name='Email']").value = item.Email
    document.querySelector("#account-details form").addEventListener('submit', (evt)=>{
        evt.preventDefault()
        const formData = new FormData(document.querySelector("#account-details form"));
        fetch("../../backend/?controller=user&action=changeInfo&id=" + Helper.getCookie("user_id"), {
            method: 'POST',
            body: formData
        })
        alert("Lưu địa chỉ thành công")
    })
}