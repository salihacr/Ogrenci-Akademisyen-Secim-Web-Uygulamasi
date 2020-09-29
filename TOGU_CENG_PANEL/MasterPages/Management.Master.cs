using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TOGU_CENG_PANEL.MasterPages
{
    public partial class Management : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Academician"] == null) Response.Redirect("../Login.aspx");
            int role = Convert.ToInt32(Session["role"]);
            if (!IsPostBack)
            {
                if (role == 1 || role == 3) management.Visible = true;
                username.Value = Session["Academician"].ToString();
            }
        }
        protected void LogoutButton_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("../Login.aspx");
        }
    }
}