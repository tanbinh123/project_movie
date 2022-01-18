const menu = document.querySelector(".menu");
const menu_nav = document.querySelector("#menu_nav");
const exit_btn = document.querySelector("#exit_btn");






window.onload = ()=> {
	menu.onclick =()=> {
		menu_nav.style.display = "block";
		
	}
	exit_btn.onclick = ()=>{
		menu_nav.style.display = "none";
	}
}