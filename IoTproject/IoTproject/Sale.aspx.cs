using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Sale : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SHOWINCOME.Text = "";
        if (Session["SES_AccountID"] == null)
        {
            Response.Redirect("login.aspx");
        }
    }

    protected void Unpaid_Click(object sender, EventArgs e)
    {
        using (connectStore_linqDataContext db0 = new connectStore_linqDataContext())
        {
            int isPaid1 =1, isPaid2 = 1;
            showSale.DataSource = db0.showSaleSortByPaidAdmin(isPaid1, isPaid2);
            showSale.DataBind();
            
        }
        using (connectStore_linqDataContext db0 = new connectStore_linqDataContext())
        {
            GridView getSumPaid = new GridView();
            getSumPaid.DataSource = db0.showAllincome();
            getSumPaid.DataBind();
            foreach (GridViewRow gvr in getSumPaid.Rows)
            {

                if (gvr != null || gvr.ToString() != "")
                {
                    SHOWINCOME.Text = "INCOME ALL:" + gvr.Cells[0].Text + " Bath";
                }

            }
        }
    }

    protected void Paid_Click(object sender, EventArgs e)
    {
        using (connectStore_linqDataContext db0 = new connectStore_linqDataContext())
        {
            int isPaid1 = 0, isPaid2 = 0;
            showSale.DataSource = db0.showSaleSortByPaidAdmin(isPaid1, isPaid2);
            showSale.DataBind();

        }

        using (connectStore_linqDataContext db0 = new connectStore_linqDataContext())
        {
            GridView getSumPaid = new GridView();
            getSumPaid.DataSource = db0.showAllincomeI1();
            getSumPaid.DataBind();
            foreach (GridViewRow gvr in getSumPaid.Rows)
            {
                
                if (gvr != null || gvr.ToString() != "")
                {
                    SHOWINCOME.Text = "UNPAID : " + gvr.Cells[0].Text +" Bath";
                }

            }
        }
    }
    protected void Allpaid_Click(object sender, EventArgs e)
    {
        using (connectStore_linqDataContext db0 = new connectStore_linqDataContext())
        {
            int isPaid1 = 1, isPaid2 = 0;
            showSale.DataSource = db0.showSaleSortByPaidAdmin(isPaid1, isPaid2);
            showSale.DataBind();
            SHOWINCOME.Text = "";
        }
    }
}