<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Adminmanagement.aspx.cs" Inherits="Adminmanagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <br />
            <div class="container">
                <br />
        
                 <h1><div align="center" id="value">
                    Items
                </div> 
                </h1> 
            <br />
            <p> debug : The premium price follow by item table in column premium price </p>
               <p> **Free Packet is Always 0 Bath, It is not follow by item table in column free price </p>
                
                     
                <h2>
         <asp:GridView ID="GridView1" runat="server" CssClass="table table-dark" AutoGenerateColumns="False" DataKeyNames="itemid" DataSourceID="item_mn">
            <Columns>
                <asp:BoundField DataField="itemid" HeaderText="itemid" ReadOnly="True" SortExpression="itemid" />
                <asp:BoundField DataField="itemname" HeaderText="itemname" SortExpression="itemname" />
                <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                <asp:TemplateField ShowHeader="False">
                    <EditItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView></h2>
                <br />
                <h1><div align="center" id="value">
                    Insert Department
                </div> 
                </h1>

                <br />

                <div class="container">
                  <div class="row">
                    <div class="col-sm-2">
                      Department name:
                    </div>
                    <div class="col-sm-4">
                      <asp:TextBox ID="insert_dept_textbox" MaxLength="20"  runat="server" CssClass="form-control" placeholder="user"></asp:TextBox>
                    </div>
                   
                  </div>
                </div>
                <br />
                 <div>
                      <ul align="center" class="nav justify-content-center">
                        <asp:Button ID="Button3" runat="server" Text="Insert Department" Onclick="inert_dept_Click"  CssClass="btn btn-success btn-lg btn-block"/>
                            </ul>
                    </div>
                 <br />
                <h1><div align="center" id="value">
                    Department Manage
                </div>
                <br />
                <asp:SqlDataSource ID="item_mn" runat="server" ConnectionString="<%$ ConnectionStrings:Smartwatch_IoTFakeSensorConnectionString1 %>" SelectCommand="SELECT * FROM [Item]" UpdateCommand="UPDATE Item SET itemname = @itemname, price = @price WHERE (itemid = @itemid)">
                    <UpdateParameters>
                        <asp:Parameter Name="itemname" />
                        <asp:Parameter Name="price" />
                        <asp:Parameter Name="itemid" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <br />
                <asp:GridView ID="GridView2" runat="server" CssClass="table table-dark" AutoGenerateColumns="False" DataKeyNames="dept_id" DataSourceID="dept_manage">
                    <Columns>
                        <asp:BoundField DataField="dept_id" HeaderText="dept_id" ReadOnly="True" SortExpression="dept_id" InsertVisible="False" />
                        <asp:BoundField DataField="deptname" HeaderText="deptname" SortExpression="deptname" />
                        <asp:CommandField ShowEditButton="True" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="dept_manage" runat="server" ConnectionString="<%$ ConnectionStrings:Smartwatch_IoTFakeSensorConnectionString1 %>" DeleteCommand="DELETE FROM Department WHERE (dept_id = @dept_id)" SelectCommand="SELECT * FROM [Department]" UpdateCommand="UPDATE Department SET deptname = @deptname WHERE (dept_id = @dept_id)">
                    <DeleteParameters>
                        <asp:Parameter Name="dept_id" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="deptname" />
                        <asp:Parameter Name="dept_id" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                
                 <br />
                </h1>
                <h1><div align="center" id="value">
                    Insert User and Account
                </div> 
                </h1>
                <br />
                <br />

                <div class="container">
                  <div class="row">
                    
                    <div class="col-sm-2">
                      firstname:
                    </div>
                    <div class="col-sm-2">
                      <asp:TextBox ID="firstname_textbok" MaxLength="20" runat="server" CssClass="form-control" placeholder="John"></asp:TextBox>
                    </div>

                      <div class="col-sm-2">
                      lastname:
                    </div>
                    <div class="col-sm-2">
                      <asp:TextBox ID="lastname_textbox" MaxLength="20" runat="server" CssClass="form-control" placeholder="Lovely"></asp:TextBox>
                    </div>
                    
                      <div class="col-sm-2">
                      department:
                    </div>
                    <div class="col-sm-2">
                        <asp:DropDownList ID="dept_textbox" MaxLength="20" runat="server" DataSourceID="dept_input_dropdown" DataTextField="deptname" DataValueField="dept_id" CssClass="form-control" placeholder="">
                        </asp:DropDownList>
                        <br />
                      
                    </div>

                      <!-- here address-->
                      <div class="col-sm-2">
                      address:
                    </div>
                    <div class="col-sm-2">
                      <asp:TextBox ID="address_textbox" MaxLength="50" runat="server" CssClass="form-control" placeholder="London"></asp:TextBox>
                    </div>


                    <div class="col-sm-2">
                      salary:
                    </div>
                    <div class="col-sm-2">
                      <asp:TextBox ID="salary" type="number" runat="server" CssClass="form-control" placeholder="999999"></asp:TextBox>
                    </div>

                     <div class="col-sm-2">
                      age:
                    </div>
                    <div class="col-sm-2">
                      <asp:TextBox ID="age" type="number" runat="server" CssClass="form-control" placeholder="99"></asp:TextBox>
                    <br />
                    </div>

                      <div class="col-sm-2">
                      username:
                    </div>
                    <div class="col-sm-2">
                      <asp:TextBox ID="username_textbox" MaxLength="20" runat="server" CssClass="form-control" placeholder="abc123456789"></asp:TextBox>
                    </div>

                      <div class="col-sm-2">
                      password:
                    </div>
                    <div class="col-sm-2">
                      <asp:TextBox ID="password_textbox" MaxLength="20" type="number" runat="server" CssClass="form-control" placeholder="abc12345679"></asp:TextBox>
                    </div>

                    
                  </div>
                </div>
                 <br />
                 <br />
                <div>
                      <ul align="center" class="nav justify-content-center">
                        <asp:Button ID="insert_user_account_btn" runat="server" Text="Insert User" CssClass="btn btn-success btn-lg btn-block" OnClick="insert_user_account_btn_Click"/>
                            </ul>
                    </div>

                <br />
                        <asp:SqlDataSource ID="dept_input_dropdown" runat="server" ConnectionString="<%$ ConnectionStrings:Smartwatch_IoTFakeSensorConnectionString1 %>" SelectCommand="SELECT * FROM [Department]"></asp:SqlDataSource>

                <br />
                <br />
                <h1><div align="center" id="value">
                    User Manage
                </div> 
                </h1>
                <br />
                <asp:GridView ID="userGrid" runat="server" CssClass="table table-dark" AutoGenerateColumns="False" DataKeyNames="userid" DataSourceID="user_mange" >
                    <Columns>
                        <asp:BoundField DataField="userid" HeaderText="userid" ReadOnly="True" SortExpression="userid" InsertVisible="False" />
                        <asp:BoundField DataField="firstname" HeaderText="firstname" SortExpression="firstname" />
                        <asp:BoundField DataField="lastname" HeaderText="lastname" SortExpression="lastname" />
                        <asp:BoundField DataField="dept_id" HeaderText="dept_id" SortExpression="dept_id" />
                        <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
                        <asp:BoundField DataField="salary" HeaderText="salary" SortExpression="salary" />
                        <asp:BoundField DataField="age" HeaderText="age" SortExpression="age" />
                        <asp:CommandField ShowDeleteButton="True" />
                        <asp:CommandField ShowEditButton="True" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="user_mange" runat="server" ConnectionString="<%$ ConnectionStrings:Smartwatch_IoTFakeSensorConnectionString1 %>" DeleteCommand="DELETE FROM [User] WHERE (userid = @userid)" SelectCommand="SELECT userid, firstname, lastname, dept_id, address, salary, age FROM [User]" UpdateCommand="UPDATE [User] SET firstname = @firstname, lastname = @lastname, dept_id = @dept_id, address = @address, salary = @salary, age = @age WHERE (userid = @userid)">
                    <DeleteParameters>
                        <asp:Parameter Name="userid" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="firstname" />
                        <asp:Parameter Name="lastname" />
                        <asp:Parameter Name="dept_id" />
                        <asp:Parameter Name="address" />
                        <asp:Parameter Name="salary" />
                        <asp:Parameter Name="age" />
                        <asp:Parameter Name="userid" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <br />

                

                <h1><div align="center" id="value">
                    Account Manage
                </div> 
                </h1>

                <asp:GridView ID="AcountGrid" runat="server" CssClass="table table-dark" AutoGenerateColumns="False" DataKeyNames="accountid" DataSourceID="account_manage" >
                    <Columns>
                        <asp:BoundField DataField="accountid" HeaderText="accountid" ReadOnly="True" SortExpression="accountid" />
                        <asp:BoundField DataField="username" HeaderText="username" SortExpression="username" />
                        <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
                        <asp:BoundField DataField="userlevel" HeaderText="userlevel" SortExpression="userlevel" />
                        <asp:BoundField DataField="packetid" HeaderText="packetid" SortExpression="packetid" />
                        <asp:BoundField DataField="startpacket" HeaderText="startpacket" SortExpression="startpacket" />
                        <asp:BoundField DataField="enddatepacket" HeaderText="enddatepacket" SortExpression="enddatepacket" />
                        <asp:CommandField ShowEditButton="True" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="account_manage" runat="server" ConnectionString="<%$ ConnectionStrings:Smartwatch_IoTFakeSensorConnectionString1 %>" SelectCommand="SELECT * FROM [Account]" UpdateCommand="UPDATE Account SET username = @username, password = @password, userlevel = @userlevel, packetid = @packetid, startpacket = @startpacket, enddatepacket = @enddatepacket WHERE (accountid = @accountid)">
                    <UpdateParameters>
                        <asp:Parameter Name="username" />
                        <asp:Parameter Name="password" />
                        <asp:Parameter Name="userlevel" />
                        <asp:Parameter Name="packetid" />
                        <asp:Parameter Name="startpacket" />
                        <asp:Parameter Name="enddatepacket" />
                        <asp:Parameter Name="accountid" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <br />
                <br />
                <br />


                </div>
    </p>
</asp:Content>

