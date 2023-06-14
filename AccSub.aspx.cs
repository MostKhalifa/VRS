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
    public partial class AccSub : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AccSubmit_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("accidentSubmission", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            string ssn = ssnT.Text;
            string veh = vehT.Text;
            string Desc = AccDesc.Text;

            int vehicle = int.Parse(veh) ;

            cmd.Parameters.Add(new SqlParameter("@ssn", ssn));
            cmd.Parameters.Add(new SqlParameter("@vehicle", vehicle));
            cmd.Parameters.Add(new SqlParameter("@description", Desc));


            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            Response.Write("Accident Submitted");
        }
    }
}