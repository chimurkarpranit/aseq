using MySql.Data.MySqlClient;
using System;
using System.Configuration;
using System.Data;
using System.Text;
using System.Web.UI.WebControls;
namespace Day5_8
{
    public partial class EmployeeTerritories : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }
        protected void BindGrid()
        {
            try
            {
                string cstring = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
                MySqlConnection con = new MySqlConnection(cstring);
                MySqlCommand cmd = new MySqlCommand("select * from employeeterritories", con);
                MySqlDataAdapter sda = new MySqlDataAdapter();
                sda.SelectCommand = cmd;
                DataSet ds = new DataSet();
                sda.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            BindGrid();
        }
        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            BindGrid();
        }
        object EmpDelID, TerrDelID;
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                EmpDelID = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values["EmployeeID"]);
                TerrDelID = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values["TerritoryID"]);
                string cstring = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
                MySqlConnection con = new MySqlConnection(cstring);
                GridViewRow row = GridView1.Rows[e.RowIndex];
                MySqlCommand cmd1 = new MySqlCommand("delete from employeeterritories where EmployeeID = '" + EmpDelID + "' and TerritoryID = '" + TerrDelID +"'", con);
                con.Open();
                cmd1.ExecuteNonQuery();
                con.Close();
                BindGrid();
                ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Record is deleted successfully');", true);
            }
            catch(Exception ex)
            {
                Response.Write(ex.Message);
            }
        }        
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            object EmpUpID, TerrUpID;
            MySqlCommand verifyEmpID;
            MySqlCommand verifyTerID;
            MySqlCommand verifyBoth;
            int empIDExists;
            int terIDExists;
            int bothExists;
            EmpUpID = GridView1.DataKeys[e.RowIndex].Values["EmployeeID"];
            TerrUpID = GridView1.DataKeys[e.RowIndex].Values["TerritoryID"];
            GridViewRow row = GridView1.Rows[e.RowIndex];
            //TextBox textEmployeeID = (TextBox)row.Cells[1].Controls[0];
            //TextBox textTerritoryID = (TextBox)row.Cells[2].Controls[0];
            string empUp = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtEmployeeID")).Text;
            string terrUp = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtTerritoryID")).Text;
            int em = Convert.ToInt32(empUp);
            int ter = Convert.ToInt32(terrUp);
            //TextBox textEmployeeID = row.FindControl("textEmployeeID") as TextBox;
            //TextBox textTerritoryID = row.FindControl("textTerritoryID") as TextBox;
            try
            {
                string cstring = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
                MySqlConnection con = new MySqlConnection(cstring);
                if (con != null && con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                //Checking if EmployeeID exists or not in Employees Table
                StringBuilder strEmp = new StringBuilder("select EmployeeID from Employees where EmployeeID='" + em + "'");
                verifyEmpID = new MySqlCommand(strEmp.ToString(), con);
                empIDExists = Convert.ToInt32(verifyEmpID.ExecuteScalar());
                //Checking if EmployeeID exists or not in Employees Table
                StringBuilder strTer = new StringBuilder("select TerritoryID from Territories where TerritoryID='" + ter + "'");
                verifyTerID = new MySqlCommand(strTer.ToString(), con);
                terIDExists = Convert.ToInt32(verifyTerID.ExecuteScalar());
                //Checking if both ids exists or not in employeeterritories Table
                StringBuilder strBoth = new StringBuilder("select EmployeeID, TerritoryID from employeeterritories where EmployeeID='" + em + "' and TerritoryID='" + ter + "'");
                verifyBoth = new MySqlCommand(strBoth.ToString(), con);
                bothExists = Convert.ToInt32(verifyBoth.ExecuteScalar());
                if (empIDExists == 0)
                {
                    ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('EmployeeID already exists in Employees Table');", true);
                }
                else if (terIDExists == 1)
                {
                    ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('TerritoryID already exists in Territory Table');", true);
                }
                else if (bothExists > 0)
                {
                    ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('EmployeeID and TerritoryID already exists in EmployeeTerritories Table');", true);
                }
                else
                {
                    GridView1.EditIndex = -1;
                    MySqlCommand cmd = new MySqlCommand(" SET FOREIGN_KEY_CHECKS = 0; update employeeterritories set EmployeeID='" + em + "',TerritoryID='" + ter + "' where EmployeeID = '" + EmpUpID + "' and TerritoryID = '" + TerrUpID + "'", con);
                    //con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    BindGrid();
                }
            }
            catch(Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            BindGrid();
        }
        protected void Insert(object sender, EventArgs e)
        {
            //object EmpIDAdd, TerrIDAdd;
            MySqlCommand verifyEmpIDAdd;
            MySqlCommand verifyTerIDAdd;
            MySqlCommand verifyBothAdd;
            int empIDExistsAdd;
            int terIDExistsAdd;
            int bothExistsAdd;
            //GridViewRow row = GridView1.Rows[e.RowIndex];
            //TextBox textEmployeeID = (TextBox)row.Cells[1].Controls[0];
            //TextBox textTerritoryID = (TextBox)row.Cells[2].Controls[0];
            //EmpIDAdd = (TextBox)GridView1.FooterRow.FindControl("textEmployeeID");
            //TerrIDAdd = (TextBox)GridView1.FooterRow.FindControl("textTerritoryID");

            string EmployeeIDAdd = textEmployeeID.Text;
            string TerritoryIDAdd = textTerritoryID.Text;
            textEmployeeID.Text = "";
            textTerritoryID.Text = "";
            try
            {
                string cstring = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
                MySqlConnection con = new MySqlConnection(cstring);
                if (con != null && con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                //Checking if EmployeeID exists or not in Employees Table
                StringBuilder strEmpAdd = new StringBuilder("select EmployeeID from Employees where (EmployeeID='" + EmployeeIDAdd + "')");
                verifyEmpIDAdd = new MySqlCommand(strEmpAdd.ToString(), con);
                empIDExistsAdd = Convert.ToInt32(verifyEmpIDAdd.ExecuteScalar());
                //Checking if EmployeeID exists or not in Employees Table
                StringBuilder strTerAdd = new StringBuilder("select TerritoryID from Territories where (TerritoryID='" + TerritoryIDAdd + "')");
                verifyTerIDAdd = new MySqlCommand(strTerAdd.ToString(), con);
                terIDExistsAdd = Convert.ToInt32(verifyTerIDAdd.ExecuteScalar());
                //Checking if both ids exists or not in employeeterritories Table
                StringBuilder strBothAdd = new StringBuilder("select EmployeeID, TerritoryID from employeeterritories where (EmployeeID='" + EmployeeIDAdd + "' and TerritoryID='" + TerritoryIDAdd + "')");
                verifyBothAdd = new MySqlCommand(strBothAdd.ToString(), con);
                bothExistsAdd = Convert.ToInt32(verifyBothAdd.ExecuteScalar());
                if (empIDExistsAdd == 0)
                {
                    ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('EmployeeID already exists in Employees Table');", true);
                }
                else if (terIDExistsAdd == 1)
                {
                    ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('TerritoryID already exists in Territory Table');", true);
                }
                else if (bothExistsAdd > 0)
                {
                    ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('EmployeeID or TerritoryID already exists in EmployeeTerritories Table');", true);
                }
                else
                {
                    MySqlCommand cmd1 = new MySqlCommand("SET FOREIGN_KEY_CHECKS = 0; INSERT INTO employeeterritories(EmployeeID, TerritoryID) VALUES ( " + "'" + EmployeeIDAdd + "'" + "," + "'" + TerritoryIDAdd + "')", con);
                    cmd1.ExecuteNonQuery();
                    con.Close();
                    BindGrid();
                }
            }
            catch(Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
    }
}