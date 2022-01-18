const item_ip = document.querySelectorAll('.item_ip');
const btn_g = document.querySelector('.btn_g');
const errorMsg = document.querySelectorAll('.errorMsg');

var idCheck = /^[a-z]+[a-z0-9]{5,19}$/;
var passwordCheck = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,16}$/;
var emailCheck = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
var nameCheck = /[ㄱ-힣]{2,10}/;
var phoneCheck = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;

var msgText = null;




function messageService(i, msgText, msgFlag) {
	clearMsgNode(errorMsg[i]);
	let msgTextNode = document.createTextNode(msgText);

	if (msgFlag == 0) {
		errorMsg[i].appendChild(msgTextNode);
		errorMsg[i].style.display = 'block';
	}
}

function clearMsgNode(msg) {

	while (msg.hasChildNodes()) {
		msg.removeChild(msg.firstChild);
	}
	msg.style.display = 'none';
}





const signupBtn = document.querySelector('#signup-btn');
const signupForm = document.querySelector('#signup-form');
signupBtn.onclick = () => {
	let formData = new FormData(signupForm);
	let signupObj = {
		username: formData.get('username'),
		password: formData.get('password'),
		email: formData.get('email'),
		name: formData.get('name'),
		telephone: formData.get('telephone'),
		role: 'ROLE_USER'
	}
	$.ajax({
		type: "post",
		url: "/auth/signup",
		data: signupObj,
		dataType: "text",
		success: function(data) {
			let respObj = JSON.parse(data);
			if (respObj.code == 400) {
				for (let i = 0; i < item_ip.length; i++) {
					clearMsgNode(errorMsg[i]);
					if (item_ip[i].value.length == 0) {
						msgText = '필수항목입니다.';
						messageService(i, msgText, 0);
					} else if (item_ip[i].value.length != 0) {
						if (!idCheck.test(item_ip[0].value)) {
							msgText = '아이디는 영문자로 시작하는 6~20자 영문자 또는 숫자이어야 합니다.';
							messageService(0, msgText, 0);
						}
						if (!passwordCheck.test(item_ip[1].value)) {
							msgText = '비밀번호를 8 ~ 16자 영문, 숫자 조합으로 하세요';
							messageService(1, msgText, 0);
						}
						if (item_ip[1].value != item_ip[2].value) {
							msgText = '비밀번호가 일치하지 않습니다.';
							messageService(2, msgText, 0);
						}
						if (!emailCheck.test(item_ip[3].value)) {
							msgText = '이메일을 다시 입력해주세요';
							messageService(3, msgText, 0);
						}
						if (!nameCheck.test(item_ip[4].value)) {
							msgText = '이름을 다시 입력해주세요';
							messageService(4, msgText, 0);
						}
						if (!phoneCheck.test(item_ip[5].value)) {
							msgText = '전화번호를 다시 입력해주세요';
							messageService(5, msgText, 0);
						}
					}
				}
			} else if (respObj.code == 410 || respObj.code == 500) {
				for (let i = 0; i < item_ip.length; i++) {
					clearMsgNode(errorMsg[i]);
				}
				alert(respObj.msg);
				msgText = '이미 가입된 아이디 입니다.'
				messageService(0,msgText,0);
			} else {
				alert(respObj.msg);
				location.href = '/auth/signin';
			}
		},
		error: function() {
			alert("전송 오류");
		}
	}) // end ajax
} // end onclick







