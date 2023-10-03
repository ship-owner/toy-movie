<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8" />
    <sitemesh:write property='head' />
</head>
<body class="d-flex flex-column h-100">
<main class="flex-shrink-0">
    <!-- Navigation-->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container px-5">
            <a class="navbar-brand" href="/movie/index">The Movie</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                    <li class="nav-item"><a class="nav-link" href="/movie/index">Index</a></li>
                    <li class="nav-item"><a class="nav-link" href="about.jsp">About</a></li>
                    <sec:authorize access="isAnonymous()">
                        <li class="nav-item"><a class="nav-link" href="/user/login">Login</a></li>
                    </sec:authorize>
                    <sec:authorize access="!isAnonymous()">
                            <li class="nav-item"><a class="nav-link" href="javascript:logout();"><sec:authentication property="principal.name"/></a></li>
                    </sec:authorize>

                    <%--<li class="nav-item"><a class="nav-link" href="pricing.jsp">Pricing</a></li>
                    <li class="nav-item"><a class="nav-link" href="faq.jsp">FAQ</a></li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="navbarDropdownBlog" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Blog</a>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownBlog">
                            <li><a class="dropdown-item" href="blog-home.jsp">Blog Home</a></li>
                            <li><a class="dropdown-item" href="blog-post.jsp">Blog Post</a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="navbarDropdownPortfolio" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Portfolio</a>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownPortfolio">
                            <li><a class="dropdown-item" href="portfolio-overview.jsp">Portfolio Overview</a></li>
                            <li><a class="dropdown-item" href="portfolio-item.jsp">Portfolio Item</a></li>
                        </ul>
                    </li>--%>
                </ul>
            </div>
        </div>
    </nav>

    <sitemesh:write property='body' />
</main>
<!-- Footer-->
<footer class="bg-dark py-4 mt-auto">
    <div class="container px-5">
        <div class="row align-items-center justify-content-between flex-column flex-sm-row">
            <div class="col-auto"><div class="small m-0 text-white">Copyright &copy; Your Website 2023</div></div>
            <div class="col-auto">
                <a class="link-light small" href="#!">Privacy</a>
                <span class="text-white mx-1">&middot;</span>
                <a class="link-light small" href="#!">Terms</a>
                <span class="text-white mx-1">&middot;</span>
                <a class="link-light small" href="#!">Contact</a>
            </div>
        </div>
    </div>
</footer>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
    function logout(){
        $.ajax({
            type: "POST",
            url: "/user/logout",
            success: function () {
                alert("로그아웃되었습니다");
                window.location.href = "/user/login";
            }
        });
    }

</script>
</body>
</html>