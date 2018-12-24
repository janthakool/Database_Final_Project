using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class hr : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["SES_AccountID"] == null)
        {
            Response.Redirect("login.aspx");
        }
        else
        {
            //if (int.TryParse(SS.Text, out result))
            session_account_id.Value = Session["SES_AccountID"].ToString();

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
                        if(gvr.Cells[0].Text == "2" || gvr.Cells[0].Text == "1")
                        {

                        }
                        else
                        {
                            string scriptText = "alert('Plese Buy a packet'); window.location='" + Request.ApplicationPath + "packet.aspx'";
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", scriptText, true);
                            //Response.Redirect("packet.aspx");
                        }
                    }

                }
            }
        }
    }


    protected void insert_linq_Click(object sender, EventArgs e)
    {
        
        string Datenow = DateTime.Now.ToString("yyyy-MM-dd");
        DateTime dtnew = Convert.ToDateTime(Datenow);
        string hour = HHvalue.Value.ToString();
        string minute = MMvalue.Value.ToString();
        string second = SSvalue.Value.ToString();
        string timeFormat = hour + ":" + minute + ":" + second;



        
        using (connectStore_linqDataContext db0 = new connectStore_linqDataContext())
        {
            string sValue = arrayValue.Value;
           
            string[] words1 = sValue.Split(',');
            foreach (string word1 in words1)
            {
                if(word1 != "" && word1  != null)
                {
                    word1.Replace("[", "");
                    word1.Replace("]", "");
                    string[] words2 = word1.Replace("[", "").Replace("]", "").Split('$');                   
                    int accountID;
                    if (Int32.TryParse(words2[0], out accountID)) ;
                    int heartrateValue;
                    if (Int32.TryParse(words2[1], out heartrateValue)) ;
                    DateTime dateValue = Convert.ToDateTime(words2[2]);
                    TimeSpan timeValue = TimeSpan.Parse(words2[3]);
                    //db0.INSERT_heartrate(int.Parse(words2[0]), int.Parse(words2[1]), dateValue, TimeSpan.Parse(words2[3]));
                    db0.INSERT_heartrate(accountID, heartrateValue, dateValue, timeValue);
                    arrayValue.Value = "";
                }
               
            }
        }
    }

    void getStringValue()
    {
        string sValue = arrayValue.Value;
        string[] words1 = sValue.Split(',');
        foreach (string word1 in words1)
        {
            word1.Replace("[","");
            word1.Replace("]", "");
            string[] words2 = word1.Split('$');
            //insert words2[0] as account id
            //insert words2[1] as heart rate
            //insert words2[3] as date
            //insert words2[4] as time
        }
    }
}