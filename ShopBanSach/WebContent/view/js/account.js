const password = document.querySelector('#password');
const re_password = document.querySelector('#re-password');
const eyeOpen = document.querySelector('.eye-open');
const eyeClose = document.querySelector('.eye-close');
const re_eyeOpen = document.querySelector('.re-eye-open');
const re_eyeClose = document.querySelector('.re-eye-close');
eyeOpen.addEventListener("click",function(){
	eyeOpen.classList.add("hidden");
	eyeClose.classList.remove("hidden");
	password.type="password";
	});
eyeClose.addEventListener("click",function(){
	eyeClose.classList.add("hidden");
	eyeOpen.classList.remove("hidden");
	password.type="text";
	 });
re_eyeOpen.addEventListener("click",function(){
	re_eyeOpen.classList.add("hidden");
	re_eyeClose.classList.remove("hidden");
	re_password.type="password";
	});
re_eyeClose.addEventListener("click",function(){
	re_eyeClose.classList.add("hidden");
	re_eyeOpen.classList.remove("hidden");
	re_password.type="text";
	 })
function toggleDropdown() {
        var dropdown = document.getElementById("myDropdown");
        dropdown.classList.toggle("show");
    }
    window.onclick = function(event) {
        if (!event.target.matches('.dropdown-content')) {
            var dropdowns = document.querySelector(".dropdown-content");
            for (var i = 0; i < dropdowns.length; i++) {
                var openDropdown = dropdowns[i];
                if (openDropdown.classList.contains('show')) {
                    openDropdown.classList.remove('show');
                }
            }
        }
    }
	//validation
	const fullname = document.querySelector("#fullname");
	const email = document.querySelector("#email");
	const address = document.querySelector("#address");
	const phone = document.querySelector("#phone");
	const username = document.querySelector("#username");
	function showErrror(input, message){
		const error = input.parentElement.querySelector("small");
		
		error.innerText=message;
		input.style.border = "1px solid red";
		}
	function successForm(input){
		const error = input.parentElement.querySelector("small");
  		error.innerText='';
		input.style.border = "1px solid black";
	}
	function checkEmptyInput(listinput){
		let isEmptyError = false;
		for(let i = 0; i< listinput.length ;i++){
			let input = listinput[i];
			input.value = input.value.trim();
			if(input.value==''){
				showErrror(input,"Không được bỏ trống");
				isEmptyError = true;
			}
			else{
				successForm(input);
			}
		}
		return isEmptyError;
	}
	function checkFullName(){
		let pattern =  /^[a-zA-ZÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÒÓÔÕÖØÙÚÛÜÝàáâãäåæçèéêëìíîïòóôõöøùúûüý-]+(\s+[a-zA-ZÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÒÓÔÕÖØÙÚÛÜÝàáâãäåæçèéêëìíîïòóôõöøùúûüý-]+)*$/;
		let inputFullname = fullname.value.trim();
		let checksucess = pattern.test(inputFullname);
		if(pattern.test(inputFullname)){
			successForm(fullname);
		}else{
			showErrror(fullname,'Tên không hợp lệ');	
		}
		return checksucess;
	}
	function checkUsername(){
		let usernameValue= username.value.trim();
	 const pattern = /^[a-zA-Z][a-zA-Z0-9_.]{5,15}$/;
		if(pattern.test(usernameValue)){
			successForm(username);
			return true;
		}else{
			showErrror(username, "Username bắt đầu bằng ký tự chữ và từ 6 đến 16 ký tự");
		}
	}
	function checkPassword(){
		let inputPassword = password.value.trim();
		
		if(inputPassword.length>=6){
			successForm(password);
			return true;
		}
		else{
			showErrror(password,"Mật khẩu phải từ 6 ký tự trở lên");
			return false;
		}
	}
	function checkRe_password(){
		let inputRe_password = re_password.value.trim();	
		let inputPassword = password.value.trim();
		if(inputRe_password === inputPassword){
			successForm(re_password);
			return true;
		}else{
			showErrror(re_password,"Nhập lại mật khẩu không trùng với mật khẩu");
			return false;
		}
	}
	
	function checkAddress(){
		let inputAddress = address.value.trim();
		const pattern = /^[\w\s\d.,#-ắằẳẵặáàảãạấầẩẫậéèẻẽẹếềểễệíìỉĩịóòỏõọốồổỗộớờởỡợúùủũụứừửữựýỳỷỹỵ]+$/;
		if(pattern.test(inputAddress)){
			successForm(address);
			return true;
		}else{
			showErrror(address,"Địa chỉ không hợp lệ");
			return false;
		}

	}
	function checkPhone(){
		let inputPhone = phone.value.trim();
		const pattern = /^[0-9]{10}$/;
		if(pattern.test(inputPhone)){
			successForm(phone);
			return true;
		}
		else{
			showErrror(phone,"Số điện thoại không hợp lệ");
			return false;
		}
	}
	function checkEmail(){
		let inputEmail = email.value.trim();
		const pattern = /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
		if(pattern.test(inputEmail)){
			successForm(email);
			return true;
		}else{
			showErrror(email,"Email không hợp lệ");
			return false;
		}
	}
	function validationForm(){
		 let listinput = [username,password,re_password,fullname,email,address,phone];
		 if(checkEmptyInput(listinput)){
		 	return false;
		 }else{
		 	if(!checkFullName()) return false;
			else if(!checkEmail()) return false;
			else  if(!checkAddress()) return false;
			else  if(!checkPhone()) return false;
			else if(!checkUsername()) return false;
			else if(!checkPassword()) return false;
			else if(!checkRe_password()) return false;
		 }
		return true;
	}