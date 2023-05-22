function showQuestion(count, page){
	const xhttp = new XMLHttpRequest();
	xhttp.onload = function(){
		document.getElementById("quizDiv").innerHTML = this.responseText;
	}
	let dispPage;
	if(page == 1){
		dispPage = "displayQuestion.jsp";
	}
	else if(page == 2){
		dispPage = "displaySubjectQuestion.jsp";
	}
	else{
		console.log("Incorrect page value");
	}
	xhttp.open("POST", dispPage);
	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	console.log("count: "+count);
	xhttp.send("QID="+count);
}

function setSession(userCategory){
	const yhttp = new XMLHttpRequest();
	yhttp.onload = showQuestion(1, 1);
	yhttp.open("POST", "sessionServlet");
	yhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	console.log("userCat: "+ userCategory);
	yhttp.send("userCategory="+userCategory);	
}

function setResponse(page) {
  	let selectedValue = document.querySelector('input[name="id"]:checked').value;
  	console.log("selectedValue = "+selectedValue);
 	const xhttp = new XMLHttpRequest();
  	xhttp.onload = function(){
		if(this.status == 200 && this.readyState == 4){
			showQuestion(1, page);
		}
		else{
			setResponse(page);
		}
	}
	xhttp.open("POST", "responseHandler");
	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhttp.send("option="+selectedValue);
}

function redirectToRegistration(){
	console.log("Entered redirectToRegistration");
	const xhttp = new XMLHttpRequest();
	xhttp.onload = function(){
		document.getElementById("quizDiv").innerHTML = this.responseText;
	}
	xhttp.open("POST", "registration.jsp");
	xhttp.send();
}

function getCollegeList(){
	let major = document.querySelector('input[name=major]:checked').value;
	let minor = document.querySelector('input[name=minor]:checked').value;
	const xhttp = new XMLHttpRequest();
	xhttp.onload = function(){
		if(this.status == 200 && this.readyState == 4){
			document.getElementById("collegeList").innerHTML = this.responseText;
		}
		else{
			getCollegeList();
		}
	}
	xhttp.open("POST", "colleges.jsp");
	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhttp.send("major="+major+"&minor="+minor);
}

function submitChoices(){
	let major = document.querySelector('input[name=major]:checked').value;
	let minor = document.querySelector('input[name=minor]:checked').value;
	const xhttp = new XMLHttpRequest();
	xhttp.onload = function(){
		getCollegeList();
	}
	xhttp.open("POST", "results");
	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhttp.send("major="+major+"&minor="+minor);
}

function loadSubjectList(){
	const yhttp = new XMLHttpRequest();
	yhttp.onload = function (){
		document.getElementById("subjectsList").innerHTML = this.responseText;
	}
	yhttp.open("POST", "selectionList.jsp");
	yhttp.send();
}

function getContacts(){
	let college = document.querySelector('input[name=college]:checked').value;
	const xhttp = new XMLHttpRequest();
	xhttp.onload = function(){
		if(this.status == 200 && this.readyState == 4){
			document.getElementById("contactList").innerHTML = this.responseText;
		}
		else{
			getContacts();
		}
	}
	xhttp.open("POST", "contactList.jsp");
	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhttp.send("college="+college);
}