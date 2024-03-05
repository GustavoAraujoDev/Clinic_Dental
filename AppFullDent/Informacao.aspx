<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Informacao.aspx.cs" Inherits="AppFullDent.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h4 class="text-center mb-4">Informações de Agendamento</h4>
   <div class="col-md-6 offset-md-3">
      <div class="form-group">
         <asp:Label ID="lblTelefone" runat="server" Text="Telefone:" CssClass="font-weight-bold"></asp:Label>
         <asp:TextBox ID="txtTelefone" runat="server" class="form-control" style="width: 100%;" onkeypress="return apenasNumeros(event)" maxlength="15" onkeyup="formatarTelefone(this)" placeholder="(__) _____-____"></asp:TextBox>
         <asp:RequiredFieldValidator ID="rfvTelefone" runat="server" ControlToValidate="txtTelefone" ErrorMessage="Campo obrigatório">*</asp:RequiredFieldValidator>
         <asp:RegularExpressionValidator ID="revTelefone" runat="server" ControlToValidate="txtTelefone" ErrorMessage="Formato de telefone inválido" ValidationExpression="^\(\d{2}\)\s\d{5}-\d{4}$"></asp:RegularExpressionValidator>
         <asp:CustomValidator ID="cvTelefone" runat="server" ControlToValidate="txtTelefone" ErrorMessage="Telefone deve ter 11 dígitos" ClientValidationFunction="validarTamanhoTelefone"></asp:CustomValidator>
      </div>
      <div class="form-group">
         <asp:Button ID="btnSubmit" runat="server" Text="Buscar" OnClick="btnSubmit_Click" CssClass="btn btn-dark btn-block" />
      </div>
      <asp:ValidationSummary ID="ValidationSummary2" runat="server" ValidationGroup="formValidation" CssClass="alert alert-danger" />
   </div>
   <asp:Repeater ID="Repeater1" runat="server">
      <ItemTemplate>
         <div>
            <table>
               <tr>
                  <td><b>Nome:</b></td>
                  <td><asp:Label ID="lblNome" runat="server" Text='<%# Eval("Nome") %>'></asp:Label></td>
               </tr>
               <!-- Outras colunas aqui -->
               <tr>
                  <td><b>Telefone:</b></td>
                  <td><asp:Label ID="lblTelefone" runat="server" Text='<%# Eval("Telefone") %>'></asp:Label></td>
               </tr>
               <!-- Outras colunas aqui -->
               <tr>
                  <td><b>Email:</b></td>
                  <td><asp:Label ID="lblEmail" runat="server" Text='<%# Eval("Email") %>'></asp:Label></td>
               </tr>
               <!-- Outras colunas aqui -->
               <tr>
                  <td><b>Rua:</b></td>
                  <td><asp:Label ID="lblRua" runat="server" Text='<%# Eval("Rua") %>'></asp:Label></td>
               </tr>
               <!-- Outras colunas aqui -->
               <tr>
                  <td><b>Numero:</b></td>
                  <td><asp:Label ID="lblNumero" runat="server" Text='<%# Eval("Numero") %>'></asp:Label></td>
               </tr>
               <!-- Outras colunas aqui -->
               <tr>
                  <td><b>Cidade:</b></td>
                  <td><asp:Label ID="lblCidade" runat="server" Text='<%# Eval("Cidade") %>'></asp:Label></td>
               </tr>
               <!-- Outras colunas aqui -->
               <tr>
                  <td><b>Clinica:</b></td>
                  <td><asp:Label ID="lblClinica" runat="server" Text='<%# Eval("Clinica") %>'></asp:Label></td>
               </tr>
               <!-- Outras colunas aqui -->
               <tr>
                  <td><b>Dentista:</b></td>
                  <td><asp:Label ID="lblDentista" runat="server" Text='<%# Eval("Dentista") %>'></asp:Label></td>
               </tr>
               <tr>
                  <td><b>Data Agendamento:</b></td>
                  <td><asp:Label ID="lblData" runat="server" Text='<%# Eval("Data") %>'></asp:Label></td>
               </tr>
               <tr>
                  <td><b>Procedimento:</b></td>
                  <td><asp:Label ID="lblProcedimento" runat="server" Text='<%# Eval("Procedimento") %>'></asp:Label></td>
               </tr>
            </table>
            <asp:Button runat="server" CssClass="btn btn-primary editButton" Text="Editar" OnClick="Editar_Click" CommandArgument='<%# Container.ItemIndex %>' />
            <asp:Button ID="btnExcluir" runat="server" Text="Excluir" CommandName="Excluir" CommandArgument='<%# Eval("Nome") %>' OnCommand="btnExcluir_Command" />
         </div>
      </ItemTemplate>
   </asp:Repeater>
   <!-- Modal de Edição -->
   <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title" id="editModalLabel">Editar Informações</h5>
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">
               
                  <!-- Campos para editar -->
                  <asp:TextBox ID="txtEditNome" runat="server" CssClass="form-control"></asp:TextBox>
                  <asp:TextBox ID="txtEditTelefone" runat="server" CssClass="form-control"></asp:TextBox>
                  <asp:TextBox ID="txtEditEmail" runat="server" CssClass="form-control"></asp:TextBox>
                  <asp:TextBox ID="txtEditRua" runat="server" CssClass="form-control"></asp:TextBox>
                  <asp:TextBox ID="txtEditNumero" runat="server" CssClass="form-control"></asp:TextBox>
                  <asp:TextBox ID="txtEditCidade" runat="server" CssClass="form-control"></asp:TextBox>
                  <asp:TextBox ID="txtEditClinica" runat="server" CssClass="form-control"></asp:TextBox>
                  <asp:TextBox ID="txtEditDentista" runat="server" CssClass="form-control"></asp:TextBox>
                  <asp:TextBox ID="txtEditData" runat="server" CssClass="form-control"></asp:TextBox>
                  <asp:TextBox ID="txtEditProcedimento" runat="server" CssClass="form-control"></asp:TextBox>
                  <!-- Adicione outros campos de edição conforme necessário -->
             
            </div>
            <div class="modal-footer">
               <asp:Button ID="btnSalvarEdicao" runat="server" Text="Salvar" CssClass="btn btn-primary" OnClick="btnSalvarEdicao_Click" />
               <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
            </div>
         </div>
      </div>
   </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.16/jquery.mask.min.js"></script>
    <script>
       
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

        function preencherFormulario(item) {
            document.getElementById("<%=txtEditNome.ClientID%>").value = item.Nome;
            document.getElementById("<%=txtEditTelefone.ClientID%>").value = item.Telefone;
            document.getElementById("<%=txtEditEmail.ClientID%>").value = item.Email;
            document.getElementById("<%=txtEditRua.ClientID%>").value = item.Rua;
            document.getElementById("<%=txtEditNumero.ClientID%>").value = item.Numero;
            document.getElementById("<%=txtEditCidade.ClientID%>").value = item.Cidade;
            document.getElementById("<%=txtEditClinica.ClientID%>").value = item.Clinica;
            document.getElementById("<%=txtEditDentista.ClientID%>").value = item.Dentista;
            document.getElementById("<%=txtEditData.ClientID%>").value = item.Data;
            document.getElementById("<%=txtEditProcedimento.ClientID%>").value = item.Procedimento;
        }

        // Evento de clique no botão Editar
        $(document).on("click", ".editButton", function () {
            var itemIndex = $(this).data("itemIndex");
            __doPostBack('<%= Repeater1.UniqueID %>', 'Edit$' + itemIndex);
        });
        jQuery(document).ready(function ($) {
            function showEditModal() {
                $('#editModal').modal('show');
            }

            function hideEditModal() {
                $('#editModal').modal('hide');
            }

            // Restante do seu código aqui...
        });

    </script>

</asp:Content>
