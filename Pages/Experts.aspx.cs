using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CNRST
{
    public partial class Experts : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dtApp = new DataTable();
            dtApp = (DataTable)Session["AppSessionExpPage"];
            GridApp_Exp.DataSource = null;
            GridApp_Exp.DataSource = dtApp;
            GridApp_Exp.DataBind();
            if (Session["UserName"] == null)
            {
                Response.Redirect("Login.aspx");
            }
                
        }
        protected void btnExportToExcel_Click(object sender, EventArgs e)
        {
            if (GridApp_Exp.Rows.Count < 0)
                return;
            // Clear all content output from the buffer stream
            Response.ClearContent();
            // Specify the default file name using "content-disposition" RESPONSE header
            Response.AppendHeader("content-disposition", "attachment; filename=Application_Expt.xls");
            // Set excel as the HTTP MIME type
            Response.ContentType = "application/excel";
            // Create an instance of stringWriter for writing information to a string
            System.IO.StringWriter stringWriter = new System.IO.StringWriter();
            // Create an instance of HtmlTextWriter class for writing markup 
            // characters and text to an ASP.NET server control output stream
            HtmlTextWriter htw = new HtmlTextWriter(stringWriter);

            // Set white color as the background color for gridview header row
            GridApp_Exp.HeaderRow.Style.Add("background-color", "#FFFFFF");

            // Set background color of each cell of GridView1 header row
            foreach (TableCell tableCell in GridApp_Exp.HeaderRow.Cells)
            {
                tableCell.Style["background-color"] = "#A55129";
            }

            // Set background color of each cell of each data row of GridView1
            foreach (GridViewRow gridViewRow in GridApp_Exp.Rows)
            {
                gridViewRow.BackColor = System.Drawing.Color.White;
                foreach (TableCell gridViewRowTableCell in gridViewRow.Cells)
                {
                    gridViewRowTableCell.Style["background-color"] = "#FFF7E7";
                }
            }
            GridApp_Exp.RenderControl(htw);
            Response.Write(stringWriter.ToString());
            Response.End();
        }
        // this function is used to override over a .NET function 
        public override void VerifyRenderingInServerForm(Control control){}
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

    }
}