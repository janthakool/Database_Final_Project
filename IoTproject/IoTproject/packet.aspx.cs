using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class packet : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
            using (connectStore_linqDataContext db0 = new connectStore_linqDataContext())
            {
                GridView gridForCheck = new GridView();
                gridForCheck.DataSource = db0.getBathOfPacket();
                gridForCheck.DataBind();
                foreach (GridViewRow gvr in gridForCheck.Rows)
                {
                    if (gvr != null || gvr.ToString() != "")
                    {
                        Label1.Text = gvr.Cells[0].Text;
                    }

                }
            }
        
    }
    protected void buyFree_Click(object sender, EventArgs e)
    {
        if (Session["SES_AccountID"] == null)
        {
            Response.Redirect("login.aspx");
        }
        else
        {
            int itemid = 1;
            string itemname = "freePacket";
            int amount = 1;
            int price = 0;
            int user_id = Int32.Parse(Session["SES_AccountID"].ToString());
            int paid = 0;
            bool bCheckPacketinCart = checkPacketinCart(itemid);
            if (!bCheckPacketinCart)
            {
                using (connectStore_linqDataContext db0 = new connectStore_linqDataContext())
                {
                    db0.insertPacketToSaleorCart(itemid, itemname, amount, price, user_id, paid);

                }

            }
            Response.Redirect("shoppingcart.aspx");
        }

    }
    protected void buyPremium_Click(object sender, EventArgs e)
    {
        if (Session["SES_AccountID"] == null)
        {
            Response.Redirect("login.aspx");
        }
        else
        {
            int itemid = 2;
            string itemname = "premiumPacket";
            int amount = 1;

            using (connectStore_linqDataContext db0 = new connectStore_linqDataContext())
            {
                
                int user_id = Int32.Parse(Session["SES_AccountID"].ToString());
                int paid = 0;
                bool bCheckPacketinCart = checkPacketinCart(itemid);
                
                
                GridView gridForCheck = new GridView();
                gridForCheck.DataSource = db0.getBathOfPacket();
                gridForCheck.DataBind();
                foreach (GridViewRow gvr in gridForCheck.Rows)
                {
                    if (gvr != null || gvr.ToString() != "")
                    {
                        //Label1.Text = gvr.Cells[0].Text;
                        int price = Int32.Parse(gvr.Cells[0].Text);
                        if (!bCheckPacketinCart)
                        {
                            db0.insertPacketToSaleorCart(itemid, itemname, amount, price, user_id, paid);
                        }
                    }

                }
                
                Response.Redirect("shoppingcart.aspx");
            }

            
            
        }

    }

    bool checkPacketinCart(int itemid)
    {

        using (connectStore_linqDataContext db0 = new connectStore_linqDataContext())
        {
            GridView gridForCheck = new GridView();
            gridForCheck.DataSource = db0.checkPacketInCart(itemid, Int32.Parse(Session["SES_AccountID"].ToString()));
            gridForCheck.DataBind();
            foreach (GridViewRow gvr in gridForCheck.Rows)
            {
                if (gvr != null || gvr.ToString() != "")
                {
                    return true;
                }

            }
        }
        return false;
    }

}