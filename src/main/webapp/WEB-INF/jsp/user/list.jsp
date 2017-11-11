<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

	<title>USER LIST</title>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  	<script src='https://www.google.com/recaptcha/api.js'></script>
  	
</head>

<body>

<script type="text/javascript">


$(document).ready(function () {

    $("#refresh-form").submit(function (event) {

    	console.log("Jquery");
        //stop submit the form, we will post it manually.
        event.preventDefault();

        refreshList();

    });
});

function refreshList() {


	$.ajax({
	    type:'GET',
	    url: "lista",
	    dataType: 'json',
	    success:function(data, status){
	    	
	        var table = document.getElementById("listtable");
	        while(table.rows[1]) table.deleteRow(1);
	        
	        var userDiv = "";
	        data.forEach(function(element) {
				
	        	userDiv += '<tr><td>'+element.name+'</td><td>'+element.surname+'</td><td>'+element.telNo+'</td><td><input type="button" class="btn btn-info" value="Update" onclick="updateUser(' + '\'' +element.name +'\'' + ',' +'\'' + element.surname +'\'' + ',' +'\'' + element.telNo +'\'' + ',' +'\'' + element.id +'\'' + ')"></td><td><spring:url value="delete/'+element.id+'" var="deleteURL" /><input type="button" class="btn btn-info" value="Delete" style="background-color:red" onclick="confirmDelete('+'\'' +'${deleteURL}' + '\'' +')"></td></tr>'

				'<tr>'+
						'<td>'+element.name+'</td>' +
						'<td>'+element.surname+'</td>' +
						'<td>'+element.telNo+'</td>' +
						'<td>' +
					'<input type="button" class="btn btn-info" value="Update" onclick="updateUser('+'\''+element.name+'\'' + ',' + '\'' +element.surname+ '\'' + ',' + '\'' +element.telNo+'\''+','+ '\''+element.id+ '\'' + ')">'+
					'</td>' +
					'<td>' +
						'<spring:url value="delete/'+element.id+'" var="deleteURL" />'+
						'<input type="button" class="btn btn-info" value="Delete" style="background-color:red" onclick="confirmDelete('+'\''+'${deleteURL}'+'\''+')">'+
						
					'</td>'+
				'</tr>'
	        });
	        
	        $("tbody").append(userDiv);  // Append the results
		},
	    error:function(xhr, status, errorThrown){
	    	console.log("Error");
	        console.log(xhr);
	        console.log(status);
	        console.log(errorThrown);
	    }
	})
}

function updateUser(name, surname, telNo, id){
	console.log("update");
	
	$('#myModalupdate').modal('show');
	
	document.getElementById("nameofuser").value=name.trim();
	document.getElementById("surnameofuser").value=surname.trim();
	document.getElementById("telNoofuser").value=telNo.trim();
	document.getElementById("idofuser").value=id.trim();
	
}
function addUser(){
	console.log("add user");
	$('#myModalsave').modal('show');
	
}
function confirmDelete(url) {

    var r = confirm("Do you want to delete?");
    if (r == true) {
    		window.location.href = url; 
    }
    
}

function isThereAnyBlank(){
	
	var btnSubmit = document.getElementById("addbutton");
	var addAlert = document.getElementById("addAlert");
	var checkName = document.getElementById("nameSave");
	var checkSurname = document.getElementById("surnameSave");
	var checkTelNo = document.getElementById("telNoSave");
	checkName=checkName.value.trim();
	checkSurname=checkSurname.value.trim();
	checkTelNo=checkTelNo.value.trim();
	
	if(checkName != "" && checkSurname != "" && checkTelNo != ""){
		btnSubmit.classList.remove("hidden");
	    btnSubmit.classList.add("show");
	}else{
		addAlert.classList.remove("hidden");
		addAlert.classList.add("show");
	}
}

//Below Function Executes On Form Submit

function recaptchaCallback() {
        var btnSubmit = document.getElementById("addbutton");

        if ( btnSubmit.classList.contains("hidden") ) {
        	
        	isThereAnyBlank();
            
        }
 }

function ValidationEvent() {

return True;   // Returns Value
}

</script>

<br/>
<table id="listtable" border="3">
	<thead>
		<tr> 
			<th colspan="1" class="text-center">&nbsp;&nbsp;&nbsp;NAME &nbsp;&nbsp;&nbsp;</th>
			<th colspan="1" class="text-center">&nbsp;&nbsp;&nbsp;SURNAME&nbsp;&nbsp;&nbsp;</th>
			<th colspan="1" class="text-center">&nbsp;&nbsp;&nbsp;PHONE NUMBER&nbsp;&nbsp;&nbsp;</th>
			<th colspan="2" class="text-center">&nbsp;&nbsp;&nbsp;ACTIONS&nbsp;&nbsp;&nbsp;</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${listUser}" var="user">
			<tr>
				<td>${user.name}</td>
				<td>${user.surname}</td>
				<td>${user.telNo}</td>
				<td>
				<input type="button" class="btn btn-info" value="Update" onclick="updateUser('${user.name}','${user.surname}','${user.telNo}','${user.id}')">
				</td>
				<td>
					<spring:url value="delete/${user.id}" var="deleteURL" />
					<input type="button" class="btn btn-info" value="Delete" style="background-color:red" onclick="confirmDelete('${deleteURL}')">
					
				</td>
			</tr>
		
		</c:forEach>
			
		
	</tbody>
</table>
                          
<br/>
<input type="button" class="btn btn-info btn-lg" style="background-color:black" value="Add New User" onclick="addUser()">

<br/><br/>

<form class="form-horizontal" id="refresh-form">
	<button type="submit" id="bth-refresh"class="btn btn-primary btn-lg">Refresh with AJAX</button>
</form>

 <%@ include file = "update.jsp" %>
 <%@ include file = "save.jsp" %>

</body>
</html>