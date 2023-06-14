using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class custRentAll : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand listSuperCustomers = new SqlCommand("ViewPremiumCustomers", conn);
            listSuperCustomers.CommandType = CommandType.StoredProcedure;

            conn.Open();
            SqlDataReader reader = listSuperCustomers.ExecuteReader(CommandBehavior.CloseConnection);
            while (reader.Read())
            {
                string SSN = reader.GetString(reader.GetOrdinal("SSN"));
                Label id = new Label();
                id.Text = "Customers SSNs: " + SSN + "<br>";
                form1.Controls.Add(id);
            }

        }
        
    }
}