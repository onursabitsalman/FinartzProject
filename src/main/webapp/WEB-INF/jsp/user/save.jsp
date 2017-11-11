<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="container">
<!-- Modal -->
  <div class="modal fade" id="myModalsave" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">ADD USER</h4>
        </div>
        <div class="modal-body">
    
    
    <spring:url value="/user/add/" var="addURL" />
   <form name="userAdd" action="${addURL}" method="post" onsubmit="return ValidationEvent()">
    <label for="name">NAME:</label>
    <input type="text" name="name" id="nameSave"><br>
    <label for="name">SURNAME:</label>
    <input type="text" name="surname" id="surnameSave"><br>
    <label for="name">PHONE NUMBER:</label>
    <input type="text" name="telNo" id="telNoSave"><br><br/>
   
  
	<div class="g-recaptcha" data-callback="recaptchaCallback"  data-sitekey="6LfzJzgUAAAAAMcGWrcNnNCK_u66TIgzlqZjQI52"></div>
	<br/>
	 <button type="submit" id="addbutton" name="addbutton" class="btn btn-default hidden">Complete</button>
	 <label for="name" class="hidden" id="addAlert">Re-open and Fill All the Fields!</label>
	 
 	</form>
        
 
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
</div>