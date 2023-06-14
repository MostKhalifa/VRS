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
    public partial class employeeUpdate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void updBtn_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            String name = nameBox.Text;
            String address = addBox.Text;
            int wph = Int16.Parse(WPHBox.Text);
            String email = emailBox.Text;
            String pass = passBox.Text;


            SqlCommand updEmp = new SqlCommand("UpdateEmpProfile", conn);
            updEmp.CommandType = CommandType.StoredProcedure;

            updEmp.Parameters.Clear();
            updEmp.Parameters.Add(new SqlParameter("@ssn", SqlDbType.VarChar)).Value = Session["user"];
            updEmp.Parameters.Add(new SqlParameter("@name", SqlDbType.VarChar)).Value = name;
            updEmp.Parameters.Add(new SqlParameter("@address", SqlDbType.VarChar)).Value = address;
            updEmp.Parameters.Add(new SqlParameter("@hours_per_week", SqlDbType.Int)).Value = wph;
            updEmp.Parameters.Add(new SqlParameter("@email", SqlDbType.VarChar)).Value = email;
            updEmp.Parameters.Add(new SqlParameter("@password", SqlDbType.VarChar)).Value = pass;

            SqlParameter success = updEmp.Parameters.Add("@success", SqlDbType.Bit);

            success.Direction = System.Data.ParameterDirection.Output;

            conn.Open();
            updEmp.ExecuteNonQuery();
            conn.Close();

            if (success.Value.ToString() == "True")
            {

                Response.Redirect("employeeProfile.aspx");

            }


        }
    }
}