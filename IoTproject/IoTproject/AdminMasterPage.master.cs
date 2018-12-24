using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminMasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["SES_AccountID"] != null)
        {
            //NameAccount.Text = Session["SES_AccountID"].ToString();

            using (connectStore_linqDataContext db0 = new connectStore_linqDataContext())
            {
                GridView getSQLSUM = new GridView();
                getSQLSUM.DataSource = db0.getName(Int32.Parse(Session["SES_AccountID"].ToString()));
                getSQLSUM.DataBind();
                foreach (GridViewRow gvr in getSQLSUM.Rows)
                {
                    
                    if (gvr != null || gvr.ToString() != null)
                    {
                        NameAccount.Text = gvr.Cells[0].Text;
                    }
                    

                }
            }

            LoginDD.InnerText = "LogOut";
            LoginDD2.InnerText = "";

        }
        else
        {
            LoginDD.InnerText = "";
            NameAccount.Text = "";
        }
    }
    protected void login_logout_btn(object sender, EventArgs e)
    {
        if (Session["SES_AccountID"] != null)
        {
            Session.RemoveAll();
            Response.Redirect("login.aspx");
        }
    }

    protected void loginbtn_Click(object sender, EventArgs e)
    {
        string U = inputUsername.Text;
        string P = inputPassword.Text;

        if (!string.IsNullOrWhiteSpace(U) && !string.IsNullOrWhiteSpace(P))
        {
            string sConnect = WebConfigurationManager.ConnectionStrings
            ["Smartwatch_IoTFakeSensorConnectionString"].ConnectionString;
            using (SqlConnection objConnect = new SqlConnection(sConnect))
            {
                objConnect.Open();
                string SQL = "SELECT accountid FROM Account WHERE(username = '" + U + "') AND(password = '" + P + "')";

                using (SqlCommand CmObj = new SqlCommand())
                {
                    CmObj.CommandText = SQL;
                    CmObj.Connection = objConnect;
                    using (SqlDataReader DrObj = CmObj.ExecuteReader())
                    {
                        DrObj.Read();
                        if (DrObj.HasRows)
                        {
                            int checkDept;
                            Session["SES_AccountID"] = DrObj["AccountID"].ToString();
                            using (connectStore_linqDataContext db0 = new connectStore_linqDataContext())
                            {
                                GridView getSQLSUM = new GridView();

                                getSQLSUM.DataSource = db0.isAdmin(Int32.Parse(Session["SES_AccountID"].ToString()));
                                getSQLSUM.DataBind();
                                foreach (GridViewRow gvr in getSQLSUM.Rows)
                                {

                                    if (gvr != null || gvr.ToString() != "")
                                    {
                                        checkDept = Int32.Parse(gvr.Cells[0].Text);
                                        if (checkDept == 1)
                                        {
                                            Response.Redirect("Adminmanagement.aspx");
                                        }
                                        else
                                        {
                                            Response.Redirect("packet.aspx");
                                        }
                                    }

                                }
                                //db0.INSERT_heartrate(Int32.Parse(Session["SES_AccountID"].ToString()), int.Parse(LabelSHOW.Text), dtnew, TimeSpan.Parse(timeFormat));
                                //show_username.Text = Order_gridview.PageCount.ToString();

                            }


                            //Session["SES_employee_ID"] = DrObj["employee_ID"].ToString();
                            //Session["SES_dept_id"] = DrObj["dept_id"].ToString();

                        }
                        else
                        {
                            //fix error username and password not in database
                            DrObj.Close();
                            objConnect.Close();
                            return;
                        }
                        DrObj.Close();
                    }
                }
                objConnect.Close();
            }

        }
    }
    protected void showInfo_Click(object sender, EventArgs e)
    {
        Response.Redirect("userInfo.aspx");

    }
}
