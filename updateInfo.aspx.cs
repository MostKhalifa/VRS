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
    public partial class updateInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);


            String name = TextBox1.Text;
            String address = TextBox2.Text;
            String password = TextBox3.Text;
            String email = TextBox4.Text;
            


            SqlCommand updateProc = new SqlCommand("UpdateCustProfile", conn);
            updateProc.CommandType = CommandType.StoredProcedure;

            SqlCommand updatePhoneProc = new SqlCommand("addMobile", conn);
            updatePhoneProc.CommandType = CommandType.StoredProcedure;


            updateProc.Parameters.Clear();
            updateProc.Parameters.Add(new SqlParameter("@ssn", SqlDbType.VarChar)).Value = Session["user"];
            updateProc.Parameters.Add(new SqlParameter("@name", SqlDbType.VarChar)).Value =name;
            updateProc.Parameters.Add(new SqlParameter("@address", SqlDbType.VarChar)).Value =address;
            updateProc.Parameters.Add(new SqlParameter("@password", SqlDbType.VarChar)).Value =password;
            updateProc.Parameters.Add(new SqlParameter("@email", SqlDbType.VarChar)).Value = email;

            String phone = TextBox5.Text;
            if (phone != "")
            {

                updatePhoneProc.Parameters.Add(new SqlParameter("@ssn", SqlDbType.VarChar)).Value = Session["user"];
                updatePhoneProc.Parameters.Add(new SqlParameter("@phone_number", SqlDbType.VarChar)).Value = phone;
                conn.Open();
                updatePhoneProc.ExecuteNonQuery();
                conn.Close();
            }


            SqlParameter success = updateProc.Parameters.Add("@success", SqlDbType.Int);

            success.Direction = System.Data.ParameterDirection.Output;

            conn.Open();
            updateProc.ExecuteNonQuery();
            conn.Close();

            //Response.Redirect("profile.aspx");
            
            Label lbl_message = new Label();
            lbl_message.Text = "Information was updated successfully";
            form1.Controls.Add(lbl_message);

            


        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Profile.aspx");
        }
    }
}
