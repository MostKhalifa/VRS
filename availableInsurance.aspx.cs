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
    public partial class availableInsurance : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand viewInsuranceProc = new SqlCommand("viewInsurances", conn);
            viewInsuranceProc.CommandType = CommandType.StoredProcedure;
            SqlCommand viewInsuranceCountProc = new SqlCommand("countAccidentsPerInsurance", conn);
            viewInsuranceCountProc.CommandType = CommandType.StoredProcedure;


            conn.Open();
            SqlDataReader rdr = viewInsuranceProc.ExecuteReader(CommandBehavior.CloseConnection);
            GridView1.DataSource = rdr;
            GridView1.DataBind();
            conn.Close();

            conn.Open();
            SqlDataReader rdr1 = viewInsuranceCountProc.ExecuteReader(CommandBehavior.CloseConnection);
            GridView2.DataSource = rdr1;
            GridView2.DataBind();
            conn.Close();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand viewInsuranceRateProc = new SqlCommand("viewInsurancesRates", conn);
            viewInsuranceRateProc.CommandType = CommandType.StoredProcedure;


            conn.Open();
            SqlDataReader rdr = viewInsuranceRateProc.ExecuteReader(CommandBehavior.CloseConnection);
            GridView1.DataSource = rdr;
            GridView1.DataBind();
            conn.Close();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("availableVehicles.aspx");

        }
    }
}