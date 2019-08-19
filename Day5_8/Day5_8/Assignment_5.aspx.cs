using MySql.Data.MySqlClient;
using System;
using System.Configuration;
using System.Data;
using System.Text;
using System.Web.UI;

namespace Day5_8
{
    public partial class Assignment_5 : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Assign();
            }
        }
        protected void Assign()
        {
            try
            {
                string cstring = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
                MySqlConnection con = new MySqlConnection(cstring);
                MySqlCommand cmd = new MySqlCommand("select EmployeeID from employees", con);
                MySqlDataAdapter sda = new MySqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                DdlEmployeeID.DataSource = dt;
                DdlEmployeeID.DataTextField = "EmployeeID";
                DdlEmployeeID.DataValueField = "EmployeeID";
                DdlEmployeeID.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {
                //if (sqlconn.State == ConnectionState.Open)
                //{
                //    sqlconn.Close();
                //}
                //objconst = null;
                //strBrInsert = null;
                //sqlconn = null;
                //sqlcmd = null;
                //sqladapter = null;
                //dttable = null;
            }
        }
        protected void BtnInsert_Click(object sender, EventArgs e)

        {
            AllMessage m;
            MySqlCommand Check_TerritoryID;
            MySqlCommand Check_EmployeeID_TerritoryID;
            int TerritoryID_Exist;
            int EmployeeID_TerritoryID_Exist;
            try
            {
                    string cstring = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
                    MySqlConnection con = new MySqlConnection(cstring);
                    if (con != null && con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    //Check if TerritoryID Present in in Territory Table
                    StringBuilder strTerr = new StringBuilder("select TerritoryID from Territories where (TerritoryID='" + TxtTerritoryID.Text + "')");
                    Check_TerritoryID = new MySqlCommand(strTerr.ToString(), con);
                    TerritoryID_Exist = Convert.ToInt32(Check_TerritoryID.ExecuteScalar());

                    //Check if TerritoryID for corresponding EmployeeID are present in Employeeterritories Table
                    StringBuilder strEmpTerr = new StringBuilder("select EmployeeID,TerritoryID from EmployeeTerritories WHERE EmployeeID='" + DdlEmployeeID.SelectedValue + "' AND TerritoryID='" + TxtTerritoryID.Text + "';");
                    Check_EmployeeID_TerritoryID = new MySqlCommand(strEmpTerr.ToString(), con);
                    EmployeeID_TerritoryID_Exist = Convert.ToInt32(Check_EmployeeID_TerritoryID.ExecuteScalar());
                    if (TerritoryID_Exist <= 0)
                    {
                        m = new AllMessage();
                        ClientScript.RegisterStartupScript(this.GetType(), "msgbox", "alert('" + m.stralertmessageTerritoryID + "');", true);
                    }
                    else if (EmployeeID_TerritoryID_Exist > 0)
                    {
                        m = new AllMessage();
                        ClientScript.RegisterStartupScript(this.GetType(), "msgbox", "alert('" + m.stralertmessageEmp_Terr_ID + "');", true);
                    }
                    else
                    {
                        MySqlCommand cmd2 = new MySqlCommand("insert into EmployeeTerritories (EmployeeID,TerritoryID) values ('" + DdlEmployeeID.SelectedItem.Value.ToString() + "','" + TxtTerritoryID.Text + "');", con);
                        cmd2.ExecuteNonQuery();
                        m = new AllMessage();
                        ClientScript.RegisterStartupScript(this.GetType(), "msgbox", "alert('" + m.stralertSuccessfulInsert + "');", true);
                    }
            }
            catch (Exception ex)
            {
                Response.Redirect(ex.Message);
            }
            finally
            {
                //if (con.State == ConnectionState.Open)
                //{
                //    sqlconn.Close();
                //}
                //sqlcmd = null;
                //strBrInsertQuery = null;
                //objconstmsg = null;
                //strBrInsertQuery = null;
                //Check_TerritoryID = null;
                //Check_EmployeeID_TerritoryID = null;
                //strBrTerritoryID = null;
                //strBrEmp_Terr_ID = null;
                //TxtTerritoryID.Text = "";
            }
        }
    }
}