document.addEventListener('DOMContentLoaded', async () => {
    // Khởi tạo trang
    _init();
})

async function _init() {
    if (Helper.getParameterByName("loginSuccfully")) {
        alert("Đăng nhập thành công")
    }
}