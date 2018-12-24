<%@ Page Language="C#" AutoEventWireup="true" CodeFile="main.aspx.cs" Inherits="main" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>main</title>
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"/>
    </head>
<body>
    <form id="form1" runat="server">
         <div class="container">
             <div align="center"> 
                 <br />
                 <br />
                 
                 <img src="image/main_pic.gif" />
                 <br />
                 <br />
                 <br />
                 
             </div>
             
                <div align="center">All-New Design Not just evolved, transformed.<br /> </div>
                <button type="button" class="btn btn-secondary btn-lg btn-block" runat="server" id="okGoogle" onserverclick="btn_gotowebsite_Click">Go to Website</button>
                    
                    

                <div align="center">This website for education in Database created by Nutdanai Janthakool and Thanapon soytong Computer engineering Naresuan University<br /> </div>
            </div>
        <br /><br />
    </form>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
</body>
</html>

