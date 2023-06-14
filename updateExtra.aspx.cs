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
    public partial class updateExtra : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);


            SqlCommand custView = new SqlCommand("viewAllExtra", conn);
            custView.CommandType = CommandType.StoredProcedure;


            conn.Open();
            SqlDataReader rdr = custView.ExecuteReader(CommandBehavior.CloseConnection);
            GridView1.DataSource = rdr;
            GridView1.DataBind();
            conn.Close();

        }

        protected void speUpBtn_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int id;
            decimal rate;

            SqlCommand updExtra = new SqlCommand("UpdateExtraRate", conn);
            updExtra.CommandType = CommandType.StoredProcedure;


            try
            {
                id = Int16.Parse(idBox.Text);
                
            }

            catch (Exception)
            {
                Response.Write("Enter a valid id from the table below");
                return;
            }

            try
            {
                rate = decimal.Parse(rateBox.Text);
                
            }

            catch (Exception)
            {
                Response.Write("Enter a valid rate (positive number)");
                return;
            }


            updExtra.Parameters.Clear();
            updExtra.Parameters.Add(new SqlParameter("@id", id));
            updExtra.Parameters.Add(new SqlParameter("@rate", rate));

            if(rate < 0)
            {
                Response.Write("Add a valid rate (positive number)");
            }

            else
            {
                Response.Write("Rate is updated");
                conn.Open();
                updExtra.ExecuteNonQuery();
                conn.Close();
                Response.Redirect("employeeMain.aspx");
            }

        }

        protected void allUpBtn_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            String type;
            decimal value;


            SqlCommand updExtra = new SqlCommand("UpdateExtratypeWithVal", conn);
            updExtra.CommandType = CommandType.StoredProcedure;

            try
            {
                type = typeBox.Text;

            }

            catch (Exception)
            {
                Response.Write("Enter a valid type from the table below");
                return;
            }

            try
            {
                value = decimal.Parse(valBox.Text);

            }

            catch (Exception)
            {
                Response.Write("Enter a valid value  (positive number)");
                return;
            }


            updExtra.Parameters.Clear();
            updExtra.Parameters.Add(new SqlParameter("@type", type));
            updExtra.Parameters.Add(new SqlParameter("@value", value));

            SqlParameter success = updExtra.Parameters.Add("@success", SqlDbType.Bit);

            success.Direction = System.Data.ParameterDirection.Output;



            if (value < 0)
            {
                Response.Write("Add a valid value (positive number)");
            }

            else
            {
                Response.Write("Rate is updated");
                conn.Open();
                updExtra.ExecuteNonQuery();
                conn.Close();
                Response.Redirect("employeeMain.aspx");
            }

        }
    }
}