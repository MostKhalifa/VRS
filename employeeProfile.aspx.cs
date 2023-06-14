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
    public partial class employeeProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand viewPro = new SqlCommand("ViewEmpProfile", conn);
            viewPro.CommandType = CommandType.StoredProcedure;


            viewPro.Parameters.Clear();
            viewPro.Parameters.Add(new SqlParameter("@ssn", Session["user"]));


            conn.Open();
            SqlDataReader rdr = viewPro.ExecuteReader(CommandBehavior.CloseConnection);
            GridView1.DataSource = rdr;
            GridView1.DataBind();
            conn.Close();


        }

        protected void updateBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("employeeUpdate.aspx");
        }
    }
}