<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
body
{
margin:0;
padding:0;
display:flex;
justify-content:center;
align-items:center;
min-height:100vh;
background:black;
}
.box
{
position:relative;
width:500px;
height:450px;
display:flex;
justify-content: center;
align-items: center;
background:black;
}
.box:before
{
content:'';
position:absolute;
top:-2px;
left:-2px;
right:-2px;
bottom:-2px;
background:white;
z-index:-1;
}
.box:after
{
content:'';
position:absolute;
top:-2px;
left:-2px;
right:-2px;
bottom:-2px;
background:white;
z-index:-2;
filter:blur(40px);
}
.box:before,
.box:after
{
background:linear-gradient(235deg,#89ff00,black,#00bcd4)
}
.comment
{
color:white;
}
table,th,td
{
border: 1px solid white;
}
table
{
border-collapse:collapse;
}
.alert
{
color:red;
}
</style>
</head>
<body>
<center>
<div class="box">
<div class="content">
<h1 class="comment"> History of Purchase</h1>
<table class="comment">
<tr> 
<th>User Id</th>
<th>Name</th>
   <th>Email</th>
   <th>Address</th>
   <th>Location</th> 
   <th>Items Purchased</th>
   <th>Total</th>
   <th>Status Of Delivey</th>
  
</tr>
  <c:forEach items="${purchaselist}" var="e">
<tr> 
 <td><c:out value="${e.userid}"></c:out></td>
  <td><c:out value="${e.firstname}"></c:out></td>
   <td><c:out value="${e.email}"></c:out></td> 
   <td><c:out value="${e.address}"></c:out></td>
   <td><c:out value="${e.city}"></c:out></td>
   <td><c:out value="${e.items}"></c:out></td>
   <td><c:out value="${e.total}"></c:out></td>
   <td><a href="/deletedashboard?userid=${e.userid}&items=${e.items}">Deliver</a></td>
</tr>
</c:forEach>
</table>
</div>
</div>
</center>
</body>
</html>