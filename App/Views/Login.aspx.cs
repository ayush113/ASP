using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Net.NetworkInformation;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Net;

public partial class Views_Login : System.Web.UI.Page
{
    private static string sender = "ayush.work113@gmail.com",user;

    protected void Page_Load(object sender, EventArgs e)
    {

        if (Request.QueryString["view"] == "2")
        {
            multiview.SetActiveView(view2);
        }
        else if(Request.QueryString["view"] == "3")
        {
            multiview.SetActiveView(view3);
        }
        else
        {
            multiview.SetActiveView(view1);
        }
    }
    protected void Page_Init(object sender,EventArgs e)
    {
        if(Request.QueryString["out"] == "1")
        {
            lblmsg.ForeColor = System.Drawing.Color.Red;
            lblmsg.Text = "You have been logged out";
        }
    }
    protected void login_Click(object sender, EventArgs e)
    {
        SqlDataSource sds = new SqlDataSource();
        sds.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
        string pass = crypto.encryption_decryption.Encrypt(password.Text);
        sds.SelectParameters.Add("username", TypeCode.String, uname.Text);
        sds.SelectParameters.Add("password", TypeCode.String, pass);
        sds.SelectCommand = "SELECT * FROM [users] WHERE [username] = @username AND [password] = @password";
        DataView dv = (DataView)sds.Select(DataSourceSelectArguments.Empty);

        if(dv != null && dv.Count!=0)
        {
            user = dv[0].Row["username"].ToString();
            int uid = Int32.Parse(dv[0].Row["userid"].ToString());
            if ((dv[0].Row["IsDeleted"].ToString() ==  "0") && (dv[0].Row["IsLocked"].ToString() == "False") &&(dv[0].Row["FirstTime"].ToString() == "False"))
            {
                Session["admin"] = dv[0].Row["admin"].ToString();
                if(dv[0].Row["admin"].ToString() == "True")
                {
                    lblmsg.Text = "Success";
                    this.Session["username"] = dv[0].Row["username"].ToString();
                    if (Session["username"] == null)
                    {
                        Console.WriteLine("??");
                    }
                    Session["userid"] = dv[0].Row["userid"].ToString();
                    CreateLogEntry(Session["userid"].ToString());
                    Response.Redirect("~/Views/Page.aspx");
                }
                else
                {
                    lblmsg.Text = "Success";
                    this.Session["username"] = dv[0].Row["username"].ToString();
                    if (Session["username"] == null)
                    {
                        Console.WriteLine("??");
                    }
                    Session["userid"] = dv[0].Row["userid"].ToString();
                    CreateLogEntry(Session["userid"].ToString());
                    Response.Redirect("~/Views/user.aspx");
                }
                
            }
            else if(dv[0].Row["FirstTime"].ToString() == "True")
            {
                utility.utils.CreateLeaveEntry(uid);
                multiview.SetActiveView(view0);
                quef.Text = dv[0].Row["SecurityQuestion"].ToString();
            }
            else if(dv[0].Row["IsLocked"].ToString() == "True")
            {
                lblmsg.ForeColor = System.Drawing.Color.Red;
                lblmsg.Text = "You Have Been Locked Out";
            }
            else 
            {
                lblmsg.ForeColor = System.Drawing.Color.Red;
                lblmsg.Text = "User No Longer Exists";
            }
            
        }
        else
        {
            UpdateCounter(uname.Text);
            lblmsg.ForeColor = System.Drawing.Color.Red;
            lblmsg.Text = "Invalid Username and Password Try again";
            
        }
    }

    private void CreateLogEntry(string v)
    {
        string SID = HttpContext.Current.Session.SessionID;
        string loginTime = DateTime.UtcNow.ToString();
        string MID = GetMACAddress();
        int uid = Int32.Parse(v);

        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
        string sql = "INSERT INTO LogTable (SessionID,LoginTime,userid,MachineID) VALUES (@SessionID,@LoginTime,@userid,@MachineID)";
        SqlCommand cmd = new SqlCommand(sql, conn);
        SqlParameter[] paramas = new SqlParameter[4];
        paramas[0] = new SqlParameter("@SessionID", SqlDbType.VarChar, 100);
        paramas[1] = new SqlParameter("@LoginTime", SqlDbType.VarChar, 100);
        paramas[2] = new SqlParameter("@userid", SqlDbType.VarChar, 100);
        paramas[3] = new SqlParameter("@MachineID", SqlDbType.VarChar, 100);
        paramas[0].Value = SID;
        paramas[1].Value = loginTime;
        paramas[2].Value = uid;
        paramas[3].Value = MID;
        for(int i=0;i<paramas.Length;i++)
        {
            cmd.Parameters.Add(paramas[i]);
        }
        conn.Open();
        cmd.CommandType = CommandType.Text;
        cmd.ExecuteNonQuery();
    }

    public string GetMACAddress()
    {
        NetworkInterface[] nics = NetworkInterface.GetAllNetworkInterfaces();
        String sMacAddress = string.Empty;
        foreach (NetworkInterface adapter in nics)
        {
            if (sMacAddress == String.Empty)// only return MAC Address from first card  
            {
                IPInterfaceProperties properties = adapter.GetIPProperties();
                sMacAddress = adapter.GetPhysicalAddress().ToString();
            }
        }
        return sMacAddress;
    }

    protected void UpdateCounter(string uname)
    {
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
        conn.Open();
        string sql = "SELECT Counter FROM Users WHERE username=@username";
        SqlParameter[] paramas = new SqlParameter[2];
        paramas[0] = new SqlParameter("@username", SqlDbType.VarChar, 50);
        paramas[1] = new  SqlParameter("@Counter", SqlDbType.Int);
        paramas[0].Value = uname;
        SqlCommand cmd = new SqlCommand(sql,conn);
        cmd.Parameters.Add(paramas[0]);
        cmd.CommandType = CommandType.Text;
        string result = cmd.ExecuteScalar().ToString();
        int counter = Int32.Parse(result);
        if(counter<3)
        {
            sql = "UPDATE Users SET Counter = @Counter WHERE username=@username";
            cmd = new SqlCommand(sql, conn);
            paramas[0] = new SqlParameter("@username", SqlDbType.VarChar, 50);
            paramas[1] = new SqlParameter("@Counter", SqlDbType.Int);
            paramas[0].Value = uname;
            paramas[1].Value = counter + 1;
            cmd.Parameters.Add(paramas[0]);
            cmd.Parameters.Add(paramas[1]);
            cmd.ExecuteNonQuery();
            
        }
        if(counter == 3)
        {
            sql = "UPDATE Users SET IsLocked = @IsLocked WHERE username=@username";
            cmd = new SqlCommand(sql, conn);
            paramas[0] = new SqlParameter("@IsLocked", SqlDbType.Bit);
            paramas[1] = new SqlParameter("@username", SqlDbType.VarChar, 50);
            paramas[0].Value = 1;
            paramas[1].Value = uname;
            cmd.Parameters.Add(paramas[0]);
            cmd.Parameters.Add(paramas[1]);
            cmd.CommandType = CommandType.Text;
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        
    }


    protected void submit_Click(object sender, EventArgs e)
    {
        string uname = name.Text;
        string email = mail.Text;

        SqlDataSource sds = new SqlDataSource();
        sds.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
        sds.SelectParameters.Add("username", TypeCode.String, uname);
        sds.SelectParameters.Add("email", TypeCode.String, email);

        sds.SelectCommand = "SELECT * FROM [Users] WHERE [username]=@username";

        DataView dv = (DataView)sds.Select(DataSourceSelectArguments.Empty);

        if(dv==null || dv.Count == 0)
        {
            Label1.Text = "No Such User Exists";
        }
        else
        {
            Label1.ForeColor = System.Drawing.Color.Green;
            Label1.Text = "Password Reset Information will be sent to the email ID you provided";
            sds.SelectCommand = "SELECT * FROM [Users] WHERE [username]=@username AND [email]=@email";
            dv = (DataView)sds.Select(DataSourceSelectArguments.Empty);

            if(dv!=null && dv.Count!=0 )
            {
                sds.SelectCommand = "SELECT password FROM [users] WHERE [username]=@username";
                dv = (DataView)sds.Select(DataSourceSelectArguments.Empty);
                sendmail(email,dv[0].Row["password"].ToString());
            }
        }

    }

    private void sendmail(string email,string passw)
    {
        MailMessage mail = new MailMessage();
        string code = crypto.encryption_decryption.Decrypt(passw);
        mail.To.Add(email);
        mail.From = new MailAddress(sender);
        mail.Subject = "Application Password Reset";
        mail.Body = "Your Password is \n\n" + code.ToString();
        SmtpClient smtp = new SmtpClient("smtp.gmail.com");
        smtp.EnableSsl = true;

        string pass = utility.utils.fetch();
        smtp.UseDefaultCredentials = true;

        NetworkCredential cred = new NetworkCredential(sender, pass);
        smtp.Port = 587;
        smtp.Credentials = cred;
        smtp.Send(mail);
    }

    protected void cont_Click(object sender, EventArgs e)
    {
        msg.Text = "";
        SqlDataSource sds = new SqlDataSource();
        sds.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
        sds.SelectParameters.Add("username", TypeCode.String,name1.Text);
        user = name1.Text;
        sds.SelectCommand = "SELECT * FROM [Users] WHERE [username]=@username";
        DataView dv = (DataView)sds.Select(DataSourceSelectArguments.Empty);
        if(dv==null || dv.Count == 0)
        {
            msg.Text = "No such user exists";
        }
        else
        {
            que.Text = dv[0].Row["SecurityQuestion"].ToString();
            lab1.Text = "Answer";
            name1.Text = "";
            rew.ErrorMessage = "No Answer Provided"; 
            add.Visible = true;
            cont.Visible = false;
            sub.Visible = true;
        }
        

    }

    protected void sub_Click1(object sender, EventArgs e)
    {
        string ans = name1.Text;
        SqlDataSource sds = new SqlDataSource();
        sds.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
        sds.SelectParameters.Add("username",TypeCode.String,user);

        sds.SelectCommand = "SELECT * FROM [Users] WHERE [username]=@username";

        DataView dv = (DataView)sds.Select(DataSourceSelectArguments.Empty);

        string corr;
        if (dv[0].Row["answer"] != null)
        {
            corr = crypto.encryption_decryption.Decrypt(dv[0].Row["answer"].ToString());
        }
        else
        {
            corr = "";
        }

        if(corr==ans)
        {
            msg.ForeColor = System.Drawing.Color.Black;
            msg.Text = "Your Password is: \n";
            msg.Text += crypto.encryption_decryption.Decrypt(dv[0].Row["password"].ToString());
        }
        else
        {
            msg.Text = "Answer Doesn't match try again";
        }
    }
    
    protected void addDetails()
    {
        string password = crypto.encryption_decryption.Encrypt(pwd.Text);
        string answer = ans.Text;

        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;

        string sql = "UPDATE Users SET password=@password,answer=@answer WHERE username=@username";

        SqlCommand cmd = new SqlCommand(sql,conn);

        SqlParameter[] paramas = new SqlParameter[3];
        paramas[0] = new SqlParameter("@password", SqlDbType.VarChar, 100);
        paramas[1] = new SqlParameter("@answer", SqlDbType.VarChar, 1000);
        paramas[2] = new SqlParameter("@username", SqlDbType.VarChar, 50);

        paramas[0].Value = password;
        paramas[1].Value = answer;
        paramas[2].Value = user;
        
        for(int i=0;i<paramas.Length;i++)
        {
            cmd.Parameters.Add(paramas[i]);
        }
        conn.Open();
        cmd.CommandType = CommandType.Text;
        cmd.ExecuteNonQuery();
        conn.Close();

        sql = "UPDATE Users SET FirstTime=@ft WHERE username=@username";
        cmd = new SqlCommand(sql, conn);
        paramas[0] = new SqlParameter("@ft",SqlDbType.Bit);
        paramas[1] = new SqlParameter("@username", SqlDbType.VarChar, 50);
        paramas[0].Value = 0;
        paramas[1].Value = user;
        conn.Open();
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.Add(paramas[0]);
        cmd.Parameters.Add(paramas[1]);
        cmd.ExecuteNonQuery();
        conn.Close();
    }

    protected void First_Click(object sender, EventArgs e)
    {
        addDetails();
        Response.Redirect("~/Views/Login.aspx");
    }
}

