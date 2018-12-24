<%@ Page Title="" Language="C#" MasterPageFile="~/ClientMasterpage.master" AutoEventWireup="true" CodeFile="calories.aspx.cs" Inherits="calories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="container">
        <br />
        <br />
        <div class="alert alert-primary" role="alert">
          Assume the one heart rate time values are 20minutes <br />
            the calories will determine follow by the average HR <br />
            Male: ((-55.0969 + (0.6309 x HR) + (0.1988 x W) + (0.2017 x A))/4.184) x 60 x T<br />
            Female: ((-20.4022 + (0.4472 x HR) - (0.1263 x W) + (0.074 x A))/4.184) x 60 x T
            <br />
            <br />
            where
            HR = Heart rate (in beats/minute)<br />

            W = Weight (in kilograms)<br />

            A = Age (in years)<br />

            T = Exercise duration time (in hours)<br />

            ref. http://www.shapesense.com/fitness-exercise/calculators/heart-rate-based-calorie-burn-calculator.shtml
            <br />
        </div>
        <!-- calories value start-->
         <div align="center" id="value" class="p-3 mb-2 bg-danger text-white">
                <h1><asp:Label ID="ShowCalories" runat="server" Text="0" ClientIdMode="static"></asp:Label>
                Kcal</h1> 
                <br />
                Sum of HR:
                <asp:Label ID="SUMlabel" runat="server" Text="0"></asp:Label>
                <br />
                Amount of HR: <asp:Label ID="Amountlabel" runat="server" Text="0"></asp:Label>
                <br />
                HR Average:
                <asp:Label ID="avgLabel" runat="server" Text="Label"></asp:Label>
                <br />
                <asp:Label ID="math_label" runat="server" Text="0"></asp:Label>
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
                <div class="container">
          <div class="row">
            <div class="col-sm-2">
              Weight (in kilograms)
            </div>
            <div class="col-sm-10">
              <asp:TextBox ID="WeightTextBox" Type="number" min="0" runat="server" CssClass="form-control" placeholder="999"></asp:TextBox>
            </div>
          </div>
        </div>

        <br />
                <div class="container">
          <div class="row">
            <div class="col-sm-2">
              Age (in years)
            </div>
            <div class="col-sm-10">
              <asp:TextBox ID="ageTextBox" Type="number" min="0" runat="server" CssClass="form-control" placeholder="99"></asp:TextBox>
            </div>
          </div>
        </div>
        <br />
                        <div class="container">
          <div class="row">
            <div class="col-sm-2">
              Sex -> Male(M), Female(FM)
            </div>
            <div class="col-sm-10">
                <asp:DropDownList ID="SEX" runat="server" CssClass="form-control">
                    <asp:ListItem Value="M">Male</asp:ListItem>
                    <asp:ListItem Value="FM">Female</asp:ListItem>
                </asp:DropDownList>
              
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
        <asp:GridView ID="showHR" runat="server" CssClass="table table-dark">
            </asp:GridView>
            </div>
        <!-- detail input end-->
    </div>

    
    

</asp:Content>


