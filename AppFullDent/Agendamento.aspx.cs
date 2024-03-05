using AppFullDent.DAO;
using AppFullDent.Models;
using AppFullDent.service;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AppFullDent
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                List<string> horariosDisponiveis = new List<string>();
                DateTime horarioInicial = DateTime.Today.AddHours(8); // Horário inicial às 9h

                
                while (horarioInicial.Hour < 17)
                {
                    horariosDisponiveis.Add(horarioInicial.ToString("HH:mm"));
                    horarioInicial = horarioInicial.AddMinutes(60);
                }

                List<DateTime> diasDisponiveis = new List<DateTime>();
                DateTime dataAtual = DateTime.Today;

               
                while (diasDisponiveis.Count < 7)
                {
                    if (dataAtual.DayOfWeek == DayOfWeek.Monday ||
                        dataAtual.DayOfWeek == DayOfWeek.Wednesday ||
                        dataAtual.DayOfWeek == DayOfWeek.Friday)
                    {
                        diasDisponiveis.Add(dataAtual);
                    }
                    dataAtual = dataAtual.AddDays(1);
                }

                foreach (var data in diasDisponiveis)
                {
                    foreach (var horario in horariosDisponiveis)
                    {
                        string dataHora = $"{data.ToShortDateString()} {horario}";
                        Datas.Items.Add(new ListItem(dataHora, dataHora));
                    }
                }

                ClinicaDAO clinicaDAO = new ClinicaDAO();
                var nomesClinicas = clinicaDAO.GetAll();

                foreach (DataRow row in nomesClinicas.Rows)
                {
                    string nomeClinica = row["Nome"].ToString();
                    Clinicas.Items.Add(new ListItem(nomeClinica, nomeClinica));
                }
            }

            Clinicas.SelectedIndexChanged += AtualizarDentistas;
            ddlDentistas.SelectedIndexChanged += AtualizarProcedimentos;
        }

        protected void AtualizarDentistas(object sender, EventArgs e)
        {
            string clinicaSelecionada = Clinicas.SelectedValue;

            if (!string.IsNullOrEmpty(clinicaSelecionada))
            {
                DentistaService dentistaService = new DentistaService();
                DentistaDAO dentistaDAO = new DentistaDAO();
                var nomesDentistas = dentistaService.GetDentistasPorClinica(clinicaSelecionada);

                ddlDentistas.Items.Clear();

                foreach (var dentista in nomesDentistas)
                {
                    string nomesdentista = dentista.Nome;
                    ddlDentistas.Items.Add(new ListItem(nomesdentista, nomesdentista));
                }
            }
            else
            {
                ddlDentistas.Items.Clear();
            }
        }

        protected void AtualizarProcedimentos(object sender, EventArgs e)
        {
            string DentistaSelecionada = ddlDentistas.SelectedValue;

            if (!string.IsNullOrEmpty(DentistaSelecionada))
            {
                ProcedimentoService procedimentoService = new ProcedimentoService();
                var nomesProcedimentos = procedimentoService.GetProcedimentoPorDentista(DentistaSelecionada);

                Procedimentos.Items.Clear();

                foreach (var Procedimento in nomesProcedimentos)
                {
                    string nomesProcedimento = Procedimento.Nome;
                    Procedimentos.Items.Add(new ListItem(nomesProcedimento, nomesProcedimento));
                }
            }
            else
            {
                Procedimentos.Items.Clear();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                AgendamentoService agendamentoServico = new AgendamentoService();
                Agendamento Agendamentos = new Agendamento
                {
                    Nome = txtNome.Text,
                    Telefone = txtTelefone.Text,
                    Rua = txtRua.Text,
                    Numero = txtNumero.Text,
                    Cidade = txtCidade.Text,
                    Email = txtEmail.Text,
                    Clinica = Clinicas.SelectedValue,
                    Data = Datas.Text,
                    Dentista = ddlDentistas.SelectedValue,
                    Procedimento = Procedimentos.SelectedValue,
                };
                agendamentoServico.Cadastrar(Agendamentos);

                if (Page.IsValid)
                {
                    Response.Write("Agendamento enviado com sucesso!");
                }
                else
                {
                   
                }
                ScriptManager.RegisterStartupScript(this, GetType(), "limparCampos", "limparCampos();", true);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
