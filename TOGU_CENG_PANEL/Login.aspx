<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TOGU_CENG_PANEL.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>GOU - CSE</title>
    <link href="vendor/css/styles.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js" crossorigin="anonymous"></script>
    <%--<link href="../vendor/bootstrap/bootstrap.min.css" rel="stylesheet" />--%>
</head>
<body style="background-color: #0093E9; background-image: linear-gradient(160deg, #0093E9 0%, #80D0C7 100%);">
    <form id="form1" runat="server">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header">
                                        <img src="vendor/img/muhendislik_tr.png" width="400" />
                                        <p class="text-center small font-weight-bolder m-2 text-primary">Bilgisayar Mühendisliği</p>

                                    </div>
                                    <div class="card-body">
                                        <form>

                                            <div class="form-group">
                                                <label class="small mb-1" for="inputEmailAddress">E-Mail</label>
                                                <input class="form-control py-4" id="txtEmail" runat="server" required type="email" placeholder="E-Mail Adresinizi Giriniz..." maxlength="50" />
                                            </div>
                                            <div class="form-group">
                                                <label class="small mb-1" for="inputPassword">Şifre</label>
                                                <input class="form-control py-4" id="txtPassword" runat="server" required type="password" placeholder="Şifrenizi Giriniz..." maxlength="50" />
                                            </div>
                                            <div class="form-group d-flex align-items-center justify-content-between mt-4 mb-0">
                                                <a class="small" href="#"></a>
                                                <asp:Button ID="LoginButton" OnClick="Login_Click" CssClass="btn btn-outline-dark font-weight-bolder" Style="width: 100%; background-color: #0093E9; background-image: linear-gradient(160deg, #00B4DB 0%, #0083B0 100%);" Text="Giriş Yap" runat="server" />
                                            </div>
                                        </form>
                                    </div>
                                    <div class="card-footer text-center">
                                        <div class="small"><a href="#">Tokat Gaziosmanpaşa Üniversitesi</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            <div id="layoutAuthentication_footer">
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid">
                        <div class="d-flex align-items-center justify-content-between small">
                        </div>
                    </div>
                </footer>
            </div>
        </div>
    </form>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="vendor/js/scripts.js"></script>
</body>
</html>
