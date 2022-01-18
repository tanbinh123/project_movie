<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
</sec:authorize>
<link rel="stylesheet" href="/css/index_include.css" />
<div id="menu_nav">
	<div id="menu_nav_top">
		<h1>
			<a href="/chart/boxoffice" class="logo">JMKY</a>
		</h1>
		<label for="" id="exit_btn"><i class="fas fa-times-circle"></i></label>
	</div>
	<div id="menu_main">
		<div class="menu_list">
			<label for=""><i class="fas fa-film"></i>Movie</label>
			<div class="menu_item">
				<ul>
					<li><a href="/chart/boxoffice">Top 10 Rated Movies</a></li>
					<li><a href="/chart/top/1/1">JMKY Movies</a></li>
				</ul>
			</div>
		</div>
		<div class="menu_list">
			<label for=""><i class="fas fa-star"></i>Awards & Events</label>
			<div class="menu_item">
				<ul>
					<li><a
						href="https://www.imdb.com/best-of/?ref_=nv_ev_best_2021">Best
							of 2021</a></li>
					<li><a href="https://www.imdb.com/oscars/?ref_=nv_ev_acd">Oscars</a></li>
					<li><a
						href="https://www.imdb.com/search/title/?count=100&groups=oscar_best_picture_winners&sort=year%2Cdesc&ref_=nv_ch_osc">Best
							Picture Winners</a></li>
					<li><a
						href="https://www.imdb.com/golden-globes/?ref_=nv_ev_gg">Golden
							Globes</a></li>
					<li><a href="https://www.imdb.com/emmys/?ref_=nv_ev_rte">Emmys</a></li>
					<li><a
						href="https://www.imdb.com/starmeterawards/?ref_=nv_ev_sma">STARmeter
							Awards</a></li>
					<li><a href="https://www.imdb.com/comic-con/?ref_=nv_ev_comic">San
							Diego Comic-Con</a></li>
					<li><a href="https://www.imdb.com/nycc/?ref_=nv_ev_nycc">New
							York Comic-Con</a></li>
					<li><a href="https://www.imdb.com/sundance/?ref_=nv_ev_sun">Sundance
							Film Festival</a></li>
					<li><a href="https://www.imdb.com/toronto/?ref_=nv_ev_tor">Toronto
							Int'l Film Festival</a></li>
					<li><a
						href="https://www.imdb.com/awards-central/?ref_=nv_ev_awrd">Awards
							Central</a></li>
					<li><a
						href="https://www.imdb.com/festival-central/?ref_=nv_ev_fc">Festival
							Central</a></li>
					<li><a href="https://www.imdb.com/event/all/?ref_=nv_ev_all">All
							Events</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>
<header id="header">
	<div class="JMKYheader">

		<h1>
			<a href="/chart/boxoffice" class="logo">JMKY</a>
		</h1>

		<ul class="menu">
			<a>
				<li class="icon"><i class="fas fa-list"></i> Menu</li>
			</a>
		</ul>
		<div id="serach_container">
			<form id="search_container" method="get" action="/find">
			<input type="search" placeholder="Search JMKY" id="key-search" name="findValue">
			<button type="submit" class="find_submit">
				<i class="fas fa-search"></i>
			</button>
			</form>
		</div>
		<ul class="top_nav">
			<a href="https://pro.imdb.com/login/ap?u=/login/lwa&imdbPageAction=signUp&rf=cons_nb_hm&ref_=cons_nb_hm">
				<li>JMKYPro</li>
			</a>
			<a href="/user/likelist">
				<li><i class="far fa-plus-square"></i> Likelist</li>
			</a>
			<c:choose>
				<c:when test="${empty principal.user }">
					<a href="/auth/signin"><li>Sign In</li></a>
				</c:when>

				<c:otherwise>

					<a href="/auth/mypage"><li class="ellipsis">${principal.user.username }
							님</li></a>
					<div>
						<a href="/logout"><li><i class="fas fa-sign-out-alt"></i></li></a>
					</div>
				</c:otherwise>

			</c:choose>
		</ul>
	</div>
</header>