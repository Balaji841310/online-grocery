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
<form action="/adminadd">
<h1 class="comment">Add Item To Store</h1>
<div class="comment">Choose Category:
<select name="category"  required>
        <option>Choose</option>
        <option value="fruit">Fruit</option>
        <option value="vegetables">Vegetables</option>
        <option value="diary">Diary</option>
</select></div><br>
<div class="comment">Enter the item to be added:
<input type="text" name="itemname" required></div><br>
<div class="comment">Enter the price of the item:
<input type="number" name="price" required></div><br>
<input type="submit" value="Add">
<h2 class="alert">${alreadyadded}</h2>
</form>
</div>
</div>
</center>
</body>
</html>