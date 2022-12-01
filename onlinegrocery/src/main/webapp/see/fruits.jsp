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
width:300px;
height:420px;
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
<h1  class="comment">Store</h1>
<form action="cart" method="get">
<table class="comment">
<tr> 
<th>Sno</th>
   <th>Item</th>
   <th>Price</th>
   <th>Add</th> 
  
</tr>
  <c:forEach items="${fruitList}" var="e">
<tr> 
  <td><c:out value="${e.sno}"></c:out></td>
   <td><c:out value="${e.fruitname}"></c:out></td> 
   <td><c:out value="${e.price}"></c:out></td>
   <td><a href="/additem?id=${e.sno}&name=${e.fruitname}&price=${e.price}"><input style="background-color:yellow" type="button" value="add to cart"></a></td>
</tr>
</c:forEach>

  
</table>
</form>
<br><br><br><br><br><br><br><br><br>
<center>
  <a href="/viewcart"><input type="submit" value="View Cart"></a>
 </center>
 </div>
 </div>
</center>
</body>
</html>