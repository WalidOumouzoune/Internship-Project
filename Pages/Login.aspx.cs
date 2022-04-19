using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Text;


namespace CNRST
{
    public partial class Login : System.Web.UI.Page
    {
        static SqlConnection cnx = new SqlConnection(@"Data Source=WALID\SQLEXPRESS;Initial Catalog= CnrstUser ;Integrated Security=True");
        SqlCommand cmd =  new SqlCommand("", cnx);
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void Btnregister_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
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
        protected void SignServer_Click(object sender, EventArgs e)
        {
            try
            {
                openConnection();
                string Query = "SELECT * FROM UserInfo WHERE UserName = @username AND UserPassword = @userpassword";
                cmd.CommandText = Query;
                // avoid sql injection
                cmd.Parameters.AddWithValue("@username", UserText.Text);
                cmd.Parameters.AddWithValue("@userpassword", PassText.Text);
                SqlDataReader rd = cmd.ExecuteReader();
                DataTable dr = new DataTable();
                dr.Load(rd);
                if (dr.Rows.Count == 0)
                    LblEmailPass.Text = "The username or password is incorrect";
                else
                {
                    Session["UserName"] = dr.Rows[0]["UserName"];
                    Response.Redirect("Home.aspx");
                }
                closeConnection();
            }
            catch (Exception )
            {
                Response.Write("Somthing went wrong");
                closeConnection();

            }
        }


    }
}