<!DOCTYPE html>
<html lang="en-US">

<head>
    <!-- Basic Page Needs -->
    <meta charset="utf-8">
    <title>Admin Dashboard</title>

    <meta name="author" content="themesflat.com">

    <!-- Mobile Specific Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <!-- Theme Style -->
    <link rel="stylesheet" type="text/css" href="assets/css/animate.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/animation.css">
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap-select.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/style.css">



    <!-- Font -->
    <link rel="stylesheet" href="assets/font/fonts.css">

    <!-- Icon -->
    <link rel="stylesheet" href="assets/icon/style.css">

    <!-- Favicon and Touch Icons  -->
    <link rel="shortcut icon" href="assets/images/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="assets/images/favicon.png">

    <script src="shared/script/app.js"></script>
    <script src="shared/script/init.js"></script>
</head>

<body class="body">

    <!-- #wrapper -->
    <div id="wrapper">
        <!-- #page -->
        <div id="page" class="">
            <!-- layout-wrap -->
            <div class="layout-wrap">
                <!-- preload -->
                <div id="preload" class="preload-container">
                    <div class="preloading">
                        <span></span>
                    </div>
                </div>
                <!-- /preload -->
                <!-- section-menu-left -->
                <div class="section-menu-left">
    <div class="box-logo">
        <a href="./" id="site-logo-inner">
            <img class id="logo_header" alt src="assets/images/logo/logo.png" data-light="assets/images/logo/logo.png"
                data-dark="assets/images/logo/logo-dark.png">
        </a>
        <div class="button-show-hide">
            <i class="icon-menu-left"></i>
        </div>
    </div>
    <div class="center">
        <div class="center-item">
            <div class="center-heading">Main Home</div>
            <ul class="menu-list">
                <li class="menu-item active">
                    <a href="./" class="menu-item-button active">
                        <div class="icon">
                            <i class="icon-grid"></i>
                        </div>
                        <div class="text">Dashboard</div>
                    </a>
                </li>
            </ul>
        </div>
        <div class="center-item">
            <div class="center-heading">All page</div>
            <ul class="menu-list">
                <li class="menu-item has-children">
                    <a href="javascript:void(0);" class="menu-item-button">
                        <div class="icon">
                            <i class="icon-shopping-cart"></i>
                        </div>
                        <div class="text">Sản phẩm</div>
                    </a>
                    <ul class="sub-menu">
                        <li class="sub-menu-item">
                            <a href="./?page=productAdd" class>
                                <div class="text">Thêm sản phẩm</div>
                            </a>
                        </li>
                        <li class="sub-menu-item">
                            <a href="./?page=products" class>
                                <div class="text">Danh sách sản phẩm</div>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="menu-item has-children">
                    <a href="javascript:void(0);" class="menu-item-button">
                        <div class="icon">
                            <i class="icon-file-plus"></i>
                        </div>
                        <div class="text">Đơn hàng</div>
                    </a>
                    <ul class="sub-menu">
                        <li class="sub-menu-item">
                            <a href="./?page=orders" class>
                                <div class="text">Danh sách đơn hàng</div>
                            </a>
                        </li>
                        <li class="sub-menu-item">
                            <a href="./?page=orderDetail" class>
                                <div class="text">Chi tiết đơn</div>
                            </a>
                        </li>
                        <li class="sub-menu-item">
                            <a href="./?page=orderTracking" class>
                                <div class="text">Theo dõi đơn</div>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="menu-item has-children">
                    <a href="javascript:void(0);" class="menu-item-button">
                        <div class="icon">
                            <i class="icon-user"></i>
                        </div>
                        <div class="text">Người dùng</div>
                    </a>
                    <ul class="sub-menu">
                        <li class="sub-menu-item">
                            <a href="./?page=users" class>
                                <div class="text">Tất cả người dùng</div>
                            </a>
                        </li>
                        <li class="sub-menu-item">
                            <a href="./?page=userAdd" class>
                                <div class="text">Thêm người dùng</div>
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
        <div class="center-item">
            <div class="center-heading">Connect us</div>
            <ul class="wg-social">
                <li>
                    <a href="#">
                        <i class="icon-facebook"></i>
                    </a>
                </li>
                <li class="active">
                    <a href="#">
                        <i class="icon-twitter"></i>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="icon-linkedin"></i>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="icon-instagram"></i>
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <div class="bot text-center">
        <div class="wrap">
            <div class="mb-20">
                <img src="assets/images/menu-left/img-bot.png" alt>
            </div>
            <div class="mb-20">
                <h6>Hi, how can we help?</h6>
                <div class="text">
                    Contact us if you have any assistance, we will contact you as soon as possible
                </div>
            </div>
            <a href="#" class="tf-button w-full">
                Contact
            </a>
        </div>
    </div>
</div>
                <!-- /section-menu-left -->
                <!-- section-content-right -->
                <div class="section-content-right">
                    <!-- header-dashboard -->
                    <div class="header-dashboard"></div>
                    <!-- /header-dashboard -->
                    <!-- main-content -->
                    <div class="main-content">
                        <!-- main-content-wrap -->
                        <?php
                        // Xác định router và trang cần được tải
                        $page = isset($_GET['page']) ? $_GET['page'] : 'home';

                        // Kiểm tra xem trang có tồn tại hay không
                        $page_path = "pages/$page/$page";
                        if (file_exists("$page_path.html")) {
                            // Tải tệp HTML tương ứng
                            include_once("$page_path.html");
                        }
                        ?>
                        <!-- /main-content-wrap -->
                        <!-- bottom-page -->
                        <div class="bottom-page"></div>
                        <!-- /bottom-page -->
                    </div>
                    <!-- /main-content -->
                </div>
                <!-- /section-content-right -->
            </div>
            <!-- /layout-wrap -->
        </div>
        <!-- /#page -->
    </div>
    <!-- /#wrapper -->
    <script>
        Helper.fetchBackendLink()
    </script>
    <?php
        echo "<script src='$page_path.js'></script>"
    ?>
    <!-- Javascript -->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/bootstrap-select.min.js"></script>
    <script src="assets/js/zoom.js"></script>
    <script src="assets/js/apexcharts/apexcharts.js"></script>
    <script src="assets/js/apexcharts/line-chart-1.js"></script>
    <script src="assets/js/apexcharts/line-chart-2.js"></script>
    <script src="assets/js/apexcharts/line-chart-3.js"></script>
    <script src="assets/js/apexcharts/line-chart-4.js"></script>
    <script src="assets/js/apexcharts/line-chart-5.js"></script>
    <script src="assets/js/apexcharts/line-chart-6.js"></script>
    <script src="assets/js/switcher.js"></script>
    <script src="assets/js/theme-settings.js"></script>
    <script src="assets/js/main.js"></script>

</body>


<!-- Mirrored from themesflat.co/html/remos/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 25 Apr 2024 12:50:11 GMT -->

</html>