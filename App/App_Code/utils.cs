using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.WebControls;
using System.Web.UI;

/// <summary>
/// Contains utility functions for:
/// 1. Adding admin passwords
/// 2. Fetching encrypted passwords from database
/// 3. Functions for Leave Management
/// 4. Functions for creating Attendance Reports
/// 
/// </summary>
/// 
namespace utility
{
    public class utils
    {
        public static void addpassword(string pass)
        {
            string store = crypto.encryption_decryption.Encrypt(pass);
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
            conn.Open();
            string sql = "INSERT INTO Passwords (Id,Password) VALUES (@Id,@Password)";

            SqlCommand cmd = new SqlCommand(sql, conn);
            SqlParameter[] para = new SqlParameter[2];
            para[0] = new SqlParameter("@Id", SqlDbType.Int);
            para[1] = new SqlParameter("@Password", SqlDbType.VarChar, 512);
            para[0].Value = 1;
            para[1].Value = store;

            cmd.Parameters.Add(para[0]);
            cmd.Parameters.Add(para[1]);

            cmd.CommandType = CommandType.Text;
            cmd.ExecuteNonQuery();
        }

        public static string fetch()
        {
            SqlDataSource sds = new SqlDataSource();
            sds.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
            sds.SelectParameters.Add("Id",TypeCode.Int32, "1");
            sds.SelectCommand = "SELECT * FROM [Passwords] WHERE [Id] = @Id";

            DataView dv = (DataView)sds.Select(DataSourceSelectArguments.Empty);

            string encrypted = dv[0].Row["Password"].ToString();
            string res = crypto.encryption_decryption.Decrypt(encrypted);
            return res;
        }

        public static bool LeaveEligibility(string type,int days)
        {
            try
            {
                string year = DateTime.Now.Year.ToString();
                SqlDataSource sds = new SqlDataSource();
                sds.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
                sds.SelectCommand = "SELECT * FROM [LeaveMaster] WHERE [FinancialYear] = @fy AND [userid]=@id";
                sds.SelectParameters.Add("fy", TypeCode.String, year);
                sds.SelectParameters.Add("id", TypeCode.Int32, HttpContext.Current.Session["userid"].ToString());

                DataView dv = (DataView)sds.Select(DataSourceSelectArguments.Empty);

                if (dv[0].Row[type].ToString() != null && dv[0].Row[type].ToString() != "0")
                {
                    if (Int32.Parse(dv[0].Row[type].ToString()) - days >= 0)
                    {
                        days = Int32.Parse(dv[0].Row[type].ToString()) - days;
                        UpdateMaster(type, days);
                        UpdateTracker(DateTime.UtcNow.ToLongDateString(), type, days, "0", 0, 0, "0");
                        return true;
                    }
                }
                
            }
            catch(Exception e)
            {
                throw new Exception(e.Message);
                
            }



            return false;
        }

        private static void UpdateMaster(string type,int days)
        {
            //First Update the Leave master by removing the leaves
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
            string sql;
            if(type == "CL")
            {
                sql = "UPDATE LeaveMaster SET CL = @L WHERE userid=@id";
            }
            else if(type == "SL")
            {
                sql = "UPDATE LeaveMaster SET SL= @L WHERE userid=@id";
            }
            else
            {
                sql = "UPDATE LeaveMaster SET PL= @L WHERE userid=@id";
            }
            SqlCommand cmd = new SqlCommand(sql, conn);
            SqlParameter[] paramas = new SqlParameter[2];
            paramas[0] = new SqlParameter("@L", SqlDbType.Int);
            paramas[1] = new SqlParameter("@id", SqlDbType.Int);

            paramas[0].Value = days;
            paramas[1].Value = Int32.Parse(HttpContext.Current.Session["userid"].ToString());

            cmd.Parameters.Add(paramas[0]);
            cmd.Parameters.Add(paramas[1]);

            cmd.CommandType = CommandType.Text;
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

        }

        private static void UpdateTracker(string DateApplied,string type,int daysapplied,string approved,int daysactual,int hasTaken,string DateTaken)
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            string sql = "INSERT INTO LeaveTracker (userid,DateApplied,Type,ApprovedBy,NoOfDays,NoOfDaysActual,hasTaken,DateTaken) VALUES(@id,@dapp,@type,@approved,@daysapp,@daysactual,@hasTaken,@dtaken)";
            cmd.CommandText = sql;

            SqlParameter[] paramas = new SqlParameter[8];

            paramas[0] = new SqlParameter("@id", SqlDbType.Int);
            paramas[1] = new SqlParameter("@dapp", SqlDbType.VarChar, 100);
            paramas[2] = new SqlParameter("@type", SqlDbType.VarChar, 4);
            paramas[3] = new SqlParameter("@approved", SqlDbType.VarChar, 50);
            paramas[4] = new SqlParameter("@daysapp", SqlDbType.Int);
            paramas[5] = new SqlParameter("@daysactual", SqlDbType.Int);
            paramas[6] = new SqlParameter("@hasTaken", SqlDbType.Bit);
            paramas[7] = new SqlParameter("@dtaken", SqlDbType.VarChar, 100);

            paramas[0].Value = Int32.Parse(HttpContext.Current.Session["userid"].ToString());
            paramas[1].Value = DateApplied;
            paramas[2].Value = type;
            paramas[3].Value = approved;
            paramas[4].Value = daysapplied;
            paramas[5].Value = daysactual;
            paramas[6].Value = hasTaken;
            paramas[7].Value = DateTaken;

            for(int i =0; i<paramas.Length;i++)
            {
                cmd.Parameters.Add(paramas[i]);
            }

            cmd.CommandType = CommandType.Text;
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

        }

        public static void CreateLeaveEntry(int uid)
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
            string sql = "INSERT INTO LeaveMaster (userid) VALUES (@userid)";
            SqlCommand cmd = new SqlCommand(sql,conn);

            SqlParameter paramas = new SqlParameter("@userid", SqlDbType.Int);
            SqlParameter paramas1 = new SqlParameter("@year", SqlDbType.VarChar,10);
            paramas.Value = uid;
            paramas1.Value = DateTime.UtcNow.Year;

            cmd.Parameters.Add(paramas);
            cmd.CommandType = CommandType.Text;
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            
        }

        public static void ApproveLeave(int id)
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
            string sql = "UPDATE LeaveTracker SET ApprovedBy = @Approval WHERE Id=@Id";
            SqlCommand cmd = new SqlCommand(sql, conn);

            SqlParameter[] paramas = new SqlParameter[2];
            paramas[0] = new SqlParameter("@Approval", SqlDbType.VarChar, 50);
            paramas[1] = new SqlParameter("@Id", SqlDbType.Int);

            paramas[0].Value = HttpContext.Current.Session["username"].ToString();
            paramas[1].Value = id;
            cmd.Parameters.Add(paramas[0]);
            cmd.Parameters.Add(paramas[1]);
            conn.Open();
            cmd.CommandType = CommandType.Text;
            cmd.ExecuteNonQuery();
        }

        public static report attendanceReport(int uid)
        {
            int count = 0;
            float days = 0;
            float halfdays = 0;
            float overtime = 0;
            SqlDataSource sds = new SqlDataSource();
            sds.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;

            sds.SelectCommand = "SELECT * FROM [Attendance] WHERE [userid]=@userid";

            sds.SelectParameters.Add("userid", TypeCode.Int32, uid.ToString());

            DataView dv = (DataView)sds.Select(DataSourceSelectArguments.Empty);

            report result = new report();

            foreach (DataRowView view in dv)
            {
                //Obtaining no. of days worked and overtime based on sign in and sign out time
                count++;
                float actHours = 0;
                DataRow row = view.Row;
                string tin = row["TimeIn"].ToString(), tout = row["TimeOut"].ToString();

                string[] calc1 = tin.Split(':');
                string[] calc2 = tout.Split(':');
                int hours = Math.Abs(Int32.Parse(calc2[0]) - Int32.Parse(calc1[0]));
                int minutes = Math.Abs((Int32.Parse(calc2[1]) * 60) - (Int32.Parse(calc1[1]) * 60));
                int addHours = minutes / 60;
                int actMinutes = minutes % 60;
                actHours = hours + addHours;
                if((actHours/((float)24)) <= 0.5)
                {
                    halfdays++;
                }
                else if((actHours/((float)24)) == 1.0)
                {
                    days++;
                }
                else
                {
                    overtime += actHours;
                }
            }
            result.days = days;
            result.half = halfdays;
            result.overtime = overtime;
            //Get Leave data here
            string month = DateTime.UtcNow.Month.ToString();
            result.leaves = getLeaveData(uid, month);

            return result;
            //Result stores the attendance report
        }

        private static List<int> getLeaveData(int uid,string month)
        {
            SqlDataSource sds = new SqlDataSource();
            sds.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;

            sds.SelectCommand = "SELECT SUM([NoOfDaysActual]) AS Number FROM [LeaveTracker] WHERE [userid]=@uid AND [month]=@mon AND [hasTaken]=1 GROUP BY [Type]";

            sds.SelectParameters.Add("uid", TypeCode.Int32, uid.ToString());
            sds.SelectParameters.Add("mon", TypeCode.String, month);

            DataView dv = (DataView)sds.Select(DataSourceSelectArguments.Empty);

            string res = dv[0].Row["Number"].ToString();

            List<int> list = new List<int>();
            list.Add(Int32.Parse(dv[0].Row["Number"].ToString()));
            list.Add(Int32.Parse(dv[1].Row["Number"].ToString()));
            list.Add(Int32.Parse(dv[2].Row["Number"].ToString()));
            return list;
        }
    }

    public class report
    {
        public float days { get; set; }

        public List<int> leaves {get; set;}

        public float half { get; set; }

        public float overtime { get; set; }
    }

    
}
