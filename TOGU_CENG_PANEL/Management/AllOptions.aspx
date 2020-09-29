<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AllOptions.aspx.cs" Inherits="TOGU_CENG_PANEL.Management.AllOptions" %>


<!DOCTYPE html>

<html lang="tr">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div id="AllStudents" runat="server">
            <div>
                <div>

                    <table>
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
                                        <td><b><%#Eval("FullName") %></b></td>
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
    </form>
</body>
</html>
