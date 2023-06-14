using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class rentVehicle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand viewProc = new SqlCommand("viewVehicle", conn);
            viewProc.CommandType = CommandType.StoredProcedure;

            SqlCommand viewInsuranceProc = new SqlCommand("viewInsurances", conn);
            viewInsuranceProc.CommandType = CommandType.StoredProcedure;


            conn.Open();
            DropDownList1.DataTextField = "model";
            DropDownList1.DataValueField = "id";
            SqlDataReader rdr = viewProc.ExecuteReader(CommandBehavior.CloseConnection);
            DropDownList1.DataSource = rdr;
            DropDownList1.DataBind();
            conn.Close();


            conn.Open();
            DropDownList2.DataTextField = "number";
            DropDownList2.DataValueField = "number";
            SqlDataReader rdr1 = viewInsuranceProc.ExecuteReader(CommandBehavior.CloseConnection);
            DropDownList2.DataSource = rdr1;
            DropDownList2.DataBind();
            conn.Close();


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand rentProc = new SqlCommand("rentTime", conn);
            rentProc.CommandType = CommandType.StoredProcedure;

            rentProc.Parameters.Add(new SqlParameter("@vehicle", SqlDbType.Int)).Value = DropDownList1.SelectedValue;
            rentProc.Parameters.Add(new SqlParameter("@insurance", SqlDbType.VarChar)).Value = DropDownList2.SelectedValue;
            rentProc.Parameters.Add(new SqlParameter("@customer_ssn", SqlDbType.VarChar)).Value = Session["user"];
            rentProc.Parameters.Add(new SqlParameter("@time", SqlDbType.DateTime)).Value = TextBox1.Text;
            rentProc.Parameters.Add(new SqlParameter("@destination", SqlDbType.VarChar)).Value = TextBox2.Text;

            conn.Open();
            rentProc.ExecuteNonQuery();
            conn.Close();


            //Response.Redirect("availableVehicles.aspx");

            Label lbl_message = new Label();
            lbl_message.Text = "Vehicle was rented successfully";
            form1.Controls.Add(lbl_message);

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("availableVehicles.aspx");
        }
    }
}