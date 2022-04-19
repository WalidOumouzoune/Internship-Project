using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.IO;
using System.Linq;
using System.Web.UI.WebControls;

namespace CNRST
{
    public partial class Home : System.Web.UI.Page
    {
        public object FileUploadServer { get; private set; }
        DataTable AppTable = new DataTable();
        DataTable ExpTable = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            // if the Session has a value it means that the user has already entered a correct email and password
            // other wise the user is trying to access this page without login 

            if (Session["UserName"] == null)
                Response.Redirect("Login.aspx");

            LblUp2.Text = "";
            lblSelect.Text = "";

            if (!IsPostBack)
            {
                DataTable dt = new DataTable();
                dt.Columns.AddRange(new DataColumn[3] { new DataColumn("Projects"), new DataColumn("Criteria"), new DataColumn("Experts") });
                ViewState["ViewCriteria"] = dt;
            }
        }
        public DataTable importExcel(GridView GridName, FileUpload fileUpName, string Query)
        {
            DataTable dt = new DataTable();
            GridName.DataSource = null;
            try
            {
                //******** Part 1**********

                string ConStr = string.Empty;
                string ext = Path.GetExtension(fileUpName.FileName).ToLower();
                string path = Server.MapPath("~/Data/" + fileUpName.FileName);  // "Data" Folder will the host for our Excel file
                fileUpName.SaveAs(path);
                // check excel file extentsion 
                if (ext.Trim() == ".xls")
                {
                    // ConnectionString for the oldest verison of excel
                    ConStr = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + path + ";Extended Properties=\"Excel 8.0;HDR=YES;IMEX=2\"";
                }
                else if (ext.Trim() == ".xlsx")
                {
                    // ConnectionString for newest vireson of excel
                    ConStr = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + path + ";Extended Properties=\"Excel 8.0;HDR=YES;IMEX=2\"";
                }


                // execute Query and Fill GridView With Excel Table


                OleDbConnection con = new OleDbConnection(ConStr);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                OleDbCommand cmd = new OleDbCommand(Query, con);
                OleDbDataAdapter ad = new OleDbDataAdapter(cmd);
                ad.Fill(dt);
                GridName.DataSource = dt;
                GridName.DataBind();
                con.Close();
            }
            catch (Exception)
            {
                Response.Write("Oops somthing went wrong");
                return dt;
            }
            // <returns> DataTable that represent excel's data </returns>//
            return dt;
        }
        protected void BtnUpload_Click(object sender, EventArgs e)
        {
            LblUp1.Text = "";
            if (FileUpload1.HasFile)
            {
                string Query = "SELECT * FROM [sheet1$]";
                AppTable = importExcel(GridExl, FileUpload1, Query);
                Session["AppSessionTable"] = AppTable;
                DropDowListCharge(AppTable, DropdApp);
                return;
            }
            LblUp1.Text = "Choose a file first";
        }
        protected void BtnUpload2_Click(object sender, EventArgs e)
        {
            LblUp2.Text = "";
            if (FileUpload2.HasFile)
            {
                string Query = "SELECT * FROM [sheet1$]";
                ExpTable = importExcel(SecGrid, FileUpload2, Query);
                Session["ExpSessionTable"] = ExpTable;
                DropDowListCharge(ExpTable, DropdExp);
                ListBoxCharge(ExpTable, ListBox1);
                return;
            }
            LblUp2.Text = "Choose a file first";

        }
        public void DropDowListCharge(DataTable dt, DropDownList Dp)
        {
            // to avoid duplicate items in the same dropdownlist
            Dp.Items.Clear();  

            // fill Dropdonwlist with columns' names
            foreach (DataColumn column in dt.Columns)
            {
                Dp.Items.Add(column.ColumnName);
            }
        }
        public void ListBoxCharge(DataTable dt, ListBox ListBoxParam)
        {
            // to avoid duplicate items in the same ListBox
            ListBoxParam.Items.Clear();  
            // fill ListBox with columns' names
            foreach (DataColumn column in dt.Columns)
            {
                ListBoxParam.Items.Add(column.ColumnName);
            }
        }
        public bool CompareLists(List<string> ListParam1, List<string> ListParam2)
        {
            for (int i = 0; i < ListParam1.Count; i++)
                if (ListParam1[i] != ListParam2[i])
                    return false;
            return true;
        }
        List<string> expectedCriteria = new List<string>();
        public List<string> ListOfCriteria()
        {
            DataTable CrtTable = (DataTable)ViewState["ViewCriteria"];

            // loop over CriteriaTable and extract the values of Criteria column 

            for (int i = 0; i < CrtTable.Rows.Count; i++)
            {
                if (CrtTable.Rows[i][1].ToString() == "Contains") 
                    expectedCriteria.Add("Contains");
                else
                    expectedCriteria.Add("Not Contains");
            }
            // return expectedCriteria with extracted values
            return expectedCriteria;  
        }
        public bool IsColumnExist(DataTable dt)
        {
            foreach (DataColumn column in dt.Columns)
            {
                if (column.ColumnName == "assignment")
                    return true;
            }
            return false;
        }
        public void filterV2()
        {
            DataTable CrtTable = (DataTable)ViewState["ViewCriteria"];
            AppTable = (DataTable)Session["AppSessionTable"];
            ExpTable = (DataTable)Session["ExpSessionTable"];
            DataTable MergeDataTables = AppTable;

            if (AppTable == null)
            {
                LblUp1.Text = " Upload a file first";
                return;
            }
            else if (ExpTable == null)
            {
                LblUp2.Text = " Upload a file first";
                return;
            }
            else
            {
                // avoid duplicate columns in the same datatable
                if (!IsColumnExist(AppTable))
                {
                    MergeDataTables.Columns.Add("assignment", typeof(string));
                }
                else
                {
                    MergeDataTables.Columns.Remove("assignment");
                    MergeDataTables.Columns.Add("assignment", typeof(string));
                }

                for (int i = 0; i < AppTable.Rows.Count; i++)
                {
                    for (int j = 0; j < ExpTable.Rows.Count; j++)
                    {
                        List<string> Criteria = new List<string>();

                        for (int x = 0; x < CrtTable.Rows.Count; x++)
                        {
                            
                            string ProjectCondition = string.Concat(AppTable.Rows[i][CrtTable.Rows[x][0].ToString()].ToString().Where(c => !char.IsWhiteSpace(c))).ToUpper();
                            string ExpCondition = string.Concat(ExpTable.Rows[j][CrtTable.Rows[x][2].ToString()].ToString().Where(c => !char.IsWhiteSpace(c))).ToUpper();

                            if (ProjectCondition.Contains(ExpCondition))
                            {
                                Criteria.Add("Contains");
                            }
                            else if (!ProjectCondition.Contains(ExpCondition))
                            {
                                Criteria.Add("Not Contains");
                            }
                        }

                        if (CompareLists(expectedCriteria, Criteria))
                        {
                            foreach (ListItem item in ListBox1.Items)
                            {
                                if (item.Selected)
                                {
                                    MergeDataTables.Rows[i]["assignment"] += ExpTable.Rows[j][item.Text] + ", ";
                                }
                            }
                            MergeDataTables.Rows[i]["assignment"] = MergeDataTables.Rows[i]["assignment"] + "|| ";
                        }
                    }
                }
                // MergeDataTables will be a part of another page that's why we store it in Session
                Session["AppSessionExpPage"] = MergeDataTables;
                Response.Redirect("Experts.aspx");

            }
        }
        protected void BtnfilterFiles_Click(object sender, EventArgs e)
        {
            ListOfCriteria();
            filterV2();
        }
        protected void btnreset_Click(object sender, EventArgs e)
        {
            // reset all dropdowslist to the default value and Remove Criteria Table in case we want to change

            DropdExp.SelectedIndex = 0;
            DropdApp.SelectedIndex = 0;
            DropdComp.SelectedIndex = 0;
            DataTable ClearData = (DataTable)ViewState["ViewCriteria"];
            ClearData.Rows.Clear();
            ViewState["ViewCriteria"] = ClearData;
            GridDropDown.DataSource = ViewState["ViewCriteria"];
            GridDropDown.DataBind();
        }
        public bool IsDropDownListEmpty()
        {
            // this function will be used in BtnAddToGrid
            if (DropdApp.Text.Contains( "Select") || DropdExp.Text.Contains("Select") || DropdComp.Text.Contains("Select"))
                return true;
            return false;
        }
        protected void btnAddTooCriteriaTable_Click(object sender, EventArgs e)
        {
            lblSelect.Text = "";
            if (IsDropDownListEmpty())
            {
                lblSelect.Text = "Please Select a value ";
                return;
            }
            DataTable dtDrop = (DataTable)ViewState["ViewCriteria"];
            dtDrop.Rows.Add(DropdApp.SelectedValue, DropdComp.SelectedValue, DropdExp.SelectedValue);
            ViewState["ViewCriteria"] = dtDrop;
            GridDropDown.DataSource = dtDrop;
            GridDropDown.DataBind();
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
        public void logout_serverClick(object sender, EventArgs e)
        {
            // clear the Session that user has created at the first time (while he was writing password and email)
            Session.Clear();
            Response.Redirect("Login.aspx");
        }
    }
}