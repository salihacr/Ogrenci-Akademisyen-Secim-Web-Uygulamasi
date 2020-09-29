using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TOGU_CENG_PANEL.Management
{
    public partial class Records : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Session["id"]);
            int role = Convert.ToInt32(Session["role"]);
            if (role == 2 || role == 4) Response.Redirect("../NotFound.aspx");
        }
    }
}