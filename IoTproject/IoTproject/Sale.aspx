<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Sale.aspx.cs" Inherits="Sale" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="container">
        <div class="dropdown">
    <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Sort Sale
          </a>

          <div class="dropdown-menu" aria-labelledby="dropdownMenuLink" runat="server">
            <a href="#" class="dropdown-item" runat="server" role="button" aria-pressed="true" onserverclick="Unpaid_Click">Paid</a>
            <a href="#" class="dropdown-item" runat="server" role="button" aria-pressed="true" onserverclick="Paid_Click">Unpaid</a>
            
            <a href="#" class="dropdown-item" runat="server" role="button" aria-pressed="true" onserverclick="Allpaid_Click">All</a>
          </div>
            <br />
            <br />
            <h1>
            <asp:Label ID="SHOWINCOME" runat="server" Text="Label"></asp:Label></h1>
            </div></div>
    <div class="container">
    <asp:GridView ID="showSale" runat="server" CssClass="table table-dark">
    </asp:GridView>
    <asp:SqlDataSource ID="sate_manage" runat="server"></asp:SqlDataSource></div>
</asp:Content>

