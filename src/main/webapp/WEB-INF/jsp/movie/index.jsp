<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Modern Business - Start Bootstrap Template</title>
        <!-- Favicon-->
        <%--<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />--%>
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="/static/css/styles.css" type="text/css" rel="stylesheet" />

        <style>
            #carousel {
                position: relative;
                overflow: hidden;
                height: 700px;
                width: 100%;
            }

            #carousel > div {
                position: absolute;
                transition: transform 1s, left 1s, opacity 1s, z-index 0s;
                opacity: 1;
            }

            #carousel div img {
                width: 400px;
                transition: width 1s;
            }

            #carousel div.hide {
                display: none;
            }

            #carousel div.hide img{
                width: 200px;
            }

            #carousel div.hideLeft {
                left: 0%;
                opacity: 0;
                transform: translateY(50%) translateX(-50%);
            }

            #carousel div.hideLeft img {
                width: 200px;
            }

            #carousel div.hideRight {
                left: 100%;
                opacity: 0;
                transform: translateY(50%) translateX(-50%);
            }

            #carousel div.hideRight img {
                width: 200px;
            }

            #carousel div.prev {
                z-index: 5;
                left: 30%;
                transform: translateY(50px) translateX(-50%);
            }

            #carousel div.prev img {
                width: 300px;
            }

            #carousel div.prevLeftSecond {
                z-index: 4;
                left: 15%;
                transform: translateY(50%) translateX(-50%);
                opacity: .7;
            }

            #carousel div.prevLeftSecond img {
                width: 200px;
            }

            #carousel div.selected {
                z-index: 10;
                left: 50%;
                transform: translateY(0px) translateX(-50%);
            }

            #carousel div.next {
                z-index: 5;
                left: 70%;
                transform: translateY(50px) translateX(-50%);
            }

            #carousel div.next img {
                width: 300px;
            }

            #carousel div.nextRightSecond {
                z-index: 4;
                left: 85%;
                transform: translateY(50%) translateX(-50%);
                opacity: .7;
            }

            #carousel div.nextRightSecond img {
                width: 200px;
            }

            .buttons {
                position: fixed;
                left: 50%;
                transform: translateX(-50%);
                bottom: 10px;
            }


            /*****************
    - Header -
*****************/
            .profile-card-6 {
                display: inline-block;
                background-color: #FFF;
                border-radius: 5px;
                box-shadow: 0px 0px 25px rgba(0, 0, 0, 0.1);
                overflow: hidden;
                position: relative;
                margin: 10px auto;
                cursor: pointer;
            }

            .profile-card-6 img {
                transition: all 0.15s linear;
            }

            .profile-card-6 .profile-name {
                position: absolute;
                top: 10px;
                left: 10px;
                font-size: 25px;
                font-weight: bold;
                color: #FFF;
                padding: 15px 20px;
                background: linear-gradient(140deg, rgba(0, 0, 0, 0.4) 50%, rgba(255, 255, 0, 0) 50%);
                transition: all 0.15s linear;
            }

            .profile-card-6 .profile-overview {
                position: absolute;
                bottom: 0px;
                left: 0px;
                right: 0px;
                background: linear-gradient(0deg, rgba(0, 0, 0, 0.4) 50%, rgba(255, 255, 0, 0));
                color: #FFF;
                padding: 50px 0px 20px 0px;
                transition: all 0.15s linear;
            }

            .profile-card-6 .profile-overview h3 {
                font-weight: bold;
            }

            .profile-card-6 .profile-overview p {
                color: rgba(255, 255, 255, 0.7);
                margin: 0;
            }

            .profile-card-6:hover img {
                filter: brightness(80%);
            }

            .profile-card-6:hover .profile-name {
                padding-left: 25px;
                padding-top: 20px;
            }

            .profile-card-6:hover .profile-overview {
                padding-bottom: 25px;
            }




            #carousel div.prevLeftSecond .profile-name,
            #carousel div.hideLeft .profile-name,
            #carousel div.nextRightSecond .profile-name,
            #carousel div.hideRight .profile-name {
                font-size: 11px;
            }

            #carousel div.prev .profile-name,
            #carousel div.next .profile-name {
                font-size: 15px;
            }

            #carousel div.selected .profile-name {
                font-size: 20px;
            }

            #carousel div.prevLeftSecond .profile-overview,
            #carousel div.hideLeft .profile-overview,
            #carousel div.nextRightSecond .profile-overview,
            #carousel div.hideRight .profile-overview {
                font-size: 11px;
            }

            #carousel div.prev .profile-overview,
            #carousel div.next .profile-overview {
                font-size: 15px;
            }

            #carousel div.selected .profile-overview {
                font-size: 20px;
            }

            h3{
                font-size: inherit;
            }
        </style>
        </style>
    </head>
    <body class="d-flex flex-column h-100">
            <!-- Header-->
            <header class="bg-dark py-5">
                <div class="container px-5">
                    <div class="row gx-5 align-items-center justify-content-center">
                        <div class="col-lg-8 col-xl-7 col-xxl-6">
                            <div class="my-5 text-center text-xl-start">
                                <h1 class="display-5 fw-bolder text-white mb-2">엘리멘탈</h1>
                                <p class="lead fw-normal text-white-50 mb-4">불, 물, 공기, 흙 4개의 원소들이 살고 있는 엘리멘트 시티. 재치 있고 불처럼 열정 넘치는 앰버는 어느 날 우연히 유쾌하고 감성적이며 물 흐르듯 사는 웨이드를 만나 특별한 우정을 쌓으며, 지금껏 믿어온 모든 것들이 흔들리는 새로운 경험을 하게 되는데...</p>
                                <div class="d-grid gap-3 d-sm-flex justify-content-sm-center justify-content-xl-start">
                                    <a class="btn btn-primary btn-lg px-4 me-sm-3" href="#features">상세보기</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-5 col-xxl-6 d-none d-xl-block text-center"><img class="img-fluid rounded-3 my-5" style="height: 400px;" src="https://image.tmdb.org/t/p/w500/1YYL1OcgjPLjAGi6n0iZe1gdl9i.jpg" alt="..." /></div>
                    </div>
                </div>
                <div class="py-5" id="carousel"></div>
            </header>


            <!-- Features section-->
            <section class="py-5" id="features">
                <div class="container px-5 my-5">
                    <div class="row gx-5">
                        <div class="col-lg-4 mb-5 mb-lg-0"><h2 class="fw-bolder mb-0">A better way to start building.</h2></div>
                        <div class="col-lg-8">
                            <div class="row gx-5 row-cols-1 row-cols-md-2">
                                <div class="col mb-5 h-100">
                                    <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-collection"></i></div>
                                    <h2 class="h5">Featured title</h2>
                                    <p class="mb-0">Paragraph of text beneath the heading to explain the heading. Here is just a bit more text.</p>
                                </div>
                                <div class="col mb-5 h-100">
                                    <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-building"></i></div>
                                    <h2 class="h5">Featured title</h2>
                                    <p class="mb-0">Paragraph of text beneath the heading to explain the heading. Here is just a bit more text.</p>
                                </div>
                                <div class="col mb-5 mb-md-0 h-100">
                                    <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-toggles2"></i></div>
                                    <h2 class="h5">Featured title</h2>
                                    <p class="mb-0">Paragraph of text beneath the heading to explain the heading. Here is just a bit more text.</p>
                                </div>
                                <div class="col h-100">
                                    <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-toggles2"></i></div>
                                    <h2 class="h5">Featured title</h2>
                                    <p class="mb-0">Paragraph of text beneath the heading to explain the heading. Here is just a bit more text.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Testimonial section-->
            <div class="py-5 bg-light">
                <div class="container px-5 my-5">
                    <div class="row gx-5 justify-content-center">
                        <div class="col-lg-10 col-xl-7">
                            <div class="text-center">
                                <div class="fs-4 mb-4 fst-italic">"Working with Start Bootstrap templates has saved me tons of development time when building new projects! Starting with a Bootstrap template just makes things easier!"</div>
                                <div class="d-flex align-items-center justify-content-center">
                                    <img class="rounded-circle me-3" src="https://dummyimage.com/40x40/ced4da/6c757d" alt="..." />
                                    <div class="fw-bold">
                                        Tom Ato
                                        <span class="fw-bold text-primary mx-1">/</span>
                                        CEO, Pomodoro
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Blog preview section-->
            <section class="py-5">
                <div class="container px-5 my-5">
                    <div class="row gx-5 justify-content-center">
                        <div class="col-lg-8 col-xl-6">
                            <div class="text-center">
                                <h2 class="fw-bolder">WAVVE 신규</h2>
                                <p class="lead fw-normal text-muted mb-5">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Eaque fugit ratione dicta mollitia. Officiis ad.</p>
                            </div>
                        </div>
                    </div>
                    <div class="row gx-5">
                        <div class="col-lg-4 mb-5">
                            <div class="card h-100 shadow border-0">
                                <img class="card-img-top" src="https://dummyimage.com/600x350/ced4da/6c757d" alt="..." />
                                <div class="card-body p-4">
                                    <div class="badge bg-primary bg-gradient rounded-pill mb-2">News</div>
                                    <a class="text-decoration-none link-dark stretched-link" href="#!"><h5 class="card-title mb-3">Blog post title</h5></a>
                                    <p class="card-text mb-0">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                </div>
                                <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                                    <div class="d-flex align-items-end justify-content-between">
                                        <div class="d-flex align-items-center">
                                            <img class="rounded-circle me-3" src="https://dummyimage.com/40x40/ced4da/6c757d" alt="..." />
                                            <div class="small">
                                                <div class="fw-bold">Kelly Rowan</div>
                                                <div class="text-muted">March 12, 2023 &middot; 6 min read</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 mb-5">
                            <div class="card h-100 shadow border-0">
                                <img class="card-img-top" src="https://dummyimage.com/600x350/adb5bd/495057" alt="..." />
                                <div class="card-body p-4">
                                    <div class="badge bg-primary bg-gradient rounded-pill mb-2">Media</div>
                                    <a class="text-decoration-none link-dark stretched-link" href="#!"><h5 class="card-title mb-3">Another blog post title</h5></a>
                                    <p class="card-text mb-0">This text is a bit longer to illustrate the adaptive height of each card. Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                </div>
                                <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                                    <div class="d-flex align-items-end justify-content-between">
                                        <div class="d-flex align-items-center">
                                            <img class="rounded-circle me-3" src="https://dummyimage.com/40x40/ced4da/6c757d" alt="..." />
                                            <div class="small">
                                                <div class="fw-bold">Josiah Barclay</div>
                                                <div class="text-muted">March 23, 2023 &middot; 4 min read</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 mb-5">
                            <div class="card h-100 shadow border-0">
                                <img class="card-img-top" src="https://dummyimage.com/600x350/6c757d/343a40" alt="..." />
                                <div class="card-body p-4">
                                    <div class="badge bg-primary bg-gradient rounded-pill mb-2">News</div>
                                    <a class="text-decoration-none link-dark stretched-link" href="#!"><h5 class="card-title mb-3">The last blog post title is a little bit longer than the others</h5></a>
                                    <p class="card-text mb-0">Some more quick example text to build on the card title and make up the bulk of the card's content.</p>
                                </div>
                                <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                                    <div class="d-flex align-items-end justify-content-between">
                                        <div class="d-flex align-items-center">
                                            <img class="rounded-circle me-3" src="https://dummyimage.com/40x40/ced4da/6c757d" alt="..." />
                                            <div class="small">
                                                <div class="fw-bold">Evelyn Martinez</div>
                                                <div class="text-muted">April 2, 2023 &middot; 10 min read</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Call to action-->
                    <aside class="bg-primary bg-gradient rounded-3 p-4 p-sm-5 mt-5">
                        <div class="d-flex align-items-center justify-content-between flex-column flex-xl-row text-center text-xl-start">
                            <div class="mb-4 mb-xl-0">
                                <div class="fs-3 fw-bold text-white">New products, delivered to you.</div>
                                <div class="text-white-50">Sign up for our newsletter for the latest updates.</div>
                            </div>
                            <div class="ms-xl-4">
                                <div class="input-group mb-2">
                                    <input class="form-control" type="text" placeholder="Email address..." aria-label="Email address..." aria-describedby="button-newsletter" />
                                    <button class="btn btn-outline-light" id="button-newsletter" type="button">Sign up</button>
                                </div>
                                <div class="small text-white-50">We care about privacy, and will never share your data.</div>
                            </div>
                        </div>
                    </aside>
                </div>
            </section>

            <!-- Bootstrap core JS-->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
            <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

            <script src="js/scripts.js"></script>
        <script>
            function moveToSelected(element) {
                if (element == "next") {
                    var selected = $(".selected").next();
                } else if (element == "prev") {
                    var selected = $(".selected").prev();
                } else {
                    var selected = element;
                }

                // 추가: 슬라이더의 첫 번째 또는 마지막 요소인 경우 순환

                if ($(selected).length === 0) {
                    if (element == "next") {
                        selected = $("#carousel > div:first");
                    } else if (element == "prev") {
                        selected = $("#carousel > div:last");
                    }
                }

                var prev = $(selected).prev();
                if(prev.length === 0) prev = $("#carousel > div:last");

                var next = $(selected).next();
                if(next.length === 0) next = $("#carousel > div:first");

                var prevSecond = $(prev).prev();
                if(prevSecond.length === 0) prevSecond = $("#carousel > div:last");

                var nextSecond = $(next).next();
                if(nextSecond.length === 0) nextSecond = $("#carousel > div:first");

                $(selected).removeClass().addClass("selected");
                $(selected).siblings().removeClass().addClass("hide");

                $(prev).removeClass().addClass("prev");
                $(next).removeClass().addClass("next");

                $(prevSecond).removeClass().addClass("prevLeftSecond");
                $(nextSecond).removeClass().addClass("nextRightSecond");

                $(prevSecond).prev().removeClass().addClass('hideLeft');
                if($(prevSecond).prev().length === 0) $("#carousel > div:last").removeClass().addClass('hideLeft');

                $(nextSecond).next().removeClass().addClass('hideRight');
                if($(nextSecond).next().length === 0) $("#carousel > div:first").removeClass().addClass('hideRight');

            }

            // Eventos teclado
            $(document).keydown(function(e) {
                switch(e.which) {
                    case 37: // left
                        moveToSelected('prev');
                        break;

                    case 39: // right
                        moveToSelected('next');
                        break;

                    default: return;
                }
                e.preventDefault();
            });

            $('#prev').click(function() {
                moveToSelected('prev');
            });

            $('#next').click(function() {
                moveToSelected('next');
            });

            function fetchMovieTrendData(){
                $.ajax({
                    type : "GET",            // HTTP method type(GET, POST) 형식이다.
                    url : "/movie/trends",      // 컨트롤러에서 대기중인 URL 주소이다.
                    success : function(data){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
                        for (var i=0; i < data.length; i++){
                            var movie = data[i];
                            var classNm;

                            if(i === 0) classNm = "prevLeftSecond";
                            else if(i === 1) classNm = "prev";
                            else if(i === 2) classNm = "selected";
                            else if(i === 3) classNm = "next";
                            else if(i === 4) classNm = "nextRightSecond";
                            else classNm = "hideRight";

                            var divHtml = '<div class="'+classNm+'">';
                            divHtml += '<div class="profile-card-6"><img src="https://image.tmdb.org/t/p/w500'+movie.posterPath+'">';
                            divHtml += '<div class="profile-name">'+movie.title+'</div>';
                            divHtml += '<div class="profile-overview">';
                            divHtml += '<div class="row text-center">';
                            divHtml += '<div class="col-xs-4">';
                            divHtml += '<p>평점</p>';
                            divHtml += '<h3>'+ movie.voteAverage.toFixed(1)+'</h3>';
                            divHtml += '</div>';
                            divHtml += '<div class="col-xs-4">';
                            divHtml += '<p>개봉일</p>';
                            divHtml += '<h3>'+movie.releaseDate+'</h3>';
                            divHtml += '</div>';
                            divHtml += '</div>';
                            divHtml += '</div>';
                            divHtml += '</div>';
                            divHtml += '<input name="movieId" type="hidden" value="'+movie.id+'" ">';
                            divHtml += '</div>';

                            $('#carousel').append(divHtml);
                        }

                    }
                });
            }

            $(document).ready(function (){
                fetchMovieTrendData();

                $(document).on('click', '.selected', function(){
                    var movieId = $(this).find("input[name=movieId]").val();
                    window.location.href = "<c:url value="/movie/detail" />/" + movieId;
                });

                $(document).on('click', '#carousel > div', function(){
                    moveToSelected($(this));
                });
            });
        </script>
    </body>
</html>
