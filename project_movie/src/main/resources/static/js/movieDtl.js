const btn=document.querySelector("#review_btn");
const review=document.querySelector("#review");
const mov_idn=document.querySelector(".mov_idn");

let today = new Date();
let year = today.getFullYear(); // 년도
let month = today.getMonth() + 1; // 월
let date = today.getDate(); // 날짜

var movieLikeData = {
	mov_idn: 0,
	number: 0,
	
}

var movieReviewData={
	mov_idn:0,
	number:0,
	content:"",
	today,
	today,
	username:""
}


btn.onclick=()=>{
	movieReviewData.mov_idn = mov_idn1.value;
	movieReviewData.content=review.value;
	if(movieReviewData.content==""){
		alert('댓글등록 실패!')
	}else{
		insertReview();
	}
	
	
}

function insertReview(){
	$.ajax({
		type: "post",
		url: "/title/"+movieReviewData.mov_idn,
		data: JSON.stringify(movieReviewData),
		dataType: "text",
		contentType: "application/json;charset=UTF-8",
		success: function(data){
			movieReviewData = JSON.parse(data);
			if(movieReviewData.error == "auth"){
			alert('로그인해주세요!');
			location.href = '/auth/signin';
			}else{
				alert('댓글등록 완료!');
				clearReview();
				location.href = "/title/"+movieReviewData.mov_idn;
			}
		},
		error:function(){
			alert('댓글 비동기 처리 실패');
			clearReview();
		}
	})

}

function clearReview(){
	review.value="";
}
const blue_star = document.querySelector('#blue_star');
const promptable_base = document.querySelector('.promptable_base');
const promptable_base_close = document.querySelector('.promptable_base_close')
const rating_stars = document.querySelectorAll(".rating_stars");
const mov_idn1 = document.querySelector("#mov_idn1");
const rate = document.querySelector(".rate");
const dtlStar = document.querySelector(".dtlStar");
const remove_button = document.querySelector(".remove_button");
const likelist = document.querySelector(".likelist");

var movieRatingData = {
	mov_idn: 0,
	number: 0,
	rating: 0
}

// 별을 누르면 본 기록이 movie_rating에 insert
function ratingInsertService(){
	$.ajax({
		type: "post",
		url: "/chart-rating/insert",
		data: JSON.stringify(movieRatingData),
		dataType: "text",
		contentType: "application/json;charset=UTF-8",
		success: function(data){
			movieRatingData = JSON.parse(data);
			if(movieRatingData.error == "auth"){
			location.href = '/auth/signin';
			}else{
			}
		},
		error:function(){
			alert('별점 비동기 처리 실패');
		}
	})

}


// 별점을 누르면 movie_rating의 rating이 update
function ratingUpdateService(){
	$.ajax({
		type: "post",
		url: "/chart-rating/update",
		data: JSON.stringify(movieRatingData),
		dataType: "text",
		contentType: "application/json;charset=UTF-8",
		success: function(data){
			movieRatingData = JSON.parse(data);
			
		},
		error:function(){
			alert('별점 비동기 처리 실패');
		}
	})

}


// x를 누르면 movie_rating에 delete
function ratingDeleteService(){
	$.ajax({
		type: "post",
		url: "/chart-rating/delete",
		data: JSON.stringify(movieRatingData),
		dataType: "text",
		contentType: "application/json;charset=UTF-8",
		success: function(data){
			movieRatingData = JSON.parse(data);
			
			
		},
		error:function(){
			alert('별점 비동기 처리 실패');
		}
	})
}

blue_star.onclick = () =>{
    promptable_base.style.display = "block";
    if(dtlStar.style.color != "darkgray"){
    
    	remove_button.style.display = "block";
    }
    
}

promptable_base_close.onclick = () =>{
    promptable_base.style.display = "none";
}

if(dtlStar.style.color == "darkgray"){

	for (let i = 0; i < 10; i++){
	    rating_stars[i].onmouseover = () => {
	        for (let j = 0; j < i + 1; j++) {
	            rating_stars[j].style.color = "#5285FF";
	        }
	    }
	    
	    rating_stars[i].onmouseout = () => {
	        for (let j = 0; j < i + 1; j++) {
	          rating_stars[j].style.color = "darkgray";
	        }
	    }
	    
	    rating_stars[i].onclick = () => {
	    	movieRatingData.mov_idn = mov_idn1.value;
	      	movieRatingData.rating = i+1;
	      	ratingInsertService();
	      	promptable_base.style.display = "none";
	      	dtlStar.style.color = "#5285FF";
	      	rate.innerHTML = "";
	      	rate.innerHTML = i+1 +"/ 10";
	    }
	}
} else {
    	for (let i = 0; i < 10; i++){
		    rating_stars[i].onmouseover = () => {
		        for (let j = 0; j < i + 1; j++) {
		            rating_stars[j].style.color = "#5285FF";
		        }
		    }
		    
		    rating_stars[i].onmouseout = () => {
		        for (let j = 0; j < i + 1; j++) {
		          rating_stars[j].style.color = "darkgray";
		        }
		    }
		    
		    rating_stars[i].onclick = () => {
		    	movieRatingData.mov_idn = mov_idn1.value;
		      	movieRatingData.rating = i+1;
		      	ratingUpdateService();
		      	promptable_base.style.display = "none";
		      	dtlStar.style.color = "#5285FF";
		      	rate.innerHTML = "";
		      	rate.innerHTML = (i+1) +"/ 10";
		    }
		    remove_button.onclick = () => {
		    	movieRatingData.mov_idn = mov_idn1.value;
		      	movieRatingData.rating = 0;
		      	ratingDeleteService();
		      	promptable_base.style.display = "none";
		      	dtlStar.style.color = "darkgray";
		      	rate.innerHTML = "";
		      	rate.innerHTML = "&nbsp;Rate";
		    }
		}
}

// like 누르면 수가 db에서 1 증가
function likePlusService(){
	$.ajax({
		type: "post",
		url: "/chart-like/plus",
		data: JSON.stringify(movieLikeData),
		dataType: "text",
		contentType: "application/json;charset=UTF-8",
		success: function(data){
			movieLikeData = JSON.parse(data);
			if(movieLikeData.error == "auth"){
			location.href = '/auth/signin';
			}else{
			}
			
		},
		error:function(){
			alert('좋아요 비동기 처리 실패');
		}
	})

}


// like 누르면 수가 db에서 1 감소
function likeMinusService(){
	$.ajax({
		type: "post",
		url: "/chart-like/minus",
		data: JSON.stringify(movieLikeData),
		dataType: "text",
		contentType: "application/json;charset=UTF-8",
		success: function(data){
			movieLikeData = JSON.parse(data);
			
			
			
		},
		error:function(){
			alert('좋아요 비동기 처리 실패');
		}
	})

}

likelist.onclick = () => {
	if(likelist.style.backgroundColor == 'darkgray'){
		movieLikeData.mov_idn = mov_idn1.value;
	 likePlusService();
	 location.href = "/title/"+mov_idn1.value;
	} else {
		 movieLikeData.mov_idn = mov_idn1.value;
		  likeMinusService();
	 location.href = "/title/"+mov_idn1.value;
	}
	 
}
