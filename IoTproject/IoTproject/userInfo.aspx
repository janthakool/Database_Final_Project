
<%@ Page Title="" Language="C#" MasterPageFile="~/ClientMasterpage.master" AutoEventWireup="true" CodeFile="userInfo.aspx.cs" Inherits="userInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <div class="dropdown">
            <br />
            <h1><asp:Label ID="showAlert" runat="server" Text="Your premium account is available for more than 7 days."></asp:Label></h1>
            
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="show_packet_db" CssClass="table table-dark">
                <Columns>
                    <asp:BoundField DataField="userlevel" HeaderText="userlevel" SortExpression="userlevel" />
                    <asp:BoundField DataField="startpacket" HeaderText="startpacket" SortExpression="startpacket" />
                    <asp:BoundField DataField="enddatepacket" HeaderText="enddatepacket" SortExpression="enddatepacket" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="show_packet_db" runat="server" ConnectionString="<%$ ConnectionStrings:Smartwatch_IoTFakeSensorConnectionString1 %>" SelectCommand="SELECT userlevel, startpacket, enddatepacket FROM Account WHERE (accountid = @accountid)">
                <SelectParameters>
                    <asp:SessionParameter Name="accountid" SessionField="SES_AccountID" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <br />
          <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Sort Heartrate
          </a>

          <div class="dropdown-menu" aria-labelledby="dropdownMenuLink" runat="server">
            <a href="#" class="dropdown-item" runat="server" role="button" aria-pressed="true" onserverclick="DAYsort_Click">This Day</a>
            <a href="#" class="dropdown-item" runat="server" role="button" aria-pressed="true" onserverclick="WEEKsort_Click">This Week</a>
            <a href="#" class="dropdown-item" runat="server" role="button" aria-pressed="true" onserverclick="MONTHsort_Click">This Month</a>
            <a href="#" class="dropdown-item" runat="server" role="button" aria-pressed="true" onserverclick="YEARsort_Click">This Year</a>
            <a href="#" class="dropdown-item" runat="server" role="button" aria-pressed="true" onserverclick="Allsort_Click">All</a>
          </div>
            <br />
            <br />
            <div class="container">
            <asp:GridView ID="showHeartrate" runat="server" CssClass="table table-dark">
            </asp:GridView>
                </div>
        </div>
    </div>
</asp:Content>




