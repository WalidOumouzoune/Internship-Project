using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;
using System.IO;

namespace CNRST
{
    public partial class Email : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
                Response.Redirect("Login.aspx");
        }
        protected void logout_serverClick(object sender, EventArgs e) 
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }
        protected void SendMail_Click(object sender, EventArgs e)
        {

            //// first you need turn this "https://www.google.com/settings/security/lesssecureapps" on in you gmail account
            //// otheriwse we will not be able to send emails using ur mail
            try
            {
                MailMessage mail = new MailMessage(txtform.Text, txtMail.Text); //create MailMessage class object
                mail.Subject = txtSubject.Text;
                mail.Body = txtMsg.Text;
                if (FileUpload1.HasFile)
                {
                    string FileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    mail.Attachments.Add(new Attachment(FileUpload1.PostedFile.InputStream, FileName));
                }
                mail.IsBodyHtml = false;

                SmtpClient smtp = new SmtpClient(); //Creating Smtp class objec
                smtp.Host = "smtp.gmail.com";
                smtp.EnableSsl = true;

                NetworkCredential NetworkCred = new NetworkCredential(txtform.Text, txtpass.Text);//set Network Credential
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = NetworkCred;
                smtp.Port = 587;
                smtp.Send(mail);
                ErrorMsg.Text = "Done.";
            }
            catch (Exception)
            {
                ErrorMsg.Text = "Password or email is incorrect !!!";
            }
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
    }
}