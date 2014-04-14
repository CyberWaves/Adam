using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AdminData;
using AdminLogic;

namespace AdminUI.Forms
{
    public partial class AcademicYear : System.Web.UI.Page
    {
        readonly LogicAcademicYear bsobj=new LogicAcademicYear();
        protected void Page_Load(object sender, EventArgs e)
        {
            List<tblAcademicYear> l1=new List<tblAcademicYear>();
            l1 = bsobj.GetAcademicYear();
            int x = l1.Count();
            GridView1.DataSource = bsobj.GetAcademicYear();
            GridView1.DataBind();
            
           
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                
            }
        }
    }
}