<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%
    String sessionId = (String) session.getAttribute("userId");
    String userName = (String) session.getAttribute("userName");
%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>이미지생성</title>
<script type="text/javascript">
    function checkForm() {
        if (document.newWrite.subject.value == "") {
            alert("제목을 선택하세요.");
            return false;
        }
        if (document.newWrite.content.value == "") {
            alert("내용을 입력하세요.");
            return false;
        }
        return true;
    }
</script>
</head>
<body>
<%@ include file="./menu.jsp"%> 
<div class="container py-4">
    <div class="p-5 mb-4 bg-body-tertiary rounded-3">
        <div class="container-fluid py-5">
            <h1 class="display-5 fw-bold">이미지생성</h1>
            <p class="col-md-8 fs-4">createImg</p>      
        </div>
    </div>

    <div class="row align-items-md-stretch text-center">      
        <form name="newImg" action="CreatePic.do" method="post" onsubmit="return checkForm()">
            <input name="id" type="hidden" value="<%= sessionId %>">
            <div class="mb-3 row">
                <label class="col-sm-2 control-label">아이디</label>
                <div class="col-sm-3">
                    <input name="name" type="text" class="form-control" value="<%= userName %>" readonly>
                </div>
            </div>
            <div class="mb-3 row">
                <label class="col-sm-2 control-label">제목</label>
                <div class="col-sm-5">
                    <textarea name="subject" cols="10" rows="1" class="form-control"></textarea>
                </div>
            </div>
            <div class="mb-3 row">
                <label class="col-sm-2 control-label">원하는 이미지 설명</label>
                <div class="col-sm-8">
                    <textarea name="content" cols="20" rows="5" class="form-control"></textarea>
                </div>
            </div>
            <div class="mb-3 row">
                <label class="col-sm-2 control-label">이미지 미리보기</label>
                <div class="col-sm-8">
                    <div style="width: 1024px; height: 1024px; border: 1px solid #ddd;">
                        <img id="previewImage" src="#" alt="이미지 미리보기" style="max-width: 100%; max-height: 100%; display: none;">
                    </div>
                </div>
            </div>
            <div class="mb-3 row">
                <div class="col-sm-offset-2 col-sm-10">
                    <input type="submit" class="btn btn-primary" value="보내기">
                    <input type="reset" class="btn btn-primary" value="취소">
                    <input type="reset" class="btn btn-primary" value="다시보내기">
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>
