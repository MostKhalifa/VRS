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
    public partial class Extras : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("viewExtra", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            conn.Open();
            SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                int id = rdr.GetInt32(rdr.GetOrdinal("id"));
                string type = rdr.GetString(rdr.GetOrdinal("type"));
                decimal rate = rdr.GetDecimal(rdr.GetOrdinal("rate"));

                Label lbl_id = new Label();
                lbl_id.Text = "ID: " +id + " ";
                Panel1.Controls.Add(lbl_id);

                Label lbl_type = new Label();
                lbl_type.Text = "Type: " + type + " ";
                Panel1.Controls.Add(lbl_type);

                Label lbl_rate = new Label();
                lbl_rate.Text = "Rate: " + rate + "<br/>";
                Panel1.Controls.Add(lbl_rate);

            }
        }

        protected void SortR_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("viewExtraOrdered", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            conn.Open();
            SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            Panel1.Controls.Clear();
            while (rdr.Read())
            {
                int id = rdr.GetInt32(rdr.GetOrdinal("id"));
                string type = rdr.GetString(rdr.GetOrdinal("type"));
                decimal rate = rdr.GetDecimal(rdr.GetOrdinal("rate"));

                Label lbl_id = new Label();
                lbl_id.Text = "ID: " + id + " ";
                Panel1.Controls.Add(lbl_id);

                Label lbl_type = new Label();
                lbl_type.Text = "Type: " + type + " ";
                Panel1.Controls.Add(lbl_type);

                Label lbl_rate = new Label();
                lbl_rate.Text = "Rate: " + rate + "<br/>";
                Panel1.Controls.Add(lbl_rate);

            }
        }

        protected void RentB_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("rentExtra", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            string ssnr = ssnT.Text;
            int etr;

            try
            {
                etr = int.Parse(ExtraID.Text);
            }
            catch
            {
                Response.Write("Please eneter Extra ID number");
                return;
            }

            cmd.Parameters.Add(new SqlParameter("@ssn", ssnr));
            cmd.Parameters.Add(new SqlParameter("@id", etr));

            Response.Write("Extra Rented");

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        protected void SortO_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("viewMinPerType", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            conn.Open();
            SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);


           while (rdr.Read())
            {

               // int id = rdr.GetInt32(rdr.GetOrdinal("ID"));
                string type = rdr.GetString(rdr.GetOrdinal("type"));
                decimal rate = rdr.GetDecimal(rdr.GetOrdinal("Minimum Rate"));

               // Label lbl_rid = new Label();
               // lbl_rid.Text = "ID: " + id + " ";
               // Panel2.Controls.Add(lbl_rid);

                Label lbl_rtype = new Label();
                lbl_rtype.Text = "Type: " + type + " ";
                Panel2.Controls.Add(lbl_rtype);

                Label lbl_rrate = new Label();
                lbl_rrate.Text = "Rate: " + rate + "<br/>";
                Panel2.Controls.Add(lbl_rrate);
            }
        }
    }
}