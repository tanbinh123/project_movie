const item_ip = document.querySelectorAll('.item_ip');
const btn_login = document.querySelector('.btn_login');

var signInData = {
	username: '',
	password: '',
	signInFlag: 0
}

function clearMsgNode(msg){
	while(msg.hasChildNodes()){
		msg.removeChild(msg.firstChild);
	}
	msg.style.display = 'none';
}

function messageService(msgText, msgFlag){
	const idErrorMsg = document.querySelector('.idErrorMsg');
	const passwordErrorMsg = document.querySelector('.passwordErrorMsg');
	
	clearMsgNode(idErrorMsg);
	clearMsgNode(passwordErrorMsg);
	
	
	let msgTextNode = document.createTextNode(msgText);
	
	//msgFlag == 0 이메일 오류, 1이면 password 오류
	if(msgFlag == 0){
		idErrorMsg.appendChild(msgTextNode);
		idErrorMsg.style.display = 'block';
	}
	if(msgFlag==1) {
		passwordErrorMsg.appendChild(msgTextNode);
		passwordErrorMsg.style.display = 'block';
	}
}


function emptyCheck(){
	if(item_ip[0].value.length == 0 && item_ip[1].value.length == 0){
		let msgText = '! 아이디를 입력해 주세요.';
		let msgText1 = '! 비밀번호를 입력해 주세요.';
		messageService(msgText, 0);
		messageService(msgText1, 1);
		return false;
	}else if(item_ip[0].value.length == 0){
		let msgText = '! 아이디를 입력해 주세요.';
		messageService(msgText, 0);
		return false;
	}else if(item_ip[1].value.length == 0){
		let msgText = '! 비밀번호를 입력해 주세요.';
		messageService(msgText, 1);
		return false;
	}else{
		return true;
	}
	
	
}

function signInSubmit(){
	$.ajax({
		type: "post",
		url: "/auth/signin",
		data: JSON.stringify(signInData),
		contentType: "application/json;charset=UTF-8",
		dataType: "text",
		success: function(data){
			signInData = JSON.parse(data);
			//이메일이 존재 하지 않음
			if(signInData.signInFlag == 0){
				let textMsg = '! 존재하지 않는 아이디 입니다.';
				messageService(textMsg, 0);
			}
			//비밀번호 틀림
			else if(signInData.signInFlag == 1){
				let textMsg = '! 비밀번호가 일치하지 않습니다.';
				messageService(textMsg, 1);
			}
			//로그인 성공
			else if(signInData.signInFlag == 2){
				alert('로그인 성공!');
				location.replace('/chart/boxoffice/1');
			}
		},
		error: function(){
			alert('로그인 실패 다시 확인하세요');
		}
	})
}

function signInService(){
	//ajax호출
	
	if(emptyCheck() == true){
		signInData.username = item_ip[0].value;
		signInData.password = item_ip[1].value;
		//signInSubmit();
	}
}



btn_login.onclick = () => {
	signInService();
}

item_ip[0].onkeypress = () => {
	if(window.event.keyCode == 13){
		window.event.preventDefault();
		item_ip[1].focus();
	}
}

item_ip[1].onkeypress = () => {
	if(window.event.keyCode == 13){
		window.event.preventDefault();
		const form = document.querySelector("#signinForm");
		
		signInService();
		form.submit();
		
	}
}