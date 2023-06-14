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
    public partial class updatePayment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            String connStr = WebConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);


            String a_number = TextBox1.Text;
            String cvv = TextBox3.Text;
            String expire = TextBox4.Text;
           


            SqlCommand addCreditCardProc = new SqlCommand("addOnlinePayment", conn);
            addCreditCardProc.CommandType = CommandType.StoredProcedure;

            addCreditCardProc.Parameters.Add(new SqlParameter("@ssn", SqlDbType.VarChar)).Value = Session["user"];
            addCreditCardProc.Parameters.Add(new SqlParameter("@credit_card_number", SqlDbType.VarChar)).Value = a_number;
            addCreditCardProc.Parameters.Add(new SqlParameter("@cvv", SqlDbType.VarChar)).Value = cvv;
            addCreditCardProc.Parameters.Add(new SqlParameter("@expire", SqlDbType.DateTime)).Value = expire;

            conn.Open();
            bool success = false;
            try
            {
                addCreditCardProc.ExecuteNonQuery();
                success = true;
            }
            catch (System.Data.SqlClient.SqlException)
            {
                Label lbl_message2 = new Label();
                lbl_message2.Text = "Credit Card is already found, cannot add";
                form1.Controls.Add(lbl_message2);

            }
            finally
            {
                if (success)
                {
                    Label lbl_message = new Label();
                    lbl_message.Text = "Credit Card was added successfully";
                    form1.Controls.Add(lbl_message);
                }
            }
            conn.Close();

            //Response.Redirect("paymentInfo.aspx");



        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            String d_number = TextBox2.Text;

            SqlCommand deleteCreditCardProc = new SqlCommand("deleteCreditCard", conn);
            deleteCreditCardProc.CommandType = CommandType.StoredProcedure;

            deleteCreditCardProc.Parameters.Add(new SqlParameter("@customer_ssn", SqlDbType.VarChar)).Value = Session["user"];
            deleteCreditCardProc.Parameters.Add(new SqlParameter("@credit_card_number", SqlDbType.VarChar)).Value = d_number;

            conn.Open();
            bool success = false;
            try
            {
                deleteCreditCardProc.ExecuteNonQuery();
                success = true;
            }
            catch (System.Data.SqlClient.SqlException)
            {
                Label lbl_message2 = new Label();
                lbl_message2.Text = "Credit Card was not found";
                form1.Controls.Add(lbl_message2);

            }
            finally
            {
                if (success)
                {
                    Label lbl_message = new Label();
                    lbl_message.Text = "Credit Card was removed successfully";
                    form1.Controls.Add(lbl_message);
                }
            }
            conn.Close();

            //Response.Redirect("paymentInfo.aspx");


        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("paymentInfo.aspx");
        }
    }
}