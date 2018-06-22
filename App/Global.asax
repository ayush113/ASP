<%@ Application Language="C#" %>
<%@ Import Namespace="App" %>
<%@ Import Namespace="System.Web.Optimization" %>
<%@ Import Namespace="System.Web.Routing" %>
    <%@ Import Namespace="System.Data.SqlClient"%>

<script runat="server">
    private static CacheItemRemovedCallback OnCacheRemove = null;

    void Application_Start(object sender, EventArgs e)
    {
        RouteConfig.RegisterRoutes(RouteTable.Routes);
        BundleConfig.RegisterBundles(BundleTable.Bundles);
        int time = 1 * 60 * 60;
        AddTask("Unlock",time);
    }

    private void AddTask(string name, int seconds)
    {
        OnCacheRemove = new CacheItemRemovedCallback(CacheItemRemoved);
        HttpRuntime.Cache.Insert(name, seconds, null,
        DateTime.Now.AddSeconds(seconds), Cache.NoSlidingExpiration,
        CacheItemPriority.NotRemovable, OnCacheRemove);
    }

    public void CacheItemRemoved(string k, object v, CacheItemRemovedReason r)
    {
        // do stuff here if it matches our taskname, like WebRequest
        // re-add our task so it recurs
        if(k=="Unlock")
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
            string sql = "UPDATE Users SET Counter=@counter";
            SqlParameter paramas = new SqlParameter("@counter",System.Data.SqlDbType.Int);
            paramas.Value = 0;
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql,conn);
            cmd.Parameters.Add(paramas);
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        AddTask(k, Convert.ToInt32(v));

    }


</script>
