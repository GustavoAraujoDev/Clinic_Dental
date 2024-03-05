<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InserirProcedimento.aspx.cs" Inherits="AppFullDent.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <h5>Inserir Procedimento</h5>
        <div class="form-group">
            <asp:Label ID="lblNome" runat="server" Text="Nome:" AssociatedControlID="txtNome"></asp:Label>
            <asp:TextBox ID="txtNome" runat="server" CssClass="form-control" Width="300"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvNome" runat="server" ControlToValidate="txtNome" ErrorMessage="Campo obrigatório" CssClass="text-danger">*</asp:RequiredFieldValidator>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="formValidation" CssClass="alert alert-danger mt-2" />
        </div>

        <div class="form-group">
            <h6>Codigo</h6>
            <asp:TextBox ID="txtCodigo" runat="server" CssClass="form-control" Width="300" placeholder="Codigo" onkeypress="return apenasNumeros(event)"></asp:TextBox>
        </div>

        <div class="form-group">
            <h6>cobertura plano 9</h6>
            <asp:DropDownList ID="ddlCoberturaPlano9" runat="server" CssClass="form-control">
                <asp:ListItem Text="Coberto" Value="Coberto"></asp:ListItem>
                <asp:ListItem Text="Não Coberto" Value="Não Coberto"></asp:ListItem>
            </asp:DropDownList>
        </div>

        <div class="form-group">
            <h6>cobertura plano de uso </h6>
            <asp:DropDownList ID="ddlCoberturaPlanoUso" runat="server" CssClass="form-control">
                <asp:ListItem Text="Coberto" Value="Coberto"></asp:ListItem>
                <asp:ListItem Text="Não Coberto" Value="Não Coberto"></asp:ListItem>
            </asp:DropDownList>
        </div>

        <div class="form-group">
            <h6>Valor</h6>
            <asp:TextBox ID="Txtvalor" runat="server" CssClass="form-control" Width="300" placeholder="Valor" onkeypress="return apenasNumeros(event)"></asp:TextBox>
        </div>

        <asp:Button ID="btnInserir" runat="server" Text="Inserir" OnClick="btnInserir_Click" CssClass="btn btn-outline-dark" />
    </div>
<script>
    function apenasLetras(evt) {
        var charCode = (evt.which) ? evt.which : evt.keyCode;
        if ((charCode < 65 || charCode > 90) && (charCode < 97 || charCode > 122) && (charCode != 32)) {
            return false;
        }
        return true;
    }
    function apenasNumeros(evt) {
        var charCode = (evt.which) ? evt.which : evt.keyCode;
        if (charCode < 48 || charCode > 57) {
            return false;
        }
        return true;
    }
</script>
</asp:Content>
