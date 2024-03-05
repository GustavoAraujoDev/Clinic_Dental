using AppFullDent.DAO;
using AppFullDent.Models;
using AppFullDent.service;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AppFullDent
{
    public partial class cadastroDentista : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
                ProcedimentoDAO procedimentoDAO = new ProcedimentoDAO();
                    var nomeProcedimento = procedimentoDAO.GetAll();

                    foreach (DataRow row in nomeProcedimento.Rows)
                    {
                        string nomeProcedimentos = row["Nome"].ToString();
                        ddlProcedimento.Items.Add(new ListItem(nomeProcedimentos, nomeProcedimentos));
                    }
                
                ClinicaDAO clinicaDAO = new ClinicaDAO();
                var nomesClinicas = clinicaDAO.GetAll();

                
                foreach (DataRow row in nomesClinicas.Rows)
                {
                    string nomeClinica = row["Nome"].ToString();
                    ddlClinicas.Items.Add(new ListItem(nomeClinica, nomeClinica));
                }
            }
        }

        protected void btnAddToList_Click(object sender, EventArgs e)
        {
            
            foreach (ListItem item in ddlProcedimento.Items)
            {
                if (item.Selected)
                {
                    lstSelectedServices.Items.Add(item);
                }
            }
        }


        protected void btnCadastrar_Click(object sender, EventArgs e)
        {
            string cpf = txtCPF.Text.Trim();

            if (!IsValidCpf(cpf))
            {
                lblResultado.Text = "CPF inválido. Por favor, verifique o CPF fornecido.";
                return; 
            }

            lblResultado.Text = "CPF válido.";

            ProcedimentoDAO procedimentoDAO = new ProcedimentoDAO();
            DentistaService dentistaServico = new DentistaService();
            Dentista Dentistas = new Dentista
            {
                Nome = txtNome.Text,
                CPF = txtCPF.Text,
                Telefone = txtTelefone.Text,
                Clinica = ddlClinicas.Text,
        };
            Dentistas.Especialidade = new List<string>();

            foreach (ListItem item in lstSelectedServices.Items)
            {
                if (item.Selected)
                {
                    Dentistas.Especialidade.Add(item.Text);
                    procedimentoDAO.ProcedimentoDentista(Dentistas.Nome, item.Text);
                }
            }
            
            dentistaServico.Cadastrar(Dentistas);
            lstSelectedServices.Items.Clear();
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
       protected bool IsValidCpf(string cpf)
       {
    // Remover caracteres não numéricos
    cpf = Regex.Replace(cpf, "[^0-9]", "");

    // Verificar se o CPF tem 11 dígitos
    if (cpf.Length != 11)
        return false;

    // Verificar se todos os dígitos são iguais (isso é inválido)
    if (new string(cpf[0], cpf.Length) == cpf)
        return false;

    // Calcular o primeiro dígito verificador
    int soma = 0;
    for (int i = 0; i < 9; i++)
    {
        soma += int.Parse(cpf[i].ToString()) * (10 - i);
    }
    int resto = soma % 11;
    int dv1 = resto < 2 ? 0 : 11 - resto;

    // Calcular o segundo dígito verificador
    soma = 0;
    for (int i = 0; i < 10; i++)
    {
        soma += int.Parse(cpf[i].ToString()) * (11 - i);
    }
    resto = soma % 11;
    int dv2 = resto < 2 ? 0 : 11 - resto;

    // Verificar se os dígitos verificadores estão corretos
    return int.Parse(cpf[9].ToString()) == dv1 && int.Parse(cpf[10].ToString()) == dv2;
}
    }
}