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
    public partial class profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand viewProc = new SqlCommand("ViewCustProfile", conn);
            viewProc.CommandType = CommandType.StoredProcedure;

            viewProc.Parameters.Add(new SqlParameter("@ssn",Session["user"]));

            conn.Open();
            SqlDataReader rdr = viewProc.ExecuteReader(CommandBehavior.CloseConnection);
            GridView2.DataSource = rdr;
            GridView2.DataBind();
            conn.Close();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("updateInfo.aspx");
        }

        protected void Button2_Click1(object sender, EventArgs e)
        {
            Response.Redirect("paymentInfo.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("availableVehicles.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand viewAccidentsProc = new SqlCommand("viewMyAccidents", conn);
            viewAccidentsProc.CommandType = CommandType.StoredProcedure;

            viewAccidentsProc.Parameters.Add(new SqlParameter("@customer_ssn", SqlDbType.VarChar)).Value = Session["user"];
            GridView gv1 = new GridView();
            form1.Controls.Add(gv1);

            conn.Open();
            SqlDataReader rdr = viewAccidentsProc.ExecuteReader(CommandBehavior.CloseConnection);
            gv1.DataSource = rdr;
            gv1.DataBind();
            conn.Close();


        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand viewPaymentProc = new SqlCommand("viewRemainingPayments", conn);
            viewPaymentProc.CommandType = CommandType.StoredProcedure;

            viewPaymentProc.Parameters.Add(new SqlParameter("@customer_ssn", SqlDbType.VarChar)).Value = Session["user"];
            GridView gv2 = new GridView();
            form1.Controls.Add(gv2);

            conn.Open();
            SqlDataReader rdr = viewPaymentProc.ExecuteReader(CommandBehavior.CloseConnection);
            gv2.DataSource = rdr;
            gv2.DataBind();
            conn.Close();

        }
    }
}