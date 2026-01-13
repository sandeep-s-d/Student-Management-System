<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="header.jsp" %>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Add Student</title>
  </head>
  <body>
  
  <div class= "container"  style="margin-top:100px ; width :500px"> 
  <h2 class ="text-center" > Registration Form </h2>
  
  <form method="POST" action="./AddStudent">
  <div class="mb-3">
  <label for="exampleInputEmail1" class="form-label">Roll Number</label>
  <input type="text" name="rno" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" 
         required pattern="\d+" title="Please enter numbers only.">
  
</div>

   <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Name</label>
    <input type="text" name="name" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required>
   
  </div>
   <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Percentage</label>
    <input type="text" name="per" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required>
   
  </div>
  
 <div class="d-grid gap-2">
    <button type="submit" class="btn btn-primary">Save</button>
 </div>
  
</form>
  
		
	
</div>    
    
    <p> ${msg} </p>
    
 
    
    
  </body>
</html>