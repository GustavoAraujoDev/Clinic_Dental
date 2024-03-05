using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AppFullDent
{
    public partial class LoginClinica : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            // Verifique se os campos obrigatórios foram preenchidos
            if (Page.IsValid)
            {
                // Obtenha os valores inseridos nos campos
                string clinicName = txtClinicName.Text.Trim();
                string password = txtPassword.Text.Trim();

                // Verifique a autenticação da clínica (você precisa implementar a lógica de autenticação)
                if (AutenticarClinica(clinicName, password))
                {
                    // Autenticação bem-sucedida - redirecione para a página de perfil da clínica
                    Response.Redirect("CadastroClinica.aspx");
                }
                else
                {
                    // Autenticação falhou - exiba uma mensagem de erro
                    lblErrorMessages.Text = "Nome da clínica ou senha inválidos. Por favor, tente novamente.";
                }
            }
        }

        // Método para autenticar a clínica
        private bool AutenticarClinica(string clinicName, string password)
        {
            // Aqui você implementará a lógica para verificar a autenticidade do nome da clínica e da senha
            // Isso pode envolver consultar um banco de dados ou qualquer outro meio de armazenamento seguro de credenciais
            // Retorne true se a autenticação for bem-sucedida, caso contrário, retorne false

            // Por enquanto, apenas um exemplo de autenticação falsa para fins de demonstração
            return clinicName == "ClinicDental" && password == "12345678";
        }

    }
}