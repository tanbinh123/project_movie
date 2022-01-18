<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WatchList</title>
    <link rel="stylesheet" href="/css/index_include.css">
    <link rel="stylesheet" href="/css/likelist.css">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>

<body>
    <jsp:include page="../include/index_include/index_header.jsp"></jsp:include>

    <div id="wraper">
        <div id="wraper_content">
            <div id="wraper_top">
                <div id="watch_list_main">
                    <div class="nav">
                        <div class="nav_left">
                            <h1>Your Likelist</h1>
                            <div id="private"><i class="fas fa-lock"></i> PRIVATE</div>
                        </div>
                        <div class="btns">
                            <a href="">
                                <span><i class="fas fa-pen fa-2x"></i></span>
                                <span>EDIT</span>
                            </a>

                            <a href="">
                                <span><i class="fas fa-code-branch fa-2x"></i></span>
                                <span>SHARE</span>
                            </a>
                        </div>        
                    </div>
                    <div class="nav_mid">
                        <div id="title_count">
                            ${fn:length(likelistAll) } Titles 
                        </div>
                        <!-- 
                        <div id="Sort">
                            <label for="">Sort by : </label>
                            <select name="" id="">
                                <option value="">List Order</option>
                                <option value="">Alphavetical</option>
                                <option value="">JMKY Rating</option>
                                <option value="">Popularity</option>
                                <option value="">Your Rating</option>
                                <option value="">Number of Ratings</option>
                                <option value="">Release Data</option>
                                <option value="">Runtime</option>
                                <option value="">Date Added</option>
                            </select>
                        </div>
                        <button><i class="fas fa-exchange-alt fa-rotate-90"></i></button>
                        <button class="btn"><i class="fas fa-th"></i></button>
                        <button class="btn">REFINE</button>
                    	-->
                    </div>
                    
                    <c:forEach var="likelistAll" items="${likelistAll }">
	                    <div class="item_list">
	                        <div id="movie_poster">
	                            <a href="/title/${likelistAll.mov_idn }"><img src="/images/${likelistAll.mov_photo }" width="100"></a>
	                        </div>
	                    
	                        <div class="item_list_content">
	                            <h3>
	                                <a href="/title/${likelistAll.mov_idn }">${likelistAll.mov_title }</a>
	                            </h3>
	                            <p id="movie_detail">
	                                <span>${likelistAll.mov_release }</span>
	                                <span>${likelistAll.mov_runtime }</span>
	                                <span>${likelistAll.mov_age }</span>
		                            <span>${likelistAll.mg_genre1 }</span>
	                                <c:if test="${null ne likelistAll.mg_genre2 }">
		                                <span>${likelistAll.mg_genre2 }</span>                                
	                                </c:if>
	                                <c:if test="${null ne likelistAll.mg_genre3 }">
		                                <span>${likelistAll.mg_genre3 }</span>	                                
	                                </c:if>
	                            </p>
	                            <div id="rating_bar">
	                            	
	                                <div class="rating_star">
	                                    <i class="fas fa-star fa" style="color:rgb(245, 197, 24)"></i>
	                                        <span>&nbsp;${likelistAll.mov_rat }</span>
	                                </div>
	                                
	                                <c:choose>
                                    	<c:when test="${likelistAll.rating_number eq 0 }">
                                    		<div class="rating_star">
		                                        <i class="far fa-star fa" style="color: darkgray"></i>
		                                        <a>Rate this</a>
                                    		</div>
                                    	</c:when>
                                    	<c:when test="${likelistAll.rating_rating eq 0 }">
                                    		<div class="rating_star">
		                                        <i class="far fa-star fa" style="color: rgba(109,174,272,0.5)"></i>
		                                        <a>seen</a>
                                    		</div>
                                    	</c:when>
                                    	<c:when test="${likelistAll.rating_rating > 0 }">
                                    		<div class="rating_star">
		                                        <i class="far fa-star fa" style="color: #5285FF"></i>
		                                        &nbsp;<a>${likelistAll.rating_rating }</a>
                                    		</div>
                                    	</c:when>
                                    </c:choose>
	                            </div>
	                            <div id="credits">
	                                <a href="">${likelistAll.mov_director } / </a>
	                                <a href="">${likelistAll.mov_actor } (${likelistAll.mov_actorchar })</a>
	                            </div>
	                            <p id="plot">${likelistAll.mov_story }
	                            </p>
	                        </div>
	                    </div>
	                     <!-- 
	                    <div id="export_list">
	                          <a href="">Export this list</a>
	                    </div>--> 
                	</c:forEach>
	                    
	            </div>
                <!--오른쪽 메뉴-->
                <div id="watch_list_main2">
                    <div id="slide_bar">
                        <div id="ab_ninja">
                            <span>
                                <h3>Create a new list</h3>
                            </span>
                            <p>List your movie, TV & celebrity picks.</p>
                            <span class="createlist" style="color: #136cb2; cursor:pointer">Create a new list</span>
                        </div>
                        <div id="aux">
                            <b>Facebook? </b><a href="https://help.imdb.com/article/imdb/general-information/sprinklr-community-access-you-re-about-to-leave-imdb-com/GP4FF3REXES9AR3P?recentlyAuthenticated=false#">Tell us what your think about this feature</a>

                        </div>
                    </div>
                </div>
            </div>

			 
            <!-- <div class="recently_view">
                <div class="rhs">
                    <a href="#" id="clear_rvi">Clear your history</a>
                </div>
                <h3>Recently View</h3>
            </div> -->
        </div>
    </div>

<jsp:include page="../include/index_include/index_footer.jsp"></jsp:include>

</body>
<script src="https://kit.fontawesome.com/b3187be5e2.js" crossorigin="anonymous"></script>
<script src="/js/header.js"></script>
<script src="/js/likelist.js"></script>
</html>