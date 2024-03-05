using AppFullDent.DAO;
using AppFullDent.Models;
using AppFullDent.service;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AppFullDent
{
    public partial class CadastroClinica : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
            }
        }
       
        protected void btnCadastrar_Click(object sender, EventArgs e)
        {
            string cnpj = txtCNPJ.Text.Trim();

            if (!IsValidCnpj(cnpj))
            {
                lblResultado.Text = "CNPJ inválido. Por favor, verifique o CNPJ fornecido.";
                return;
            }

            lblResultado.Text = "CPNJ válido.";

            ClinicaService ClinicaServico = new ClinicaService();
            Clinica Clinicas = new Clinica
            {
                Nome = txtNome.Text,
                CNPJ = txtCNPJ.Text,
                Telefone = txtTelefone.Text,
                Email = txtEmail.Text,
                Rua = txtRua.Text,
                Numero = txtNumero.Text,
                Cidade = txtCidade.Text,
            };
            ClinicaServico.Cadastrar(Clinicas);

            if (Page.IsValid)
            {
                Response.Write("Cadastro enviado com sucesso!");
            }
            else
            {
                Visible = true;
            }
            ScriptManager.RegisterStartupScript(this, GetType(), "limparCampos", "limparCampos();", true);
        }
        protected void btnInformacao_Click(object sender, EventArgs e)
        {
            
            ClinicaDAO clinicaDAO = new ClinicaDAO();
            ClinicaService clinicaServico = new ClinicaService();
            List<Clinica> clinica = clinicaServico.GetClinica();
            GridViewClinicas.DataSource = clinica;
            GridViewClinicas.DataBind();
        }

        protected void btnExcluirClinica_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "Excluir")
            {
                string nome = e.CommandArgument.ToString();

                // Chame o método para excluir a linha correspondente no banco de dados
                ClinicaDAO clinicaDAO = new ClinicaDAO();
                clinicaDAO.Delete(nome);
                atualizar();
                // Exiba uma mensagem de sucesso ou faça qualquer outra ação necessária
                Response.Write("Linha excluída com sucesso.");
            }
        }
        protected void atualizar()
        {
            ClinicaDAO clinicaDAO = new ClinicaDAO();
            ClinicaService clinicaServico = new ClinicaService();
            List<Clinica> clinica = clinicaServico.GetClinica();
            GridViewClinicas.DataSource = clinica;
            GridViewClinicas.DataBind();
        }
        
        static bool IsValidCnpj(string cnpj)
        {
            // Remover caracteres não numéricos
            cnpj = Regex.Replace(cnpj, "[^0-9]", "");

            // Verificar se o CNPJ tem 14 dígitos
            if (cnpj.Length != 14)
                return false;

            // Verificar se todos os dígitos são iguais (isso é inválido)
            if (new string(cnpj[0], cnpj.Length) == cnpj)
                return false;

            // Calcular o primeiro dígito verificador
            int[] multiplicadores1 = { 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2 };
            int soma = 0;
            for (int i = 0; i < 12; i++)
            {
                soma += int.Parse(cnpj[i].ToString()) * multiplicadores1[i];
            }
            int resto = soma % 11;
            int dv1 = resto < 2 ? 0 : 11 - resto;

            // Calcular o segundo dígito verificador
            int[] multiplicadores2 = { 6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2 };
            soma = 0;
            for (int i = 0; i < 13; i++)
            {
                soma += int.Parse(cnpj[i].ToString()) * multiplicadores2[i];
            }
            resto = soma % 11;
            int dv2 = resto < 2 ? 0 : 11 - resto;

            // Verificar se os dígitos verificadores estão corretos
            return int.Parse(cnpj[12].ToString()) == dv1 && int.Parse(cnpj[13].ToString()) == dv2;
        }
        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            string cep = txtCEP.Text.Trim().Replace("-", "");
            if (!string.IsNullOrEmpty(cep))
            {
                string url = $"https://viacep.com.br/ws/{cep}/json/";
                using (HttpClient client = new HttpClient())
                {
                    var response = client.GetAsync(url).Result;
                    if (response.IsSuccessStatusCode)
                    {
                        var json = response.Content.ReadAsStringAsync().Result;
                        dynamic endereco = JsonConvert.DeserializeObject(json);
                        if (endereco != null)
                        {
                            txtRua.Text = endereco.logradouro;
                            txtbairro.Text = endereco.bairro;
                            txtCidade.Text = endereco.localidade;
                        }
                    }
                    else
                    {
                        
                        Response.Write("CEP não encontrado.");
                    }
                }
            }
            else
            {
                Response.Write("Digite um CEP válido.");
            }
        }
    }
}