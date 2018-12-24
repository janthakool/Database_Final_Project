<%@ Page Title="" Language="C#" MasterPageFile="~/ClientMasterpage.master" AutoEventWireup="true" CodeFile="shoppingcart.aspx.cs" Inherits="shoppingcart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div class="container">
    <asp:GridView ID="showOrder" runat="server" CssClass="table table-dark" AutoGenerateColumns="False" DataKeyNames="saleid" DataSourceID="showOrder_db" EmptyDataText="NO DATA IN CART">
        <Columns>
            <asp:BoundField DataField="saleid" HeaderText="saleid" InsertVisible="False" ReadOnly="True" SortExpression="saleid" />
            <asp:BoundField DataField="itemid" HeaderText="itemid" SortExpression="itemid" />
            <asp:BoundField DataField="itemname" HeaderText="itemname" SortExpression="itemname" />
            <asp:BoundField DataField="amount" HeaderText="amount" SortExpression="amount" />
            <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
            <asp:BoundField DataField="userid" HeaderText="userid" SortExpression="userid" />
            <asp:BoundField DataField="paid" HeaderText="paid" SortExpression="paid" />
            <asp:CommandField ShowDeleteButton="True" />
        </Columns>
    </asp:GridView>
            <asp:SqlDataSource ID="showOrder_db" runat="server" ConnectionString="<%$ ConnectionStrings:Smartwatch_IoTFakeSensorConnectionString1 %>" DeleteCommand="DELETE FROM [Sale] WHERE [saleid] = @saleid" InsertCommand="INSERT INTO [Sale] ([itemid], [amount], [userid], [paid]) VALUES (@itemid, @amount, @userid, @paid)" SelectCommand="SELECT * FROM [Sale] WHERE (([userid] = @userid) AND ([paid] = @paid))" UpdateCommand="UPDATE [Sale] SET [itemid] = @itemid, [amount] = @amount, [userid] = @userid, [paid] = @paid WHERE [saleid] = @saleid">
                <DeleteParameters>
                    <asp:Parameter Name="saleid" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="itemid" Type="Int32" />
                    <asp:Parameter Name="amount" Type="Int32" />
                    <asp:Parameter Name="userid" Type="Int32" />
                    <asp:Parameter Name="paid" Type="Int32" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="userid" SessionField="SES_AccountID" Type="Int32" />
                    <asp:Parameter DefaultValue="0" Name="paid" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="itemid" Type="Int32" />
                    <asp:Parameter Name="amount" Type="Int32" />
                    <asp:Parameter Name="userid" Type="Int32" />
                    <asp:Parameter Name="paid" Type="Int32" />
                    <asp:Parameter Name="saleid" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <ul class="nav justify-content-end">
            <asp:Button ID="confirm_buy" runat="server" Text="Confirm Buy" CssClass="btn btn-success" OnClick="confirm_buy_Click" />
                </ul>
            <br />
        <br />
        </div>
</asp:Content>

