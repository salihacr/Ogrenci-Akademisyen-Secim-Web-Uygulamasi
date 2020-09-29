<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Management.Master" AutoEventWireup="true" CodeBehind="Academicians.aspx.cs" Inherits="TOGU_CENG_PANEL.Management.Academicians" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <ol class="breadcrumb mb-4">
            <li class="breadcrumb-item active">Dashboard/Academicians</li>
        </ol>
        <div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-table mr-1"></i>
                Add New Academician
            </div>
            <div class="card-body">
                <div class="table-responsive">

                    <form>
                        <div class="form-group">
                            <label>Ad Soyad</label>
                            <asp:TextBox ID="txtName" CssClass="form-control" runat="server" placeholder="İsim Soyisim" required></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>E-Mail</label>
                            <input type="email" id="txtEmail" class="form-control" runat="server" placeholder="E-Mail Adres" required />
                        </div>
                        <div class="form-group">
                            <label>Parola</label>
                            <asp:TextBox ID="txtPassword" CssClass="form-control" runat="server" placeholder="Parola" required></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <label>Akademisyen Rol</label>
                            <asp:DropDownList AutoPostBack="true" ID="ddl_roles" CssClass="form-control" runat="server" required>
                            </asp:DropDownList>
                        </div>
                        <asp:Button ID="SaveButton" OnClick="Add_Academician_Click" CssClass="btn btn-primary mt-4" Style="width: 100%;" Text="KAYDET" runat="server" />
                    </form>
                </div>
            </div>

        </div>

        <div id="Successful" visible="false" runat="server" class="alert alert-success alert-dismissible fade show" role="alert">
            <strong>Kayıt Başarılı...</strong>
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <div id="EmailAlert" visible="false" runat="server" class="alert alert-warning alert-dismissible fade show" role="alert">
            <strong>Girdiğiniz Email adresine ait kayıt mevcut...</strong>
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
    </form>
</asp:Content>
