<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CadastroClinica.aspx.cs" Inherits="AppFullDent.CadastroClinica" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div class="container">
        <div class="row">
            <div class="col-md-6">
                <h2>Cadastro de Clínicas Clinic Dental</h2>
                <div class="form-group">
                    <asp:Label ID="lblNomeCompleto" runat="server" Text="Nome Completo:" AssociatedControlID="txtNome"></asp:Label>
                    <asp:TextBox ID="txtNome" runat="server" style="width: 300px" onkeypress="return apenasLetras(event)" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvNome" runat="server" ControlToValidate="txtNome" ErrorMessage="Campo obrigatório" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revNome" runat="server" ControlToValidate="txtNome" ErrorMessage="Somente letras são permitidas" ValidationExpression="^[a-zA-Z\s]+$" Display="Dynamic" CssClass="text-danger"></asp:RegularExpressionValidator>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblCNPJ" runat="server" Text="CNPJ:" AssociatedControlID="txtCNPJ" onkeypress="return apenasNumeros(event)"></asp:Label>
                    <asp:TextBox ID="txtCNPJ" runat="server" onkeyup="formatarCNPJ(this)" placeholder="00.000.000/0000-00" CssClass="form-control" onkeypress="return apenasNumeros(event)" MaxLength="18"></asp:TextBox>
                    <asp:CustomValidator ID="cvCNPJ" runat="server" ControlToValidate="txtCNPJ" ErrorMessage="CNPJ deve ter 14 dígitos" ClientValidationFunction="validarTamanhoCNPJ" Display="Dynamic" CssClass="text-danger"></asp:CustomValidator>
                    <asp:Label ID="lblResultado" runat="server" Text=""></asp:Label>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblTelefone" runat="server" Text="Telefone:" AssociatedControlID="txtTelefone"></asp:Label>
                    <asp:TextBox ID="txtTelefone" runat="server" okkeypress="return apenasNumeros(event)" onkeyup="formatarTelefone(this)" placeholder="(__) _____-____" CssClass="form-control" onkeypress="return apenasNumeros(event)" MaxLength="15"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvTelefone" runat="server" ControlToValidate="txtTelefone" ErrorMessage="Campo obrigatório" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revTelefone" runat="server" ControlToValidate="txtTelefone" ErrorMessage="Formato de telefone inválido" ValidationExpression="^\(\d{2}\)\s\d{5}-\d{4}$" Display="Dynamic" CssClass="text-danger"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="cvTelefone" runat="server" ControlToValidate="txtTelefone" ErrorMessage="Telefone deve ter 11 dígitos" ClientValidationFunction="validarTamanhoTelefone" Display="Dynamic" CssClass="text-danger"></asp:CustomValidator>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblEmail" runat="server" Text="Email:" AssociatedControlID="txtEmail"></asp:Label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Campo obrigatório" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Formato de email inválido" ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$" Display="Dynamic" CssClass="text-danger"></asp:RegularExpressionValidator>
                </div>

                <div class="form-group">
                    <asp:TextBox ID="txtCEP" runat="server"  onkeyup="formatarCEP(this)" CssClass="form-control" onkeypress="return apenasNumeros(event)" MaxLength="9"></asp:TextBox>
                    <asp:Button ID="btnBuscar" runat="server" CausesValidation="false" Text="Buscar" OnClick="btnBuscar_Click" />
                </div>
                <div class="form-group">
                    <asp:Label ID="lblEndereco" runat="server" Text="Endereço:" AssociatedControlID="txtRua"></asp:Label>
                    <asp:TextBox ID="txtRua" runat="server" placeholder="Rua" CssClass="form-control" onkeypress="return apenasLetras(event)"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvRua" runat="server" ControlToValidate="txtRua" ErrorMessage="Campo obrigatório" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtNumero" runat="server" placeholder="Número" CssClass="form-control" onkeypress="return apenasNumeros(event)"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvNumero" runat="server" ControlToValidate="txtNumero" ErrorMessage="Campo obrigatório" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtbairro" runat="server" placeholder="Birro" CssClass="form-control" onkeypress="return apenasLetras(event)"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCidade" ErrorMessage="Campo obrigatório" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtCidade" runat="server" placeholder="Cidade" CssClass="form-control" onkeypress="return apenasLetras(event)"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvCidade" runat="server" ControlToValidate="txtCidade" ErrorMessage="Campo obrigatório" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>
                <asp:Button ID="btnCadastrar" runat="server" Text="Cadastrar Clínicas" OnClick="btnCadastrar_Click" CssClass="btn btn-primary" />
            </div>
            <div class="col-md-6">
                <asp:Button ID="Button1" CausesValidation="false" runat="server" Text="Lista de Clínicas" OnClick="btnInformacao_Click" CssClass="btn btn-outline-dark mb-3" />
                <asp:GridView ID="GridViewClinicas" runat="server" AutoGenerateColumns="False" CssClass="table table-striped">
                    <Columns>
                        <asp:TemplateField HeaderText="Nome">
                            <ItemTemplate>
                                <asp:Label ID="lblNome" runat="server" Text='<%# Eval("Nome") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Telefone">
                            <ItemTemplate>
                                <asp:Label ID="lblTelefone" runat="server" Text='<%# Eval("Telefone") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Email">
                            <ItemTemplate>
                                <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Rua">
                            <ItemTemplate>
                                <asp:Label ID="lblRua" runat="server" Text='<%# Eval("Rua") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Numero">
                            <ItemTemplate>
                                <asp:Label ID="lblNumero" runat="server" Text='<%# Eval("Numero") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Cidade">
                            <ItemTemplate>
                                <asp:Label ID="lblCidade" runat="server" Text='<%# Eval("Cidade") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Ações">
                            <ItemTemplate>
                                <asp:Button ID="btnExcluirClinica" runat="server" Text="Excluir" CommandName="Excluir" CommandArgument='<%# Eval("Nome") %>' OnCommand="btnExcluirClinica_Command" CssClass="btn btn-danger btn-sm" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
    <script>

        function limparCampos() {
            document.getElementById('<%= txtNome.ClientID %>').value = '';
            document.getElementById('<%= txtTelefone.ClientID %>').value = '';
            document.getElementById('<%= txtCNPJ.ClientID %>').value = '';
            document.getElementById('<%= txtEmail.ClientID %>').value = '';
            document.getElementById('<%= txtRua.ClientID %>').value = '';
            document.getElementById('<%= txtNumero.ClientID %>').value = '';
            document.getElementById('<%= txtCidade.ClientID %>').value = '';
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

        function validarTamanhoCNPJ(sender, args) {
            var cnpj = document.getElementById('<%= txtCNPJ.ClientID %>').value.replace(/\D/g, '');
            args.IsValid = (cnpj.length === 14);
        }

        function formatarCNPJ(input) {
            var valor = input.value.replace(/\D/g, '');
            var length = valor.length;

            if (length > 0) {
                input.value = valor.substring(0, 2);
            }
            if (length > 2) {
                input.value += '.' + valor.substring(2, 5);
            }
            if (length > 5) {
                input.value += '.' + valor.substring(5, 8);
            }
            if (length > 8) {
                input.value += '/' + valor.substring(8, 12);
            }
            if (length > 12) {
                input.value += '-' + valor.substring(12, 14);
            }
        }

        $(document).ready(function () {
            $('#<%= txtCNPJ.ClientID %>').mask('00.000.000/0000-00');
});
        function formatarCEP(input) {
            var valor = input.value.replace(/\D/g, ''); // Remover todos os caracteres não numéricos
            var length = valor.length;

            // Limpar o valor atual do campo de entrada
            input.value = '';

            if (length > 0) {
                input.value += valor.substring(0, 5); // Adicionar os primeiros 5 dígitos do CEP
            }
            if (length > 5) {
                input.value += '-' + valor.substring(5, 8); // Adicionar o hífen e os últimos 3 dígitos do CEP
            }
        }

    </script>

</asp:Content>
