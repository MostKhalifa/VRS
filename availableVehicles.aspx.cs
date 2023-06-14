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
    public partial class availableVehicles : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            String connStr = WebConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand viewProc = new SqlCommand("viewVehicle", conn);
            viewProc.CommandType = CommandType.StoredProcedure;

            SqlCommand viewRateProc = new SqlCommand("viewVehicleRating", conn);
            viewRateProc.CommandType = CommandType.StoredProcedure;


            conn.Open();
            SqlDataReader rdr = viewProc.ExecuteReader(CommandBehavior.CloseConnection);
            GridView1.DataSource = rdr;
            GridView1.DataBind();
            conn.Close();

            conn.Open();
            SqlDataReader rdr1 = viewRateProc.ExecuteReader(CommandBehavior.CloseConnection);
            GridView2.DataSource = rdr1;
            GridView2.DataBind();
            conn.Close();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand viewbyBrandProc = new SqlCommand("orderVehiclesByBrand", conn);
            viewbyBrandProc.CommandType = CommandType.StoredProcedure;

            conn.Open();
            SqlDataReader rdr = viewbyBrandProc.ExecuteReader(CommandBehavior.CloseConnection);
            GridView1.DataSource = rdr;
            GridView1.DataBind();
            conn.Close();

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand viewbyClassProc = new SqlCommand("orderVehiclesByClass", conn);
            viewbyClassProc.CommandType = CommandType.StoredProcedure;

            conn.Open();
            SqlDataReader rdr = viewbyClassProc.ExecuteReader(CommandBehavior.CloseConnection);
            GridView1.DataSource = rdr;
            GridView1.DataBind();
            conn.Close();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand viewbyRateProc = new SqlCommand("orderVehiclesByRate", conn);
            viewbyRateProc.CommandType = CommandType.StoredProcedure;

            conn.Open();
            SqlDataReader rdr = viewbyRateProc.ExecuteReader(CommandBehavior.CloseConnection);
            GridView1.DataSource = rdr;
            GridView1.DataBind();
            conn.Close();
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand viewNonRentedProc = new SqlCommand("getNonRentedVehicles", conn);
            viewNonRentedProc.CommandType = CommandType.StoredProcedure;

            conn.Open();
            SqlDataReader rdr = viewNonRentedProc.ExecuteReader(CommandBehavior.CloseConnection);
            GridView1.DataSource = rdr;
            GridView1.DataBind();
            conn.Close();
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("availableInsurance.aspx");
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            Response.Redirect("rentVehicle.aspx");
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            Response.Redirect("profile.aspx");

        }
    }
}