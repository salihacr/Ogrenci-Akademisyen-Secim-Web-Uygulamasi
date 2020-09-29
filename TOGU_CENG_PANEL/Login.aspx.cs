using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TOGU_CENG_PANEL
{
    public partial class Login : System.Web.UI.Page
    {
        static string adress = ConfigurationManager.ConnectionStrings["PanelDB"].ConnectionString;
        SqlConnection conn = new SqlConnection(adress);
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Login_Click(object sender, EventArgs e)
        {
            try
            {
                login2(sender);
            }
            catch (Exception ex)
            {
                string msg = "Bir Hata Oluştu Lüttfen Tekrar Deneyiniz";
                ScriptManager.RegisterClientScriptBlock(sender as Control, this.GetType(), "alert", "alert('" + ex.Message + "')", true);
            }
        }
        public void login(string query)
        {
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@email", txtEmail.Value);
            cmd.Parameters.AddWithValue("@password", txtPassword.Value);
            cmd.Connection = conn;
            conn.Open();
            int role = 0;
            SqlDataReader sdr = cmd.ExecuteReader();
            if (sdr.Read())
            {
                role = Convert.ToInt32(sdr["RoleID"]);
                int id = Convert.ToInt32(sdr["ID"]);
                string name = Convert.ToString(sdr["FullName"]);
                Session["role"] = role;
                Session["id"] = id;
                Session["FullName"] = name;
                Response.Redirect("Management/StudentOptions.aspx");
            }
        }
        public void login2(object sender)
        {
            //Boolean flag = false;

            SqlCommand cmd = new SqlCommand("Select * From Users Where Email=@email and Password =@password", conn);
            cmd.Parameters.AddWithValue("@email", txtEmail.Value);
            cmd.Parameters.AddWithValue("@password", txtPassword.Value);
            cmd.Connection = conn;
            conn.Open();
            int role = 0;
            SqlDataReader sdr = cmd.ExecuteReader();

            if (sdr == null || !sdr.HasRows)
            {
                sdr.Close();
                conn.Close();
                conn.Open();
                SqlCommand cmdAdm = new SqlCommand("Select * From Academicians Where Email=@email and Password =@password", conn);
                cmdAdm.Parameters.AddWithValue("@email", txtEmail.Value);
                cmdAdm.Parameters.AddWithValue("@password", txtPassword.Value);
                cmdAdm.Connection = conn;

                SqlDataReader sdrAdm = cmdAdm.ExecuteReader();
                if (sdrAdm == null || !sdrAdm.HasRows)
                {
                    // Girilen Kullanıcı yok Hata mesajı çıkar ;
                    string msg = "Kullanıcı adı veya şifre hatalıdır, Tekrar deneyiniz";
                    ScriptManager.RegisterClientScriptBlock(sender as Control, this.GetType(), "alert", "alert('" + msg + "')", true);

                }
                else
                {
                    if (sdrAdm.Read())
                    {
                        role = Convert.ToInt32(sdrAdm["RoleID"]);
                        int id = Convert.ToInt32(sdrAdm["ID"]);
                        string name = Convert.ToString(sdrAdm["Academician"]);
                        Session["role"] = role;
                        Session["id"] = id;
                        Session["Academician"] = name;
                        Response.Redirect("Management/StudentOptions.aspx");
                    }
                }

            }
            else
            {
                if (sdr.Read())
                {
                    role = Convert.ToInt32(sdr["RoleID"]);
                    int id = Convert.ToInt32(sdr["ID"]);
                    string name = Convert.ToString(sdr["FullName"]);
                    Session["role"] = role;
                    Session["id"] = id;
                    Session["FullName"] = name;
                    Response.Redirect("User/MakeChoice.aspx");

                }

            }



        }
    }
}