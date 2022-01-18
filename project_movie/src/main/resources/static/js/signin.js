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
	const emailErrorMsg = document.querySelector('.emailErrorMsg');
	const passwordErrorMsg = document.querySelector('.passwordErrorMsg');
	
	clearMsgNode(emailErrorMsg);
	clearMsgNode(passwordErrorMsg);
	
	let msgTextNode = document.createTextNode(msgText);
	
	if(msgFlag == 0){ // 0이면 이메일 오류
		emailErrorMsg.appendChild(msgTextNode);
		emailErrorMsg.style.display = 'block';
	}else { // 1이면 password 오류
		passwordErrorMsg.appendChild(msgTextNode);
		passwordErrorMsg.style.display = 'block';
	}
}

function emptyCheck(){
	if(item_ip[0].value.length == 0){ // id값이 비었다면?
		let msgText = '이메일을 입력해 주세요.';
		messageService(msgText, 0);
		return false;
	} else if(item_ip[1].value.length == 0){ // 아이디는 안 비었고 비밀번호가 비었다면?
		let msgText = '비밀번호를 입력해 주세요.';
		messageService(msgText, 1);
		return false;
	} else{ // 둘다 비어있지 않다면?
		return true;
	}
}

function signInSubmit(){
	$.ajax({
		type: "post",
		url: "sign-in",
		data: JSON.stringify(signInData),
		contentType: "application/json;charset=UTF-8",
		dataType: "text",
		success: function(data){
			signInData = JSON.parse(data);
			if(signInData.signInFlag == 0){// flag=0일때 이메일이 존재하지 않음
				let textMsg = '존재하지 않는 이메일입니다.';
				messageService(textMsg, 0);
			} else if(signInData.signInFlag == 1){ // flag=1일때 비밀번호 틀림
				let textMsg = '비밀번호가 일치하지 않습니다.';
				messageService(textMsg, 1);
			} else if(signInData.signInFlag == 2){ // flag=2일때 로그인 성공 (session처리)
				alert('로그인 성공!');
				location.replace('index');
			}
		},
		error: function(){
			alert('비동기 처리 오류!');
		}
	})
}

btn_login.onclick = () => { // 로그인 버튼 클릭했을때
	signInService();
}

function signInService(){ 
	// ajax호출
	if(emptyCheck() == true){ // submit 날아감
		const item_cb = document.querySelector('.item_cb');
		signInData.user_email = item_ip[0].value;
		signInData.user_password = item_ip[1].value;
		signInData.signIncb = item_cb.value;
		signInSubmit();
	}
}

item_ip[0].onkeypress = () => { // email입력창에서 엔터 -> password 이동
	if (window.event.keyCode == 13) {  // keycode 13 = enter
		window.event.preventDefault(); // 기본으로 내장되어 있는 이벤트를 죽인다.
		item_ip[1].focus();
	}
}

item_ip[1].onkeypress = () => {
	if(window.event.keyCode == 13){
		window.event.preventDefault();
		signInService();
			}
}