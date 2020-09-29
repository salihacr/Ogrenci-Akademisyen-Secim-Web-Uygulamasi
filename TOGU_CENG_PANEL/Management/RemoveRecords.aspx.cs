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
    public partial class RemoveRecords : System.Web.UI.Page
    {
        static string adress = ConfigurationManager.ConnectionStrings["PanelDB"].ConnectionString;
        SqlConnection conn = new SqlConnection(adress);
        int id;
        int role;
        protected void Page_Load(object sender, EventArgs e)
        {
            id = Convert.ToInt32(Session["id"]);
            role = Convert.ToInt32(Session["role"]);
            if (role == 1 || role == 3)
            {
                form1.Visible = true;
            }
            else
            {
                Response.Redirect("../NotFound.aspx");
            }

            if (!IsPostBack)
            {
                loadAcademicians();
            }
        }
        public void loadAcademicians()
        {
            ddl_academicians.Items.Insert(0, new ListItem("Lütfen Seçim Yapınız...", "0"));

            string query = "SELECT * FROM Academicians Where RoleID = 1 or RoleID = 2 ORDER BY Academician";
            SqlCommand cmd = new SqlCommand(query, conn);
            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                ListItem list = new ListItem();
                list.Text = dr["Academician"].ToString();
                list.Value = dr["ID"] + "";
                ddl_academicians.Items.Add(list);
            }
            conn.Close();
        }
        protected void Remove_Options_Click(object sender, EventArgs e)
        {
            try
            {
                removeAllRecords("DELETE FROM Options");
            }

            catch (Exception)
            {
                string msg = "Bir Hata Oluştu Lüttfen Tekrar Deneyiniz";
                ScriptManager.RegisterClientScriptBlock(sender as Control, this.GetType(), "alert", "alert('" + msg + "')", true);
                DangerAlert.Visible = true;
            }
        }
        protected void Remove_Users_Click(object sender, EventArgs e)
        {
            try
            {
                removeAllRecords("DELETE FROM Users");
            }

            catch (Exception)
            {
                string msg = "Bir Hata Oluştu Lüttfen Tekrar Deneyiniz";
                ScriptManager.RegisterClientScriptBlock(sender as Control, this.GetType(), "alert", "alert('" + msg + "')", true);
            }
        }
        protected void Remove_Semesters_Click(object sender, EventArgs e)
        {
            try
            {
                removeAllRecords("DELETE FROM Semesters");
            }

            catch (Exception)
            {
                string msg = "Bir Hata Oluştu Lütfen Tekrar Deneyiniz";
                ScriptManager.RegisterClientScriptBlock(sender as Control, this.GetType(), "alert", "alert('" + msg + "')", true);
                DangerAlert.Visible = true;
            }
        }
        protected void Remove_Academician_Click(object sender, EventArgs e)
        {
            try
            {
                string query = "delete from Academicians Where Academicians.ID = @id";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@id", Convert.ToInt32(ddl_academicians.SelectedValue));
                    if (id == Convert.ToInt32(ddl_academicians.SelectedValue))
                    {
                        string msg = "Bu kaydı sistemden silemezsiniz...";
                        ScriptManager.RegisterClientScriptBlock(sender as Control, this.GetType(), "alert", "alert('" + msg + "')", true);
                    }
                    else
                    {
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        conn.Close();
                        Alert.Visible = true;
                    }
                }
            }

            catch (Exception ex)
            {
                string msg = "Bir Hata Oluştu Lüttfen Tekrar Deneyiniz";
                ScriptManager.RegisterClientScriptBlock(sender as Control, this.GetType(), "alert", "alert('" + msg + ex + "')", true);
                DangerAlert.Visible = true;
            }
        }
        void removeAllRecords(string query)
        {
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();

                Alert.Visible = true;
            }
        }
        int removeById(string query, string parameterName, int id)
        {
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue(parameterName, id);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                Alert.Visible = true;
            }
            return id;
        }
    }
}