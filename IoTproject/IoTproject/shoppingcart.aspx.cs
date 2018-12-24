using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class shoppingcart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["SES_AccountID"] == null)
        {
            Response.Redirect("login.aspx");
        }
        else
        {
            /*
            using (connectStore_linqDataContext db0 = new connectStore_linqDataContext())
            {
                showOrder.DataSource = db0.showOrder(Int32.Parse(Session["SES_AccountID"].ToString()));
                showOrder.DataBind();
            }*/
        }
        
    }

    protected void confirm_buy_Click(object sender, EventArgs e)
    {


        foreach (GridViewRow gvr in showOrder.Rows)
        {
            int saleid = Int32.Parse(gvr.Cells[0].Text);
            int itemid = Int32.Parse(gvr.Cells[1].Text);
            int accoundid = Int32.Parse((Session["SES_AccountID"].ToString()));
            if (gvr.ToString() != null || gvr.ToString() != "")
            {
                
                using (connectStore_linqDataContext db0 = new connectStore_linqDataContext())
                {
                    db0.upDatePacket(saleid, itemid, accoundid);
                    //db0.INSERT_heartrate(Int32.Parse(Session["SES_AccountID"].ToString()), int.Parse(LabelSHOW.Text), dtnew, TimeSpan.Parse(timeFormat));
                    //show_username.Text = Order_gridview.PageCount.ToString();

                }
}

        }
        Response.Redirect("shoppingcart.aspx");
    }

}