using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace TOGU_CENG_PANEL.User
{
    public partial class MakeChoice : System.Web.UI.Page
    {
        static string adress = ConfigurationManager.ConnectionStrings["PanelDB"].ConnectionString;
        SqlConnection conn = new SqlConnection(adress);
        int id;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null) Response.Redirect("Login.aspx");
            id = Convert.ToInt32(Session["id"]);
            if (!IsPostBack)
            {
                loadAcademicians();
                loadSemesters();
            }
            if (exist(id) >= 1)
            {
                lblInfo.Text = "Email adresinize ait kayıt bulunuyor. " + successsFullRecord();
                ExistRecord.Visible = true;
                SuccessfullRecord.Visible = false;
                MissingValues.Visible = false;
                QuotaOverFlow.Visible = false;
            }
        }

        /// <Summary>
        /// this function get academicians from database and loads Dropdown
        /// </Summary>
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

        /// <Summary>
        /// this function get semester from database and loads Dropdown
        /// </Summary>
        public void loadSemesters()
        {
            ddl_semesters.Items.Insert(0, new ListItem("Lütfen Seçim Yapınız...", "0"));

            string query = "SELECT * FROM Semesters Where State = 'ON'";
            SqlCommand cmd = new SqlCommand(query, conn);
            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                ListItem list = new ListItem();
                list.Text = dr["SemesterName"].ToString();
                list.Value = dr["ID"] + "";
                ddl_semesters.Items.Add(list);
            }
            conn.Close();
        }


        protected void SendButton_Click(object sender, EventArgs e)
        {
            int aid = Convert.ToInt32(ddl_academicians.SelectedValue);
            int sid = Convert.ToInt32(ddl_semesters.SelectedValue);
            try
            {
                if (aid == 0 || sid == 0)
                {
                    MissingValues.Visible = true;
                    SuccessfullRecord.Visible = false;
                    QuotaOverFlow.Visible = false;
                }
                else if (exist(id, sid) >= 1)
                {
                    lblInfo.Text = "Email adresinize ait kayıt bulunuyor. " + successsFullRecord();
                    ExistRecord.Visible = true;
                    SuccessfullRecord.Visible = false;
                    MissingValues.Visible = false;
                    QuotaOverFlow.Visible = false;
                }
                else if (studentCounter(aid, sid) >= academicianQuota(sid))
                {
                    SuccessfullRecord.Visible = false;
                    MissingValues.Visible = false;
                    QuotaOverFlow.Visible = true;
                }
                else
                {
                    string date = DateTime.Now.ToString();
                    string query = "INSERT Options(RegistrationDate,UserID,SemesterID,AcademicianID) VALUES (@date,@uid,@sid,@aid)";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@date", date);
                    cmd.Parameters.AddWithValue("@uid", id);
                    cmd.Parameters.AddWithValue("@sid", sid);
                    cmd.Parameters.AddWithValue("@aid", aid);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();

                    lblSuccess.Text = successsFullRecord();
                    SuccessfullRecord.Visible = true;
                }
            }
            catch (Exception es)
            {
                string msg = "Bir Hata Oluştu Lüttfen Tekrar Deneyiniz";
                ScriptManager.RegisterClientScriptBlock(sender as Control, this.GetType(), "alert", "alert('" + msg + es.Message + "')", true);
            }
        }
        public string successsFullRecord()
        {
            string label = "";

            string query = "SELECT Academicians.Academician as Lecturer, Semesters.SemesterName as Lesson FROM Options " +
                "INNER JOIN Academicians ON Options.AcademicianID = Academicians.ID " +
                "INNER JOIN Semesters ON Options.SemesterID = Semesters.ID " +
                "INNER JOIN Users ON Options.UserID = Users.ID " +
                "WHERE Users.ID = @uid";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@uid", id);
            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                label = dr["Lesson"] + " dersi için " + dr["Lecturer"] + " adlı akademisyene kaydınız gerçekleşmiştir...";
            }

            conn.Close();
            return label;
        }


        protected void ddl_academicians_selected(object sender, EventArgs e)
        {
            MissingValues.Visible = false;
            int aid = Convert.ToInt32(ddl_academicians.SelectedValue);
            int sid = Convert.ToInt32(ddl_semesters.SelectedValue);
            if (exist(id, sid) >= 1)
            {
                lblInfo.Text = "Email adresinize ait kayıt bulunuyor. " + successsFullRecord();
                ExistRecord.Visible = true;
                SuccessfullRecord.Visible = false;
                MissingValues.Visible = false;
                QuotaOverFlow.Visible = false;
            }
            else if (studentCounter(aid, sid) >= academicianQuota(sid))
            {
                QuotaOverFlow.Visible = true;
                SuccessfullRecord.Visible = false;
                MissingValues.Visible = false;
            }
            else
                QuotaOverFlow.Visible = false;
        }


        public int exist(int id, int semesterID)
        {
            int result = 0;
            string query = "Select * from Options Where UserID=@uid and SemesterID=@sid";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@uid", id);
            cmd.Parameters.AddWithValue("@sid", semesterID);
            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                result++;
            }

            conn.Close();
            return result;
        }
        public int exist(int id)
        {
            int result = 0;
            string query = "Select * from Options Where UserID=@uid";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@uid", id);
            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                result++;
            }

            conn.Close();
            return result;
        }
        public int studentCounter(int academicianID, int semesterID)
        {
            int result;
            string query = "Select Count(AcademicianID) from Options " +
                "INNER JOIN Semesters ON Options.SemesterID = Semesters.ID " +
                "Where AcademicianID=@aid and Semesters.ID=@sid";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@aid", academicianID);
            cmd.Parameters.AddWithValue("@sid", semesterID);
            conn.Open();
            result = Convert.ToInt32(cmd.ExecuteScalar());
            conn.Close();
            return result;
        }

        public double academicianQuota(int semesterID)
        {
            int academicians = 0;
            int capacity = 0;
            double quota = 0;
            string query1 = "Select Count(ID) from Academicians Where RoleID IN(1,2)";
            using (SqlCommand cmd = new SqlCommand(query1, conn))
            {
                conn.Open();
                academicians = Convert.ToInt32(cmd.ExecuteScalar());
                conn.Close();
            }
            string query2 = "Select Capacity from Semesters Where ID = @sid";
            using (SqlCommand cmd = new SqlCommand(query2, conn))
            {
                cmd.Parameters.AddWithValue("@sid", semesterID);
                conn.Open();
                capacity = Convert.ToInt32(cmd.ExecuteScalar());
                conn.Close();
            }
            quota = capacity / academicians;
            return quota;
        }
    }
}