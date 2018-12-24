using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class calories : System.Web.UI.Page
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
            showHR.DataSource = db0.showHRBetweenDate(Int32.Parse(Session["SES_AccountID"].ToString()),Start,End);
            showHR.DataBind();


            GridView getSQLCOUNT = new GridView();
            getSQLCOUNT.DataSource = db0.COUNTofHR(Int32.Parse(Session["SES_AccountID"].ToString()), Start, End);
            getSQLCOUNT.DataBind();
            foreach (GridViewRow gvr in getSQLCOUNT.Rows)
            {
                Amountlabel.Text = gvr.Cells[0].Text;

            }
            GridView getSQLSUM = new GridView();
            getSQLSUM.DataSource = db0.SUMofHR(Int32.Parse(Session["SES_AccountID"].ToString()), Start, End);
            getSQLSUM.DataBind();
            foreach (GridViewRow gvr in getSQLSUM.Rows)
            {
                SUMlabel.Text = gvr.Cells[0].Text;
                if(SUMlabel.Text == null|| SUMlabel.Text == "")
                {
                    SUMlabel.Text = "0";
                }

            }

            amount = Int32.Parse(Amountlabel.Text);
            double HR,W,A,T,cal;
            ShowCalories.Text = "0";
            avgLabel.Text = "0";
            math_label.Text = "";
            if (amount != 0)
            {
                
                sum = Int32.Parse(SUMlabel.Text);
                double timeperOneHR = 20.0; // assume 1 HR eq 20minute
                avg = sum / amount;
                avgLabel.Text = avg.ToString();
                HR = avg;
                W = double.Parse(WeightTextBox.Text);
                A = double.Parse(ageTextBox.Text);
                T = amount*(timeperOneHR / 60.0);
                if (SEX.Text.ToUpper() == "M")
                {
                    cal = ((-55.0969 + (0.6309 * HR) + (0.1988 * W) + (0.2017 * A)) / 4.184) * 60 * T;

                    ShowCalories.Text = cal.ToString();
                    math_label.Text = "Male: ((-55.0969 + (0.6309 x " + HR + ") +(0.1988 x " + W + ") +(0.2017 x " + A + "))/ 4.184) x 60 x " + T + "";
                }
                if (SEX.Text.ToUpper() == "FM")
                {
                    cal = ((-20.4022 + (0.4472 * HR) - (0.1263 * W) + (0.074 * A)) / 4.184) * 60 * T;
                    ShowCalories.Text = cal.ToString();
                    math_label.Text = "Female: ((-20.4022 + (0.4472 x "+HR+ ") - (0.1263 x " + W + ") + (0.074 x " + A + "))/4.184) x 60 x " + T + " ";
                }
            }

            
        }
    }
}