<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Ruiz - Watch Store</title>
    <meta name="robots" content="noindex, follow" />
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.ico">

    <!-- CSS
    ============================================ -->

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="assets/css/vendor/bootstrap.min.css">
    <!-- Icon Font CSS -->
    <link rel="stylesheet" href="assets/css/vendor/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/vendor/simple-line-icons.css">

    <!-- Plugins CSS -->
    <link rel="stylesheet" href="assets/css/plugins/animation.css">
    <link rel="stylesheet" href="assets/css/plugins/slick.css">
    <link rel="stylesheet" href="assets/css/plugins/animation.css">
    <link rel="stylesheet" href="assets/css/plugins/nice-select.css">
    <link rel="stylesheet" href="assets/css/plugins/fancy-box.css">
    <link rel="stylesheet" href="assets/css/plugins/jqueryui.min.css">

    <link rel="stylesheet" href="assets/css/style.css">

    <script src="shared/script/app.js"></script>
    <script src="shared/script/init.js"></script>

</head>

<!-- effice fadeIn start -->
<style>
    /* Đặt opacity của phần tử là 0 ban đầu */
    section.main {
        opacity: 0;
        transition: opacity 1s ease-in-out;
        /* Thêm transition để tạo hiệu ứng mượt mà */
    }

    section.main.show {
        opacity: 1;
        /* Khi được thêm lớp .show, opacity sẽ chuyển sang 1 */
    }
</style>
<script>
    // Đợi 1 giây trước khi thêm lớp .show
    setTimeout(function () {
        document.querySelector('section.main').classList.add('show');
    }, 100);
</script>
<!-- effice fadeIn end -->

<body>

    <div class="main-wrapper">

        <header class="header"></header>

        <section class="main">
            <?php
            // Xác định router và trang cần được tải
            $page = isset($_GET['page']) ? $_GET['page'] : 'home';

            // Kiểm tra xem trang có tồn tại hay không
            $page_path = "pages/$page/$page";
            if (file_exists("$page_path.html")) {
                // Tải tệp HTML tương ứng
                include_once ("$page_path.html");
            } else {
                // Trang không tồn tại, xử lý bằng cách hiển thị trang 404 hoặc trang mặc định khác
                include_once ("shared/components/error404.html");
            }
            ?>
        </section>

        <!-- footer Start -->
        <footer class="footer"></footer>
        <!-- footer End -->


    </div>

    <!-- JS
============================================ -->
    <?php
    echo "<script src='$page_path.js'></script>"
        ?>

    <!-- Modernizer JS -->
    <script src="assets/js/vendor/modernizr-3.6.0.min.js"></script>

    <!-- jquery -->
    <script src="assets/js/vendor/jquery-3.6.1.min.js"></script>
    <script src="assets/js/vendor/jquery-migrate-3.4.0.min.js"></script>

    <!-- Bootstrap JS -->
    <script src="assets/js/vendor/bootstrap.min.js"></script>

    <!-- Plugins JS -->
    <script src="assets/js/plugins/slick.min.js"></script>
    <script src="assets/js/plugins/jquery.nice-select.min.js"></script>
    <script src="assets/js/plugins/countdown.min.js"></script>
    <script src="assets/js/plugins/image-zoom.min.js"></script>
    <script src="assets/js/plugins/fancybox.js"></script>
    <script src="assets/js/plugins/scrollup.min.js"></script>
    <script src="assets/js/plugins/jqueryui.min.js"></script>
    <script src="assets/js/plugins/ajax-contact.js"></script>

    <!-- Main JS -->
    <script src="assets/js/main.js"></script>

</body>

</html>