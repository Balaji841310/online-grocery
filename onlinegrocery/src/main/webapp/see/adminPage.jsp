<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>

img
{
height:450px;
width:300px;
}

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
footer
{
position:fixed;
left:0;
bottom:0;
}
header
{
top:0;
position:fixed;
}
</style>

</head>
<header>
<h1 class="comment">${admin}</h1>
</header>
<body>

<center>

<div class="box">
<div class="content">
<h2 class="comment"> Dashboard</h2>
<a href="/dashboard"><img src="\images\dashboard.jpg" height="100" width="100"></a>
</div>
</div>
</center>&emsp; &emsp; &emsp; &emsp;
<center>
<div class="box">
<div class="content">
<h2 class="comment"> Add Item</h2>
<a href="/adminstoreadd"><img src="\images\cart1.jpg" height="100" width="100"></a>
</div>
</div></center>&emsp; &emsp; &emsp; &emsp;
<center>
<div class="box">
<div class="content">
<h2 class="comment"> Remove Item</h2>
<a href="/adminstoredel"><img src="\images\minus.jpg" height="100" width="100"></a>
</div>
</div></center>&emsp; &emsp; &emsp; &emsp;
<h2 class="alert">${delivered}</h2>
<h2 class="alert">${itemadded}</h2>
<h2 class="alert">${itemremoved}</h2>
</center>
</body>
<footer>
<a href="/logout"><input type="button" value="Logout"></a>
</footer>
</html>