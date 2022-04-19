using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace CNRST
{
    public partial class Register : System.Web.UI.Page
    {
        static SqlConnection cnx = new SqlConnection(@"Data Source=WALID\SQLEXPRESS;Initial Catalog= CnrstUser ;Integrated Security=True");
        SqlCommand cmd = new SqlCommand("", cnx);

        protected void Page_Load(object sender, EventArgs e)
        {
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
        protected void BtnSign_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
        protected void Btnregister_Click(object sender, EventArgs e)
        {
            SqlDataReader rd;
            DataTable dr = new DataTable();
                openConnection();
                string Query = "SELECT * FROM UserInfo WHERE UserName = @username;";
                cmd.CommandText = Query;
                // avoid sql injection
                cmd.Parameters.AddWithValue("@username", UserText.Text);
                rd = cmd.ExecuteReader();
                dr.Load(rd);
                if (dr.Rows.Count > 0)
                    ErrorMsg.Text = "please try another Username";
                else
                {
                    Query = "INSERT INTO UserInfo(UserName,UserPassword,FullName) VALUES (@Usernamee,@userpassword,@fullname) ";
                    cmd.CommandText = Query;
                    cmd.Parameters.AddWithValue("@Usernamee", UserText.Text);
                    cmd.Parameters.AddWithValue("@userpassword",PassText.Text);
                    cmd.Parameters.AddWithValue("@fullname", TxtName.Text);
                    cmd.ExecuteNonQuery();
                    Response.Redirect("Login.aspx");
                }
                closeConnection();
        }
        
        public string Base64Encode(string plainText)
        {
            var plainTextBytes = Encoding.UTF8.GetBytes(plainText);
            return Convert.ToBase64String(plainTextBytes);
        }

       
    }
}