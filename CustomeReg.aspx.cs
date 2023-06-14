using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Part2
{
    public partial class EmployeeR : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AccC(object sender, EventArgs e)
        {
            Response.Redirect("AccSub.aspx");


        }

        protected void Ext_Click(object sender, EventArgs e)
        {
            Response.Redirect("Extras.aspx");
        }

        protected void Eval_Click(object sender, EventArgs e)
        {
            Response.Redirect("EvalVeh.aspx");
        }

        protected void UpBK_Click(object sender, EventArgs e)
        {
            Response.Redirect("UpdKm.aspx");
        }

        protected void UpLoc_Click(object sender, EventArgs e)
        {
            Response.Redirect("UpdLoc.aspx");
        }
    }
}