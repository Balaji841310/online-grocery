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
footer
{
position:fixed;
left:center;
bottom:0;
}
</style>
</head>
<body>
<div class="box">
<div class="content">
<form action="/pay" method="post">

<center>

            <h1 class="comment">Billing Address</h1>
            <div class="comment"> Full Name</div>
            <input type="text" id="fname" name="firstname" required> <br><br>
            <div class="comment"> Email</div>
            <input type="text" id="email" name="email"  required><br><br>
            <div class="comment">Address</div>
            <input type="text" id="adr" name="address"  required><br><br>
            <div class="comment">City</div>
            <input type="text" id="city" name="city"  required><br><br>
   </center>
        </div>
        </div>
&nbsp; &nbsp; &nbsp; &nbsp;
          <div class="box">
         <div class="content">
         <center>
            <h1 class="comment">Payment</h1>
           
            <div class="comment">Name on Card</div>
            <input type="text" id="cname" name="cardname"  required><br><br>
            <div class="comment">Credit card number</div>
            <input type="number" name="cc1" min="1000" max="9999" placeholder="xxxx" required><h9 class="comment">-</h9>
            <input type="number" name="cc1" min="1000" max="9999" placeholder="xxxx" required><h9 class="comment">-</h9>
            <input type="number" name="cc1" min="1000" max="9999" placeholder="xxxx" required><h9 class="comment">-</h9>
            <input type="number" name="cc1" min="1000" max="9999" placeholder="xxxx" required><br><br>
            <div class="comment">Card Expiry</div>
            <input type="month" id="expmonth" name="expmonth"  required><br><br>

            
               
              
              
                <div class="comment">CVV</div>
                <input type="number" id="cvv" min="100" max="999" name="cvv" required ><br>
         
        
        <div class="comment">
          <input type="checkbox" checked="checked" name="sameadr"> Shipping address same as billing
        </div><br>
        
         <input type="submit" value="PAY" class="btn">
        </center>
        </div>
        </div>
  </center>
 
</form>
</body>

</html>

