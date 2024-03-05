<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="AppFullDent.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row justify-content-center align-items-center">
            <div class="col-md-12 text-center">
                <h1>BEM VINDO A CLINIC DENTAL</h1>
            </div>
        </div>

        <div class="row justify-content-center mt-3">
            <div class="col-md-6 text-center">
                <asp:Button ID="btnAgendarServico" runat="server" Text="Agendar um Serviço" OnClick="btnAgendarServico_Click" CssClass="btn btn-outline-dark" />
            </div>
            <div class="col-md-6 text-center">
                <asp:Button ID="btnVerInformacoes" runat="server" Text="Ver Informações" OnClick="btnVerInformacoes_Click" CssClass="btn btn-outline-dark" />
            </div>
        </div>
    </div>
</asp:Content>
