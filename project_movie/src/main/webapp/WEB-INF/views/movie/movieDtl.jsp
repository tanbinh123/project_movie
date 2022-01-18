<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Movie</title>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal"/> 
</sec:authorize>
   	<link rel="stylesheet" href="/css/index_include.css">
    <link rel="stylesheet" href="/css/main.css">
    <link rel="stylesheet" href="/css/movieDtl.css">
        <link rel="stylesheet" href="/css/signin.css" />
     <script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>

<body>

	<jsp:include page="../include/index_include/index_header.jsp"></jsp:include>

    <!--main-->
    <div class="wrap">
    	
        <section id="wrap_top">
            <div id="main_top">
            
                <input type="hidden" value="${movie_dtl.mov_idn }" id="mov_idn1">  
                <div class="title_block_container">
                    <div class="title_block">
                        <h1>${movie_dtl.mov_title }</h1>
                        <div>
                            <li>
                                <a>${movie_dtl.mov_release }</a>
                                ㆍ<a> ${movie_dtl.mov_age } </a>ㆍ ${movie_dtl.mov_runtime }
                            </li>
                        </div>
                    </div>
                    <div class="rating_bar_container">
                        <div class="rating_bar_btn">
                            <div class="rating_bar_header"><p>JMKY RATING</p></div>
                            <a >
                                <div class="rating_star">
                                    <i class="fas fa-star fa-2x" id="star"></i>
                                    <div>
                                        <span>&nbsp;${movie_dtl.mov_rat } /10</span>
                                        <div id="mini_txt">&nbsp;2.5M</div>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="rating_bar_btn">
                            <div class="rating_bar_header"><p>YOUR RATING</p></div>
                            
                                <div id="blue_star" class="rating_star">
                                <c:choose>
                                	<c:when test="${movie_dtl.rating_number eq 0}">
	                                	<i class="fas fa-star fa-2x dtlStar" style="cursor:pointer; color: darkgray"></i>
	                                    <span class="rate">&nbsp;Rate</span>
                                	</c:when>
                                	<c:when test="${movie_dtl.rating_number ne 0}">
                                		<i class="fas fa-star fa-2x dtlStar" style="cursor:pointer"></i>
                                		<span class="rate">&nbsp;${movie_dtl.rating_rating } /10</span>
                                	</c:when>
                                </c:choose>
                                    
                                </div>
                            
                        </div>
                        <div class="rating_bar_btn">
                            <div class="rating_bar_header"><p>POPULARITY</p></div>
                            
                                <div class="rating_star">
                                    <i id="grape" class="fas fa-chart-line fa-2x"></i>
                                    <div id="popularity_box">
                                        <div>&nbsp;38</div>
                                        <div>&nbsp;<i class="fas fa-sort-up"></i> 14</div>
                                    </div>
                                </div>
                           
                        </div>
                    </div>
                </div>
                <div id="sub_nav">
                    <div>
                        <ul>
                            <li><a>cast & crew</a></li>
                            <li>ㆍ<a> User reviews</a></li>
                            <li>ㆍ<a> Trivia</a></li>
                            <li>ㆍ<a href="https://pro.imdb.com/title/tt2953050/?rf=cons_tt_contact&ref_=cons_tt_contact"> JMKYPro</a></li>
                            <button type="button"><i class="fas fa-th-large"></i>&nbsp;All topics</button>
                            <label> | </label>
                            <button type="button"><i class="fas fa-code-branch"></i></button>
                        </ul>
                    </div>
                </div>

                <div id="main_img">
                    <div id="poster">
                        <img src="/images/dtl-photo/${movie_dtl.mov_photo }" style="width:284px;height:420.95px">
                    </div>
                    <div id="preview">
                        <iframe width="808px" height="420.95px" src="https://www.youtube.com/embed/${movie_dtl.mov_trailer }" frameborder="no" scrolling="no" title="NaverVideo" allow="autoplay; gyroscope; accelerometer; encrypted-media" allowfullscreen></iframe>
                        
                    </div>
                </div>


                
              <div id="content_container">
                  <div id="content_left">
                      <div class="drama">
                        	<c:if test="${movie_dtl.mg_genre1 ne null }">
                        		<div>
                                <a href="/search/genre/${movie_dtl.mov_gnr1 }">${movie_dtl.mg_genre1 }</a>
                            	</div>
                        	</c:if>
                            
                           <c:if test="${movie_dtl.mg_genre2 ne null }">
                        		<div>
                                <a href="/search/genre/${movie_dtl.mov_gnr2 }">${movie_dtl.mg_genre2 }</a>
                            	</div>
                        	</c:if>
                           <c:if test="${movie_dtl.mg_genre3 ne null }">
                        		<div>
                                <a href="/search/genre/${movie_dtl.mov_gnr3 }">${movie_dtl.mg_genre3 }</a>
                            	</div>
                        	</c:if>
                        	<div>
	                            <span>
	                                ${movie_dtl.mov_story }
	                            </span>
                            </div>
                        </div>
                        <ul class="metadata">
                            <li class="director"><span>Director</span>&nbsp;&nbsp;<a>${movie_dtl.mov_director }</a></li>
                            
                            <li id="stars">
                                <span>Stars</span>&nbsp;
                                <a>${movie_dtl.mov_actor }</a>
                                
                            </li>
                            <li id="jmkypro">
                                <div>
                                    <a href="https://pro.imdb.com/title/tt2953050/?rf=cons_tt_atf&ref_=cons_tt_atf">
                                        JMKYPro
                                        <span>See production, box office & company info&nbsp;<i class="fas fa-external-link-alt"></i></span>
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div id="content_right">
                        <div id="content_right_top">
                        <c:choose>
                        	<c:when test="${movie_dtl.like_number eq 0 }">
                        		<button type="button" class="likelist" style="background-color: darkgray">
                                	<i class="fas fa-plus" style="color:black"></i>
                                	<div style="color:black">Add to Likelist</div>
                            	</button>
                            	
                        	</c:when>
                        	<c:when test="${movie_dtl.like_number ne 0 }">
                        		<button type="button" class="likelist" style="background-color:#E04386">
                                	<i class="fas fa-check"></i>
                                	<div>In Likelist</div>
                            	</button>
                            	                 	
                        	</c:when>
                        </c:choose>
                            
                        </div>
                        <ul id="review_content">
                            <li id="user_review">
                                <a><span>9.6K </span><span>User reviews</span></a>
                            </li>
                            <li id="critic_review">
                                <a><span>193 </span><span>Critic reviews</span></a>
                            </li>
                            <li id="metascore">
                                <a><span>80 </span><span>Metascore</span></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>

			

			

		<!--메인 아랫부분-->
		<section id="wrap_bottom">
			<div id="main_footer">
				<div class="ipc_page">
					<div class="ipc_page_innerbox">
						<div class="ipc_title_wrapper">

							<a >
								<h3>
									배우 <i class="fas fa-chevron-right"></i>
								</h3>
								<div>
									<a ><i class="fas fa-pen"></i> Edit</a>
								</div>
							</a>
						</div>
						<div id="ipc_sub_grid">
							<div class="actor_wrap">
								<div>
									<img class="images_actor" src="/images/actor/${movie_dtl.mov_actor }.PNG" 
									sizes="50vw"
									width="70" height="70" />
								</div>
								<div id="actor_name">
									<a >${movie_dtl.mov_actor }</a> <span>${movie_dtl.mov_actorchar }</span>
								</div>
							</div>

						</div>
						<ul class="metadata">
							<li class="director"><span>Director</span>&nbsp;&nbsp;<a
								>${movie_dtl.mov_director }</a></li>

							<li class="metadata_list_item"><a>All cast &
									crew</a> <a><i class="fas fa-chevron-right"></i></a></li>
							<li class="metadata_list_item"><a href="https://pro.imdb.com/title/tt2953050/?rf=cons_tt_btf_cc&ref_=cons_tt_btf_cc">See more cast
									details at JKMYPro</a> <a href="https://pro.imdb.com/title/tt2953050/?rf=cons_tt_btf_cc&ref_=cons_tt_btf_cc"><i
									class="fas fa-external-link-alt"></i></a></li>
						</ul>
					</div>

					<div id="ipc_right">
						<div class="ipc_right_box">
							<div class="ipc_right_wrapper">
								<a href="">
									<h3>
										평론가 한줄평 <i class="fas fa-chevron-right"></i>
									</h3>
								</a>
							</div>
							<div id="master_review">
								<div id="master_info">
									<span>이동진</span> <span>2021.12.09</span>
								</div>
								<div>
									<span><i class="fas fa-star fa"></i>&nbsp;9/10</span>
								</div>
								<div>
								<!--  
									<div class="user_review_title">
										<span>많은 이들의 '인생 영화'</span>
									</div> -->
									<div>
										${movie_dtl.mov_expertReview }
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
				<div class="ipc_page">
					<div class="ipc_page_innerbox">
						<div class="ipc_title_wrapper">
							<a href="">
								<h3>
									유저 리뷰 <i class="fas fa-chevron-right"></i>
								</h3>
							</a>
						</div>
						<div id="user_review_container">
							<div id="review_top">
								<span>TOP REVIEW</span> <span><i class="fas fa-star fa"></i>&nbsp;9/10</span>

							</div>
							<div class="user_review_title">
								<span>A Middle Finger To Pigs Everywhere</span>
							</div>
							<div>
								WHAT. A. MOVIE<br> <br> It is just so well acted. You
								beleve it all and want more of every single character!<br>
								<br> Clever,moralistic and entertaining.<br> <br>
								Hollywood has done very few consequential movies since (V For
								Vendetta, Captain Fantastic and<br> perhaps Watchmen..) so
								grab this one if you have not watched it.
							</div>
							<!--
							<div id="user_review_bottom">
								<div>
									<button>
										<i class="far fa-thumbs-up fa-2x"></i>
									</button>
									<span> <span>helpful</span> <span>ㆍ</span> <span>14</span>
									</span>
									<button>
										<i class="far fa-thumbs-down fa-2x"></i>
									</button>
									<span>0</span>
								</div>
								<div>
									<button>
										<i class="fas fa-ellipsis-v"></i>
									</button>
								</div>
							</div> -->
						</div>
					</div>
					<div id="right_user_review">
						<div class="ipc_right_wrapper">
							<a href="">
								<h3>리뷰 등록</h3>
							</a>
						</div>
						<!-- 리뷰 등록 박스 -->
						<div id="review_ip">
							<textarea name="review" id="review" cols="30" rows="5" placeholder="감상평을 입력해주세요."></textarea>
							<button id="review_btn" type="button">등록</button>
						</div>
						<!-- 리뷰 조회 -->
						<div id="reviews">
							<input type="hidden" id="number" name="number" value="${movie.number }" >
							<c:forEach var="movie_review" items="${movie_review}">
								<div class="review_list">
									<div>
										<h5>${movie_review.username} <span>${movie_review.createdate }</span></h5>
										<label for="">${movie_review.content }</label>
									</div>
									<c:if test="${movie_review.number eq movie.number}">
										<button><i class="fas fa-times"></i></button>
									</c:if>
								</div>
							</c:forEach>
						</div>


					</div>
				</div>

			</div>
		</section>
	</div>


	<div class="promptable_base">
        <div class="promptable_base_panel">
            <div class="promptable_base_focus">
                <div class="promptable_base_close">
                    
                    <i class="fas fa-times-circle fa-2x"></i>
                    
                </div>
                <div class="promptable_base_autofocus">
                    <div class="promptable_base_content">
                        <div class="rating_display" >
                            <i class="fas fa-star fa-5x" style="color: #5285FF"></i>
                        </div>
                        <div class="rating_prompt_container">
                            <h6 style="height: 30px;font-size: 18px;font-weight: lighter;">Rate this</h6>
                            <div style="height: 50px; letter-spacing: 0.1em; font-size: 18px;">${ movie_dtl.mov_title}</div>
                            <div class="prompt_rating_container">
                                <ul class="starbar">
                                    
                                        <li class="starbar_li">
                                            <i
                                            class="fas fa-star rating_stars fa-2x"
                                            id="star1"
                                            style="color: darkgray"
                                          ></i>
                                        </li>
                                        <li class="starbar_li">
                                            <i
                                            class="fas fa-star rating_stars fa-2x"
                                            id="star2"
                                            style="color: darkgray"
                                          ></i>
                                        </li>
                                        <li class="starbar_li"><i
                                            class="fas fa-star rating_stars fa-2x"
                                            id="star3"
                                            style="color: darkgray"
                                          ></i>
                                        </li>
                                        <li class="starbar_li">
                                            <i
                                            class="fas fa-star rating_stars fa-2x"
                                            id="star4"
                                            style="color: darkgray"
                                          ></i>
                                        </li>
                                        <li class="starbar_li">
                                            <i
                                            class="fas fa-star rating_stars fa-2x"
                                            id="star5"
                                            style="color: darkgray"
                                          ></i>
                                        </li>
                                        <li class="starbar_li">
                                            <i
                                            class="fas fa-star rating_stars fa-2x"
                                            id="star6"
                                            style="color: darkgray"
                                          ></i>
                                        </li>
                                        <li class="starbar_li">
                                            <i
                                            class="fas fa-star rating_stars fa-2x"
                                            id="star7"
                                            style="color: darkgray"
                                          ></i>
                                        </li>
                                        <li class="starbar_li"><i
                                            class="fas fa-star rating_stars fa-2x"
                                            id="star8"
                                            style="color: darkgray"
                                          ></i>
                                        </li>
                                        <li class="starbar_li">
                                            <i
                                            class="fas fa-star rating_stars fa-2x"
                                            id="star9"
                                            style="color: darkgray"
                                          ></i>
                                        </li>
                                        <li class="starbar_li">
                                            <i
                                            class="fas fa-star rating_stars fa-2x"
                                            id="star10"
                                            style="color: darkgray"
                                          ></i>
                                        </li>
                                          
                                    
                                    </ul>
                                	<button type="button" class="remove_button">Remove</button>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
   <jsp:include page="../include/index_include/index_footer.jsp"></jsp:include>
   


</body>
<script src="https://kit.fontawesome.com/b3187be5e2.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="/js/movieDtl.js"></script>
<script type="text/javascript" src="/js/header.js"></script>
</html>