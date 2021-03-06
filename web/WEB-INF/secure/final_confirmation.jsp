<%--
  Created by IntelliJ IDEA.
  User: Tamir
  Date: 2/4/2018
  Time: 3:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Payment details page</title>
    <script src="resources/js/jquery.min.js" type="text/javascript"></script>
    <link href="resources/css/header.css" type="text/css" rel="stylesheet">
    <style>
        #purchase{
            width: 80%;
            margin: 100px auto 0px;
        }

        form > *{
            font-size: 11pt;
            display: block;
            width: 80%;
            height: 25px;
            margin-left: 50px;
            margin-top: 10px;
        }

        #toast {
            position: fixed;
            right: 20px;
            bottom: 20px;
            text-align: center;
            background-color: rgba(0, 0, 0, 0.75);
            color: azure;
            width: 400px;
            height: 50px;
            padding: 5px;
            font-weight: bold;
            display: none;
        }

        #body {
            width: 90%;
            margin: 75px auto;
        }

        a:link{
            text-decoration: none;
            color: white;
        }

        a:visited{
            text-decoration: none;
            color: white;
        }
    </style>
</head>
<body>
<div id="header">
    <p id="store_name"><a href="/home">Sport clothes store</a></p>
</div>
<div id="body">
    <div id="purchase">
        <h2> Purchase details</h2>
        <form method="post" action="http://localhost:8080/final_purchase">
            <input type="text" name="Billing address" placeholder="Billing address">
            <input type="text" name="Shipping address" placeholder="Shipping address">
            <input type="text" name="Card number" placeholder="Card number">
            <input type="text" name="Card name" placeholder="Card name">
            <input type="text" name="Card expiry date" placeholder="Card expiry date">
            <input type="submit" value="Purchase">
        </form>
    </div>
</div>
<div id="toast">
    <p id="toast_message">${errormsg}</p>
</div>
<script>
    var toastMessage = "${errormsg}";
    if(toastMessage){
        $("#toast").css("display", "block");
        window.setTimeout(function(){
            $("#toast").css("display", "none");
        }, 3000);
    }
</script>
</body>
</html>


