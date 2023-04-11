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