document.addEventListener('DOMContentLoaded', async () => {
    // Khởi tạo trang
    _init();
})

async function _init() {

    if (Helper.getParameterByName("signupSuccfully")) {
        alert("Đăng ký tài khoản thành công")
    } else if(Helper.getParameterByName("signupFailed")) {
        alert("Đăng ký tài khoản thất bại")
    } else if(Helper.getParameterByName("loginFailed")) {
        alert("Tài khoản mật khẩu không đúng!")
    }
}