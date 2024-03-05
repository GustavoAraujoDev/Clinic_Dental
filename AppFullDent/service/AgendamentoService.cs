using AppFullDent.DAO;
using AppFullDent.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace AppFullDent.service
{
    public class AgendamentoService
    {
        public bool Cadastrar(Agendamento agendamento)
        {
            try
            {
                AgendamentoDAO agendamentoDAO = new AgendamentoDAO();
                agendamentoDAO.Insert(agendamento);
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public List<Agendamento> GetTelefone(string Telefone)
        {
            List<Agendamento> agendamentos = new List<Agendamento>();

            try
            {
                string sql = $"SELECT * FROM Agendamento WHERE Telefone = '{Telefone}'";
                Conexao conexao = new Conexao();
                DataView dataView = conexao.Excute(sql);

                foreach (DataRowView row in dataView)
                {
                    Agendamento agendamento = new Agendamento
                    {
                        Nome = row["Nome"].ToString(),
                        Telefone = row["Telefone"].ToString(),
                        Email = row["Email"].ToString(),
                        Rua = row["Rua"].ToString(),
                        Numero = row["Numero"].ToString(),
                        Cidade = row["Cidade"].ToString(),
                        Clinica = row["ClinicDental"].ToString(),
                        Data = row["DataAgendamento"].ToString(),
                        Dentista = row["Dentista"].ToString(),
                        Procedimento = row["Procedimento"].ToString(),
                    };
                    agendamentos.Add(agendamento);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return agendamentos;
        }

        public bool Atualizar(Agendamento agendamento)
        {
            try
            {
                AgendamentoDAO agendamentoDAO = new AgendamentoDAO();
                agendamentoDAO.Update(agendamento);
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public bool Excluir(string nome)
        {
            try
            {
                AgendamentoDAO agendamentoDAO = new AgendamentoDAO();
                agendamentoDAO.Delete(nome);
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }


        public Agendamento GetAgendamentoPorNome(string nome)
        {
            try
            {
                string sql = $"SELECT * FROM Agendamento WHERE Nome = '{nome}'";
                Conexao conexao = new Conexao();
                DataView dataView = conexao.Excute(sql);

                if (dataView.Count > 0)
                {
                    DataRowView row = dataView[0];
                    Agendamento agendamento = new Agendamento
                    {
                        Nome = row["Nome"].ToString(),
                        Telefone = row["Telefone"].ToString(),
                        Email = row["Email"].ToString(),
                        Rua = row["Rua"].ToString(),
                        Numero = row["Numero"].ToString(),
                        Cidade = row["Cidade"].ToString(),
                        Clinica = row["ClinicDental"].ToString(),
                        Dentista = row["Dentista"].ToString(),
                    };
                    return agendamento;
                }
                else
                {
                    return null; 
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool EditarAgendamento(string nome, Agendamento novoAgendamento)
        {
            try
            {
                AgendamentoDAO agendamentoDAO = new AgendamentoDAO();

                
                Agendamento agendamentoExistente = GetAgendamentoPorNome(nome);
                if (agendamentoExistente != null)
                {
                    
                    agendamentoExistente.Nome = novoAgendamento.Nome;
                    agendamentoExistente.Telefone = novoAgendamento.Telefone;
                    agendamentoExistente.Email = novoAgendamento.Email;
                    agendamentoExistente.Rua = novoAgendamento.Rua;
                    agendamentoExistente.Numero = novoAgendamento.Numero;
                    agendamentoExistente.Cidade = novoAgendamento.Cidade;
                    agendamentoExistente.Clinica = novoAgendamento.Clinica;
                    agendamentoExistente.Dentista = novoAgendamento.Dentista;

                   
                    agendamentoDAO.Update(agendamentoExistente);
                    return true;
                }
                else
                {
                    return false; 
                }
            }
            catch (Exception ex)
            {
                return false;
            }
        }

    }

}