<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title> Sản Phẩm </title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
        rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
    <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


    <!-- Customized Bootstrap Stylesheet -->
    <link href="/client/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="/client/css/style.css" rel="stylesheet">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0&family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@48,400,1,0" />
    <link rel="stylesheet" href="/client/css/chatbot/style.css" />
</head>

<body>

    <!-- Spinner Start -->
    <div id="spinner"
        class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
        <div class="spinner-grow text-primary" role="status"></div>
    </div>
    <!-- Spinner End -->

    <jsp:include page="../layout/header.jsp" />

    <!-- Single Product Start -->
    <div class="container-fluid py-5 mt-5">
        <div class="container py-5">
            <div class="row g-4 mb-5">
                <div>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="/">Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Danh Sách Sản Phẩm
                            </li>
                        </ol>
                    </nav>
                </div>

                <div class="row g-4 fruite">
                    <div class="col-12 col-md-4">
                        <div class="row g-4">
                            <div class="col-12" id="factoryFilter">
                                <div class="mb-2"><b>Hãng sản xuất</b></div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="factory-1" value="APPLE">
                                    <label class="form-check-label" for="factory-1">Apple</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="factory-2" value="ASUS">
                                    <label class="form-check-label" for="factory-2">Asus</label>
                                </div>

                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="factory-3" value="LENOVO">
                                    <label class="form-check-label" for="factory-3">Lenovo</label>
                                </div>

                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="factory-4" value="DELL">
                                    <label class="form-check-label" for="factory-4">Dell</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="factory-6" value="ACER">
                                    <label class="form-check-label" for="factory-6">Acer</label>
                                </div>

                            </div>
                            <div class="col-12" id="targetFilter">
                                <div class="mb-2"><b>Mục đích sử dụng</b></div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="target-1" value="GAMING">
                                    <label class="form-check-label" for="target-1">Gaming</label>
                                </div>

                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="target-2"
                                        value="SINHVIEN-VANPHONG">
                                    <label class="form-check-label" for="target-2">Sinh viên - văn
                                        phòng</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="target-3"
                                        value="THIET-KE-DO-HOA">
                                    <label class="form-check-label" for="target-3">Thiết kế đồ
                                        họa</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="target-4" value="MONG-NHE">
                                    <label class="form-check-label" for="target-4">Mỏng nhẹ</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="target-5" value="DOANH-NHAN">
                                    <label class="form-check-label" for="target-5">Doanh nhân</label>
                                </div>


                            </div>
                            <div class="col-12" id="priceFilter">
                                <div class="mb-2"><b>Mức giá</b></div>

                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="price-2" value="duoi-10-trieu">
                                    <label class="form-check-label" for="price-2">Dưới 10 triệu</label>
                                </div>

                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="price-3" value="10-15-trieu">
                                    <label class="form-check-label" for="price-3">Từ 10 - 15
                                        triệu</label>
                                </div>

                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="price-4" value="15-20-trieu">
                                    <label class="form-check-label" for="price-4">Từ 15 - 20
                                        triệu</label>
                                </div>

                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="price-5" value="tren-20-trieu">
                                    <label class="form-check-label" for="price-5">Trên 20 triệu</label>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="mb-2"><b>Sắp xếp</b></div>

                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" id="sort-1" value="gia-tang-dan"
                                        name="radio-sort">
                                    <label class="form-check-label" for="sort-1">Giá tăng dần</label>
                                </div>

                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" id="sort-2" value="gia-giam-dan"
                                        name="radio-sort">
                                    <label class="form-check-label" for="sort-2">Giá giảm dần</label>
                                </div>

                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" id="sort-3" checked value="gia-nothing"
                                        name="radio-sort">
                                    <label class="form-check-label" for="sort-3">Không sắp xếp</label>
                                </div>

                            </div>
                            <div class="col-12">
                                <button
                                    class="btn border-secondary rounded-pill px-4 py-3 text-primary text-uppercase mb-4"
                                    id="btnFilter">
                                    Lọc Sản Phẩm
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-md-8 text-center">
                        <div class="row g-4">
                            <c:if test="${totalPages ==  0}">
                                <div>Không tìm thấy sản phẩm</div>
                            </c:if>
                            <c:forEach var="product" items="${products}">
                                <div class="col-md-6 col-lg-4">
                                    <div class="rounded position-relative fruite-item">
                                        <div class="fruite-img">
                                            <img src="${product.image}" class="img-fluid w-100 rounded-top" alt="">
                                        </div>
                                        <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                            style="top: 10px; left: 10px;">Laptop
                                        </div>
                                        <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                            <h4 class="fw-bold mb-3"
                                                style="font-family: 'Open Sans', sans-serif; font-size: 14px;">
                                                <a href="/product/${product.id}">
                                                    ${product.name}
                                                </a>
                                            </h4>
                                            <p style="font-size: 13px;">
                                                ${product.shortDesc}</p>
                                            <div class="d-flex  flex-lg-wrap justify-content-center flex-column">
                                                <p style="font-size: 15px; text-align: center; width: 100%;"
                                                    class="text-dark  fw-bold mb-3">
                                                    <fmt:formatNumber type="number" value="${product.price}" />
                                                    đ
                                                </p>
                                                <form action="/add-product-to-cart/${product.id}" method="post">
                                                    <input type="hidden" name="${_csrf.parameterName}"
                                                        value="${_csrf.token}" />

                                                    <button
                                                        class="mx-auto btn border border-secondary rounded-pill px-3 text-primary"><i
                                                            class="fa fa-shopping-bag me-2 text-primary"></i>
                                                        Add to cart
                                                    </button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>


                            <c:if test="${totalPages > 0}">
                                <div class="pagination d-flex justify-content-center mt-5">
                                    <li class="page-item">
                                        <a class="${1 eq currentPage ? 'disabled page-link' : 'page-link'}"
                                            href="/products?page=${currentPage - 1}${queryString}"
                                            aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                    <c:forEach begin="0" end="${totalPages - 1}" varStatus="loop">
                                        <li class="page-item">
                                            <a class="${(loop.index + 1) eq currentPage ? 'active page-link' : 'page-link'}"
                                                href="/products?page=${loop.index + 1}${queryString}">
                                                ${loop.index + 1}
                                            </a>
                                        </li>
                                    </c:forEach>
                                    <li class="page-item">
                                        <a class="${totalPages eq currentPage ? 'disabled page-link' : 'page-link'}"
                                            href="/products?page=${currentPage + 1}${queryString}" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>

                                </div>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Single Product End -->
    

    <jsp:include page="../layout/footer.jsp" />



    <!-- Back to Top
    <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
            class="fa fa-arrow-up"></i></a> -->

        <button id="chatbot-toggler">
        <span class="material-symbols-rounded">mode_comment</span>
        <span class="material-symbols-rounded">close</span>
    </button>
    <div class="chatbot-popup">
        <div class="chat-header">
            <div class="header-info">
                <svg class="chatbot-logo" xmlns="http://www.w3.org/2000/svg" width="50" height="50" viewBox="0 0 1024 1024">
                    <path d="M738.3 287.6H285.7c-59 0-106.8 47.8-106.8 106.8v303.1c0 59 47.8 106.8 106.8 106.8h81.5v111.1c0 .7.8 1.1 1.4.7l166.9-110.6 41.8-.8h117.4l43.6-.4c59 0 106.8-47.8 106.8-106.8V394.5c0-59-47.8-106.9-106.8-106.9zM351.7 448.2c0-29.5 23.9-53.5 53.5-53.5s53.5 23.9 53.5 53.5-23.9 53.5-53.5 53.5-53.5-23.9-53.5-53.5zm157.9 267.1c-67.8 0-123.8-47.5-132.3-109h264.6c-8.6 61.5-64.5 109-132.3 109zm110-213.7c-29.5 0-53.5-23.9-53.5-53.5s23.9-53.5 53.5-53.5 53.5 23.9 53.5 53.5-23.9 53.5-53.5 53.5zM867.2 644.5V453.1h26.5c19.4 0 35.1 15.7 35.1 35.1v121.1c0 19.4-15.7 35.1-35.1 35.1h-26.5zM95.2 609.4V488.2c0-19.4 15.7-35.1 35.1-35.1h26.5v191.3h-26.5c-19.4 0-35.1-15.7-35.1-35.1zM561.5 149.6c0 23.4-15.6 43.3-36.9 49.7v44.9h-30v-44.9c-21.4-6.5-36.9-26.3-36.9-49.7 0-28.6 23.3-51.9 51.9-51.9s51.9 23.3 51.9 51.9z" />
                </svg>
                <h2 class="logo-text">HCT GlobalLaps</h2>
            </div>
            <button id="close-chatbot" class="material-symbols-rounded">keyboard_arrow_down</button>
        </div>
        <div class="chat-body">
            <div class="message bot-message">
                <svg class="bot-avatar" xmlns="http://www.w3.org/2000/svg" width="50" height="50" viewBox="0 0 1024 1024">
                    <path d="M738.3 287.6H285.7c-59 0-106.8 47.8-106.8 106.8v303.1c0 59 47.8 106.8 106.8 106.8h81.5v111.1c0 .7.8 1.1 1.4.7l166.9-110.6 41.8-.8h117.4l43.6-.4c59 0 106.8-47.8 106.8-106.8V394.5c0-59-47.8-106.9-106.8-106.9zM351.7 448.2c0-29.5 23.9-53.5 53.5-53.5s53.5 23.9 53.5 53.5-23.9 53.5-53.5 53.5-53.5-23.9-53.5-53.5zm157.9 267.1c-67.8 0-123.8-47.5-132.3-109h264.6c-8.6 61.5-64.5 109-132.3 109zm110-213.7c-29.5 0-53.5-23.9-53.5-53.5s23.9-53.5 53.5-53.5 53.5 23.9 53.5 53.5-23.9 53.5-53.5 53.5zM867.2 644.5V453.1h26.5c19.4 0 35.1 15.7 35.1 35.1v121.1c0 19.4-15.7 35.1-35.1 35.1h-26.5zM95.2 609.4V488.2c0-19.4 15.7-35.1 35.1-35.1h26.5v191.3h-26.5c-19.4 0-35.1-15.7-35.1-35.1zM561.5 149.6c0 23.4-15.6 43.3-36.9 49.7v44.9h-30v-44.9c-21.4-6.5-36.9-26.3-36.9-49.7 0-28.6 23.3-51.9 51.9-51.9s51.9 23.3 51.9 51.9z" />
                </svg>
                <div class="message-text"> Xin chào 👋<br /> Tôi có thể giúp gì cho bạn hôm nay? </div>
            </div>
        </div>
        <div class="chat-footer">
            <form action="#" class="chat-form">
                <textarea placeholder="Message..." class="message-input" required></textarea>
                <div class="chat-controls">
                    <button type="button" id="emoji-picker" class="material-symbols-outlined">sentiment_satisfied</button>
                    <div class="file-upload-wrapper">
                        <input type="file" id="file-input" hidden />
                        <img src="#" />
                        <button type="button" id="file-upload" class="material-symbols-rounded">attach_file</button>
                        <button type="button" id="file-cancel" class="material-symbols-rounded">close</button>
                    </div>
                    <button type="submit" id="send-message" class="material-symbols-rounded">arrow_upward</button>
                </div>
            </form>
        </div>
    </div>


    <!-- JavaScript Libraries -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/client/lib/easing/easing.min.js"></script>
    <script src="/client/lib/waypoints/waypoints.min.js"></script>
    <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
    <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/emoji-mart@latest/dist/browser.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.17.2/dist/sweetalert2.all.min.js"></script>

    <script src="/client/js/chatbot/script.js"></script>

    <!-- Template Javascript -->
    <script src="/client/js/main.js"></script>
</body>

</html>