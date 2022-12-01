<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<form onsubmit="/forgotpassword" action="forgotpassword" method="get">
<h1 class="comment"> Password Recovery</h1>
<div class="comment">User Id
<input type="text" name="userid" required>
</div><br>
<div class="comment">Question
<input type="text" name="question" required>
</div><br>
<div class="comment"> Answer
<input type="text" name="answer" required>
</div><br>
<div class="alert">${show}</div><br>
<div class="alert">${wrong}</div><br>
<input type="submit" value="Show">

</form>
</div>
</div>
</center>
</body>

</html>