<%@ Page Title="" Language="C#" MasterPageFile="~/ClientMasterpage.master" AutoEventWireup="true" CodeFile="hr.aspx.cs" Inherits="hr" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
            <div class="container">


            <div id="chart"></div>
            <div id="demo"></div>
            <div align="center" class="container">
            <h1><div align="center" id="value">
                <asp:Label ID="LabelSHOW" runat="server" Text="value" ClientIdMode="static"></asp:Label>
                </div> bpm
                </h1>   
                
                <asp:Label ID="HH" runat="server" Text="Label"></asp:Label>
                :<asp:Label ID="MM" runat="server" Text="Label"></asp:Label>
                :<asp:Label ID="SS" runat="server" Text="Label"></asp:Label>
                <br />
                <br />
                <asp:Label ID="arrayShow" runat="server" Text="NO data record"></asp:Label>
                <asp:HiddenField ID="heartrateValue" runat="server" />
                <asp:HiddenField ID="HHvalue" runat="server" />
                <asp:HiddenField ID="MMvalue" runat="server" />
                <asp:HiddenField ID="SSvalue" runat="server" />
                <asp:HiddenField ID="arrayValue" runat="server" />
                <asp:HiddenField ID="session_account_id" runat="server" />
                <br />
                <br />
                <asp:Button ID="insert_linq" runat="server" OnClick="insert_linq_Click" Text="Success" CssClass="btn btn-success"/>
                
                <br />

                </div>
                <br />
                <br />
            
                
                <script>
                    var check = 0;
                    function getData() {
                        var max = 100;
                        var min = 70;
                        return Math.floor(Math.random() * (max - min + 1) ) + min;
                    }
                    var second = 10;
                    function calc2() {
                        var value;

                        Plotly.plot('chart', [{
                            y: [value = getData()],
                            type: 'line'
                        }]);
                        //document.getElementById("value").innerHTML = value;
                        var label = document.getElementById("<%=LabelSHOW.ClientID %>");
                        label.innerHTML = value;
                        document.getElementById('<%= heartrateValue.ClientID %>').value = value;
                        setTimeout(calc2, 1000*second);
                    }
                    calc2();

                    var cnt = 0;
                    maxValuetoShow = 100;
                    setInterval(function () {

                        Plotly.extendTraces('chart', { y: [[getData()]] }, [0]);
                        cnt++;

                        if (cnt > maxValuetoShow) {
                            Plotly.relayout('chart', {

                                xaxis: {
                                    range: [cnt-maxValuetoShow,cnt]
                                }

                            });
                        }
                    
                    }, 200);

                function calc() {


                    var d = new Date();
                    var hh = d.getHours(); // => 9
                    var mm = d.getMinutes(); // =>  30
                    var ss = d.getSeconds(); // => 51
                    
                    var today = new Date();
                    var DD = today.getDate();
                    var MM = today.getMonth()+1; //January is 0!
                    var YYYY = today.getFullYear();

                    d.getHours(); // => 9
                    d.getMinutes(); // =>  30
                    d.getSeconds(); // => 51
                    if(DD<10) {
                        DD = '0'+dd
                    } 

                    if(MM<10) {
                        MM = '0'+mm
                    } 
                    
                    //today = mm + '/' + dd + '/' + yyyy;

                    if (hh < 10) {
                        hh = '0'+hh
                    } 

                    if(mm<10) {
                        mm = '0'+mm
                    } 
                    if(ss<10) {
                        ss = '0'+ss
                    } 
                    //timenow = hh + ':' + mm + ':' + ss;
                    //document.getElementById("demo").innerHTML = timenow;
                    
                        var hour = document.getElementById("<%=HH.ClientID %>");
                        var minute = document.getElementById("<%=MM.ClientID %>");
                        var second = document.getElementById("<%=SS.ClientID %>");
                        hour.innerHTML = hh;
                        minute.innerHTML = mm;
                        second.innerHTML = ss;
                        document.getElementById('<%= HHvalue.ClientID %>').value = hh;
                        document.getElementById('<%= MMvalue.ClientID %>').value = mm;
                        document.getElementById('<%= SSvalue.ClientID %>').value = ss;
                    var second = document.getElementById('<%= SSvalue.ClientID %>').value;
                    if (second == "30" || second == "10" || second == "50" ||
                        second == "20" || second == "40" || second == "00") {
                        var array = [document.getElementById('<%= arrayValue.ClientID %>').value];

                        var hr = document.getElementById('<%= heartrateValue.ClientID %>').value;
                        var hour = document.getElementById('<%= HHvalue.ClientID %>').value;
                        var minute = document.getElementById('<%= MMvalue.ClientID %>').value;

                        var account_ID = document.getElementById('<%= session_account_id.ClientID %>').value;
                        
                        var x = array.push("[" + account_ID + "$" + hr + "$" + YYYY +
                            "-" + MM + "-" + DD + "$" + hour + ":" + minute + ":" + second + "]");
                    
                        var arrayShow = document.getElementById("<%=arrayShow.ClientID %>");
                        document.getElementById('<%= arrayValue.ClientID %>').value = array;
                        arrayShow.innerHTML = array;
                    }
                    

                    setTimeout(calc, 1000);

                    
                }
                
                
                calc();

                function getValueToArray() {
                    var array = [document.getElementById('<%= arrayValue.ClientID %>').value];
                    var hr = document.getElementById('<%= heartrateValue.ClientID %>').value;
                    var hour = document.getElementById('<%= HHvalue.ClientID %>').value;
                    var minute = document.getElementById('<%= MMvalue.ClientID %>').value;
                    var second = document.getElementById('<%= SSvalue.ClientID %>').value;
                    var x = array.push("["+"accountid"+","+hr+","+hour+":"+minute+":"+second+":"+"]");
                    
                    setTimeout(getValueToArray, 1000);
                }
                

            </script>

    

            </div>

       
</asp:Content>


