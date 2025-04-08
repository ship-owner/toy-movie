<%@ page import="com.toy.movie.dto.MovieListDto" %>
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
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link href="/static/css/styles.css" type="text/css" rel="stylesheet" />

        <style>
            * {
                box-sizing: border-box;
            }

            body {
                color: #333 !important;
                font-family: "open sans";
                padding: 20px;
            }

            body.no-scroll {
                overflow: hidden;
            }

            .main {
                padding-left: 40px;
                padding-right: 40px;
            }

            .col-0 {
                flex: 0 0 0%;
                max-width: 0%;
            }

            .filter-title {
                text-transform: uppercase;
                margin-bottom: 20px;
            }

            .main-row.no-menu .menu {
                transform: translate3d(-300px, 0, 0);
            }

            .col-menu .menu-wrap {
                position: fixed;
            }

            .col-menu .menu {
                transition: 1s;
                position: absolute;
                width: 200px;
                left: 0;
                top: 0;
            }

            .row-cards.is-moving .card.clone {
                transition: 1s;
            }

            .row-cards.is-moving .card:nth-child(1) {
                position: absolute;
                width: 100%;
                height: 100%;
                top: 0;
                left: 0;
            }

            .row-cards.is-moving .card:nth-child(2) {
                opacity: 0;
            }

            .col-card__content {
                position: relative;
                cursor: pointer;
            }

            .card {
                padding: 0;
                border: none;
                margin-bottom: 50px;
                box-shadow: 0 2px 14px 0 rgba(47, 60, 83, 0.16);
            }

            .card .card-body {
                padding: 30px 20px;
            }

            .card .card-title {
                font-size: 14px;
                font-weight: 700;
                text-transform: uppercase;
            }

            .card .card-text {
                font-size: 12px;
                line-height: 1.4;
                display: -webkit-box;
                overflow:hidden;
                -webkit-box-orient:vertical;
                -webkit-line-clamp:3
            }

            .card .card-list {
                font-size: 12px;
                padding-left: 15px;
            }

            #btn-toggle {
                margin: 0 auto;
                margin-bottom: 20px;
                width: 200px;
                display: block;
                background: rgb(64, 191, 246);
                background: linear-gradient(90deg, rgba(64, 191, 246, 1) 0%, rgba(110, 102, 224, 1) 100%);
                border: none;
                font-size: 14px;
                padding: 15px;
                font-weight: 300;
                box-shadow: 0 2px 14px 0 rgba(47, 60, 83, 0.3);
            }

            html, body {
                padding: 0;
            }

            body {
                background-color: #f5f6f7;
            }

            header.tg-header {
                padding: 40px;
                margin-bottom: 40px;
                background: rgb(247, 89, 100);
                background: linear-gradient(90deg, rgba(247, 89, 100, 1) 0%, rgba(249, 148, 104, 1) 100%);
                color: #fff;
            }

            h1.tg-h1 {
                text-align: center;
                font-size: 20px;
                text-transform: uppercase;
                letter-spacing: 1.2px;
                font-weight: bold;
            }

            h2.tg-h2 {
                text-align: center;
                font-size: 12px;
                letter-spacing: 1.2px;
                font-weight: 300;
            }

            hr.tg-hr {
                margin: 0 auto;
                margin-top: 30px;
                margin-bottom: 30px;
            }

            footer.tg-footer {
                text-align: center;
                padding-bottom: 50px;
            }

            .tg-link {
                display: inline-block;
                margin: 0 20px;
                text-align: center;
                color: #278fb2;
            }

            .col-6 {
                width: 33%;
            }



            .pagination_rounded {
                display: inline-block;
                margin: 0 auto;
                width: auto;
            }

            .pagination_rounded ul {
                margin: 0;
                padding: 0;
                list-style: none;
            }

            .pagination_rounded li:first-child {
                margin-left: 0px;
            }

            .pagination_rounded ul li {
                float: left;
                margin-left: 20px;
            }

            .pagination_rounded ul li a:hover {
                background: #e1e1e1;
                color: #4285f4;
                border: 1px solid #e1e1e1;
            }

            .pagination_rounded ul li.active a {
                background: #4285f4;
                color: #fff;
                border: 1px solid #4285f4;
            }

            a:link {
                text-decoration: none;
            }

            .pagination_rounded .prev {
                margin-left: 0px;
                border-radius: 35px;
                width: 90px;
                height: 34px;
                line-height: 34px;
            }


            .pagination_rounded ul li a {
                float: left;
                color: #4285f4;
                border-radius: 50%;
                line-height: 30px;
                height: 30px;
                width: 30px;
                text-align: center;
                margin-bottom: 40px;
                border: 1px solid #e0e0e0;
            }

            .pagination_rounded .prev i {
                margin-right: 10px;
            }

            .pagination_rounded .next {
                border-radius: 35px;
                width: 90px;
                height: 34px;
                line-height: 34px;
            }

        </style>
    </head>
    <body class="d-flex flex-column">

    <div class="main">
        <div id="btn-toggle" class="btn btn-primary">Show / Hide Filters</div>
        <div class="row main-row">
            <div class="col-4 col-menu">
                <div class="menu-wrap">
                    <div class="menu">
                        <h6 class="filter-title">Filters</h6>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <div class="input-group-text">
                                    <input type="checkbox" aria-label="Checkbox for following text input">
                                </div>
                            </div>
                            <div class="form-control">Wavve</div>
                        </div>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <div class="input-group-text">
                                    <input type="checkbox" aria-label="Checkbox for following text input">
                                </div>
                            </div>
                            <div class="form-control">Tving</div>
                        </div>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <div class="input-group-text">
                                    <input type="checkbox" aria-label="Checkbox for following text input">
                                </div>
                            </div>
                            <div class="form-control">Netflix</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-8 col-cards">
                <div class="row row-cards">

                    <c:forEach items="${searchResult.movieList}" var="movie">
                        <div class="col-6 col-card" onclick="window.location='/movie/detail/<c:out value="${movie.id}" />'">
                            <div class="col-card__content">
                                <div class="card">
                                    <img class="card-img-top" src="https://image.tmdb.org/t/p/w500<c:out value="${movie.posterPath}" />" alt="Card image cap">
                                    <div class="card-body">
                                        <h5 class="card-title"><c:out value="${movie.title}" /></h5>
                                        <p class="card-text"><c:out value="${movie.overview}" /></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                </div>
            </div>

            <div class="pagination_rounded">
                <ul>
                    <li>
                        <a href="javascript:goPage(${searchResult.page - 1});" class="prev" ${searchResult.page == 1 ? 'style="pointer-events: none; opacity: 0.5;"' : ''}>
                            <i class="fa fa-angle-left" aria-hidden="true"></i> Prev
                        </a>
                    </li>

                    <%
                        MovieListDto searchResult = (MovieListDto) request.getAttribute("searchResult");

                        int currentPage = searchResult.getPage();
                        int totalPages = searchResult.getTotalPages();

                        int startPage = Math.max(1, currentPage - 2);
                        int endPage = Math.min(totalPages, currentPage + 2);

                        if (endPage - startPage < 4) {
                            if (startPage == 1) {
                                endPage = Math.min(totalPages, startPage + 4);
                            } else if (endPage == totalPages) {
                                startPage = Math.max(1, endPage - 4);
                            }
                        }

                        request.setAttribute("startPage",startPage);
                        request.setAttribute("endPage",endPage);
                    %>
                    <c:forEach var="i" begin="${startPage}" end="${endPage}">
                        <li class="${i == searchResult.page ? 'active' : 'hidden-xs'}">
                            <a href="javascript:goPage(${i});" class="${i == currentPage ? 'active' : ''}">${i}</a>
                        </li>
                    </c:forEach>

                    <li>
                        <a href="javascript:goPage(${searchResult.page + 1});" class="next" ${searchResult.page == searchResult.totalPages ? 'style="pointer-events: none; opacity: 0.5;"' : ''}>
                            Next <i class="fa fa-angle-right" aria-hidden="true"></i>
                        </a>
                    </li>
                </ul>
            </div>

        </div>
    </div>


        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
            <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

    <script>

        document.addEventListener('DOMContentLoaded', function(){
            let btnToggle = document.querySelector('#btn-toggle');
            let rowCards = document.querySelector('.row-cards');
            let mainRow = document.querySelector('.main-row');
            let colCardAll = document.querySelectorAll('.col-card');
            let cardAll = document.querySelectorAll('.card');

            btnToggle.addEventListener('click', function(){
                if (!rowCards.classList.contains('is-moving')) {
                    mainRow.classList.toggle("no-menu");

                    for(i=0; i<cardAll.length; i++){
                        let clone = cardAll[i].cloneNode(true);
                        clone.classList.add("clone");
                        cardAll[i].parentElement.insertBefore(clone, cardAll[i]);

                        let top = clone.getBoundingClientRect().top;
                        let left = clone.getBoundingClientRect().left;
                        let width = clone.getBoundingClientRect().width;
                        let height = clone.getBoundingClientRect().height;


                        clone.style.position = 'fixed';
                        clone.style.top = top+'px';
                        clone.style.left = left+'px';
                        clone.style.width = width+'px';
                        clone.style.height = height+'px';
                    }

                    document.querySelector('.col-menu').classList.toggle('col-0');
                    document.querySelector('.col-menu').classList.toggle('col-4');
                    document.querySelector('.col-cards').classList.toggle('col-8');
                    document.querySelector('.col-cards').classList.toggle('col-12');
                    for(i=0; i<colCardAll.length; i++){
                        colCardAll[i].classList.toggle('col-4');
                        colCardAll[i].classList.toggle('col-6');
                    }
                    rowCards.classList.add('is-moving');

                    let cardCloneAll = document.querySelectorAll('.card.clone');
                    for(i=0; i<cardCloneAll.length; i++){
                        let top = cardAll[i].getBoundingClientRect().top;
                        let left = cardAll[i].getBoundingClientRect().left;
                        let width = cardAll[i].getBoundingClientRect().width;
                        let height = cardAll[i].getBoundingClientRect().height;

                        cardCloneAll[i].style.top = top+'px';
                        cardCloneAll[i].style.left = left+'px';
                        cardCloneAll[i].style.width = width+'px';
                        cardCloneAll[i].style.height = height+'px';
                    }

                    setTimeout(function(){
                        rowCards.classList.remove('is-moving');
                        for(i=0; i<cardCloneAll.length; i++){
                            cardCloneAll[i].remove();
                        }
                    }, 1000)

                }

            })


            //simulate click for thumbnail
           /* setTimeout(function(){
                document.getElementById('btn-toggle').click();
            }, 500);
            setTimeout(function(){
                document.getElementById('btn-toggle').click();
            }, 2500)*/
        });


        function goPage(page) {
            let currentParams = new URLSearchParams(window.location.search);
            currentParams.set('page', page);

            console.log(currentParams);
            window.location.href = "/movie/search?" + currentParams;
        }

    </script>
    </body>
</html>
