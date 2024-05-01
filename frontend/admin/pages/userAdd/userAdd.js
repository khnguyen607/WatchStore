document.addEventListener('DOMContentLoaded', async () => {
    _sendData()
})

async function _sendData() {
    document.querySelector("form.form-add-new-user").addEventListener('submit', async (evt) => {
        evt.preventDefault();
        // const inputs = document.querySelectorAll("#_addUserForm input");
        // for (let input of inputs) {
        //     console.log(input.value);
        //     if (input.value == "") {
        //         alert("Vui lòng nhập đủ thông tin");
        //         return; // Thoát khỏi hàm
        //     }
        // }
        // Dữ liệu form
        const formData = new FormData(document.querySelector("form.form-add-new-user"));

        // Tùy chọn cấu hình cho request
        const requestOptions = {
            method: 'POST', // Phương thức HTTP
            body: formData, // Dữ liệu form
        };

        // URL của endpoint nhận request
        const url = "../../backEnd/?controller=user&action=insert";

        // Gửi request sử dụng fetch
        fetch(url, requestOptions)
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json(); // Đọc và trả về dữ liệu JSON từ phản hồi
            })
            .then(data => {
                console.log(data == true);
                data == true ? alert("Thêm người dùng thành công") : alert("Thêm người dùng thất bại")
            })
            .catch(error => {
                console.error('There was a problem with your fetch operation:', error);
            });
    })
}