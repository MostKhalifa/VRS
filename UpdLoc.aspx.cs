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
    public partial class UpdLoc : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submit_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("updateLocation", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            string ssnr = newLoc.Text;
            int etr;

            try
            {
                etr = int.Parse(vid.Text);
            }
            catch (Exception)
            {
                Response.Write("Please enter vehicle ID number");
                return;
            }

            cmd.Parameters.Add(new SqlParameter("@vehicle", etr));
            cmd.Parameters.Add(new SqlParameter("@location", ssnr));
            SqlParameter successBit = cmd.Parameters.Add("@success", SqlDbType.Int);
            successBit.Direction = ParameterDirection.Output;

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();


            //if (count.Value.ToString().Equals("1"))
            if (successBit.Value.ToString().Equals("1"))
            {


                Response.Write("Location Updated");

            }
            else
            {
                Response.Write("Location Unchanged");

            }



        }
    }
}