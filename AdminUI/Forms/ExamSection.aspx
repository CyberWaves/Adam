<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ExamSection.aspx.cs" Inherits="AdminUI.Forms.ExamSection" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:ScriptManager runat="server" ID="ScriptManagerMain" />
        <asp:UpdatePanel ID="upMain" runat="server">
                    <ContentTemplate>
                    <div class="row">
                    <div class="" style="text-align:right; padding:10px 0px;">
                        <asp:Button ID="btnAdd" runat="server" Text="Add New Record" CssClass="btn btn-info" OnClick="btnAdd_Click" />
                    </div>
                    </div>
                    <div>
                        <asp:GridView ID="gvSections" runat="server" HorizontalAlign="Center"
                            OnRowCommand="gvSections_RowCommand" AutoGenerateColumns="false" AllowPaging="true"
                            DataKeyNames="SectionId" CssClass="table table-hover table-striped">
                            <Columns>                            
                                <asp:BoundField DataField="SectionId" HeaderText="Section Code" />
                                <asp:BoundField DataField="SectionName" HeaderText="Section Name" />
                                <asp:BoundField DataField="Description" HeaderText="Description" />
                                <asp:BoundField DataField="IsActive" HeaderText="Status" />                                                         
                                <asp:ButtonField CommandName="editRecord" ControlStyle-CssClass="btn btn-info"
                                    ButtonType="Button" Text="Edit" HeaderText="Edit Record">
                                    <ControlStyle CssClass="btn btn-info"></ControlStyle>
                                </asp:ButtonField>
                            </Columns>
                        </asp:GridView>
                    </div>                        
                    </ContentTemplate>
                    <Triggers>
                    </Triggers>
                </asp:UpdatePanel>
    
    <!-- Edit Modal Starts here -->
            <div id="editModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3 id="editModalLabel">Edit Record</h3>
                </div>
                <asp:UpdatePanel ID="upEdit" runat="server">
                    <ContentTemplate>
                        <div class="modal-body">
                            <table class="table">
                                <tr>
                                    <td>Section Code : 
                                <asp:Label ID="lblSectionCode" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Section Name : 
                                <asp:TextBox ID="txtSectionNameEdit" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Description : 
                                <asp:TextBox ID="txtDescriptionEdit" TextMode="MultiLine" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Status:
                                <asp:CheckBox ID="chkStatusEdit" runat="server" />
                                    </td>
                                </tr> 
                            </table>
                        </div>
                        <div class="modal-footer">
                            <asp:Label ID="lblResult" Visible="false" runat="server"></asp:Label>
                            <asp:Button ID="btnSave" runat="server" Text="Update" CssClass="btn btn-info" OnClick="btnSave_Click" />
                            <button class="btn btn-info" data-dismiss="modal" aria-hidden="true">Close</button>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="gvSections" EventName="RowCommand" />
                        <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
            <!-- Edit Modal Ends here -->
            <!-- Add Record Modal Starts here-->
            <div id="addModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="addModalLabel" aria-hidden="true">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3 id="addModalLabel">Add New Record</h3>
                </div>
                <asp:UpdatePanel ID="upAdd" runat="server">
                    <ContentTemplate>
                        <div class="modal-body">
                            <table class="table table-bordered table-hover">
                                <tr>
                                    <td>Section Name : 
                                <asp:TextBox ID="txtSectionName" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Description : 
                                <asp:TextBox ID="txtDescription" TextMode="MultiLine" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Status:
                                <asp:CheckBox ID="chkStatus" runat="server" />
                                    </td>
                                </tr>                               
                            </table>
                        </div>
                        <div class="modal-footer">                          
                            <asp:Button ID="btnAddRecord" runat="server" Text="Add" CssClass="btn btn-info" OnClick="btnAddRecord_Click" />
                            <button class="btn btn-info" data-dismiss="modal" aria-hidden="true">Close</button>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnAddRecord" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
    </div>
</asp:Content>
