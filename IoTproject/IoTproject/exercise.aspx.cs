using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class sleep : System.Web.UI.Page
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
                db0.checkIsPremium(Int32.Parse(Session["SES_AccountID"].ToString()));


                //db0.INSERT_heartrate(Int32.Parse(Session["SES_AccountID"].ToString()), int.Parse(LabelSHOW.Text), dtnew, TimeSpan.Parse(timeFormat));
                //show_username.Text = Order_gridview.PageCount.ToString();

            }

            using (connectStore_linqDataContext db0 = new connectStore_linqDataContext())
            {
                GridView getSQLSUM = new GridView();
                getSQLSUM.DataSource = db0.getUserlever_(Int32.Parse(Session["SES_AccountID"].ToString()));
                getSQLSUM.DataBind();
                foreach (GridViewRow gvr in getSQLSUM.Rows)
                {

                    if (gvr != null || gvr.ToString() != "")
                    {
                        if (gvr.Cells[0].Text == "2")
                        {

                        }
                        else
                        {
                            //Response.Redirect("packet.aspx");
                            string scriptText = "alert('Plese Buy a packet'); window.location='" + Request.ApplicationPath + "packet.aspx'";
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", scriptText, true);
                        }
                    }

                }
            }
        }
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        using (connectStore_linqDataContext db0 = new connectStore_linqDataContext())
        {

            double sum, amount, avg;
            DateTime Start = Convert.ToDateTime(StartDateTextBox.Text);
            DateTime End = Convert.ToDateTime(EndDateTextBox.Text);

            //edit store showvelocityBetweenDate
            showALLTime.DataSource = db0.showvelocityBetweenDate(Int32.Parse(Session["SES_AccountID"].ToString()), Start, End);
            showALLTime.DataBind();

            //edit store COUNTofHR to CountOfvelocityGPS
            GridView getSQLCOUNT = new GridView();
            getSQLCOUNT.DataSource = db0.CountOfvelocityGPS(Int32.Parse(Session["SES_AccountID"].ToString()), Start, End);
            getSQLCOUNT.DataBind();
            foreach (GridViewRow gvr in getSQLCOUNT.Rows)
            {
                Amountlabel.Text = gvr.Cells[0].Text;

            }
            GridView getSQLSUM = new GridView();

            //edit store SUMofHR to SUMofvelocityGPS
            getSQLSUM.DataSource = db0.SUMofvelocityGPS(Int32.Parse(Session["SES_AccountID"].ToString()), Start, End);
            getSQLSUM.DataBind();
            foreach (GridViewRow gvr in getSQLSUM.Rows)
            {
                SUMlabel.Text = gvr.Cells[0].Text;
                if (SUMlabel.Text == null || SUMlabel.Text == "")
                {
                    SUMlabel.Text = "0";
                }

            }

            amount = Int32.Parse(Amountlabel.Text);
            double S,V,T;
            ShowDistance.Text = "0";
            avgLabel.Text = "0";
            TimeLabel.Text = "0";
            if (amount != 0)
            {

                sum = Int32.Parse(SUMlabel.Text);
                double timeperOnevelocity = 20; // assume 1 velocity eq 0.5minute
                avg = sum / amount;



                avgLabel.Text = avg.ToString();
                V = avg;
                T = amount * (timeperOnevelocity);
                S = V * T;
                ShowDistance.Text = S.ToString();
                TimeLabel.Text = T.ToString();


            }


        }
    }
}