using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!Page.IsPostBack)
        {
            SqlDataSource sds = new SqlDataSource();
            sds.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
            string uname = Session["username"].ToString();
            sds.SelectParameters.Add("username", TypeCode.String, uname);
            sds.SelectCommand = "SELECT [Image] FROM [Users] WHERE [username]=@username";
            DataView dv = (DataView)sds.Select(DataSourceSelectArguments.Empty);

            if(dv!=null && dv.Count!=0)
            {
                profileimage.ImageUrl = dv[0].Row["Image"].ToString();
            }
        }
    }
    protected void Page_Init(object sender,EventArgs e)
    {

        ClearTextBoxes(Page);
        if (Session["username"] == null)
        {
            Response.Redirect("~/Views/Login.aspx");
        }
    }

    protected void settings_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/Views/Settings.aspx");
    }

    protected void logout_Click(object sender, ImageClickEventArgs e)
    {
        //Function to update the user logout time
        int uid = Int32.Parse(Session["userid"].ToString());
        addlog(uid);
        Session.Abandon();
        Response.Redirect("~/Views/Login.aspx?out=1");
    }

    private void addlog(int userid)
    {
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;

        string sql = "UPDATE LogTable SET LogoutTime=@log WHERE userid=@id";

        SqlCommand cmd = new SqlCommand(sql, conn);
        SqlParameter[] paramas = new SqlParameter[2];
        paramas[0] = new SqlParameter("@log", SqlDbType.VarChar, 100);
        paramas[1] = new SqlParameter("@id", SqlDbType.Int);

        paramas[0].Value = DateTime.UtcNow.ToString(); 
        paramas[1].Value = userid;

        cmd.Parameters.Add(paramas[0]);
        cmd.Parameters.Add(paramas[1]);
        conn.Open();
        cmd.CommandType = CommandType.Text;
        cmd.ExecuteNonQuery();
        conn.Close();

    }

    protected void ClearTextBoxes(Control p1)
    {
        foreach (Control ctrl in p1.Controls)
        {
            if (ctrl is TextBox)
            {
                TextBox t = ctrl as TextBox;

                if (t != null)
                {
                    t.Text = String.Empty;
                }
            }
            else
            {
                if (ctrl.Controls.Count > 0)
                {
                    ClearTextBoxes(ctrl);
                }
            }
        }
    }
}
