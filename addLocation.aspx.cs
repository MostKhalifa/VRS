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
    public partial class addLocation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int pin;
            String loc = gpsBox.Text;

            SqlCommand add = new SqlCommand("AddLocation", conn);
            add.CommandType = CommandType.StoredProcedure;

            try
            {
                pin = Int16.Parse(pinNoBox.Text);
            }
            catch (Exception)
            {
                Response.Write("Enter a valid pin number");
                return;
            }

            add.Parameters.Clear();
            add.Parameters.Add(new SqlParameter("@pin_number", pin));
            add.Parameters.Add(new SqlParameter("@gps_location", loc));

            if (loc.Length == 0)
                Response.Write("Enter a valid location");

            else
            {
                Response.Write("Location Added");
                conn.Open();
                add.ExecuteNonQuery();
                conn.Close();
                Response.Redirect("employeeMain.aspx");
            }

        }
    }
}