<%@ Page Title="" Language="C#" MasterPageFile="~/ClientMasterpage.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!-- Login form start-->
    </br>
    </br>
    <div class="container">
        <h1 class="form-heading">login Form
            
        </h1>
        <div class="login-form">
        <div class="main-div">
            <div class="panel">
           
           <p>Please enter your Username and password</p>
           </div>

                <div class="form-group">
                    <asp:TextBox runat="server" ID="inputUsername"
                        CssClass="form-control" placeholder="Username" />

                </div>

                <div class="form-group">
                    <asp:TextBox runat="server" ID="inputPassword"
                        CssClass="form-control" placeholder="Password" />

                </div>
                    <button type="button" class="btn btn-secondary btn-lg btn-block" runat="server" id="Button1" onserverclick="login_btn_Click">Login</button>

            </div>
        </div></div>

</asp:Content>
