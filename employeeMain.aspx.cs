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
    public partial class employeeMain : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void profileBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("employeeProfile.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("curRented.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("curCust.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("updateVehicle.aspx");
        }

        protected void Button4_Click1(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedIndex == 0)
                Response.Redirect("addExtra.aspx");
            else if (DropDownList1.SelectedIndex == 1)
                Response.Redirect("addVehicle.aspx");
            else if (DropDownList1.SelectedIndex == 2)
                Response.Redirect("addLocation.aspx");
            else
                Response.Redirect("addInsurance.aspx");
        }

        protected void updateExtra_Click(object sender, EventArgs e)
        {
            Response.Redirect("updateExtra.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);


            String e_date = TextBox1.Text;
            SqlCommand deletePaymentProc = new SqlCommand("DeleteExpiredPayments", conn);
            deletePaymentProc.CommandType = CommandType.StoredProcedure;

            deletePaymentProc.Parameters.Add(new SqlParameter("@date", SqlDbType.DateTime)).Value = e_date;
            conn.Open();
            deletePaymentProc.ExecuteNonQuery();
            conn.Close();


        }
        protected void custRentAll_Click(object sender, EventArgs e)
        {
            Response.Redirect("custRentAll.aspx");
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            Response.Redirect("UnavailVeh.aspx");
        }
    }
}