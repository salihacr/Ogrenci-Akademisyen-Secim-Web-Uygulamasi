<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Management.Master" AutoEventWireup="true" CodeBehind="RemoveRecords.aspx.cs" Inherits="TOGU_CENG_PANEL.Management.RemoveRecords" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server" visible="false">
        <ol class="breadcrumb mb-4">
            <li class="breadcrumb-item active">Dashboard/Remove Records</li>
        </ol>
        <div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-table mr-1"></i>
                Remove All Options
            </div>
            <div class="card-body">
                Panelden herhangi bir kayıt silmeden önce öğrencilerin yapmış olduğu varolan tüm kayıtları temizlemeniz gerekmektedir.
                 <asp:Button ID="RemoveOptions" OnClick="Remove_Options_Click" CssClass="btn btn-danger font-weight-bold mt-4" Style="width: 100%;" Text="Tüm Öğrenci Tercih Listesini Temizle" runat="server" />
            </div>
        </div>
        <div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-table mr-1"></i>
                Remove All Users
            </div>
            <div class="card-body">
                Öğrenci tercihleri sekmesinde olan tüm kayıtlar silindikten sonra öğrencileri kaldırabilirsiniz.
                 <asp:Button ID="RemoveUsers" OnClick="Remove_Users_Click" CssClass="btn btn-danger font-weight-bold mt-4" Style="width: 100%;" Text="Tüm Öğrencileri Temizle" runat="server" />
            </div>
        </div>
        <div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-table mr-1"></i>
                Remove Semesters
            </div>
            <div class="card-body">
                Yukarıdaki verilerin silindiğinden emin olduysanız dönem bilgilerinide kaldırabilirsiniz.
                <br />
                <asp:Button Style="width: 100%" ID="RemoveSemesters" OnClick="Remove_Semesters_Click" CssClass="btn btn-danger font-weight-bold mt-4" Text="Tüm Dönemleri Temizle" runat="server" />
            </div>
        </div>
        <div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-table mr-1"></i>
                Remove Academician
            </div>
            <div class="card-body">
                Seçtiğiniz akademisyeni sistemden silin... Sistemde akademisyene ait herhangi bir bağlantı olmadığından emin olun...
                <br />
                <br />
                <div class="form-group">
                    <asp:DropDownList ID="ddl_academicians" CssClass="form-control" runat="server" required>
                    </asp:DropDownList>
                </div>
                <asp:Button ID="RemoveAcademician" OnClick="Remove_Academician_Click" CssClass="btn btn-danger font-weight-bold mt-4" Style="width: 100%;" Text="Seçili Akademisyeni Kaldırın" runat="server" />
            </div>
        </div>
        <div id="Alert" visible="false" runat="server">
            <div class="alert alert-success" role="alert">
                Silme işlemi başarılı...
            </div>
        </div>
        <div id="DangerAlert" visible="false" runat="server">
            <div class="alert alert-danger" role="alert">
                Bi hata oluştu lütfen sonra tekrar deneyiniz....
            </div>
        </div>

    </form>
</asp:Content>
