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
background-image:url('/images/cart1.jpg');
background-attachment:fixed;
background-size:cover;
margin:0;
padding:0;
display:flex;
justify-content:center;
align-items:center;
min-height:100vh;
}
.box
{
position:relative;
width:300px;
height:500px;
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
table,th,td
{
border: 1px solid white;
}
table
{
border-collapse:collapse;
}
.comment
{
color:white;
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
<h1  class="comment">Cart</h1>
   <form action="/buy" method="get" onsubmit="return CheckSum()">
<table class="comment">
<tr> 
    <th>UserId</th>
   <th>Item</th>
   <th>Price</th> 
   <th>Delete</th>
  
</tr>
<c:set var="s" value="0"></c:set>
  <c:forEach items="${cartlist}" var="d">
  <c:set var="s" value="${s+ d.price}"></c:set>
  
<tr> 
   <td><c:out value="${d.sno}"></c:out></td>
   <td><c:out value="${d.fruitname}"></c:out></td> 
   <td><c:out value="${d.price}"></c:out></td>
   <td><a href="/deleteitem?id=${d.fruitname}"><input style="background-color:yellow" type="button" value="Delete from Cart"></a></td>
</tr>
</c:forEach>

<tr>
<td colspan="2" align="right">Sum</td>
<td>${s}</td>

</tr>
  
</table>
<br><br><br>
<a href="/gocategory">Continue Shopping</a>
<br><br><br>
<input type="submit" value="Buy">

</form>
</div>
</div>
    </center>
    
    
    
  <script>
function CheckSum()
{
	if(${s}==0)
		{
		alert('cart is empty');
      return false;
		}else
			{
			return true;
			}
};

</script>

</body>
</html>