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
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>JMKY Top10</title>
    
    <link rel="stylesheet" href="/css/style.css" />
    <link rel="stylesheet" href="/css/mainNav.css" />
    <link rel="stylesheet" href="/css/chart.css" />
    <link rel="stylesheet" href="/css/signin.css" />
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  </head>
  <body>
    <div class="container">
     <jsp:include page="../include/index_include/index_header.jsp"></jsp:include>
       

      <div class="wrapper">
        <div class="pagecontent">
          <div class="content_2_wide">
            <div class="main">
              <span class="ab_widget">
                <div class="covid_message">
                  <div class="alert">
                    <p class="alert_message">
                      While theaters are closed, some data on this page may be
                      delayed or unavailable. In the meantime, check out
                      <a href="https://www.imdb.com/whats-on-tv/?ref_=im_2020"
                        >What's on TV and Streaming »</a
                      >
                    </p>
                    <p class="alert_message">
                      If you’re going out to the movies (or going out anywhere),
                      please stay safe! Check out the
                      <a
                        href="https://www.who.int/emergencies/diseases/novel-coronavirus-2019/question-and-answers-hub/q-a-detail/q-a-on-covid-19-and-masks"
                        >World Health Organization’s guidance on the use of
                        masks</a
                      >
                      to prevent the spread of COVID-19.
                    </p>
                  </div>
                </div>
              </span>
              <h1 class="title_topBo">Top 10 Rated Movies</h1>

              <hr />
              <span class="desc"></span>
              <table class="chart">
                <thead class="chart_header">
                  <tr>
                    <th class="chart_poster"></th>
                    <th class="chart_title chart_date_title">Title</th>
                    <th class="chart_rating chart_rating_title">
                      IMDb <br />Rating
                    </th>
                    <th class="chart_date">Date</th>
                    <th class="chart_myrating chart_myrating_title">My<br/> Rating</th>
                    <th class="chart_like">Like</th>
                  </tr>
                </thead>
                <tbody class="chart_main">
                  <c:forEach var="chartAllTop" items="${chartAllTop }">
                  <input class="mov_idn1" type="hidden" value=${chartAllTop.mov_idn }>
                  <tr>
                  
                    <td class="chart_poster">
                      <a
                        href="/title/${chartAllTop.mov_idn }"
                        ><img src="/images/${chartAllTop.mov_photo }"
                      		style="width:45px; height:67px;"
                      ></a>
                    </td>
                    <td class="chart_title">
                      <a
                        href="/title/${chartAllTop.mov_idn }"
                        >${chartAllTop.mov_title }</a
                      >
                    </td>
                    <td class="chart_rating">
                      <div class="seen_widget">
                        <div class="imdb_rating">
                          <i class="fas fa-star" style="color: rgb(245, 197, 24)"></i
                          >&nbsp;<span class="imdb_rating_number">${chartAllTop.mov_rat }</span>
                        </div>
                        
                      </div>
                    </td>
                    <td class="chart_date">${chartAllTop.mov_release }</td>
                    <td class="chart_myrating">
                    
                    <div class="my_rating">
                          <div class="popover" style="display: none">
                            <span class="popover_delete"></span>
                            <ul class="popover_rating">
                              <li>
                                <i
                                  class="fas fa-star rating_stars"
                                  id="star1"
                                  style="color: darkgray"
                                ></i>
                              </li>
                              <li>
                                <i
                                  class="fas fa-star rating_stars"
                                  id="star2"
                                  style="color: darkgray"
                                ></i>
                              </li>
                              <li>
                                <i
                                  class="fas fa-star rating_stars"
                                  id="star3"
                                  style="color: darkgray"
                                ></i>
                              </li>
                              <li>
                                <i
                                  class="fas fa-star rating_stars"
                                  id="star4"
                                  style="color: darkgray"
                                ></i>
                              </li>
                              <li>
                                <i
                                  class="fas fa-star rating_stars"
                                  id="star5"
                                  style="color: darkgray"
                                ></i>
                              </li>
                              <li>
                                <i
                                  class="fas fa-star rating_stars"
                                  id="star6"
                                  style="color: darkgray"
                                ></i>
                              </li>
                              <li>
                                <i
                                  class="fas fa-star rating_stars"
                                  id="star7"
                                  style="color: darkgray"
                                ></i>
                              </li>
                              <li>
                                <i
                                  class="fas fa-star rating_stars"
                                  id="star8"
                                  style="color: darkgray"
                                ></i>
                              </li>
                              <li>
                                <i
                                  class="fas fa-star rating_stars"
                                  id="star9"
                                  style="color: darkgray"
                                ></i>
                              </li>
                              <li>
                                <i
                                  class="fas fa-star rating_stars"
                                  id="star10"
                                  style="color: darkgray"
                                ></i>
                              </li>
                            </ul>
                          </div>

                         <c:choose>
						  	<c:when test="${chartAllTop.rating_number eq 0 }">
						  		<i
                            class="fas fa-star seen_star"
                            style="color: darkgray; margin-left: 13px;"
                          ></i>
						  	</c:when>
                          	<c:when test="${chartAllTop.rating_rating eq 0 }">
                          		<i
                            class="fas fa-star seen_star"
                            style="color: rgba(109,174,272,0.5)"
                          ></i>
                          	</c:when>
                          	<c:when test="${chartAllTop.rating_rating > 0 }">
                          		<i
                            class="fas fa-star seen_star"
                            style="color: #5285FF"
                          ></i>
                          	</c:when>
						  
                         
                          </c:choose>
                           <c:choose>
                          	<c:when test="${chartAllTop.rating_number eq 0 }"><span class="seen" style="font-size: 13px"></span> </c:when>
                          	<c:when test="${chartAllTop.rating_rating eq 0 }">
                          		<span class="seen" style="font-size: 13px">seen</span>
                          	</c:when>
                          	<c:when test="${chartAllTop.rating_rating > 0 }">
                          		<span class="seen" style="font-size: 16px;width:30px;top:1.5px;textAlign:center;">${chartAllTop.rating_rating }</span>
                          	</c:when>
                          </c:choose>
                        </div>
                    </td>
                    <td class="chart_like">
                      <div class="like_widget">
                        <div class="imdb_like">
                          <i
                            class="fas fa-heart like_heart"
                            style="color:  ${ chartAllTop.like_number ne 0 ? '#E04386' : 'darkgray'}"
                          ></i>
                        </div>
                        <div class="people_like">
                          <div style="font-size: 13px">
                            <span class="like_count">${chartAllTop.mov_lik_cnt }</span> likes
                          </div>
                        </div>
                      </div>
                    </td>
                  </tr>
                  </c:forEach>
                </tbody>
              </table>
              <div class="text_smaller">
                Reported by
                <a href="https://www.boxofficemojo.com/">Box Office Mojo</a> ©
                2021
              </div>
              
              
            </div>
            <div class="sidebar">
              <div class="sidebar_top"></div>
              <div class="sidebar_widget" style="display:none">
                <div class="sidebar_title">
                  <h5 class="title_yhs">You Have Seen</h5>
                </div>
                <div class="sidebar_seen">
                  <span class="sidebar_seen_movies">0</span>
                  <span>/ 10</span>
                  <span>( 0% )</span><br />
                  <div>
                    <input class="seen_title" type="checkbox" />
                    <label for="seen_title">Hide titles I've seen</label>
                  </div>
                </div>
              </div>
              <div class="sidebar_widget">
                <h3>JMKY Charts</h3>

                <a href="/chart/boxoffice">Top 10 Rated Movies</a><br />
                <div>Most Popular Movies</div>
                <a href="/chart/top/1/1">JMKY Movies</a><br />
                
                <div>Most Popular TV Shows</div>
                <div>Top 250 TV Shows</div>
                <div>Top Rated Indian Movies</div>
                <div>Lowest Rated Movies</div>
              </div>
              <div class="sidebar_widget">
                <h3>JMKY Charts</h3>

                <a href="/search/genre/1">Action </a><br />
                <a href="/search/genre/2">Adventure</a><br />
                <a href="/search/genre/3">Animation</a><br />
                <a href="/search/genre/4">Biography</a><br />
                <a href="/search/genre/5">Comedy</a><br />
                <a href="/search/genre/6">Crime</a><br />
                <a href="/search/genre/7">Drama</a><br />
                <a href="/search/genre/8">Family</a><br/>
                <a href="/search/genre/9">Fantasy </a><br />
                <a href="/search/genre/10">Film-Noir</a><br />
                <a href="/search/genre/11">History</a><br />
                <a href="/search/genre/12">Horror</a><br />
                <a href="/search/genre/13">Musical</a><br />
                <a href="/search/genre/14">Mystery</a><br/>
                <a href="/search/genre/15">Romance</a><br />
                <a href="/search/genre/16">Sci-Fi</a><br />
                <a href="/search/genre/17">Sport</a><br />
                <a href="/search/genre/18">Thriller</a><br />
                <a href="/search/genre/19">War</a><br />
                <a href="/search/genre/20">Western</a>
              </div>
            </div>
          </div>
        </div>
        <div id="rvi_div">
          <div class="recently_viewed"></div>
        </div>
      </div>
      <jsp:include page="../include/index_include/index_footer.jsp"></jsp:include>
        
    </div>
    <script type="text/javascript" src="/js/chart.js"></script>
	<script src="/js/header.js"></script>
    <script
      src="https://kit.fontawesome.com/a04df2c0ca.js"
      crossorigin="anonymous"
    ></script>
  </body>
  
</html>
    