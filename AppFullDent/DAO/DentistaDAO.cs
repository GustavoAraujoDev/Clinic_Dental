using AppFullDent.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace AppFullDent.DAO
{
    public class DentistaDAO
    {
        public void Insert(Dentista Dentista)
        {
            try
            {
                string sql = $"INSERT INTO Dentista (Nome, CPF, Telefone, Clinica, Especialidade) VALUES ('{Dentista.Nome}','{Dentista.CPF}','{Dentista.Telefone}','{Dentista.Clinica}', '{Dentista.Especialidade}')";
                Conexao conexao = new Conexao();
                conexao.ExecuteReader(sql);

               
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void Delete(string nome)
        {
            try
            {
                string sql = $"DELETE FROM Dentista WHERE Nome = {nome}";
                Conexao conexao = new Conexao();
                conexao.ExecuteReader(sql);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void Update(Dentista dentista)
        {
            try
            {
                string sql = $"UPDATE Dentista SET Nome = '{dentista.Nome}', CPF = '{dentista.CPF}', " +
                             $"Telefone = '{dentista.Telefone}', Clinica = '{dentista.Clinica}' " +
                             $"WHERE Nome = {dentista.Nome}";
                Conexao conexao = new Conexao();
                conexao.ExecuteReader(sql);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void AddEspecialidade(int dentistaID, string especialidade)
        {
            try
            {
                string sql = $"INSERT INTO Especialidade (DentistaID, Especialidade) VALUES ('{dentistaID}','{especialidade}')";
                Conexao conexao = new Conexao();
                conexao.ExecuteReader(sql);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public Dentista GetByName(String nome)
        {
            try
            {
                string sql = $"SELECT * FROM Dentista WHERE Nome = {nome}";
                Conexao conexao = new Conexao();
                DataView dataView = conexao.Excute(sql);
                DataTable dataTable = dataView.ToTable();
                if (dataTable.Rows.Count > 0)
                {
                    DataRow row = dataTable.Rows[0];
                    return new Dentista
                    {
                        Nome = row["Nome"].ToString(),
                        CPF = row["CPF"].ToString(),
                        Telefone = row["Telefone"].ToString(),
                        Clinica = row["Clinica"].ToString()
                    };
                }
                return null;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public DataTable GetAll()
        {
            try
            {
                string sql = "SELECT * FROM Dentista";
                Conexao conexao = new Conexao();
                DataView dataView = conexao.Excute(sql);
                return dataView.ToTable();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }

}