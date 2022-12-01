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
.comment
{
color:white;
}
.alert
{
color:red;
}

img
{
height:450px;
width:300px;
}
footer
{
position:fixed;
left:0;
bottom:0;
}
header
{
position:fixed;

top:0;
}
</style>
<header>
<center>
<h1 class="comment">${user}</h1>
<h2 class="comment">Pick a Category</h2>
</center>
</header>
</head>
<body>

<center>

<div class="box">
<div class="content">

<h2 class="comment">Fruit</h2>
<a href="/searchfruit">
<img src="\images\fruits.jpg" height="100" ><br>
</a>

</div>
</div>
</center>
<br>&emsp; &emsp; &emsp; &emsp;
<center>
<div class="box">
<div class="content">
<h2 class="comment">Vegetables</h2>
<a href="/searchvegetables">
<img src="\images\veg.jpg" height="100"><br>
</a>
</div>
</div>
</center>
<br>&emsp; &emsp; &emsp; &emsp;
<center>
<div class="box">
<div class="content">
<h2 class="comment"> Dairy</h2>
<a href="/searchdiary">

<img src="\images\diary.jpg" height="100" ><br>
</a>
</div>
</div>
</center>
&emsp; &emsp; &emsp; &emsp;
<br><br>
<center>
<div class="alert">${added}</div>
<div class="alert">${deleted}</div>
<div class="alert">${success}</div>
</div>
</div>
</center>
</body>
<footer>
<a href="/logout"><input type="button" value="Logout"></a>
 <a href="/viewcart"><input type="submit" value="View Cart"></a>
</footer>
</html>