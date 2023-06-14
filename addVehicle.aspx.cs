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
    public partial class addVehicle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            String class1 = DropDownList1.SelectedValue.ToString();
            String brand = brandBox.Text;
            String model = modelBos.Text;
            String gps = gpsBox.Text;
            int rate;

            try
            {
                rate = Int16.Parse(rateBox.Text);
            }
            catch (Exception)
            {
                Response.Write("Enter a number in Rate box");
                return;
            }


            SqlCommand add = new SqlCommand("AddVehicle", conn);
            add.CommandType = CommandType.StoredProcedure;

            add.Parameters.Clear();
            add.Parameters.Add(new SqlParameter("@class", class1));
            add.Parameters.Add(new SqlParameter("@brand", brand));
            add.Parameters.Add(new SqlParameter("@model", model));
            add.Parameters.Add(new SqlParameter("@rate", rate));
            add.Parameters.Add(new SqlParameter("@gps_loc", gps));

            if (class1.Length == 0 || brand.Length == 0 || model.Length == 0 || gps.Length == 0)
            {
                Response.Write("Enter valid data in the boxes below");
            }
            else
            {
                Response.Write("Vehicle added!");
                conn.Open();
                add.ExecuteNonQuery();
                conn.Close();
                Response.Redirect("employeeMain.aspx");
            }

        }
    }
}