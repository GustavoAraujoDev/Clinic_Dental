<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LoginClinica.aspx.cs" Inherits="AppFullDent.LoginClinica" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
 <div class="container">
        <h2>Login Cadastro Clinicas Clinic Dental</h2>

        <div class="form-group">
            <asp:Label ID="lblClinicName" runat="server" Text="Nome da Clínica:" AssociatedControlID="txtClinicName"></asp:Label>
            <asp:TextBox ID="txtClinicName" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvClinicName" runat="server" ControlToValidate="txtClinicName" ErrorMessage="Por favor, insira o nome da clínica." Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>

        <div class="form-group">
            <asp:Label ID="lblPassword" runat="server" Text="Senha:" AssociatedControlID="txtPassword"></asp:Label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Por favor, insira a senha." Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>

        <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" CssClass="btn btn-primary" />
        <asp:Label ID="lblErrorMessages" runat="server" ForeColor="Red"></asp:Label>
    </div>
</asp:Content>
