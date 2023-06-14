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
    public partial class addInsurance : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


        }




        protected void Button1_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            String insu = insuBox.Text;
            decimal rate;
            String type = DropDownList2.SelectedValue.ToString();
            decimal la;



            try
            {
                rate = decimal.Parse(rateBox.Text);
            }
            catch (Exception)
            {
                Response.Write("Enter a number in Rate box");
                return;
            }


            try
            {
                la = decimal.Parse(LABox.Text);
            }
            catch (Exception)
            {
                Response.Write("Enter a number in Liability Amount box");
                return;
            }



            SqlCommand add = new SqlCommand("AddInsurance", conn);
            add.CommandType = CommandType.StoredProcedure;

            add.Parameters.Clear();
            add.Parameters.Add(new SqlParameter("@insurance", insu));
            add.Parameters.Add(new SqlParameter("@rate", rate));
            add.Parameters.Add(new SqlParameter("@type", type));
            if(DropDownList2.SelectedIndex == 1)
                add.Parameters.Add(new SqlParameter("@liablity_amount", la));
            else
                add.Parameters.Add(new SqlParameter("@liablity_amount", 0));


            if (insu.Length == 0)
            {
                Response.Write("Enter correct data in the boxes below");
            }
            else
            {
                Response.Write("Insurance Added");
                conn.Open();
                add.ExecuteNonQuery();
                conn.Close();
                Response.Redirect("employeeMain.aspx");
            }


        }
    }
}
