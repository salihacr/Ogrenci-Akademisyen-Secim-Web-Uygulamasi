<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Management.Master" AutoEventWireup="true" CodeBehind="Records.aspx.cs" Inherits="TOGU_CENG_PANEL.Management.Records" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <ol class="breadcrumb mb-4">
            <li class="breadcrumb-item active">Dashboard/All Records</li>
        </ol>
        <div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-table mr-1"></i>
                All Registered Semesters
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <%--GRİD VİEW--%>

                    <asp:GridView ID="GridView1" CssClass="table table-striped table-hover" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" DataSourceID="semesterSource" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                            <asp:BoundField DataField="SemesterName" HeaderText="SemesterName" SortExpression="SemesterName" />
                            <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                            <asp:BoundField DataField="Capacity" HeaderText="Capacity" SortExpression="Capacity" />
                        </Columns>
                        <EditRowStyle BackColor="#7C6F57" />
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#E3EAEB" />
                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                        <SortedDescendingHeaderStyle BackColor="#15524A" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="semesterSource" runat="server" ConnectionString="<%$ ConnectionStrings:PanelDB %>" DeleteCommand="DELETE FROM [Semesters] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Semesters] ([SemesterName], [State], [Capacity]) VALUES (@SemesterName, @State, @Capacity)" SelectCommand="SELECT * FROM [Semesters]" UpdateCommand="UPDATE [Semesters] SET [SemesterName] = @SemesterName, [State] = @State, [Capacity] = @Capacity WHERE [ID] = @ID">
                        <DeleteParameters>
                            <asp:Parameter Name="ID" Type="Int16" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="SemesterName" Type="String" />
                            <asp:Parameter Name="State" Type="String" />
                            <asp:Parameter Name="Capacity" Type="Int32" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="SemesterName" Type="String" />
                            <asp:Parameter Name="State" Type="String" />
                            <asp:Parameter Name="Capacity" Type="Int32" />
                            <asp:Parameter Name="ID" Type="Int16" />
                        </UpdateParameters>
                    </asp:SqlDataSource>

                </div>
            </div>
        </div>
        <div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-table mr-1"></i>
                All Registered Academicians           
                
            </div>
            <div class="card-body">
                <div class="table-responsive">

                    <%--GRİD VİEW--%>
                    <asp:GridView ID="GridView2" CssClass="table table-striped" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" DataSourceID="academicianSource" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:CommandField ShowEditButton="True" />
                            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                            <asp:BoundField DataField="Academician" HeaderText="Academician" SortExpression="Academician" />
                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                            <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                            <asp:BoundField DataField="RoleID" HeaderText="RoleID" SortExpression="RoleID" />
                        </Columns>
                        <EditRowStyle BackColor="#7C6F57" />
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#E3EAEB" />
                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                        <SortedDescendingHeaderStyle BackColor="#15524A" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="academicianSource" runat="server" ConnectionString="<%$ ConnectionStrings:PanelDB %>" DeleteCommand="DELETE FROM [Academicians] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Academicians] ([Academician], [Email], [Password], [RoleID]) VALUES (@Academician, @Email, @Password, @RoleID)" SelectCommand="SELECT * FROM [Academicians]" UpdateCommand="UPDATE [Academicians] SET [Academician] = @Academician, [Email] = @Email, [Password] = @Password, [RoleID] = @RoleID WHERE [ID] = @ID">
                        <DeleteParameters>
                            <asp:Parameter Name="ID" Type="Int16" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Academician" Type="String" />
                            <asp:Parameter Name="Email" Type="String" />
                            <asp:Parameter Name="Password" Type="String" />
                            <asp:Parameter Name="RoleID" Type="Int16" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Academician" Type="String" />
                            <asp:Parameter Name="Email" Type="String" />
                            <asp:Parameter Name="Password" Type="String" />
                            <asp:Parameter Name="RoleID" Type="Int16" />
                            <asp:Parameter Name="ID" Type="Int16" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
        <div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-table mr-1"></i>
                All Registered Users
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <%--GRİD VİEW--%>
                    <asp:GridView ID="GridView3" CssClass="table table-striped" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" DataSourceID="userSource" ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                            <asp:BoundField DataField="FullName" HeaderText="FullName" SortExpression="FullName" />
                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                            <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                        </Columns>
                        <EditRowStyle BackColor="#7C6F57" />
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#E3EAEB" />
                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                        <SortedDescendingHeaderStyle BackColor="#15524A" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="userSource" runat="server" ConnectionString="<%$ ConnectionStrings:PanelDB %>" DeleteCommand="DELETE FROM [Users] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Users] ([FullName], [Email], [Password]) VALUES (@FullName, @Email, @Password)" SelectCommand="SELECT * FROM [Users] ORDER BY [FullName]" UpdateCommand="UPDATE [Users] SET [FullName] = @FullName, [Email] = @Email, [Password] = @Password WHERE [ID] = @ID">
                        <DeleteParameters>
                            <asp:Parameter Name="ID" Type="Int16" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="FullName" Type="String" />
                            <asp:Parameter Name="Email" Type="String" />
                            <asp:Parameter Name="Password" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="FullName" Type="String" />
                            <asp:Parameter Name="Email" Type="String" />
                            <asp:Parameter Name="Password" Type="String" />
                            <asp:Parameter Name="ID" Type="Int16" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
