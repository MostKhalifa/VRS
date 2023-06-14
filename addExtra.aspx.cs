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
    public partial class addExtra : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            String type = typeBox.Text;
            decimal rate;

            SqlCommand add = new SqlCommand("AddExtra", conn);
            add.CommandType = CommandType.StoredProcedure;

            try
            {
                rate = decimal.Parse(rateBox.Text);
            }
            catch (Exception)
            {
                Response.Write("Enter a number in Rate box");
                return;
            }

            add.Parameters.Clear();
            add.Parameters.Add(new SqlParameter("@type", type));
            add.Parameters.Add(new SqlParameter("@rate", rate));


            if (type.Length == 0 || rate < 0)
            {
                Response.Write("Enter correct data in the boxes below");
            }
            else
            {
                Response.Write("Extra item is added!");
                conn.Open();
                add.ExecuteNonQuery();
                conn.Close();
                Response.Redirect("employeeMain.aspx");
            }

        }
    }
}