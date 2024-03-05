using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AppFullDent
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text;
            string password = txtPassword.Text;

            // Verificar se as credenciais são válidas (lógica de autenticação fictícia)
            if (IsLoginValid(username, password))
            {
                // Redirecionar para a página de destino após o login bem-sucedido
                Response.Redirect("cadastroDentista.aspx");
            }
            else
            {
                // Exibir mensagem de erro se as credenciais forem inválidas
                lblErrorMessage.Text = "Nome de usuário ou senha inválidos.";
            }
        }

        // Função fictícia para verificar se as credenciais são válidas
        private bool IsLoginValid(string username, string password)
        {
            // Aqui você deve implementar a lógica de autenticação real, como verificar em um banco de dados
            // Por enquanto, estamos apenas simulando um login bem-sucedido para fins de exemplo
            return username == "ClinicDental" && password == "12345678";
        }
    }
}