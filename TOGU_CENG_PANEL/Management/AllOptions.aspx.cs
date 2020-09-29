using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TOGU_CENG_PANEL.Management
{
    public partial class AllOptions : System.Web.UI.Page
    {
        int role, id;
        static string adress = ConfigurationManager.ConnectionStrings["PanelDB"].ConnectionString;
        SqlConnection conn = new SqlConnection(adress);
        protected void Page_Load(object sender, EventArgs e)
        {
            id = Convert.ToInt32(Session["id"]);
            role = Convert.ToInt32(Session["role"]);
            if (role == 1 || role == 2 || role == 3)
            {
                Response.Redirect("../Login.aspx");
            }
            string query2 = "SELECT Users.Email,Users.FullName,Academicians.Academician,Semesters.SemesterName,Options.RegistrationDate" +
                " FROM Options" +
                " INNER JOIN Users ON Options.UserID = Users.ID" +
                " INNER JOIN Semesters ON Options.SemesterID = Semesters.ID" +
                " INNER JOIN Academicians ON Options.AcademicianID = Academicians.ID" +
                " WHERE Semesters.State = 'ON'" +
                " ORDER BY Academician";
            conn.Open();
            SqlDataAdapter sda2 = new SqlDataAdapter(query2, conn);
            DataTable dt2 = new DataTable();
            sda2.Fill(dt2);
            rptOptionsAll.DataSource = dt2;
            rptOptionsAll.DataBind();
            conn.Close();
        }
    }
}