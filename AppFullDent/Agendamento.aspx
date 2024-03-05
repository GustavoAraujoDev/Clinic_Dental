<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Agendamento.aspx.cs" Inherits="AppFullDent.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <h2 class="text-center">Agendamento Clinic Dental</h2>

        <div class="row justify-content-center">
            <div class="col-md-6">
                <asp:Label ID="lblNome" runat="server" Text="Nome Completo:" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtNome" runat="server" CssClass="form-control" onkeypress="return apenasLetras(event)"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvNome" runat="server" ControlToValidate="txtNome" ErrorMessage="Campo obrigatório" CssClass="text-danger">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revNome" runat="server" ControlToValidate="txtNome" ErrorMessage="Somente letras são permitidas" ValidationExpression="^[a-zA-Z\s]+$" CssClass="text-danger"></asp:RegularExpressionValidator>
            </div>
        </div>

        <div class="row justify-content-center">
            <div class="col-md-6">
                <asp:Label ID="lblEndereco" runat="server" Text="Endereço:" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtRua" runat="server" CssClass="form-control" placeholder="Rua" onkeypress="return apenasLetras(event)"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvRua" runat="server" ControlToValidate="txtRua" ErrorMessage="Campo obrigatório" CssClass="text-danger">*</asp:RequiredFieldValidator>
                <asp:TextBox ID="txtNumero" runat="server" CssClass="form-control" placeholder="Número" onkeypress="return apenasNumeros(event)"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvNumero" runat="server" ControlToValidate="txtNumero" ErrorMessage="Campo obrigatório" CssClass="text-danger">*</asp:RequiredFieldValidator>
                <asp:TextBox ID="txtCidade" runat="server" CssClass="form-control" placeholder="Cidade" onkeypress="return apenasLetras(event)"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvCidade" runat="server" ControlToValidate="txtCidade" ErrorMessage="Campo obrigatório" CssClass="text-danger">*</asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="row justify-content-center">
            <div class="col-md-6">
                <asp:Label ID="lblTelefone" runat="server" Text="Telefone:" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtTelefone" runat="server" CssClass="form-control" placeholder="(__) _____-____" onkeypress="return apenasNumeros(event)" maxlength="15" onkeyup="formatarTelefone(this)"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvTelefone" runat="server" ControlToValidate="txtTelefone" ErrorMessage="Campo obrigatório" CssClass="text-danger">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revTelefone" runat="server" ControlToValidate="txtTelefone" ErrorMessage="Formato de telefone inválido" ValidationExpression="^\(\d{2}\)\s\d{5}-\d{4}$" CssClass="text-danger"></asp:RegularExpressionValidator>
                <asp:CustomValidator ID="cvTelefone" runat="server" ControlToValidate="txtTelefone" ErrorMessage="Telefone deve ter 11 dígitos" ClientValidationFunction="validarTamanhoTelefone" CssClass="text-danger"></asp:CustomValidator>
                <asp:ValidationSummary ID="ValidationSummary2" runat="server" ValidationGroup="formValidation" CssClass="alert alert-danger" />
            </div>
        </div>

        <div class="row justify-content-center">
            <div class="col-md-6">
                <asp:Label ID="lblEmail" runat="server" Text="Email:" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Campo obrigatório" CssClass="text-danger">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Formato de email inválido" ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$" CssClass="text-danger"></asp:RegularExpressionValidator>
                <asp:ValidationSummary ID="ValidationSummary3" runat="server" ValidationGroup="formValidation" CssClass="alert alert-danger" />
            </div>
        </div>

        <div class="row justify-content-center">
            <div class="col-md-6">
                <asp:Label ID="lblSelect1" runat="server" Text="Clinic" CssClass="form-label"></asp:Label>
                <asp:DropDownList ID="Clinicas" runat="server" AutoPostBack="true" CssClass="form-control">
                    <asp:ListItem Text="Selecione uma clínica" Value=""></asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>

        <div class="row justify-content-center">
            <div class="col-md-6" id="Containerdentist">
                <asp:Label ID="lblSelect2" runat="server" Text="Dentist" CssClass="form-label"></asp:Label><br />
                <asp:DropDownList ID="ddlDentistas" runat="server" AutoPostBack="true" CssClass="form-control">
                    <asp:ListItem Text="Selecione um dentista" Value=""></asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>

        <div class="row justify-content-center">
            <div class="col-md-6" id="containerdata">
                <asp:Label ID="lblSelect3" runat="server" Text="Data e Hora:" CssClass="form-label"></asp:Label><br />
                <asp:DropDownList ID="Datas" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Selecione uma data e hora" Value=""></asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>

        <div class="row justify-content-center">
            <div class="col-md-6" id="containerProcedimento">
                <asp:Label ID="Label1" runat="server" Text="Procedimentos" CssClass="form-label"></asp:Label><br />
                <asp:DropDownList ID="Procedimentos" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Selecione um Procedimento" Value=""></asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>

        <div class="row justify-content-center">
            <div class="col-md-6">
                <asp:Button ID="btnSubmit" runat="server" Text="Agendar" OnClick="btnSubmit_Click" CssClass="btn btn-outline-dark mt-3" />
            </div>
        </div>
    </div>
        
    <script>
        
        function limparCampos() {
            document.getElementById('<%= txtNome.ClientID %>').value = '';
            document.getElementById('<%= txtTelefone.ClientID %>').value = '';
            document.getElementById('<%= txtRua.ClientID %>').value = '';
            document.getElementById('<%= txtNumero.ClientID %>').value = '';
            document.getElementById('<%= txtCidade.ClientID %>').value = '';
            document.getElementById('<%= txtEmail.ClientID %>').value = '';
            document.getElementById('<%= Clinicas.ClientID %>').value = '';
            document.getElementById('<%= ddlDentistas.ClientID %>').value = '';
            document.getElementById('<%= Datas.ClientID %>').value = '';
        }

        function mostrarOcultarDropdown() {
            var ddlSelect1 = document.getElementById('<%= Clinicas.ClientID %>');
            var containerDentist = document.getElementById('Containerdentist');
            var ddlSelect2 = document.getElementById('<%= ddlDentistas.ClientID %>');

        if (ddlSelect1.value !== '') {
            containerDentist.style.display = 'block';
            ddlSelect2.selectedIndex = 0; // Reiniciar o dropdown selecionado
            mostrarOcultarDropdownDentist(); // Chamar a função para mostrar ou ocultar o próximo dropdown
        } else {
            containerDentist.style.display = 'none';
            document.getElementById('containerdata').style.display = 'none';
        }
    }

    function mostrarOcultarDropdownDentist() {
        var ddlSelect2 = document.getElementById('<%= ddlDentistas.ClientID %>');
            var containerData = document.getElementById('containerdata');

            if (ddlSelect2.value !== '') {
                containerData.style.display = 'block';
            } else {
                containerData.style.display = 'none';
            }
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
    </script>

</asp:Content>
