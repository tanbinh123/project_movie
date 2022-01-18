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
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" contenWt="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Gnr</title>
    <link rel="stylesheet" href="/css/index_include.css" />
    <link rel="stylesheet" href="/css/gnr.css" />
    
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>

<body>
    <div class="container">

        <jsp:include page="../include/index_include/index_header.jsp"></jsp:include>
        <!--main-->
        <div class="wrap">
            <div class="main">
                <div class="main_component">
                    <div id="sub_list">
                        <h1>Feature Film, Rating Count at least 30 <br>
                        (Sorted by JMKY Rating Descending)</h1>
                        
                        <br class="clear">
                        <div id="sort">
                            <span>Sort by : </span>
                            <a href="" style="font-weight:bold;color:#136cb2">Popularity</a>
                            <label> | </label>
                            <a>A-Z</a>
                            <label> | </label>
                            <a>User Rating</a>
                            <label> | </label>
                            <a >Number of Votes</a>
                            <label> | </label>
                            <a>US Box Office</a>
                            <label> | </label>
                            <a>Runtime</a>
                            <label> | </label>
                            <a>Year</a>
                            <label> | </label>
                            <a>Release Date</a>
                            <label> | </label>
                            <a>Date of Your Rating</a>
                            <label> | </label>
                            <a>Your Rating</a>
                        </div>
                        <br class="clear">

						<c:forEach var="genreAll" items="${genreAll }"> 
                        <div class="item_list">
                        	
                            <div id="movie_poster">
                                <a href="/title/${genreAll.mov_idn }"><img src="/images/${genreAll.mov_photo }" alt=""
                                style="width:67px; height:98px"></a>
                            </div>
                        
                            <div class="item_list_content">
                                <h3>
                                    <span>${genreAll.mov_idn }. </span>
                                    <a href="/title/${genreAll.mov_idn }">${genreAll.mov_title }</a>
                                    <span> (${genreAll.mov_release })</span>
                                </h3>
                                <p id="movie_detail">
                                    <span>${genreAll.mov_age }</span>
                                    <label> | </label>
                                    <span>${genreAll.mov_runtime }</span>
                                    <label> | </label>
                                    
                                </p>
                                <div id="rating_bar">
                                    <div class="rating_star">
                                        <i class="fas fa-star fa"></i>
                                            <span>${genreAll.mov_rat }</span>
                                    </div>
                                    <c:choose>
                                    	<c:when test="${genreAll.rating_number eq 0 }">
                                    		<div class="rating_star">
		                                        <i class="far fa-star fa" style="color: darkgray"></i>
		                                        <a>Rate this</a>
                                    		</div>
                                    	</c:when>
                                    	<c:when test="${genreAll.rating_rating eq 0 }">
                                    		<div class="rating_star">
		                                        <i class="far fa-star fa" style="color: rgba(109,174,272,0.5)"></i>
		                                        <a>seen</a>
                                    		</div>
                                    	</c:when>
                                    	<c:when test="${genreAll.rating_rating > 0 }">
                                    		<div class="rating_star">
		                                        <i class="far fa-star fa" style="color: #5285FF"></i>
		                                        &nbsp;<a>${genreAll.rating_rating }</a>
                                    		</div>
                                    	</c:when>
                                    </c:choose>
                                    
                                </div>
                                <p id="plot">${genreAll.mov_story }
                                </p>
                                <div id="credits">
                                    <span>Director : </span>
                                    <a href="">${genreAll.mov_director }</a>
                                    <label> | </label>
                                    <span>Main Actors : </span>
                                    <a href="">${genreAll.mov_actor }</a>
                                    
                                </div>
                                <div id="sort_num">
                                    <span>Likes: ${genreAll.mov_lik_cnt }</span>
                                    <label> | </label>
                                    <span>Gross: $${genreAll.mov_gross }M</span>
                                </div>
                                
                            </div>
                        </div>

						</c:forEach>

                        

                    </div>
                    
                </div>
            </div>
            
        </div>
        <jsp:include page="../include/index_include/index_footer.jsp"></jsp:include>
    </div>
    <script src="https://kit.fontawesome.com/a04df2c0ca.js" crossorigin="anonymous"></script>
    <script src="/js/header.js"></script>
</body>

</html>