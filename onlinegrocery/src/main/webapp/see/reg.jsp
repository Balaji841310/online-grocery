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
<h1 class="comment">Register</h1>
<form action="registerpage" method="post">
<div class="comment">UserName
<input type="text" name="uname" required></div><br>
<div class="comment">E-mail
<input type="email" name="mail" required></div><br>
<div class="comment">Phone Number
<input type="tel" name="phno" pattern="[1-9]{1}[0-9]{9}" required></div><br>
<div class="comment">Gender
<select name="gender" id="gender" required>
        <option>Select</option>
        <option value="M">Male</option>
        <option value="F">Female</option>
</select></div><br>
<div class="comment">Whats your Favurite Sport? (Sec Que)
<input type="text" name="answer" required></div><br>
<div class="comment">Set Password
<input type="password" name="password" required></div><br>


<input type="submit" value="Register">

</form>
</div>
</div>
</center>
</body>
</html>