<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting/setting_taglib.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JMKY 회원가입</title>
    <link rel="stylesheet" href="/css/signup.css">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    
</head>
<body>
    <form id="signup-form">
        <div id="logo_box">
            <h1 class="logo"><a href="/chart/boxoffice" style="color:black">JMKY</a></h1>
        </div>
        <div id="inner_box">
            <h1>Create account</h1>
            <div>
                <label for="">ID</label>
                <input type="text" name="username" class="item_ip">
            </div>
            <div class="item_msg">
                    <span class="errorMsg"></span>
            </div>
            <div>
                <label for="">Password</label>
                <input type="password" name="password" class="item_ip">
            </div>
            <div class="item_msg">
                    <span class="errorMsg"></span>
            </div>
            <div>
                <label for="">Re-enter password</label>
                <input type="password" name="repassword" class="item_ip">
            </div>
            <div class="item_msg">
                    <span class="errorMsg"></span>
            </div>
            <div>
                <label for="">Email</label>
                <input type="text" name="email" class="item_ip">
            </div>
            <div class="item_msg">
                    <span class="errorMsg"></span>
            </div>
            <div>
                <label for="">Your name</label>
                <input type="text" name="name" class="item_ip">
            </div>
            <div class="item_msg">
                    <span class="errorMsg"></span>
            </div>
            <div>
                <label for="">Your telephone (without "-")</label>
                <input type="tel" name="telephone" class="item_ip">
            </div>
            <div class="item_msg">
                    <span class="errorMsg"></span>
            </div>
            
            <button type="button" id="signup-btn" class="btn_g">JMKY 계정 만들기</button>
            
            <div id="inner_footer">계정을 가지고 계신가요?<a href="/auth/signin">로그인</a></div>
        </div>
    </form>
    <jsp:include page="../include/signup_include/signup_footer.jsp"></jsp:include>
</body>
<script src="/js/signup.js"></script>
</html>