document.addEventListener('DOMContentLoaded', async () => {
    // Đổ danh sách sản phẩm
    _init();
})

async function _init() {
    if (Helper.getParameterByName("action")=="update") {
        productUpdate()
    } else {
        productAdd()
    }
}

async function productAdd() {
    document.getElementById('_addProductForm').addEventListener('submit', function (event) {
        event.preventDefault(); // Prevent default form submission

        // Get form data
        const formData = new FormData(this);

        // Send form data using fetch
        fetch('../../backend/?controller=product&action=insert', {
            method: 'POST',
            body: formData
        })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json(); // Assuming response is JSON
            })
            .then(data => {
                if (data) {
                    window.location.href = "./?page=products";
                    alert("Thêm thành công")
                } else {
                    alert("Thêm thất bại")
                }
            })
            .catch(error => {
                // Handle errors
                console.error('There was a problem with the fetch operation:', error);
                alert("Thêm thất bại")
            });
    });
}

async function productUpdate() {
    var item = await Helper.fetchData(`product&action=find&id=${Helper.getParameterByName("id")}`)
    document.querySelector(".main-content-wrap .items-center h3").textContent="Cập nhật thông sản phẩm"
    document.querySelector("#_addProductForm input[name='Name']").value = item.Name
    document.querySelector("#_addProductForm input[name='Subtitle']").value = item.Subtitle
    document.querySelector("#_addProductForm input[name='Price']").value = item.Price
    document.querySelector("#_addProductForm textarea[name='Description']").textContent = item.Description

    document.getElementById('_addProductForm').addEventListener('submit', function (event) {
        event.preventDefault(); // Prevent default form submission

        // Get form data
        const formData = new FormData(this);

        // Send form data using fetch
        fetch('../../backend/?controller=product&action=update&id='+Helper.getParameterByName("id"), {
            method: 'POST',
            body: formData
        })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json(); // Assuming response is JSON
            })
            .then(data => {
                if (data) {
                    window.location.href = "./?page=products";
                    alert("Sửa thành công")
                } else {
                    alert("Sửa thất bại")
                }
            })
            .catch(error => {
                // Handle errors
                console.error('There was a problem with the fetch operation:', error);
                alert("Sửa thất bại")
            });
    });
}