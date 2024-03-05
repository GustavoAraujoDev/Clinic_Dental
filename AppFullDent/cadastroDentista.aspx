<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="cadastroDentista.aspx.cs" Inherits="AppFullDent.cadastroDentista" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <h2>Cadastro de Dentistas</h2>

                <div class="form-group">
                    <asp:Label ID="lblNomeCompleto" runat="server" Text="Nome Completo:" CssClass="control-label"></asp:Label>
                    <asp:TextBox ID="txtNome" runat="server" CssClass="form-control" onkeypress="return apenasLetras(event)"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvNome" runat="server" ControlToValidate="txtNome" ErrorMessage="Campo obrigatório" CssClass="text-danger">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revNome" runat="server" ControlToValidate="txtNome" ErrorMessage="Somente letras são permitidas" ValidationExpression="^[a-zA-Z\s]+$" CssClass="text-danger"></asp:RegularExpressionValidator>
                </div>

                <div class="form-group">
                    <asp:Label ID="lblCPF" runat="server" Text="CPF:" CssClass="control-label"></asp:Label>
                    <asp:TextBox ID="txtCPF" runat="server" CssClass="form-control" onkeypress="return apenasNumeros(event)" maxlength="14" onkeyup="formatarCPF(this)" placeholder="000.000.000-00"></asp:TextBox>
                    <asp:CustomValidator ID="cvCPF" runat="server" ControlToValidate="txtCPF" ErrorMessage="CPF deve ter 11 dígitos" ClientValidationFunction="validarTamanhoCPF" CssClass="text-danger"></asp:CustomValidator>
                    <asp:Label ID="lblResultado" runat="server" Text=""></asp:Label>
                </div>

                <div class="form-group">
                    <asp:Label ID="lblTelefone" runat="server" Text="Telefone:" CssClass="control-label"></asp:Label>
                    <asp:TextBox ID="txtTelefone" runat="server" CssClass="form-control" onkeypress="return apenasNumeros(event)" maxlength="15" onkeyup="formatarTelefone(this)" placeholder="(__) _____-____"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvTelefone" runat="server" ControlToValidate="txtTelefone" ErrorMessage="Campo obrigatório" CssClass="text-danger">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revTelefone" runat="server" ControlToValidate="txtTelefone" ErrorMessage="Formato de telefone inválido" ValidationExpression="^\(\d{2}\)\s\d{5}-\d{4}$" CssClass="text-danger"></asp:RegularExpressionValidator>
                </div>

                <div class="form-group">
                    <asp:Label ID="lblClinicas" runat="server" Text="Clínicas:" CssClass="control-label"></asp:Label>
                    <asp:DropDownList ID="ddlClinicas" runat="server" CssClass="form-control">
                        <asp:ListItem Text="Selecione uma clínica" Value=""></asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="form-group">
                    <h6>Serviço</h6>
                    <asp:DropDownList ID="ddlProcedimento" runat="server" CssClass="form-control" AutoPostBack="false" SelectionMode="Multiple">
                        <asp:ListItem Text="Selecione um Procedimento" Value=""></asp:ListItem>
                    </asp:DropDownList>
                    <asp:Button ID="btnAddToList" runat="server" Text="Adicionar à Lista" OnClick="btnAddToList_Click" CssClass="btn btn-primary mt-2" />
                </div>

                <div class="form-group">
                    <asp:ListBox ID="lstSelectedServices" runat="server" CssClass="form-control" SelectionMode="Multiple"></asp:ListBox>
                </div>

                <asp:Button ID="btnCadastrar" runat="server" Text="Cadastrar" OnClick="btnCadastrar_Click" CssClass="btn btn-success" />
            </div>
        </div>
    </div>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.16/jquery.mask.min.js"></script>
    <script>
        function limparCampos() {
            document.getElementById('<%= txtNome.ClientID %>').value = '';
            document.getElementById('<%= txtTelefone.ClientID %>').value = '';
            document.getElementById('<%= txtCPF.ClientID %>').value = '';
            document.getElementById('<%= ddlClinicas.ClientID %>').value = '';
        }
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
     function validarTamanhoTelefone(sender, args) {
         var telefone = document.getElementById('<%= txtTelefone.ClientID %>').value.replace(/\D/g,'');
    args.IsValid = (telefone.length === 11);
    }

    function formatarTelefone(input) {
        var valor = input.value.replace(/\D/g, '');
        var length = valor.length;

        if (length > 0) {
            input.value = '(' + valor.substring(0, 2);
        }
        if (length > 2) {
            input.value += ') ' + valor.substring(2, 7);
        }
        if (length > 7) {
            input.value += '-' + valor.substring(7, 11);
        }
    }

$(document).ready(function () {
    $('#<%= txtTelefone.ClientID %>').mask('(00) 00000-0000');
});
        function validarTamanhoCPF(sender, args) {
            var cpf = document.getElementById('<%= txtCPF.ClientID %>').value.replace(/\D/g, '');
            args.IsValid = (cpf.length === 11);
        }

        function formatarCPF(input) {
            var valor = input.value.replace(/\D/g, '');
            var length = valor.length;

            if (length > 0) {
                input.value = valor.substring(0, 3);
            }
            if (length > 3) {
                input.value += '.' + valor.substring(3, 6);
            }
            if (length > 6) {
                input.value += '.' + valor.substring(6, 9);
            }
            if (length > 9) {
                input.value += '-' + valor.substring(9, 11);
            }
        }
        $(document).ready(function () {
            $('#<%= txtCPF.ClientID %>').mask('000.000.000-00');
});

    </script>
</asp:Content>
