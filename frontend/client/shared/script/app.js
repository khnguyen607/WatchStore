// Tương tác với sessionStorage
class CartManager {
  // Cập nhật hiển thị giỏ hàng
  static show() {
    if (sessionStorage.getItem("cart") == null) {
      document.querySelector(".shopping-cart-wrap .mini-cart").classList.add('d-none')
      return;
    } else {
      document.querySelector(".shopping-cart-wrap .mini-cart").classList.remove('d-none')
    }
    document
      .querySelectorAll(".shopping-cart-wrap .cart-total")
      .forEach((item) => {
        item.textContent = Object.keys(this.getItem()).length;
      });
    var cartList = document.querySelector("._cartProductList");
    var cartProduct = cartList
      .querySelector("._cartProductList li.cart-item")
      .cloneNode(true);
    cartList.innerHTML = "";
    var items = this.getItem();
    var _totalPriceCart = 0;
    Object.keys(items).forEach((item) => {
      var cloneCartProduct = cartProduct.cloneNode(true);
      cloneCartProduct.querySelector("h4").textContent = item;
      var item = items[item];
      cloneCartProduct.querySelector("img").src = Helper.getLink(item.Img);
      cloneCartProduct.querySelector(".price-box .new-price").textContent =
        (parseInt(item.Price) * 1000).toLocaleString("vi-VN") + "₫";
      cloneCartProduct.querySelector(".quantity").textContent =
        parseInt(item.Quantity) + " x";
      _totalPriceCart += parseInt(item.Price) * parseInt(item.Quantity) * 1000;
      cartList.appendChild(cloneCartProduct);
    });
    document.querySelector("._totalPriceCart").textContent =
      _totalPriceCart.toLocaleString("vi-VN") + "₫";
  }

  // Phương thức để thêm hoặc cập nhật một giá trị vào sessionStorage
  static setItem(key, value) {
    // Lấy danh sách mục từ sessionStorage
    var items = this.getItem();

    // Kiểm tra xem danh sách có tồn tại không
    if (!items) {
      // Nếu không tồn tại, tạo một mảng mới
      items = {};
    }

    // Thêm mục mới vào danh sách
    if (items[key]) {
      items[key]["Quantity"] =
        parseInt(items[key]["Quantity"]) + parseInt(value["Quantity"]);
    } else {
      items[key] = value;
    }
    // Lưu danh sách đã được cập nhật vào sessionStorage
    sessionStorage.setItem("cart", JSON.stringify(items));
  }

  // Phương thức để đọc một giá trị từ sessionStorage
  static getItem() {
    const item = sessionStorage.getItem("cart");
    return item ? JSON.parse(item) : null;
  }

  // Phương thức để kiểm tra xem một khóa đã tồn tại trong sessionStorage hay chưa
  static hasItem() {
    return sessionStorage.getItem("cart") !== null;
  }

  // Phương thức để xóa một giá trị khỏi sessionStorage
  static clear() {
    sessionStorage.removeItem("cart");
  }

  // Phương thức để thêm hoặc cập nhật một giá trị vào sessionStorage
  static delItem(key) {
    // Lấy danh sách mục từ sessionStorage
    var items = this.getItem();
    delete items[key]
    // Lưu danh sách đã được cập nhật vào sessionStorage
    sessionStorage.setItem("cart", JSON.stringify(items));
  }

}

// Hàm dùng chung
class Helper {
  // Lấy dữ liệu từ backend
  static async fetchData(controller) {
    return fetch("../../backend/index.php?controller=" + controller)
      .then((response) => response.json())
      .then((data) => {
        return data;
      })
      .catch((error) => {
        console.log(error);
        return null;
      });
  }

  // Lấy dữ liệu html
  static async fetchHTML(url) {
    try {
      const response = await fetch(url);
      if (!response.ok) {
        throw new Error("Fetch HTML error:", response.status);
      }
      return await response.text();
    } catch (error) {
      console.error("Fetch HTML error:", error);
      throw error;
    }
  }
  // Lấy biến get của trình duyệt
  static getParameterByName(name) {
    // Tạo một đối tượng URLSearchParams từ query string của URL
    var queryParams = new URLSearchParams(window.location.search);

    // Kiểm tra xem có tham số có tên tương ứng không
    if (queryParams.has(name)) {
      // Nếu có, trả về giá trị của tham số đó
      return queryParams.get(name);
    }
    // Trả về null nếu không tìm thấy tham số có tên tương ứng
    return null;
  }

  // Lấy giá trị cokkie
  static getCookie(cookieName) {
    // Tách các cookie thành một mảng
    var cookies = document.cookie.split(";");

    // Lặp qua từng cookie để tìm cookieName
    for (var i = 0; i < cookies.length; i++) {
      var cookie = cookies[i];
      // Loại bỏ khoảng trắng ở đầu và cuối chuỗi
      cookie = cookie.trim();
      // Kiểm tra xem cookie có bắt đầu bằng cookieName hay không
      if (cookie.startsWith(cookieName + "=")) {
        // Trích xuất và trả về giá trị của cookie
        return cookie.substring(cookieName.length + 1);
      }
    }
    // Nếu không tìm thấy cookie, trả về null
    return null;
  }

  static backendLink = null;

  static async fetchBackendLink() {
    try {
      const response = await fetch("../conf.json");
      const data = await response.json();
      this.backendLink = data.backend;
    } catch (error) {
      console.error("Error:", error);
      this.backendLink = null;
    }
  }

  static getLink(link) {
    return this.backendLink ? this.backendLink + "www/" + link : null;
  }
}
