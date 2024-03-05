using AppFullDent.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace AppFullDent.DAO
{
    public class AgendamentoDAO
    {
        public void Insert(Agendamento agendamento)
        {
            try
            {
                string sql = $"INSERT INTO Agendamento (Nome, Telefone, Rua, Numero, Cidade, Email, ClinicDental, Dentista, DataAgendamento, Procedimento) VALUES ('{agendamento.Nome}','{agendamento.Telefone}','{agendamento.Rua}','{agendamento.Numero}','{agendamento.Cidade}','{agendamento.Email}','{agendamento.Clinica}','{agendamento.Dentista}','{agendamento.Data}','{agendamento.Procedimento}')";
                Conexao conexao = new Conexao();
                conexao.ExecuteReader(sql);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void Update(Agendamento agendamento)
        {
            try
            {
                string sql = $"UPDATE Agendamento SET Telefone = '{agendamento.Telefone}', Rua = '{agendamento.Rua}', Numero = '{agendamento.Numero}', Cidade = '{agendamento.Cidade}', Email = '{agendamento.Email}', ClinicDental = '{agendamento.Clinica}', Dentista = '{agendamento.Dentista}', DataAgendamento = '{agendamento.Data}' WHERE Nome = '{agendamento.Nome}'";
                Conexao conexao = new Conexao();
                conexao.ExecuteReader(sql);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void Rear(string Nome)
        {
            try
            {
                string sql = $"SELECT * FROM Agendamento WHERE Nome = '{Nome}'";
                Conexao conexao = new Conexao();
                conexao.ExecuteReader(sql);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void Delete(string Nome)
        {
            try
            {
                string sql = $"DELETE FROM Agendamento WHERE Nome = '{Nome}'";
                Conexao conexao = new Conexao();
                conexao.ExecuteReader(sql);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }

}