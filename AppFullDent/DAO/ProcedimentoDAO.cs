using AppFullDent.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace AppFullDent.DAO
{
    public class ProcedimentoDAO
    {
        public void Insert(Procedimento procedimento)
        {
            try
            {
                string sql = $"INSERT INTO Procedimentos10 (Nome, Codigo, CoberturaPlano9, CoberturaPlanoUso, Valor) VALUES ('{procedimento.Nome}','{procedimento.Codigo}','{procedimento.CoberturaPlano9}','{procedimento.CoberturaPlanoUso}', '{procedimento.Valor}')";
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
                string sql = "SELECT Nome FROM Procedimentos10";
                Conexao conexao = new Conexao();
                DataView dataView = conexao.Excute(sql);
                return dataView.ToTable();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public void ProcedimentoDentista(string nomeDentista, string nomeProcedimento)
        {
            try {
            string sql = $"INSERT INTO DentistaProcedimento(NomeDentista, NomeProcedimento) VALUES('{nomeDentista}', '{nomeProcedimento}')";
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