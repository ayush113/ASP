using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Views_Page : System.Web.UI.Page
{
    // This string stores the Database connection information
    private static string connstr = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
    private int quit = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    protected void Page_Init(object sender,EventArgs e)
    {
        // Redirect to home if no credentials are provided

        if (Session["username"] == null)
        {
            Response.Redirect("~/Views/Home.aspx?flag=1");
            return;
        }

        // Redirect to normal user page, if credentials don't allow for admin access

        if((Session["admin"] == null) || Session["admin"].ToString() == "False")
        {
            Response.Redirect("~/Views/user.aspx");
            return;
        }
    }

    /*
     *  Logout Button Event Handler
     *  Destroys Credewntial Data and Redirects to Login Page
     * 
     */
    protected void Button1_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("~/Views/Login.aspx");
    }

    protected void Page_Unload(object sender,EventArgs e)
    {
        if(quit == 1)
        {
            Session.Abandon();
        }
    }

    /*
     *  exists Method:
     *  Utility function to check if an user exists
     * 
     */

    protected int exists(string uid)
    {
        SqlDataSource sds = new SqlDataSource();
        sds.ConnectionString = connstr;
        sds.SelectParameters.Add("userid", TypeCode.Int32, uid);
        sds.SelectCommand = "SELECT * FROM [Users] WHERE [userid]=@userid";
        DataView dv = (DataView)sds.Select(DataSourceSelectArguments.Empty);
        if (dv != null && dv.Count != 0)
        {
            if (Session["userid"].ToString() == uid)
                return 1;
            else
                return 0;
        }
        else
            return -1;
    }

    /*
     *  delete_Click Method:
     *  Method for deleting the user details
     *  User Data is not actually deleted, but an edit is made in the database
     */
    protected void delete_Click(object sender, ImageClickEventArgs e)
    {
        string id = uid.Text;
        if(exists(uid.Text) ==  0)
        {
            string val = "1";
            SqlDataSource conn = new SqlDataSource();
            conn.ConnectionString = connstr;
            conn.SelectParameters.Add("id", TypeCode.Int32, id);
            conn.SelectParameters.Add("val", TypeCode.Int32, val);
            conn.SelectCommand = "UPDATE [Users] SET [IsDeleted]=@val WHERE [userid]=@id";
            conn.Select(DataSourceSelectArguments.Empty);
        }
        else if(exists(uid.Text) == -1)
        {
            lblmsg.ForeColor = System.Drawing.Color.Red;
            lblmsg.Text = "User ID doesn't exist";
        }
        else if(exists(uid.Text) == 1)
        {
            lblmsg.ForeColor = System.Drawing.Color.Red;
            lblmsg.Text = "Can not work on current user from this window";
        }
        
    }


    
    protected void view_Click(object sender, ImageClickEventArgs e)
    {

    }

    protected void edit_Click(object sender,ImageClickEventArgs e)
    {

    }

    protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        if(SqlDataSource1 == null)
        {
            entry.Visible = false;
        }
    }

    protected void plus_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/Views/Register.aspx?userid=1");
    }

    protected void done_Click(object sender, EventArgs e)
    {
        int eid;

        if (Int32.TryParse(id.Text, out eid))
        {
            utility.utils.ApproveLeave(eid);
        }
        else
        {
            Response.Write("<script>alert(\"Invalid ID Entered \");</script>");
            
        }

        
        
    }
}