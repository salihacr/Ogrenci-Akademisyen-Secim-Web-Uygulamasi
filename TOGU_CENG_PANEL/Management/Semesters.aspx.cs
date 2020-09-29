using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TOGU_CENG_PANEL.Management
{
    public partial class Semesters : System.Web.UI.Page
    {
        static string adress = ConfigurationManager.ConnectionStrings["PanelDB"].ConnectionString;
        SqlConnection conn = new SqlConnection(adress);

        protected void Page_Load(object sender, EventArgs e)
        {
            int role, id;
            id = Convert.ToInt32(Session["id"]);
            role = Convert.ToInt32(Session["role"]);
            if (role == 2 || role == 4) Response.Redirect("../NotFound.aspx");

        }
        protected void Add_Semester_Click(object sender, EventArgs e)
        {
            try
            {
                string query = "INSERT Semesters(SemesterName,State,Capacity) VALUES (@semester,@state,@capacity)";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@semester", txtSemester.Text);
                    cmd.Parameters.AddWithValue("@state", ddl_state.SelectedValue);
                    cmd.Parameters.AddWithValue("@capacity", Convert.ToInt32(txtCapacity.Text));
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();

                    Successful.Visible = true;
                }
            }

            catch (Exception)
            {
                string msg = "Bir Hata Oluştu Lüttfen Tekrar Deneyiniz";
                ScriptManager.RegisterClientScriptBlock(sender as Control, this.GetType(), "alert", "alert('" + msg + "')", true);
            }
        }
    }
}