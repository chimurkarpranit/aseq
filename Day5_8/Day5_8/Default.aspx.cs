using MySql.Data.MySqlClient;
using System;
using System.Configuration;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Day5_8
{
    public partial class _Default : Page
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
                MySqlCommand cmd = new MySqlCommand("select EmployeeID,FirstName,LastName,City,Salary,Notes from employees", con);
                MySqlDataAdapter sda = new MySqlDataAdapter();
                sda.SelectCommand = cmd;
                DataSet ds = new DataSet();
                sda.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
            catch(Exception ex)
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
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                string cstring = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
                MySqlConnection con = new MySqlConnection(cstring);
                GridViewRow row = GridView1.Rows[e.RowIndex];
                con.Open();
                MySqlCommand cmd1 = new MySqlCommand("SET FOREIGN_KEY_CHECKS = 0;" + "delete FROM employees where EmployeeID=" + Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()) + "", con);
                cmd1.ExecuteNonQuery();
                con.Close();
                BindGrid();
            }
            catch(Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                string cstring = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
                MySqlConnection con = new MySqlConnection(cstring);
                int EmpID = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
                GridViewRow row = GridView1.Rows[e.RowIndex];
                TextBox textFirstName = (TextBox)row.Cells[1].Controls[0];
                TextBox textLastName = (TextBox)row.Cells[2].Controls[0];
                TextBox textCity = (TextBox)row.Cells[3].Controls[0];
                TextBox textsalary = (TextBox)row.Cells[4].Controls[0];
                TextBox textnotes = (TextBox)row.Cells[5].Controls[0];

                GridView1.EditIndex = -1;
                con.Open();
                MySqlCommand cmd = new MySqlCommand("update employees set FirstName='" + textFirstName.Text + "',LastName='" + textLastName.Text + "',City='" + textCity.Text + "',Salary='" + textsalary.Text + "',Notes='" + textnotes.Text + "' where EmployeeID='" + EmpID + "'", con);
                cmd.ExecuteNonQuery();
                con.Close();
                BindGrid();
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
            try
            {
                string FirstName = textFirstName.Text;
                string LastName = textLastName.Text;
                string City = textCity.Text;
                string Salary = textSalary.Text;
                string Notes = textNotes.Text;
                textFirstName.Text = "";
                textLastName.Text = "";
                textCity.Text = "";
                textSalary.Text = "";
                textNotes.Text = "";
                string cstring = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
                MySqlConnection con = new MySqlConnection(cstring);
                MySqlCommand cmd = new MySqlCommand("INSERT INTO employees(FirstName, LastName, City, Salary, Notes ) VALUES ( " + "'" + FirstName + "'" + "," + "'" + LastName + "'" + "," + "'" + City + "'" + "," + Salary + "," + "'" + Notes + "'" + ")", con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                BindGrid();
            }
            catch(Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
    }
}