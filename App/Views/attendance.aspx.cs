using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Views_attendance : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    /*
     *This method is used to update the attendance record in the database
     */
    protected void attend_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;

        string sql = "INSERT INTO Attendance (userid,atdate,TimeIn,TimeOut) Values(@uid,@date,@tin,@tout)";

        SqlCommand cmd = new SqlCommand(sql, conn);

        SqlParameter[] paramas = new SqlParameter[4];

        paramas[0] = new SqlParameter("@uid", SqlDbType.Int);
        paramas[1] = new SqlParameter("@date", SqlDbType.VarChar, 100);

        paramas[2] = new SqlParameter("@tin", SqlDbType.VarChar, 50);
        paramas[3] = new SqlParameter("@tout", SqlDbType.VarChar, 50);

        paramas[0].Value = Int32.Parse(Session["userid"].ToString());
        paramas[1].Value = DateTime.UtcNow.ToLongDateString();
        paramas[2].Value = @in.Text;
        paramas[3].Value = @out.Text;

        for(int i=0;i<paramas.Length;i++)
        {
            cmd.Parameters.Add(paramas[i]);
        }

        conn.Open();

        cmd.CommandType = CommandType.Text;
        cmd.ExecuteNonQuery();
        conn.Close();
        Response.Redirect("~/Views/user.aspx");

    }
}