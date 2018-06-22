using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using utility;

public partial class Views_user : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.PopulateRssFeed();
        attend1.Click += new EventHandler(attend_Click);
    }

    protected void Page_Init(object sender,EventArgs e)
    {
        if((Session["admin"] == null) || (Session["admin"].ToString() == "True"))
        {
            Response.Redirect("~/Views/Page.aspx");
            return;
        }
    }

    private void PopulateRssFeed()
    {
        string rssFeedUrl = System.Configuration.ConfigurationManager.AppSettings["RssFeedUrl"];
        List<Feeds> feeds = new List<Feeds>();
        XDocument xDoc = XDocument.Load(rssFeedUrl);
        var items = (from y in xDoc.Descendants("channel")
                     from x in y.Descendants("item")
                     select new
                     {
                         title = x.Element("title").Value,
                         description = x.Element("description").Value
                     });
        if (items != null)
        {
            feeds.AddRange(items.Select(i => new Feeds
            {
                Title = i.title,
                Description = i.description
            }));
        }
        gvRss.DataSource = feeds;
        gvRss.DataBind();
    }

    public class Feeds
    {
        public string Title { get; set; }
        public string Description { get; set; }
    }

    protected void submit_Click(object sender, EventArgs e)
    {
        Modal4.Hide();
        ApplyPanel.Visible = false;
        string dapp = DateApplied.Text;
        string type = ddl.SelectedItem.Value;
        int days;
        Int32.TryParse(NoOfDays.Text,out days);

        utility.utils.LeaveEligibility(type, days);
        Page.Response.Redirect(Page.Request.Url.ToString(), true);



    }

    protected void Unnamed_ServerValidate(object source, ServerValidateEventArgs args)
    {
        string info = NoOfDays.Text;
        int num;
        if(Int32.TryParse(info,out num))
        {
            if (num > 0)
            {
                args.IsValid = true;
                return;
            }
                
        }
        args.IsValid = false;
    }

    protected void attend_Click(object sender, EventArgs e)
    {
        string id = Session["userid"].ToString();
        Response.Redirect("~/Views/attendance.aspx?id="+id);
    }


    [System.Web.Services.WebMethod]
    protected void report_Click(object sender,EventArgs e)
    {
        int uid = Int32.Parse(Session["userid"].ToString());
        report res = utils.attendanceReport(uid);

        days.Text = res.days.ToString() + " Days";
        half.Text = res.days.ToString();
        ot.Text = res.overtime.ToString() + " Hours";

        cl.Text = res.leaves[0].ToString();
        pl.Text = res.leaves[1].ToString();
        sl.Text = res.leaves[2].ToString();

        data.Visible = true;
    }

    
}