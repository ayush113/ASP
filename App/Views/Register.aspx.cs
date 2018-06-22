using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Net.Mail;
using System.IO;
using System.Net;
using crypto;

public partial class Views_Register : System.Web.UI.Page
{
    private static string sender = "ayush.work113@gmail.com";
    private static string a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12,pass,fpath,a13;
    private static int vcode,flag=0;

    protected void Page_Load(object sender, EventArgs e)
    {
        MultiView1.SetActiveView(view1);
        if(Request.QueryString["userid"] == "1")
        {
            flag = 1;
        }
    }

    protected void Sizecheck(object sender,ServerValidateEventArgs e)
    {
        string name = this.uname.Text;
        if(name.Length <= 6 )
        {
            e.IsValid = false;
        }
        else
        {
            e.IsValid = true;
        }
    }

    protected void Checkit(object sender,ServerValidateEventArgs e)
    {
        string name = this.uname.Text;
        if (name.Length <= 6)
        {
            e.IsValid = false;
        }
        else
        {
            e.IsValid = true;
        }
    }

    protected void execute(string username,string password,string name,string gender,string address1,string address2,string city,string state,string pin,string mobile,string telephone, string email,string dob,string Image,string CreatedOn,string SecurityQuestion)
    {
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = connstring();
        string sql = "INSERT INTO Users (username,password,name,gender,address1,address2,city,state,pin,mobile,telephone,email,dob,Image,CreatedOn,SecurityQuestion) VALUES (@username,@password,@name,@gender,@address1,@address2,@city,@state,@pin,@mobile,@telephone,@email,@dob,@Image,@CreatedOn,@SecurityQuestion)";
        try
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            SqlParameter[] paramas = new SqlParameter[16];
            paramas[0] = new SqlParameter("@username", SqlDbType.VarChar, 50);
            paramas[1] = new SqlParameter("@password", SqlDbType.VarChar, 100);
            paramas[2] = new SqlParameter("@name", SqlDbType.VarChar, 50);
            paramas[3] = new SqlParameter("@gender", SqlDbType.VarChar, 10);
            paramas[4] = new SqlParameter("@address1", SqlDbType.VarChar, 100);
            paramas[5] = new SqlParameter("@address2", SqlDbType.VarChar, 100);
            paramas[6] = new SqlParameter("@city", SqlDbType.VarChar, 50);
            paramas[7] = new SqlParameter("@state", SqlDbType.VarChar, 50);
            paramas[8] = new SqlParameter("@pin", SqlDbType.VarChar, 6);
            paramas[9] = new SqlParameter("@mobile", SqlDbType.VarChar, 10);
            paramas[10] = new SqlParameter("@telephone", SqlDbType.VarChar, 10);
            paramas[11] = new SqlParameter("@email", SqlDbType.VarChar, 100);
            paramas[12] = new SqlParameter("@dob", SqlDbType.VarChar, 20);
            paramas[13] = new SqlParameter("@Image", SqlDbType.VarChar, 1000);
            paramas[14] = new SqlParameter("@CreatedOn", SqlDbType.Date);
            paramas[15] = new SqlParameter("@SecurityQuestion", SqlDbType.VarChar, 1000);

            paramas[0].Value = username;
            paramas[1].Value = password;
            paramas[2].Value = name;
            paramas[3].Value = gender;
            paramas[4].Value = address1;
            paramas[5].Value = address2;
            paramas[6].Value = city;
            paramas[7].Value = state;
            paramas[8].Value = pin;
            paramas[9].Value = mobile;
            paramas[10].Value = telephone;
            paramas[11].Value = email;
            paramas[12].Value = dob;
            paramas[13].Value = Image;
            paramas[14].Value = CreatedOn;
            paramas[15].Value = SecurityQuestion;

            for(int i = 0;i<paramas.Length;i++)
            {
                cmd.Parameters.Add(paramas[i]);
            }

            cmd.CommandType = CommandType.Text;
            cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            string msg = "Error While Adding to Database";
            msg += ex.Message;
            throw new Exception(msg);
        }
        finally
        {
            conn.Close();
        }
    }

    protected void Register_onClick(object Sender,EventArgs e)
    {


        string storagePath = Server.MapPath("~/Images/");
        if(prof.FileName != "")
        {
            prof.SaveAs(storagePath + Path.GetFileName(prof.FileName));
            fpath = "/Images/" + Path.GetFileName(prof.FileName);
        }
        else
        {
            fpath = "/Images/defaultuser.png";
        }
            
       

        SqlDataSource sds = new SqlDataSource();
        sds.ConnectionString = connstring();
        sds.SelectParameters.Add("username", TypeCode.String, this.uname.Text);
        sds.SelectParameters.Add("email", TypeCode.String, this.email.Text);
        sds.SelectParameters.Add("mobile", TypeCode.String, this.mobile.Text);

        sds.SelectCommand = "SELECT * FROM [Users] WHERE [username] = @username";
        DataView dv1 = (DataView)sds.Select(DataSourceSelectArguments.Empty);
        sds.SelectCommand = "SELECT * FROM [Users] WHERE [email] = @email";
        DataView dv2 = (DataView)sds.Select(DataSourceSelectArguments.Empty);
        sds.SelectCommand = "SELECT * FROM [Users] WHERE [mobile] = @mobile";
        DataView dv3 = (DataView)sds.Select(DataSourceSelectArguments.Empty);

        if(dv1 != null && dv1.Count != 0)
        {
            lblmsg.ForeColor = System.Drawing.Color.Red;
            lblmsg.Text = "Username already exists";
            return;
        }
        else if((dv2 != null && dv2.Count != 0))
        {
            lblmsg.ForeColor = System.Drawing.Color.Red;
            lblmsg.Text = "Email ID already in use";
            return;
        }
        else if((dv3 != null && dv3.Count != 0))
        {
            lblmsg.ForeColor = System.Drawing.Color.Red;
            lblmsg.Text = "Mobile Number already in use";
            return;
        }
        else
        {
            Random rnd = new Random();
            vcode = rnd.Next(100000, 999999); 
            sendemail(email.Text, vcode);
            a1 = uname.Text;
            a2 = name.Text;
            a3 = gender.Text;
            a4 = Add1.Text;
            a5 = TextBox1.Text;
            a6 = city.SelectedItem.Value;
            a7 = TextBox2.SelectedItem.Value;
            a8 = pin.Text;
            a9 = mobile.Text;
            a10 = telephone.Text;
            a11 = email.Text;
            a12 = dob.Text;
            a13 = security.SelectedItem.Value;
            MultiView1.SetActiveView(view2);
            
            
        }
    }

    public string connstring()
    {
        return System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
    }

    protected void PassCheck(object sender,ServerValidateEventArgs e)
    {
        pass = password.Text;
        string msg = "";
        int ascii,CharacterCount=0;
        lblmsg.Text = "";
        //Initialize flags for checking special characters and condidtions
        /*Password Conditions checked for
         * One Capital Letter
         * Three Alphabets
         * One Special Character
         * One Number
         * Length greater than 6
         * */
        bool SpecialCharFlag=false,CharacterFlag=false,NumFlag=false,CapitalFlag=false;
        if(pass.Length < 6)
        {
            e.IsValid = false;
            msg += "Password should be more than 6 characters <br/>";
        }
        char[] pwd = pass.ToCharArray();
        for(int i =0;i<pwd.Length;i++)
        {
            ascii = (int)pwd[i];
            if((ascii >= 32 && ascii <=47) || (ascii >= 91 && ascii <=96))
            {
                SpecialCharFlag = true;
            }
            else if(ascii>= 97 && ascii <= 122)
            {
                CharacterCount++;
            }
            else if(ascii>=48 && ascii <= 57)
            {
                NumFlag = true;
            }
            else if(ascii >= 65 && ascii <= 90)
            {
                CharacterCount++;
                CapitalFlag = true;
            }
            if(CharacterCount >=3)
            {
                CharacterFlag = true;
            }
        }
        if(SpecialCharFlag && CharacterFlag && NumFlag && CapitalFlag)
        {
            e.IsValid = true;
        }
        else
        {
            e.IsValid = false;
        }
        if(!SpecialCharFlag)
        {
            msg += "No Special Character <br/>";
        }
        if(!CharacterFlag)
        {
            msg += "Need at least 3 alphabets <br/>";
        }
        if(!NumFlag)
        {
            msg += "There Should be at least one number <br/>";
        }
        if(!CapitalFlag)
        {
            msg += "There should be at least one capital letter";
        }
        if(e.IsValid == false)
        {
            lblmsg.ForeColor = System.Drawing.Color.Red;
            lblmsg.Text = msg;
        }

    }

    protected static void sendemail(string email,int code)
    {
        MailMessage mail = new MailMessage();

        mail.To.Add(email);
        mail.From = new MailAddress(sender);
        mail.Subject = "Application Email Verification";
        mail.Body = "Your Verification Code is:\n" + code.ToString();
        SmtpClient smtp = new SmtpClient("smtp.gmail.com");
        smtp.EnableSsl = true;

        string pass = utility.utils.fetch();
        smtp.UseDefaultCredentials = true;

        NetworkCredential cred = new NetworkCredential(sender,pass);
        smtp.Port = 587;
        smtp.Credentials = cred;
        smtp.Send(mail);

    }

    protected void verify_Click(object sender, EventArgs e)
    {
        int cd = Int32.Parse(code.Text);
        if (cd == vcode)
        {
            DateTime date = new DateTime();
            string dt;
            dt = date.ToLongDateString();

            string passf = encryption_decryption.Encrypt(pass);
            execute(a1, passf, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12,fpath,dt,a13);
            if(flag==1)
            {
                addCreated();
            }

            lblmsg.Text = "Registered Successfully !";
            Response.Redirect("~/Views/Login.aspx");
        }
        else
        {
            lblinfo.ForeColor = System.Drawing.Color.Red;
            lblinfo.Text = "Invalid Verification Code retry";
            MultiView1.SetActiveView(view1);
        }
    }

    protected void name_TextChanged(object sender, EventArgs e)
    {

    }

    protected void addCreated()
    {
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = connstring();
        conn.Open();
        string sql = "UPDATE Users SET CreatedBy=@CreatedBy WHERE username=@username";
        SqlCommand cmd = new SqlCommand(sql, conn);
        SqlParameter[] paramas = new SqlParameter[2];
        paramas[0] = new SqlParameter("@CreatedBy", SqlDbType.VarChar, 50);
        paramas[1] = new SqlParameter("@username", SqlDbType.VarChar, 50);
        paramas[0].Value = Session["username"].ToString();
        paramas[1].Value = a1;

        cmd.Parameters.Add(paramas[0]);
        cmd.Parameters.Add(paramas[1]);
        cmd.CommandType = CommandType.Text;
        cmd.ExecuteNonQuery();
        conn.Close();
    }

    

    protected void TextBox2_SelectedIndexChanged1(object sender, EventArgs e)
    {
      
    }

    protected void Unnamed14_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}