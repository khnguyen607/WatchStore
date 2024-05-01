
document.addEventListener('DOMContentLoaded', async () => {
    // Đặt các layouts
    await _getLayouts()
})

async function _getLayouts() {
    try {
        // Get components
        var components = document.createElement("div")
        components.innerHTML = await Helper.fetchHTML("./shared/components/layout.html");
        // document.querySelector("div.section-menu-left").innerHTML = components.querySelector("div.section-menu-left").innerHTML;
        document.querySelector("div.header-dashboard").innerHTML = components.querySelector("div.header-dashboard").innerHTML;
        document.querySelector("div.bottom-page").innerHTML = components.querySelector("div.bottom-page").innerHTML;
    } catch (error) {
        console.error('Error loading HTML:', error);
    }
}

