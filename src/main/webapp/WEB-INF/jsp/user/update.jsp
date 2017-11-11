<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="container">
<!-- Modal -->
  <div class="modal fade" id="myModalupdate" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">UPDATE USER</h4>
        </div>
        <div class="modal-body">
      <spring:url value="/user/update/" var="updateURL" />
   <form id="myForm" action="${updateURL}">
   <br/>
    <label for="name">NAME:</label>
    <input type="text" id="nameofuser" name="name"> <br/>
    <label for="name">SURNAME:</label>
    <input type="text" id="surnameofuser" name="surname"> <br/>
    <label for="name">PHONE NUMBER:</label>
    <input type="text" id="telNoofuser" name="telNo"> <br/>
    <br></br>
    <input type="hidden" id="idofuser" name="id">
    <button type="submit" id="updateButton">Update</button>
    
 	</form>
        
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
</div>