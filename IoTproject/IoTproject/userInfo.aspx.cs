using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class userInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["SES_AccountID"] == null)
        {
            Response.Redirect("login.aspx");
        }
        else
        {
            using (connectStore_linqDataContext db0 = new connectStore_linqDataContext())
            {
                GridView getAlert = new GridView();
                getAlert.DataSource = db0.alertLessThan7Days(Int32.Parse(Session["SES_AccountID"].ToString()));
                getAlert.DataBind();
                foreach (GridViewRow gvr in getAlert.Rows)
                {

                    if (gvr != null || gvr.ToString() != "")
                    {
                        showAlert.Text = "Your account will expire.";
                    }

                }
            }
        }
        
    }

    protected void Allsort_Click(object sender, EventArgs e)
    {

        using (connectStore_linqDataContext db0 = new connectStore_linqDataContext())
        {
            showHeartrate.DataSource = db0.showAllHeatrateByID(Int32.Parse(Session["SES_AccountID"].ToString()),99);
            showHeartrate.DataBind();
        }
    }
    protected void YEARsort_Click(object sender, EventArgs e)
    {

        using (connectStore_linqDataContext db0 = new connectStore_linqDataContext())
        {
            showHeartrate.DataSource = db0.showAllHeatrateByID(Int32.Parse(Session["SES_AccountID"].ToString()), 365);
            showHeartrate.DataBind();
        }
    }
    protected void MONTHsort_Click(object sender, EventArgs e)
    {

        using (connectStore_linqDataContext db0 = new connectStore_linqDataContext())
        {
            showHeartrate.DataSource = db0.showAllHeatrateByID(Int32.Parse(Session["SES_AccountID"].ToString()), 12);
            showHeartrate.DataBind();
        }
    }
    protected void WEEKsort_Click(object sender, EventArgs e)
    {

        using (connectStore_linqDataContext db0 = new connectStore_linqDataContext())
        {
            showHeartrate.DataSource = db0.showAllHeatrateByID(Int32.Parse(Session["SES_AccountID"].ToString()), 7);
            showHeartrate.DataBind();
        }
    }
    protected void DAYsort_Click(object sender, EventArgs e)
    {

        using (connectStore_linqDataContext db0 = new connectStore_linqDataContext())
        {
            showHeartrate.DataSource = db0.showAllHeatrateByID(Int32.Parse(Session["SES_AccountID"].ToString()), 1);
            showHeartrate.DataBind();
        }
    }
}