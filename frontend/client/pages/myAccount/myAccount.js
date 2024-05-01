document.addEventListener('DOMContentLoaded', async () => {
    // Khởi tạo trang
    _init();
})

async function _init() {
    var item = await Helper.fetchData(`user&action=find&id=${Helper.getCookie("user_id")}`)
    var account = document.querySelector(".account-dashboard")
    account.querySelector(".user-name").innerHTML = `Xin chào <span>${item.Name}</span>`
}




