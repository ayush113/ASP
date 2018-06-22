using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Views_Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // The flag 1 is sent with the query string when an attempt to
        // open a secure page is made without any cerdentials

        if (Request.QueryString["flag"] == "1")
        {
            lblmsg.ForeColor = System.Drawing.Color.Red;
            lblmsg.Text = "Can not access Page.aspx without logging in";
        }

    }
}