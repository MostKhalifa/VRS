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
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);


            SqlCommand cusCount = new SqlCommand("customerCount", conn);
            cusCount.CommandType = CommandType.StoredProcedure;


            SqlCommand rentCount = new SqlCommand("vehicleCount", conn);
            rentCount.CommandType = CommandType.StoredProcedure;

            cusCount.Parameters.Add("@count", SqlDbType.Int).Direction = ParameterDirection.Output;
            rentCount.Parameters.Add("@count", SqlDbType.Int).Direction = ParameterDirection.Output;



            conn.Open();
            cusCount.ExecuteNonQuery();
            int response = Convert.ToInt32(cusCount.Parameters["@count"].Value);
            Label1.Text = response.ToString();
            conn.Close();


            conn.Open();
            rentCount.ExecuteNonQuery();
            int response1 = Convert.ToInt32(rentCount.Parameters["@count"].Value);
            Label2.Text = response1.ToString();
            conn.Close();


        }

        protected void loginBtn_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);


            String mail = emailBox.Text;
            String pass = passBox.Text;

            SqlCommand loginProc = new SqlCommand("allLogin", conn);
            loginProc.CommandType = CommandType.StoredProcedure;

            loginProc.Parameters.Clear();
            loginProc.Parameters.Add(new SqlParameter("@email", SqlDbType.VarChar)).Value = mail;
            loginProc.Parameters.Add(new SqlParameter("@password", SqlDbType.VarChar)).Value = pass;

            SqlParameter success = loginProc.Parameters.Add("@success", SqlDbType.Bit);
            SqlParameter type = loginProc.Parameters.Add("@type", SqlDbType.Int);
            SqlParameter ssn = loginProc.Parameters.Add("@ssn", SqlDbType.VarChar,14);

            success.Direction = System.Data.ParameterDirection.Output;
            type.Direction = System.Data.ParameterDirection.Output;
            ssn.Direction = System.Data.ParameterDirection.Output;

            conn.Open();
            loginProc.ExecuteNonQuery();
            conn.Close();

            if (success.Value.ToString() == "True")
            {
                Session["user"] = ssn.Value.ToString();

                if (type.Value.ToString() == "0")
                {
                    Response.Redirect("profile.aspx");
                }
                else if (type.Value.ToString() == "1")
                {
                    Response.Redirect("employeeMain.aspx");
                }
                else
                {
                    Response.Redirect("CustomeReg.aspx");
                }
            }
            else
                Response.Write("Please enter a valid email/password");

        }

        protected void regBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("registration.aspx");
        }

        protected void cusBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("availableCust.aspx");
        }

        
    }
}
