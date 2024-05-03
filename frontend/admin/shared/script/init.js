
document.addEventListener('DOMContentLoaded', async () => {
    // Đặt các layouts
    await _getLayouts()
    // Active sidebar tương ứng
    menuActive()
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

async function menuActive() {
    var page = Helper.getParameterByName("page")
    if (page) {
        var currentPage = document.querySelector(`.menu-list .menu-item.has-children .sub-menu-item a[href='./?page=${page}']`)
        currentPage.classList.add('active')
        currentPage.parentNode.parentNode.parentNode.classList.add('active')
    } else {
        document.querySelector("._menuDashboard").classList.add("active")
        document.querySelector("._menuDashboard a").classList.add("active")
    }
}

