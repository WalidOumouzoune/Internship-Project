using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace CNRST
{
    public partial class Profile : System.Web.UI.Page
    {
        static SqlConnection cnx = new SqlConnection(@"Data Source=WALID\SQLEXPRESS;Initial Catalog= CnrstUser ;Integrated Security=True");
        SqlCommand cmd = new SqlCommand("", cnx);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
                Response.Redirect("Login.aspx");
            txtEmail.Text = (string)Session["UserName"];

        }
        public void openConnection()
        {
            if (cnx.State == ConnectionState.Closed || cnx.State == ConnectionState.Broken)
                cnx.Open();
        }
        public void closeConnection()
        {
            if (cnx.State == ConnectionState.Open)
                cnx.Close();
        }
        protected void logout_serverClick(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }
        protected void GotoMessage_Click(object sender, EventArgs e)
        {
            Response.Redirect("Email.aspx");
        }
        protected void GotoDashboard_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
        protected void GotoProfile_Click(object sender, EventArgs e)
        {
            Response.Redirect("Profile.aspx");
        }
        protected void SaveUserInfo_Click(object sender, EventArgs e)
        {
            ErrorMsg.Text = "";
            openConnection();
            string Query = "SELECT * FROM UserInfo WHERE UserPassword = @CurrentPassord";
            cmd.CommandText = Query;
            cmd.Parameters.AddWithValue("@CurrentPassord", CurrentPass.Text);
            SqlDataReader rd = cmd.ExecuteReader();
            DataTable dr = new DataTable();
            dr.Load(rd);
            if (dr.Rows.Count == 0)
                ErrorMsg.Text = "The Current Passord is Incorrect";
            else
            {
                Query = "UPDATE UserInfo SET UserPassword = @userpassword  WHERE UserName = @username   ";
                cmd.CommandText = Query;
                cmd.Parameters.AddWithValue("@userpassword", txtNewPass.Text);
                cmd.Parameters.AddWithValue("@username", txtEmail.Text);
                cmd.ExecuteNonQuery();
                ErrorMsg.Text = "Done";
            }
            closeConnection();

        }
    }
}