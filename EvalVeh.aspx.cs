using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Part2
{
    public partial class EvalVeh : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RaterB_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("evaluateVehicle", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            int rateV = DropDownList1.SelectedIndex;
            string ss = ssnT.Text;
            int vtr;

            try
            {
                vtr = int.Parse(vehicleT.Text);
            }
            catch (Exception)
            {
                Response.Write("Please enter vehicle ID number");
                return;
            }

                cmd.Parameters.Add(new SqlParameter("@customer_ssn", ss));
                cmd.Parameters.Add(new SqlParameter("@vehicle", vtr));
                cmd.Parameters.Add(new SqlParameter("@rating", rateV));
                Response.Write("Vehicle Evaluated");

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }
    }
}