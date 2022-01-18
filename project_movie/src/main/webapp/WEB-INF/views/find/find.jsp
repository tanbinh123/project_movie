<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>find</title>
	<link rel="stylesheet" href="/css/index_include.css" />
    <link rel="stylesheet" href="/css/find.css" />
    
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	
	<div class="container">
		<jsp:include page="../include/index_include/index_header.jsp"></jsp:include>
     	<div class="wrap">
            <div class="main">
                <div class="main_component">
                    <div id="sub_list">
                    
                    <c:set var="findValue" value="${findValue }"> </c:set>
                    <c:if test="${findValue ne null }">
                    	<h1>Results for "${findValue }"</h1>
                    </c:if>
                  
                    	
                        
                        <div class="findSection">
                            <h3 class="findSectionHeader">Titles</h3>
                            <table class="findList">
                            
                            <c:forEach var="findMovie" items="${findMovie }">
                            
                            	<c:if test="${findMovie.mov_title ne null}">
                            		<tbody>
                                    <tr class="findResult">
                                        <td class="primary_photo">
                                            <a href="http://localhost:8000/title/${findMovie.mov_idn }">
                                                <img src="/images/${findMovie.mov_photo }" style="width:32px; height: 44px;" alt="">
                                            </a>
                                        </td>
                                        <td class="result_text">
                                            <a href="http://localhost:8000/title/${findMovie.mov_idn }">${findMovie.mov_title }</a>
                                            ${findMovie.mov_release }
                                            <br>
                                            
                                        </td>
                                    </tr>
                                   
                                </tbody>
                            	
                            	</c:if>
                            	
                            	
                            </c:forEach>
                            </table>
                            
                        </div>
                        <div class="findSection">
                            <h3 class="findSectionHeader">Names</h3>
                            <table class="findList">
                                 <c:forEach var="findActorMovie" items="${findActorMovie }">
                            
                            	<c:if test="${findActorMovie.mov_actor ne null}">
                            		<tbody>
                                    <tr class="findResult">
                                        <td class="primary_photo">
                                            <a href="http://localhost:8000/title/${findActorMovie.mov_idn }">
                                                <img src="/images/${findActorMovie.mov_photo }" style="width:32px; height: 44px;" alt="">
                                            </a>
                                        </td>
                                        <td class="result_text">
                                            <a href="http://localhost:8000/title/${findActorMovie.mov_idn }">${findActorMovie.mov_title }</a>
                                            ${findActorMovie.mov_release }
                                            <br>
                                            
                                        </td>
                                    </tr>
                                   
                                </tbody>
                            	
                            	</c:if>
                            	
                            	
                            </c:forEach>
                            </table>
                        </div>
                        
                    </div>
                    
                </div>

            </div>
            
        </div>
        <jsp:include page="../include/index_include/index_footer.jsp"></jsp:include>
       
	</div>
    <script
      src="https://kit.fontawesome.com/a04df2c0ca.js"
      crossorigin="anonymous"
    ></script>
    <script src="/js/header.js"></script>
</body>
</html>