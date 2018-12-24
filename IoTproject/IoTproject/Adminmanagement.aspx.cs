using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Adminmanagement : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["SES_AccountID"] == null)
        {
            Response.Redirect("login.aspx");
        }
    }

    protected void inert_dept_Click(object sender, EventArgs e)
    {
        using (connectStore_linqDataContext db0 = new connectStore_linqDataContext())
        {
            db0.INSERT_department(insert_dept_textbox.Text);
            Response.Redirect("Adminmanagement.aspx");
        }
    }

    protected void insert_user_account_btn_Click(object sender, EventArgs e)
    {
        using (connectStore_linqDataContext db0 = new connectStore_linqDataContext())
        {


            try
            {
                int account_level = 0;
                int accountpacket = 0;
                int dept_id = Int32.Parse(dept_textbox.Text);
                DateTime Start = Convert.ToDateTime("1999-01-01");
                DateTime End = Convert.ToDateTime("1999-02-02");
                int sqlIdentityDebug = 0;
                db0.Register(sqlIdentityDebug, username_textbox.Text, password_textbox.Text, 
                    account_level, accountpacket, Start, End, sqlIdentityDebug, 
                    firstname_textbok.Text, lastname_textbox.Text, dept_id, address_textbox.Text, 
                    Int32.Parse(salary.Text), Int32.Parse(age.Text));
                Response.Redirect("Adminmanagement.aspx");
            }
            catch (Exception s)
            {
                
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert(s.ToString());", true);
            }
            



            //db0.INSERT_heartrate(Int32.Parse(Session["SES_AccountID"].ToString()), int.Parse(LabelSHOW.Text), dtnew, TimeSpan.Parse(timeFormat));
            //show_username.Text = Order_gridview.PageCount.ToString();

        }
    }
}