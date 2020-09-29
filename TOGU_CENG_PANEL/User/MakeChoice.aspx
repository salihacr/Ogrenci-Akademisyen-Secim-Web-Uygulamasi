<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/User.Master" AutoEventWireup="true" CodeBehind="MakeChoice.aspx.cs" Inherits="TOGU_CENG_PANEL.User.MakeChoice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">

        <div class="row">
            <div class="col">
                <div id="Panel" runat="server">
                    <div class="card">
                        <h4 class="pt-4 text-primary font-weight-bold text-center">GOU | Bilgisayar Mühendisliği</h4>
                        <h4 class="text-dark font-weight-bold text-center">Bilgisayar Mühendisliği Uygulamaları 1 ve 2 Dersi</h4>
                        <h4 class="text-primary font-weight-bold text-center">Akademisyen Seçim Paneli</h4>
                        <div class="card-body">
                            <div class="m-3">
                                <div class="mb-3">
                                    <div class="form-group">
                                        <label>Ders Seçiniz</label>
                                        <asp:DropDownList AutoPostBack="true" ID="ddl_semesters" CssClass="form-control" runat="server" required>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label>Akademisyenler</label>
                                    <asp:DropDownList AutoPostBack="true" ID="ddl_academicians" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddl_academicians_selected" required>
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <asp:Button ID="SendButton" CssClass="btn btn-primary" runat="server" OnClick="SendButton_Click" Text="KAYDET" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <br />
                <br />
                <div id="SuccessfullRecord" visible="false" runat="server">
                    <div class="alert alert-success" role="alert">
                        <asp:Label ID="lblSuccess" runat="server"></asp:Label>
                    </div>
                </div>
                <div id="ExistRecord" visible="false" runat="server">
                    <div class="alert alert-info" role="alert">
                        <asp:Label ID="lblInfo" runat="server"></asp:Label>
                    </div>
                </div>
                <div id="MissingValues" visible="false" runat="server">
                    <div class="alert alert-warning" role="alert">
                        Lütfen bilgileri eksiksiz doldurunuz.
                    </div>
                </div>
                <div id="QuotaOverFlow" visible="false" runat="server">
                    <div class="alert alert-info" role="alert">
                        Seçtiğiniz Akademisyene ait kontenjan dolmuştur. Lütfen Diğer Seçeneklerden Birini Seçiniz...
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
