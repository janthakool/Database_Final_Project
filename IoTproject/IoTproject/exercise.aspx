<%@ Page Title="" Language="C#" MasterPageFile="~/ClientMasterpage.master" AutoEventWireup="true" CodeFile="exercise.aspx.cs" Inherits="sleep" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <br />
        <br />
        <div class="alert alert-primary" role="alert">
          Assume the one velocity gps detect time values are 20seconds <br />
            the time will determine follow by <br />
            <br />
            s = vt
            <br />
            <br />
            where<br />
            Distance = (s)<br />
            velocity = (u or v) <br />
            time = (t)      
            
            <br />
        </div>
        <!-- calories value start-->
         <div align="center" id="value" class="p-3 mb-2 bg-warning text-white">
                <h1><asp:Label ID="ShowDistance" runat="server" Text="0" ClientIdMode="static"></asp:Label>
                Metre</h1> 
                <br />
                Sum of velocity:
                <asp:Label ID="SUMlabel" runat="server" Text="0"></asp:Label>
                <br />
                Amount of velocity: <asp:Label ID="Amountlabel" runat="server" Text="0"></asp:Label>
                <br />
                velocity Average:
                <asp:Label ID="avgLabel" runat="server" Text="Label"></asp:Label>
                <br />
                Time:
                <asp:Label ID="TimeLabel" runat="server" Text="0"></asp:Label>
                seconds
                <br />
        </div> 
                
        <br />
        <!-- input value start-->
        <div class="container">
          <div class="row">
            <div class="col-sm-2">
              Start Date
            </div>
            <div class="col-sm-10">
              <asp:TextBox ID="StartDateTextBox" Type="date" runat="server" CssClass="form-control" placeholder="YYYY/MM/DD"></asp:TextBox>
            </div>
          </div>
        </div>
       <br />
        <div class="container">
          <div class="row">
            <div class="col-sm-2">
              End Date
            </div>
            <div class="col-sm-10">
              <asp:TextBox ID="EndDateTextBox" Type="date" runat="server" CssClass="form-control" placeholder="YYYY/MM/DD"></asp:TextBox>
            </div>
          </div>
        </div>
        <br />
                
        <ul class="nav justify-content-center">
        <asp:Button ID="Button2" runat="server" Text="OK" CssClass="btn btn-success btn-lg" OnClick="Button3_Click"/>
            </ul>
        <br />
        <br />



        <div class="container">
        <asp:GridView ID="showALLTime" runat="server" CssClass="table table-dark">
            </asp:GridView>
            </div>
        <!-- detail input end-->
    </div>
</asp:Content>




