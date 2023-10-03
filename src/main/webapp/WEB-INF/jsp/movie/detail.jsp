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
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="/static/css/styles.css" type="text/css" rel="stylesheet" />
    </head>
    <body class="d-flex flex-column">
            <!-- Page Content-->
            <section class="py-5">
                <div class="container px-5 my-5">
                    <div class="row gx-5">
                        <div class="col-lg-3">
                            <c:forEach items="${movie.actorList}" var="actor">
                                <div class="d-flex align-items-center mt-lg-5 mb-4">
                                    <img class="img-fluid rounded-circle" style="width: 50px; height: 50px;" src="https://image.tmdb.org/t/p/w500<c:out value="${actor.profilePath}" />" alt="..." />
                                    <div class="ms-3">
                                        <div class="fw-bold"><c:out value="${actor.name}" /></div>
                                        <div class="text-muted"><c:out value="${actor.character}" /></div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <div class="col-lg-9">
                            <!-- Post content-->
                            <article>
                                <!-- Post header-->
                                <header class="mb-4">
                                    <input id="movieId" type="hidden" value="<c:out value="${movie.id}" />" />
                                    <!-- Post title-->
                                    <h1 class="fw-bolder mb-1"><c:out value="${movie.title}" /></h1>
                                    <!-- Post meta content-->
                                    <div class="text-muted fst-italic mb-2"><c:out value="${movie.releaseDate}" /></div>
                                    <!-- Post categories-->

                                    <div class="tab-container">
                                        <nav>
                                            <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                                <button class="nav-link active" id="nav-flatrate-tab" data-bs-toggle="tab" data-bs-target="#nav-flatrate" type="button" role="tab" aria-controls="nav-flatrate" aria-selected="true">정액제</button>
                                                <button class="nav-link" id="nav-rent-tab" data-bs-toggle="tab" data-bs-target="#nav-rent" type="button" role="tab" aria-controls="nav-rent" aria-selected="false">대여</button>
                                                <button class="nav-link" id="nav-buy-tab" data-bs-toggle="tab" data-bs-target="#nav-buy" type="button" role="tab" aria-controls="nav-buy" aria-selected="false">구매</button>
                                            </div>
                                        </nav>
                                        <div class="tab-content" id="nav-tabContent">
                                            <div class="tab-pane fade show active" id="nav-flatrate" role="tabpanel" aria-labelledby="nav-flatrate-tab" tabindex="0" style="margin-top: 5px;">
                                                <c:if test="${not empty movie.flatrateList}">
                                                    <c:forEach items="${movie.flatrateList}" var="provider">
                                                        <a class="navbar-brand" href="#" style="margin-left: 6px; font-size: 17px; font-weight: 700; line-height: 21px; letter-spacing: -.1px;">
                                                            <img src="https://image.tmdb.org/t/p/w500/<c:out value="${provider.logoPath}" />" alt="Logo" width="30" height="30" class="d-inline-block align-text-top">
                                                            <c:out value="${provider.providerName}" />
                                                        </a>
                                                    </c:forEach>
                                                </c:if>
                                            </div>
                                            <div class="tab-pane fade" id="nav-rent" role="tabpanel" aria-labelledby="nav-rent-tab" tabindex="0" style="margin-top: 5px;">
                                                <c:if test="${not empty movie.rentList}">
                                                    <c:forEach items="${movie.rentList}" var="provider">
                                                        <a class="navbar-brand" href="#" style="margin-left: 6px; font-size: 17px; font-weight: 700; line-height: 21px; letter-spacing: -.1px;">
                                                            <img src="https://image.tmdb.org/t/p/w500/<c:out value="${provider.logoPath}" />" alt="Logo" width="30" height="30" class="d-inline-block align-text-top">
                                                            <c:out value="${provider.providerName}" />
                                                        </a>
                                                    </c:forEach>
                                                </c:if>
                                            </div>
                                            <div class="tab-pane fade" id="nav-buy" role="tabpanel" aria-labelledby="nav-buy-tab" tabindex="0" style="margin-top: 5px;">
                                                <c:if test="${not empty movie.buyList}">
                                                    <c:forEach items="${movie.buyList}" var="provider">
                                                        <a class="navbar-brand" href="#" style="margin-left: 6px; font-size: 17px; font-weight: 700; line-height: 21px; letter-spacing: -.1px;">
                                                            <img src="https://image.tmdb.org/t/p/w500/<c:out value="${provider.logoPath}" />" alt="Logo" width="30" height="30" class="d-inline-block align-text-top">
                                                            <c:out value="${provider.providerName}" />
                                                        </a>
                                                    </c:forEach>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>

                                </header>
                                <!-- Preview image figure-->
                                <figure class="mb-4"><img class="img-fluid rounded" src="https://image.tmdb.org/t/p/w500<c:out value="${movie.backdropPath}" />" alt="..." /></figure>
                                <!-- Post content-->
                                <section class="mb-5">
                                    <p class="fs-5 mb-4"><c:out value="${movie.overview}" /></p>
                                </section>
                            </article>

                            <!-- Comments section-->
                            <section id="comments">
                            </section>
                        </div>
                    </div>
                </div>
            </section>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
            <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

    <script>
        function loadComment(){
            $("#comments").load("<c:url value="/comment/${movie.id}" />")
        }

        $(document).ready(function (){
            loadComment();
        });
    </script>
    </body>
</html>
