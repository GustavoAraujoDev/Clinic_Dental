using AppFullDent.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace AppFullDent.DAO
{
    public class ClinicaDAO
    {
        public void Insert(Clinica clinica)
        {
            try
            {
                string sql = $"INSERT INTO Clinica (Nome, CNPJ, Telefone, Email, Rua, Numero, Cidade) " +
                             $"VALUES ('{clinica.Nome}', '{clinica.CNPJ}', '{clinica.Telefone}', " +
                             $"'{clinica.Email}', '{clinica.Rua}', '{clinica.Numero}', '{clinica.Cidade}')";
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
                string sql = $"DELETE FROM Clinica WHERE Nome = '{nome}'";
                Conexao conexao = new Conexao();
                conexao.ExecuteReader(sql);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void Update(Clinica clinica)
        {
            try
            {
                string sql = $"UPDATE Clinica SET Nome = '{clinica.Nome}', CNPJ = '{clinica.CNPJ}', " +
                             $"Telefone = '{clinica.Telefone}', Email = '{clinica.Email}', " +
                             $"Rua = '{clinica.Rua}', Numero = '{clinica.Numero}', Cidade = '{clinica.Cidade}' " +
                             $"WHERE Telefone = '{clinica.Telefone}'";
                Conexao conexao = new Conexao();
                conexao.ExecuteReader(sql);
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
                string sql = "SELECT Nome FROM Clinica"; 
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