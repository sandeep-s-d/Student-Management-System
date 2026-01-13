<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.*" %>
<%@ page import ="com.tca.entities.*" %>
<%@ include file ="header.jsp" %>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Display</title>
  </head>
  
  <script>
  
  function modify(trno){
	  var tr = document.getElementById(trno);
	  
	  var td = tr.getElementsByTagName("td");
	  
	  var tname =td[1].querySelector("input").value;
	  
	  var tper = td[2].querySelector("input").value;
	  fetch('http://localhost:8080/SMS/UpdateStudent',
 				{ 
 	 			   method: 'POST',
 			   	   body  : new URLSearchParams({'rno': trno,'tname':tname,'tper': tper})
 				}
 		 )
		.then(response=> response.text())
		.then(data => {
			
					if(data.trim() =="success")
					{
						alert("Record is Updated for Roll Number :" +trno);
						
						
						
					}
					if(data.trim() =="failed")
					{
						
						alert("Failed to Update Record for Roll Number :" +trno);
					}
						
				})
		.catch(error => console.error("My error while Updating :",error))
	  
	  
	
	  
	  
  }
  
 
  
  
  
  
  
  </script>
  
  
  
  
  
  
  <body>
  
  <%
  
  String trno = request.getParameter("rno");
  String sbtn = request.getParameter("sbtn");
  
  if(trno==null){
	  
	  trno="";
  }
  
  if(sbtn !=null && sbtn.equals("Refresh")){
	  trno = "";
  
  }
  
  
  
  %>
  
  
  
  <div class="container" style="margin-top:100px ; width :1000px">
  <h2 class="text-center mb-5 text-dark  "> Student Information </h2>
  
  <div class="container-fluid d-flex justify-content-end">
    <form class="d-flex" role="search" method="GET" action="./UpdateStudent" >
     
      <input class="form-control me-2" type="search" name="rno" value="<%= trno %>" placeholder="Enter roll num" aria-label="Search">
      <button class="btn btn-outline-success"     type="submit"      name="sbtn" value="Search">Search</button>
      <button class="btn btn-outline-success ms-2" type="submit"     name="sbtn"     value="Refresh">Refresh</button>
      
    </form>
  </div>
  
 
 <table class="table table-hover  table-bordered text-center mt-3" >
 <thead>
 <tr class="table-dark">
  
      <th scope="col">Roll Number</th>
      <th scope="col">Name</th>
      <th scope="col">Percentage</th>
      <th scope="col"> Action</th>
 </tr>
 
 
 </thead>
 <tbody> 
  <%
  
  List<Student> L = ( List<Student> )request.getAttribute("listofstudents");
  
  
  if(L==null || L.isEmpty()){
%>
		<tr>
			<td colspan ="4">
			No Data Found !!
			</td>
		</tr>



<% 	  
	  
  }
  else{
  
		  for(Student S : L){
			 int rno = S.getRno();
			 String name = S.getName();
			 double per = S.getPer();
			 
			 String cls ="";
			 if(per<50){
				 
				 cls="table-danger";
			 }
			 
		%>
				
				<tr id ="<%= rno  %>"class= <%= cls %>>
				   <td> <%= rno  %> </td>
				   <td> <input type="text" value="<%= name  %>" class="form-control me-2 border-danger" /> </td>
				   <td> <input type="text" value="<%= per  %>" class="form-control me-2 border-danger" /> </td>
				   <td> <input type= "button" value="Update" class= "btn btn-primary" onclick ="modify(<%= rno  %>)"></td>
				
				</tr>
		<% 	
			 
		  }
  }	  
  
  
  %>   
 
  </tbody>
  
</table> 
  
 
  
  
  
  </div>
  </body>
</html>