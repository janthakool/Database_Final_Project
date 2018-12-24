<%@ Page Title="" Language="C#" MasterPageFile="~/ClientMasterpage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
                 <br />
                 <br />
                 <h1> Register Form</h1>
                 <br />
                  <div>
                                    
                      <h4>firstname</h4>
                     <asp:TextBox ID="firstname_textbok" runat="server" MaxLength="20" CssClass="form-control form-control-lg" placeholder="John"></asp:TextBox>

                      <h4>lastname</h4>
                      <asp:TextBox ID="lastname_textbox" runat="server" MaxLength="20" CssClass="form-control form-control-lg" placeholder="Lovely"></asp:TextBox>
                       
                      <h4>address</h3>                   
                      <asp:TextBox ID="address_textbox" runat="server" MaxLength="20" CssClass="form-control form-control-lg" placeholder="London"></asp:TextBox>
                       
                      <h4>salary</h4>
                      <asp:TextBox ID="salary" type="number" min="0" MaxLength="20" runat="server" CssClass="form-control form-control-lg" placeholder="999999"></asp:TextBox>

                      <h4>age</h4>                  
                      <asp:TextBox ID="age" type="number" min="0" MaxLength="20" runat="server" CssClass="form-control form-control-lg" placeholder="99"></asp:TextBox>
                      </br>
                      <h4>username</h4>                
                      <asp:TextBox ID="username_textbox" runat="server" MaxLength="20" CssClass="form-control form-control-lg" placeholder="abc123456789"></asp:TextBox>
                                        
                      <h4>password</h4> 
                      <asp:TextBox ID="password_textbox" runat="server" MaxLength="20" CssClass="form-control form-control-lg" placeholder="abc123456789"></asp:TextBox>
                      
                    
                  </div>
                 <br />
                 <br />
                    <div>
                      <ul align="center" class="nav justify-content-center">
                        <asp:Button ID="insert_user_account_btn" runat="server" Text="Register Now" CssClass="btn btn-success btn-lg btn-block" OnClick="insert_user_account_btn_Click"/>
                            </ul>
                    </div>
                </div>
                
</asp:Content>

