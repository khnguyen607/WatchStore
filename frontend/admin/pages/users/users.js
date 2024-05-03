document.addEventListener('DOMContentLoaded', async () => {
    // Đổ danh sách sản phẩm
    _init();
})

async function _init() {
    var items = await Helper.fetchData("user")
    showProducts(items)
    document.querySelector(".form-search .button-submit button").addEventListener('click', (evt)=>{
        evt.preventDefault()
        filterBy()
    })
}

async function showProducts(items) {
    var dataList = document.querySelector("._userList")
    var data = document.querySelector("._userList .user-item").cloneNode(true)
    dataList.innerHTML = ""
    await items.forEach(item => {
        let cloneData = data.cloneNode(true)
        cloneData.querySelector(".name a").textContent = item.Name
        cloneData.querySelector("._userUserName").textContent = item.UserName
        cloneData.querySelector("._userRole").textContent = item.Role == '0' ? "Khách" : "Admin"
        cloneData.querySelector(".item.trash").addEventListener('click', () => {
            cloneData.classList.add("d-none")
            Helper.fetchData("user&action=delete&id="+item.ID)
        })
        dataList.appendChild(cloneData)
    });
}

async function filterBy() {
    console.log(document.querySelector(".form-search .name input"));
    document.querySelectorAll("._userList .user-item").forEach(item => {
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