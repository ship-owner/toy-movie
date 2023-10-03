<%@ page import="com.toy.movie.dto.CommentDto" %>
<%@ page import="java.util.List" %>
<%@ page import="com.toy.movie.dto.MovieDto" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>

    hr {
        margin-top: 20px;
        margin-bottom: 20px;
        border: 0;
        border-top: 1px solid #FFFFFF;
    }
    a {
        color: #82b440;
        text-decoration: none;
    }
    .blog-comment::before,
    .blog-comment::after,
    .blog-comment-form::before,
    .blog-comment-form::after{
        content: "";
        display: table;
        clear: both;
    }

    .blog-comment{
        padding-left: 5%;
        padding-right: 5%;
    }

    .blog-comment .mb-4{
        margin-top: 15px;
        margin-bottom: 15px;
        display: inline-block;
        width: 100%;
    }

    .blog-comment .mb-4 .btn{
        margin-top: 5px;
        float: right;
    }

    .blog-comment .mb-4 textarea{
        resize: none;
    }

    .blog-comment ul{
        list-style-type: none;
        padding: 0;
    }

    .blog-comment img{
        opacity: 1;
        filter: Alpha(opacity=100);
        -webkit-border-radius: 4px;
        -moz-border-radius: 4px;
        -o-border-radius: 4px;
        border-radius: 4px;
    }

    .blog-comment img.avatar {
        position: relative;
        float: left;
        margin-left: 0;
        margin-top: 0;
        width: 65px;
        height: 65px;
    }

    .blog-comment .post-comments{
        border: 1px solid #eee;
        margin-bottom: 20px;
        padding: 10px 20px;
        position: relative;
        -webkit-border-radius: 4px;
        -moz-border-radius: 4px;
        -o-border-radius: 4px;
        border-radius: 4px;
        background: #fff;
        color: #6b6e80;
        position: relative;
    }

    .blog-comment .meta {
        font-size: 13px;
        color: #aaaaaa;
        padding-bottom: 8px;
        margin-bottom: 10px !important;
        border-bottom: 1px solid #eee;
    }

    .blog-comment ul.comments{
        padding-top: 0px;
        padding-bottom: 0px;
    }

    .blog-comment ul.comments ul{
        list-style-type: none;
        padding: 0;
        margin-left: 25px;
    }

    .blog-comment-form{
        padding-left: 15%;
        padding-right: 15%;
        padding-top: 40px;
    }

    .blog-comment h3,
    .blog-comment-form h3{
        margin-bottom: 40px;
        font-size: 26px;
        line-height: 30px;
        font-weight: 800;
    }
</style>


<div class="card bg-light">
    <div class="blog-comment">
        <div class="mb-4">
            <textarea class="form-control comment" rows="3" placeholder="Join the discussion and leave a comment!"></textarea>
            <button type="button" class="btn btn-primary" onclick="saveComment($(this).siblings('.comment').val());">저장</button>
        </div>

        <%!
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        %>

        <%!
            public String makeComment(List<CommentDto> commentList) {
                StringBuilder sb = new StringBuilder();
                if (commentList != null && commentList.size() > 0) {
                    sb.append("<ul class=\"comments\">");
                    for (CommentDto commentDto : commentList) {
                        sb.append("<li class=\"clearfix\">");
                        sb.append("<input name=\"commentId\" type=\"hidden\" value=\""+commentDto.getCommentId()+"\" />");
                        sb.append("<div class=\"post-comments\">");
                        sb.append("<p class=\"meta\">");
                        sb.append(commentDto.getModDate() != null ? sdf.format(commentDto.getModDate()) : sdf.format(commentDto.getRegDate()));
                        sb.append(" <a href=\"#\">" + commentDto.getUserName() + "</a>");
                        sb.append("<i class=\"pull-right\" style=\"float:right;\"><a href=\"javascript:void(0);\" onclick=\"appendReply(this)\"><small>Reply</small></a></i>");
                        sb.append("</p>");
                        sb.append("<p>" + commentDto.getContent() + "</p>");
                        sb.append("</li>");

                        if(commentDto.getChildren() != null) {
                            sb.append(makeComment(commentDto.getChildren()));
                        }
                    }
                    sb.append("</ul>");
                }
                return sb.toString();
            }
        %>

        <%
            List<CommentDto> comments = (List<CommentDto>)request.getAttribute("comments");
        %>
        <%=makeComment(comments)%>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
    function saveComment(content, parentId) {
        $.ajax({
            type : "POST",            // HTTP method type(GET, POST) 형식이다.
            url : "/comment/save",      // 컨트롤러에서 대기중인 URL 주소이다.
            data : {content: content, parentId: parentId, movieId: $("#movieId").val()},
            success : function(data){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
                loadComment();
            }
        });
    }

    function appendReply(btn){
        var commentHtml = "<div class=\"mb-4\">";
        commentHtml += "<textarea class=\"form-control comment\" rows=\"3\" placeholder=\"Join the discussion and leave a comment!\"></textarea>";
        commentHtml += "<button type=\"button\" class=\"btn btn-primary\" onclick=\"saveComment($(this).siblings('.comment').val(), $(this).closest('li').find('input[name=commentId]').val());\">저장</button>";
        commentHtml += "</div>";

        $(btn).closest("li").append(commentHtml);
    }
</script>