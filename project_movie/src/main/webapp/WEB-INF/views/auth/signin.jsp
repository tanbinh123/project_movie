<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign in with JMKY</title>
    <link rel="stylesheet" href="/css/signin.css">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link rel="stylesheet" href="/css/index_include.css">
</head>

<body>
    <body>
	<jsp:include page="../include/index_include/index_header.jsp"></jsp:include>
    <div id="root">
        <div class="content1">
            <div id="sign_in_option">
                <div id="sign_in_box">
                    <h1>Sign in</h1>
                    <form action="/auth/signin" method="post" id="signinForm">
                    	<input type="hidden" id="flag" value="${empty flag ? 3 : flag }">
                        <div>
                            <input type="text" class="item_ip" name="username"  placeholder="ID">
                        </div>
                        <div class="item_msg">
                            <span class="idErrorMsg"></span>
                        </div>
                        <div>
                            <input type="password" class="item_ip" name="password" placeholder="Password">
                        </div>
                        <div class="item_msg">
                            <span class="passwordErrorMsg"></span>
                        </div>
                        <div id="login_btns">
                            <div>
                                <button type="submit" class="item_btn btn_login">로그인</button>
                            </div>
                            <div>
                                <button type="button" onclick="location.href='/oauth2/authorization/google'"><a><i class="fab fa-google"></i> 구글 로그인</a></button>
                            </div>
                            <div>
                                <button type="button" onclick="location.href='/oauth2/authorization/facebook'" ><a><i class="fab fa-facebook-square"></i> 페이스북 로그인</a></button>
                            </div>
                            <div>
                                <button type="button" onclick="location.href='/oauth2/authorization/naver'"><a> 네이버 로그인</a></button>
                            </div>
                        </div>
                    </form>
                            
                    <div class="hr-sect">
                        <span>&nbsp;or&nbsp;</span>
                    </div>
                    <div>
                        <button type="button" id="sign_up_btn" onclick="location.href = '/auth/signup'">회원가입</button>
                    </div>
                    <p class="text-center">
                        <small>By signing in, you agree to IMDb's
                            <a href="">Conditions of Use</a>
                             and 
                            <a href="">Privacy Policy</a> 
                        </small>
                    </p>
                </div>
            </div>
            <div id="sign_in_perks">
                <h1>Benefits of your free IMDb account</h1>
                <p>
                    <strong>Personalized Recommendations</strong><br>
                    Discover shows you'll love.
                </p>
                <p>
                    <strong>Your Watchlist</strong><br>
                    Track everything you want to watch and receive e-mail when<br>
                    movies open in theaters.
                </p>
                <p>
                    <strong>Your Ratings</strong><br>
                    Rate and remember everything you've seen.
                </p>
                <p>
                    <strong>Contribute to IMDb</strong><br>
                    Add data that will be seen by millons of people and get cool<br>
                    badges.
                </p>

            </div>
        </div>
        <!--  
        <div class="recently_view">
            <div class="rhs">
                <a href="#" id="clear_rvi">Clear your history</a>
            </div>
            <h3>Recently View</h3>
        </div>
		-->
    </div>
	<jsp:include page="../include/index_include/index_footer.jsp"></jsp:include>
	
</body>
<script src="https://kit.fontawesome.com/b3187be5e2.js" crossorigin="anonymous"></script>
<script src="/js/signin.js"></script>
<script src="/js/header.js"></script>
</html>