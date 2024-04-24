
document.addEventListener('DOMContentLoaded', async () => {
    await Helper.fetchBackendLink();
    console.log(Helper.backendLink);
    // Đặt các layouts
    await _getLayouts()
    // Hiển thị sản phẩm đang có trong cart
    // CartManager.show()
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
