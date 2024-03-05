using AppFullDent.DAO;
using AppFullDent.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace AppFullDent.service
{
    public class ProcedimentoService
    {
        public bool Cadastrar(Procedimento procedimento)
        {
            try
            {
                ProcedimentoDAO procedimentoDAO = new ProcedimentoDAO();
                procedimentoDAO.Insert(procedimento);
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
        public List<Procedimento> GetProcedimentoPorDentista(string dentista)
        {
            List<Procedimento> procedimentos = new List<Procedimento>();

            try
            {
                string sql = $"SELECT NomeProcedimento FROM DentistaProcedimento WHERE NomeDentista = '{dentista}'";
                Conexao conexao = new Conexao();
                DataView dataView = conexao.Excute(sql);

                foreach (DataRowView row in dataView)
                {
                    Procedimento procedimento = new Procedimento
                    {
                        Nome = row["NomeProcedimento"].ToString()
                    };
                    procedimentos.Add(procedimento);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return procedimentos;
        }
    }
}