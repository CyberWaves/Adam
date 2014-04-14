using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AdminData;
using AdminLogic;
using System.Linq;

namespace AdminUI.Forms
{
    public partial class ExamSection : System.Web.UI.Page
    {
        AdamEntities objAdamEntities = new AdamEntities();

        public void BindGrid()
        {
            var sections = objAdamEntities.tblSections.Select(a => new { a.SectionId, a.SectionName, a.Description, a.IsActive }).ToList();
            gvSections.DataSource = sections;
            gvSections.DataBind();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            BindGrid();
        }

        protected void gvSections_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName.Equals("editRecord"))
            {
                GridViewRow gvrow = gvSections.Rows[index];
                lblSectionCode.Text = HttpUtility.HtmlDecode(gvrow.Cells[0].Text).ToString();
                txtSectionNameEdit.Text = HttpUtility.HtmlDecode(gvrow.Cells[1].Text);
                txtDescriptionEdit.Text = HttpUtility.HtmlDecode(gvrow.Cells[2].Text);
                chkStatusEdit.Checked = Convert.ToBoolean(HttpUtility.HtmlDecode(gvrow.Cells[3].Text));
                lblResult.Visible = false;
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#editModal').modal('show');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "EditModalScript", sb.ToString(), false);

            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append(@"<script type='text/javascript'>");
            sb.Append("$('#addModal').modal('show');");
            sb.Append(@"</script>");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AddShowModalScript", sb.ToString(), false);
        }
        protected void btnAddRecord_Click(object sender, EventArgs e)
        {
            tblSection objtblSection = new tblSection()
            {
                SectionName = txtSectionName.Text,
                Description = txtDescription.Text,
                IsActive = chkStatus.Checked
            };
            objAdamEntities.tblSections.AddObject(objtblSection);
            if (objAdamEntities.SaveChanges() == 1)
            {
                BindGrid();
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("alert('Record Added Successfully');");
                sb.Append("$('#addModal').modal('hide');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AddHideModalScript", sb.ToString(), false);
            }
            else
            { 
            //todo
            }

            
           
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            int sectionId = Convert.ToInt32(lblSectionCode.Text);
            tblSection objtblSection = objAdamEntities.tblSections.First(a => a.SectionId == sectionId);
            objtblSection.SectionName = txtSectionNameEdit.Text;
            objtblSection.Description = txtDescriptionEdit.Text;
            objtblSection.IsActive = chkStatusEdit.Checked;
            int num = objAdamEntities.SaveChanges();
            BindGrid();
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append(@"<script type='text/javascript'>");
            sb.Append("alert('Records Updated Successfully');");
            sb.Append("$('#editModal').modal('hide');");
            sb.Append(@"</script>");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "EditHideModalScript", sb.ToString(), false);
        }
    }
}