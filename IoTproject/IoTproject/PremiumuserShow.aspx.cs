using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PremiumuserShow : System.Web.UI.Page
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

                showPremium.DataSource = db0.showPremiumUserOrFreeuser(2);
                showPremium.DataBind();
                //db0.INSERT_heartrate(Int32.Parse(Session["SES_AccountID"].ToString()), int.Parse(LabelSHOW.Text), dtnew, TimeSpan.Parse(timeFormat));
                //show_username.Text = Order_gridview.PageCount.ToString();

            }
        }

    }
}