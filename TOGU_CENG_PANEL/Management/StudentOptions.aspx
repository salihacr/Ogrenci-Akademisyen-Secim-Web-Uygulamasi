<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Management.Master" AutoEventWireup="true" CodeBehind="StudentOptions.aspx.cs" Inherits="TOGU_CENG_PANEL.Management.StudentOptions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <ol class="breadcrumb mb-4">
            <li class="breadcrumb-item active">Dashboard</li>
        </ol>
        <div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-table mr-1"></i>
                Your Students
            </div>
            <div class="card-body">
                <div class="table-responsive">

                    <table class="table table-bordered table-hover" id="dataTable2" width="100%">
                        <thead>
                            <tr>
                                <th scope="col">E-Mail</th>
                                <th scope="col">Öğrenci</th>
                                <th scope="col">Akademisyen</th>
                                <th scope="col">Dönem (Ders)</th>
                                <th scope="col">Kayıt Tarihi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="rptOptions" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td><%#Eval("Email") %></td>
                                        <td><%#Eval("FullName") %></td>
                                        <td><%#Eval("Academician") %></td>
                                        <td><%#Eval("SemesterName") %></td>
                                        <td><b><%#Eval("RegistrationDate") %></b></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div id="Alert" visible="false" runat="server">
            <div class="alert alert-danger" role="alert">
                Tüm Öğrencilerin Kayıt Listesine Bakma Yetkiniz Bulunmamaktadır...
            </div>
        </div>
        <div class="card mb-4" id="AllStudents" runat="server">
            <div class="card-header">
                <i class="fas fa-table mr-1"></i>
                All Student Choices
            </div>
            <div class="card-body">
                <div class="table-responsive">

                    <table class="table table-bordered table-hover" id="dataTable" width="100%">
                        <thead>
                            <tr>
                                <th scope="col">E-Mail</th>
                                <th scope="col">Öğrenci</th>
                                <th scope="col">Akademisyen</th>
                                <th scope="col">Dönem (Ders)</th>
                                <th scope="col">Kayıt Tarihi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="rptOptionsAll" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td><%#Eval("Email") %></td>
                                        <td class="text-danger font-weight-bold"><%#Eval("FullName") %></td>
                                        <td class="font-weight-bold text-primary"><%#Eval("Academician") %></td>
                                        <td><%#Eval("SemesterName") %></td>
                                        <td><b><%#Eval("RegistrationDate") %></b></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
