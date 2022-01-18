/*
const search_container = document.querySelector("#search_container");
const find_submit = document.querySelector(".find_submit");

function findSelect(){

	let formData = new Formdata(search_container);
	
	$.ajax({
		type: "post",
		url: "/find",
		enctype: "multipart/form-data",
		data: formData,
		processData: false,
		contentType: false,
		success: function(data){
			if(data == 0){
				alert('공지사항 등록 실패');
				
			} else{
				alert(formData);
				location.href = '/find/' + data;
			}	
		},
		error: function(){
			alert('전송 실패');
		}
	})
}

find_submit.onclick = () =>{
	
	findSelect();
}
*/