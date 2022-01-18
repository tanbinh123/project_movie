
const imdb_rating_number = document.querySelectorAll(".imdb_rating_number");
const seen_star = document.querySelectorAll(".seen_star");
const seen = document.querySelectorAll(".seen");
const popover = document.querySelectorAll(".popover");
const rating_stars = document.querySelectorAll(".rating_stars");
const popover_delete = document.querySelectorAll(".popover_delete");
const like_heart = document.querySelectorAll(".like_heart");
const like_count = document.querySelectorAll(".like_count");
const sidebar_seen_movies = document.querySelector(".sidebar_seen_movies");
const descend = document.querySelector(".descend");

// let seen_movies_number = sidebar_seen_movies.innerText;
let ratingNumber = new Array(20);
let likeNumber = new Array(20);

const mov_idn1 = document.querySelectorAll(".mov_idn1");

var movieLikeData = {
	mov_idn: 0,
	number: 0,
	
}

var movieRatingData = {
	mov_idn: 0,
	number: 0,
	rating: 0
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
				alert('Likelist에 영화가 추가되었습니다.');
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
			
				alert('Likelist에 영화가 제거되었습니다.');
			
		},
		error:function(){
			alert('좋아요 비동기 처리 실패');
		}
	})

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
				location.reload(true);
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
			
				location.reload(true);
			
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
			
				location.reload(true);
			
		},
		error:function(){
			alert('별점 비동기 처리 실패');
		}
	})
}
//별 누르면 seen 나오고, sidebar 숫자 1 추가
for (let p = 0; p < 10; p++) {

	 seen_star[p].onclick = () => {
    if (seen_star[p].style.color == "darkgray") {
       movieRatingData.mov_idn = mov_idn1[p].value;
       movieRatingData.rating = 0;
       ratingInsertService();
   	  
      seen_star[p].style.color = "rgba(109,174,272,0.5)";
      seen[p].style.display = "inline-block";
      
      seen_movies_number = parseInt(seen_movies_number) + 1;
      sidebar_seen_movies.innerHTML = seen_movies_number;
    } else {
      popover[p].style.display = "block";
    }
  };


 
}

// x 아이콘 누르면 popover 사라지고 평점 원래대로 돌아옴
for (let q = 0; q < 10; q++) {
  ratingNumber[q] = imdb_rating_number[q].innerText;
  const firstRatingNumber1 = parseFloat(ratingNumber[q]);
  popover_delete[q].onclick = () => {
  	movieRatingData.mov_idn = mov_idn1[q].value;
  	movieRatingData.rating = 0;
  	ratingDeleteService();
  	
    popover[q].style.display = "none";
    seen_star[q].style.color = "darkgray";
    
  };
}

// 별점 생성, 별점의 숫자 반영
for (let k = 0; k < 10; k++) {
  ratingNumber[k] = imdb_rating_number[k].innerText;
  const firstRatingNumber = parseFloat(ratingNumber[k]);
  for (let i = 10 * k + 0; i < 10 * k + 10; i++) {
    rating_stars[i].onmouseover = () => {
      for (let j = 10 * k; j < i + 1; j++) {
      	
      	
        rating_stars[j].style.color = "#5285FF";
        seen[k].innerHTML = j + 1 - 10 * k;
        seen[k].style.fontSize = "16px";
        seen[k].style.width = "30px";
        seen[k].style.top = "1.5px";
        seen[k].style.textAlign = "center";
      }
    };
    rating_stars[i].onmouseout = () => {
      for (let j = 0; j < i + 1; j++) {
        rating_stars[j].style.color = "darkgray";
      }
    };
    rating_stars[i].onclick = () => {
    
      
      	 movieRatingData.mov_idn = mov_idn1[k].value;
      	movieRatingData.rating = i+1- 10*k;
      	ratingUpdateService();
      popover[k].style.display = "none";
      seen_star[k].style.color = "#5285FF";
      ratingNumber[k] =
        (firstRatingNumber * 9 + parseInt(seen[k].innerText)) / 10;
      imdb_rating_number[k].innerHTML = ratingNumber[k].toFixed(1);
      	
        
      
      
     
    };
  }
}
// 하트 생성, 하트수 증감
for (let r = 0; r < 10; r++) {
  likeNumber[r] = like_count[r].innerText;

  like_heart[r].onclick = () => {
    if (like_heart[r].style.color == "darkgray") {
      movieLikeData.mov_idn = mov_idn1[r].value;    
      likePlusService();
      	
      likeNumber[r] = parseInt(likeNumber[r]) + 1;
      like_count[r].innerHTML = likeNumber[r];
      like_heart[r].style.color = "#E04386";
     
    } else {
    
      movieLikeData.mov_idn = mov_idn1[r].value;
      likeMinusService();
      
      likeNumber[r] = parseInt(likeNumber[r]) - 1;
      like_count[r].innerHTML = likeNumber[r];
      like_heart[r].style.color = "darkgray";
    }
  };
}

/* 별점 매기는 일반 for문

for (let i = 10; i < 20; i++) {
  rating_stars[i].onmouseover = () => {
    for (let j = 10; j < i + 1; j++) {
      rating_stars[j].style.color = "blue";
      seen[1].innerHTML = j + 1 - 10;
    }
  };
  rating_stars[i].onmouseout = () => {
    for (let j = 10; j < i + 1; j++) {
      rating_stars[j].style.color = "darkgray";
    }
  };
  rating_stars[i].onclick = () => {
    popover[1].style.display = "none";
  };
}
*/
