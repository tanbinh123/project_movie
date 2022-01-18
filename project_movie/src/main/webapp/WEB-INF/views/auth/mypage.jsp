<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal"/> 
</sec:authorize>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EditProfile</title>
    <link rel="stylesheet" href="/css/index_include.css">
    <link rel="stylesheet" href="/css/mypage.css">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
    <jsp:include page="../include/index_include/index_header.jsp"></jsp:include>

    <!--main-->
    <form id="root">
        <div class="content1">
            <div id="main">
                <h1>Edit Profile</h1>
                <div class="article">
                    <div class="input_container">
                        <div class="input_title">Id</div>
                        <div class="input_info">
                            <label class="item_lb" for="">${principal.username }</label><br>
                            
                        </div>
                    </div>
                    <div class="input_container">
                        <div class="input_title">Password</div>
                        <div class="input_info">
                            <input type="password" placeholder="비밀번호 입력">
                        </div>
                    </div>
                    <div class="input_container">
                        <div class="input_title">NickName</div>
                        <div class="input_info">
                            <label class="item_lb" for="">${login_user.nickname }</label><br>
                            <input type="text" placeholder="닉네임 입력">
                        </div>
                    </div>
                    <button type="button" id="edit-info">회원 정보 수정</button>
                </div>
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
    </form>
    
	<script type="text/javascript">
			const editInfo = document.querySelector('#edit-info');
			
			editInfo.onclick = () => {
				alert('코드를 수정 중입니다!');
				/*
				 let data ={
				            password:$("#password").val(),
				            email:$("#email").val()
				        }
				$.ajax({
					type: "put",
					url: "/auth/mypage",
					data: JSON.stringify(data),
					dataType: "text",
					contentType: "application/json; charset=UTF-8",
					success: function(data){
						location.href = '/chart/boxoffice';
						alert("성공적으로 변경되었습니다!");
					},
					error: function(){
						alert("전송 오류!");
					}
				})*/
				
			}
		</script>
    </div>

    <jsp:include page="../include/index_include/index_footer.jsp"></jsp:include>
</body>
<script src="https://kit.fontawesome.com/b3187be5e2.js" crossorigin="anonymous"></script>
<script src="/js/header.js"></script>
</html>