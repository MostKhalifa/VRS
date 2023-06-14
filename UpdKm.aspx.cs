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
    public partial class UpdKm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void UpB_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("UpdateBattery", conn);
            SqlCommand cmd2 = new SqlCommand("UpdateDiesel", conn);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd2.CommandType = CommandType.StoredProcedure;

            string veh = vehID.Text;
            decimal KMBR;

            try
            {
                KMBR = int.Parse(upV.Text);
            }
            catch (Exception)
            {
                Response.Write("Please enter a valid number");
                return;
            }

            if (Typeddl.SelectedIndex.ToString().Equals("Motor"))
            {
                cmd2.Parameters.Add(new SqlParameter("@vehicle", veh));
                cmd2.Parameters.Add(new SqlParameter("@battery", KMBR));
                Response.Write("Updated");
            }
            else
            {

                cmd.Parameters.Add(new SqlParameter("@vehicle", veh));
                cmd.Parameters.Add(new SqlParameter("@battery", KMBR));
                Response.Write("Updated");
            }


            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();



        }

    }
}
