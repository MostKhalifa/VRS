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
    public partial class paymentInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand viewCreditCards = new SqlCommand("viewOnlinePayment", conn);
            viewCreditCards.CommandType = CommandType.StoredProcedure;

            viewCreditCards.Parameters.Add(new SqlParameter("@ssn", Session["user"]));

            conn.Open();
            SqlDataReader rdr = viewCreditCards.ExecuteReader(CommandBehavior.CloseConnection);
            GridView1.DataSource = rdr;
            GridView1.DataBind();
            conn.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("updatePayment.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("profile.aspx");
        }
    }
}