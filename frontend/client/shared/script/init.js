
document.addEventListener('DOMContentLoaded', async () => {
    // Đặt các layouts
    await _getLayouts()
    // Hiển thị sản phẩm đang có trong cart
    CartManager.show()
    _showMyaccount()
})

async function _getLayouts() {
    try {
        // Get components
        var components = document.createElement("div")
        components.innerHTML = await Helper.fetchHTML("./shared/components/layout.html");
        // Set Header
        document.querySelector("header.header").innerHTML = components.querySelector("header.header").innerHTML;
        // Set footer
        document.querySelector("footer.footer").innerHTML = components.querySelector("footer.footer").innerHTML;
    } catch (error) {
        console.error('Error loading HTML:', error);
    }
}

async function _showMyaccount() {
    if (Helper.getCookie("user_id")) {
        document.querySelector(".my-account-container a[href='./?page=login']").classList.add("d-none")
    } else {
        document.querySelector(".my-account-container a[href='./?page=myAccount']").classList.add("d-none")
    }
}
