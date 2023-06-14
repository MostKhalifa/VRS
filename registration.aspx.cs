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
    public partial class registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void regDoneBtn_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand reg = null;
            reg.Parameters.Clear();
            if (RadioButtonList1.SelectedIndex == 0)
            {
                reg = new SqlCommand("CustomerRegister", conn);
                reg.CommandType = CommandType.StoredProcedure;
            }
            else
            {
                reg = new SqlCommand("EmployeeRegister", conn);
                reg.CommandType = CommandType.StoredProcedure;
                int hpw = Int16.Parse(HPWbox.Text);
                reg.Parameters.Add(new SqlParameter("@hours_per_week", hpw));
            }


            String ssn = ssnBox.Text;
            String name = nameBox.Text;
            String email = emailRegBox.Text;
            String pass = passRegBox.Text;
            String add = addBox.Text;

            reg.Parameters.Add(new SqlParameter("@ssn", ssn));
            reg.Parameters.Add(new SqlParameter("@name", name));
            reg.Parameters.Add(new SqlParameter("@password", pass));
            reg.Parameters.Add(new SqlParameter("@email", email));
            reg.Parameters.Add(new SqlParameter("@address", add));

            conn.Open();
            reg.ExecuteNonQuery();
            conn.Close();

            Label l = new Label();
            l.Text = "You have successfully registered in the system";
            form1.Controls.Add(l);
            Response.Redirect("login.aspx");


        }
    }
}