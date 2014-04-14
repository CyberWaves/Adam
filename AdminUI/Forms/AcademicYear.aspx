<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AcademicYear.aspx.cs" Inherits="AdminUI.Forms.AcademicYear" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <fieldset>
        <legend>
            
            Academi Year
        
        </legend>
        

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            onrowdatabound="GridView1_RowDataBound">
            
             <Columns>
                                        <asp:BoundField HeaderText="Academic Year" DataField="AcdmcYear">
                                            <ItemStyle Font-Size="X-Small" Width="40%" />
                                        </asp:BoundField>
                                        <asp:BoundField HeaderText="Is Active" DataField="IsActive">
                                            <ItemStyle Font-Size="X-Small" Width="40%" />
                                        </asp:BoundField>
                                        
                                       <asp:TemplateField HeaderText="Actions">
                                           
                                           <ItemTemplate >
                                               <asp:CheckBox ID="chk1" runat="server" />

                                           </ItemTemplate>

                                       </asp:TemplateField>
                                       <asp:TemplateField HeaderText="Actions">
                                           
                                           <ItemTemplate >
                                               <asp:Button ID="Button1" runat="server" Text="Edit"/>

                                           </ItemTemplate>

                                       </asp:TemplateField>
                                        
                                    </Columns>
            
            
            

        </asp:GridView>
        

    </fieldset>
    
    
    


</asp:Content>
