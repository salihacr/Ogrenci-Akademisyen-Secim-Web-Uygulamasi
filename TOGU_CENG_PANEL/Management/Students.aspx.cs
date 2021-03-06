﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TOGU_CENG_PANEL.Management
{
    public partial class Students : System.Web.UI.Page
    {
        static string adress = ConfigurationManager.ConnectionStrings["PanelDB"].ConnectionString;
        SqlConnection conn = new SqlConnection(adress);
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Session["id"]);
            int role = Convert.ToInt32(Session["role"]);
            if (role == 2 || role == 4) Response.Redirect("../NotFound.aspx");
        }
        protected void Add_User_Click(object sender, EventArgs e)
        {
            try
            {
                string fullName = txtName.Text;
                string email = txtEmail.Value;
                if (exist(email) > 0)
                {
                    EmailAlert.Visible = true;
                    Successful.Visible = false;
                }
                else
                {
                    string query = "INSERT Users(FullName,Email,Password,RoleID) VALUES(@name,@email,@pw,@roleid)";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@name", txtName.Text);
                        cmd.Parameters.AddWithValue("@email", txtEmail.Value);
                        cmd.Parameters.AddWithValue("@pw", txtPassword.Text);
                        cmd.Parameters.AddWithValue("@roleid", Convert.ToInt32(ddl_roles.SelectedValue));
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        conn.Close();

                        Successful.Visible = true;
                        EmailAlert.Visible = false;
                    }
                }
            }

            catch (Exception)
            {
                string msg = "Bir Hata Oluştu Lüttfen Tekrar Deneyiniz";
                ScriptManager.RegisterClientScriptBlock(sender as Control, this.GetType(), "alert", "alert('" + msg + "')", true);
            }
        }
        public int exist(string email)
        {
            int result = 0;
            string query = "Select * from Users Where Email=@email";
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@email", email);
                conn.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                    result++;
                conn.Close();
            }
            return result;
        }
    }
}