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
    public partial class UnavailVeh : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("GetUnavailableVehicles", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            conn.Open();
            SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                int id = rdr.GetInt32(rdr.GetOrdinal("id"));
                Boolean owned = rdr.GetBoolean(rdr.GetOrdinal("owned"));
                string vs = rdr.GetString(rdr.GetOrdinal("status"));
                int rate = rdr.GetInt32(rdr.GetOrdinal("rate"));
                string clss = rdr.GetString(rdr.GetOrdinal("class"));
                string brand = rdr.GetString(rdr.GetOrdinal("brand"));
                string model = rdr.GetString(rdr.GetOrdinal("model"));
                int current_milage = rdr.GetInt32(rdr.GetOrdinal("current_milage"));
                string gps_loc = rdr.GetString(rdr.GetOrdinal("gps_loc"));
                object temp2 = rdr.GetValue(rdr.GetOrdinal("location"));
                string loc = temp2.ToString();
                // int loc = rdr.GetInt32(rdr.GetOrdinal("Location"));
                // int loc = rdr.IsDBNull(rdr.GetOrdinal("location")) ? -1 : Convert.ToInt32(rdr["location"]);
                // decimal range = rdr.GetDecimal(rdr.GetOrdinal("fuel"));
                // decimal motor = rdr.GetDecimal(rdr.GetOrdinal("motor"));
                // decimal battery = rdr.GetDecimal(rdr.GetOrdinal("battery"));



                Label lbl_id = new Label();
                lbl_id.Text = "ID:" + id + " " + "<br/>";
                unav.Controls.Add(lbl_id);
               
                Label lbl_owned = new Label();
                lbl_owned.Text = "Owned:" + owned + " " + "<br/>";
                unav.Controls.Add(lbl_owned);

                Label lbl_status = new Label();
                lbl_status.Text = "Status:" + vs + " " + "<br/>";
                unav.Controls.Add(lbl_status);

                Label lbl_rate = new Label();
                lbl_rate.Text = "Rate :" + rate + " " + "<br/>";
                unav.Controls.Add(lbl_rate);

                Label lbl_class = new Label();
                lbl_class.Text = "Class :" + clss + " " + "<br/>";
                unav.Controls.Add(lbl_class);

                Label lbl_brand = new Label();
                lbl_brand.Text = "Brand :" + brand + " " + "<br/>";
                unav.Controls.Add(lbl_brand);

                Label lbl_model = new Label();
                lbl_model.Text = "Model :" + model + " " + "<br/>";
                unav.Controls.Add(lbl_model);

                Label lbl_current_milage = new Label();
                lbl_current_milage.Text = "Current Milage :" + current_milage + " " + "<br/>";
                unav.Controls.Add(lbl_current_milage);

                Label lbl_gps_loc = new Label();
                lbl_gps_loc.Text = "GPS Location :" + gps_loc + " <br/>";
                unav.Controls.Add(lbl_gps_loc);

                if (loc.ToString().Equals(""))
                {
                    Label lbl_loc = new Label();
                    lbl_loc.Text = "";
                    unav.Controls.Add(lbl_loc);

                }
                else
                {
                    Label lbl_loc = new Label();
                    lbl_loc.Text = "location :" + loc + " ";
                    unav.Controls.Add(lbl_loc);
                }


                /*  if (motor.ToString().Equals(""))
                  {
                      Label lbl_mot = new Label();
                      lbl_mot.Text = "";
                      unav.Controls.Add(lbl_mot);

                  }
                  else
                  {
                      Label lbl_mot = new Label();
                      lbl_mot.Text = "Motor :" + motor + " <br/>";
                      unav.Controls.Add(lbl_mot);
                  }

                  if (battery.ToString().Equals(""))
                  {
                      Label lbl_batt = new Label();
                      lbl_batt.Text = "";
                      unav.Controls.Add(lbl_batt);

                  }
                  else
                  {
                      Label lbl_batt = new Label();
                     lbl_batt.Text = "Battery :" + battery + " <br/>";
                     unav.Controls.Add(lbl_batt);
                  } */

            }
        }
    }
}