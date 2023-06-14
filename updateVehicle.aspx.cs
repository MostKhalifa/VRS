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
    public partial class updateVehicle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand viewVeh = new SqlCommand("ListAllVehicles", conn);
            viewVeh.CommandType = CommandType.StoredProcedure;


            conn.Open();
            SqlDataReader rdr = viewVeh.ExecuteReader(CommandBehavior.CloseConnection);
            GridView1.DataSource = rdr;
            GridView1.DataBind();
            conn.Close();

        }

        protected void updBtn_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int id = Int16.Parse(idBox.Text);

            SqlCommand updStatus = new SqlCommand("updateStatus", conn);
            updStatus.CommandType = CommandType.StoredProcedure;
            updStatus.Parameters.Clear();
            updStatus.Parameters.Add(new SqlParameter("@vehicle", SqlDbType.Int)).Value = id;
            updStatus.Parameters.Add(new SqlParameter("@status", SqlDbType.VarChar)).Value = DropDownList1.SelectedValue.ToString();

            conn.Open();
            updStatus.ExecuteNonQuery();
            conn.Close();

            Response.Redirect("updateVehicle.aspx");




        }
    }
}