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
width:350px;
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
<form action="/admindel">
<h1 class="comment">Remove Item From Store</h1>
<div class="comment">Choose Category:
<select name="category"  required>
        <option>Choose</option>
        <option value="fruit">Fruit</option>
        <option value="vegetables">Vegetables</option>
        <option value="diary">Diary</option>
</select></div><br>
<div class="comment">Enter the item to be removed:
<input type="text" name="itemname" required></div><br>
<input type="submit" value="Remove">
<h2 class="alert">${donotexist}</h2>
</form>
</div>
</div>
</center>
</body>
</html>