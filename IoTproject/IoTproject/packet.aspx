<%@ Page Title="" Language="C#" MasterPageFile="~/ClientMasterpage.master" AutoEventWireup="true" CodeFile="packet.aspx.cs" Inherits="packet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div>
            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"class="active"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="3"class="active"></li>
          </ol>
          <div class="carousel-inner">
            <div class="carousel-item active">
              <img class="d-block w-100 h-100" src="image/bg2.png" alt="First slide">
            </div>
            <div class="carousel-item">
              <img class="d-block w-100 h-100" src="image/bg1.png" alt="Second slide">
            </div>
            <div class="carousel-item">
              <img class="d-block w-100 h-100" src="image/bg3.png" alt="Third slide">
            </div>
            <div class="carousel-item">
              <img class="d-block w-100 h-100" src="image/bg4.png" alt="Third slide">
            </div>

          </div>
          <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
    </div>
      <br/>
        <br />

            <div class="container">

              <div class="row mb-2">
                <div class="col-md-6">
                  <div class="card flex-md-row mb-4 box-shadow h-md-250">
                    <div class="card-body d-flex flex-column align-items-start">
                        <span class="auto-style3">Standard </span>
                      <h3 class="auto-style4">
                          Get standard member</h3>
                      <div class="mb-1 text-muted">free
                          <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
&nbsp;/ 30 Days</div>
                      <p class="card-text mb-auto">You only use some function for your smartwatch</p>
                        <a class="text-primary" runat="server" role="button" onserverclick="buyFree_Click"  OnClientClick="return confirm('Are u sure?');">Buy<span></span></a></div>
                       
                      <!--<a href="#" class="text-primary" runat="server" role="button" aria-pressed="true" >Login</span></a>   -->
                      <img src="image/free.png" style="height: 202px" />
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="card flex-md-row mb-4 box-shadow h-md-250">
                    <div class="card-body d-flex flex-column align-items-start">
                        <span class="auto-style2">Premium</span>
                      <h3 class="auto-style4">
                          <a href="#"><span class="text-dark">G</span></a>et Premium member</h3>
                      <div class="mb-1 text-muted">
                          <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                          Bath / 30 Days</div>
                      <p class="card-text mb-auto">You can use full function for your smartwatch</p>
                      <a class="text-primary" runat="server" role="button" onserverclick="buyPremium_Click"  OnClientClick="return confirm('Are u sure?');">Buy<span></span></a></div>
                        <img src="image/pre.png" />
                  </div>
                      
                  </div>
                </div>
              </div>
            </div>
</asp:Content>

