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
background:url('/images/caart.jpg');
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
.alert
{
color:red;
}
</style>
</head>
<% String id=request.getSession().getId();%>
<body>
<center>
<div class="box">
<div class="content">

<h1 class="comment"><span>CTS Grocery Store</span></h1>

<h2 class="comment">LOGIN</h2>
<form action="loginCheck" method="post">
<div class="comment">User Id
<input type="text" name="userid">
</div><br>
<div class="comment"> Password
<input type="password" name="password">
</div><br>
<input type='hidden' name='session_id' value='<%=id%>'/>
<input type="submit" value=" Sign-In">
<br>
<div class="alert">${error}</div>
<div class="alert">${register}</div>
<div class="alert">${userid}</div>
<div class="comment">
<a href="/forgot">Forgot Password?</a></div>
<br>
<div class="comment">
<a href="/register">New Register</a>
</div>
<br>


</form>
</div>
</div>
</center>
</body>

</html>