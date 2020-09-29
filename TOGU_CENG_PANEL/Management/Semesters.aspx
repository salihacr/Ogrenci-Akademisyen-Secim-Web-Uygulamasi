<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Management.Master" AutoEventWireup="true" CodeBehind="Semesters.aspx.cs" Inherits="TOGU_CENG_PANEL.Management.Semesters" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <ol class="breadcrumb mb-4">
            <li class="breadcrumb-item active">Dashboard/Semesters</li>
        </ol>
        <div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-table mr-1"></i>
                Add New Semester
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <div class="form-group">
                        <label>Dönem</label>
                        <asp:TextBox runat="server" ID="txtSemester" CssClass="form-control" placeholder="Dönem Oluşturunuz -> örn. (2020 - 2021 4.Sınıf Bilgisayar Müh. Uygulamaları - 2)" required></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Kapasite</label>
                        <asp:TextBox runat="server" ID="txtCapacity" CssClass="form-control" placeholder="Ders Kapasitesi Belirleyiniz -> örn. (60)" required></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Dersin Seçim Durumu (Açık veya Kapalı)</label>
                        <asp:DropDownList ID="ddl_state" AutoPostBack="true" CssClass="form-control" runat="server">
                            <asp:ListItem Value="ON"> Açık </asp:ListItem>
                            <asp:ListItem Value="OFF"> Kapalı </asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <asp:Button ID="SaveButton" CssClass="btn btn-primary mt-4" Style="width: 100%;" OnClick="Add_Semester_Click" Text="KAYDET" runat="server" />
                </div>
            </div>
        </div>
        <div id="Successful" visible="false" runat="server" class="alert alert-success alert-dismissible fade show" role="alert">
            <strong>Kayıt Başarılı...</strong>
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
    </form>
</asp:Content>
