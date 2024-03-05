using AppFullDent.DAO;
using AppFullDent.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace AppFullDent.service
{
    public class DentistaService
    {
        public bool Cadastrar(Dentista dentista)
        {
            try
            {
                DentistaDAO DentistaDAO = new DentistaDAO();
                DentistaDAO.Insert(dentista);
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public List<Dentista> GetDentistasPorClinica(string clinica)
        {
            List<Dentista> dentistas = new List<Dentista>();

            try
            {
                string sql = $"SELECT Nome FROM Dentista WHERE Clinica = '{clinica}'";
                Conexao conexao = new Conexao();
                DataView dataView = conexao.Excute(sql);

                foreach (DataRowView row in dataView)
                {
                    Dentista dentista = new Dentista
                    {
                        Nome = row["Nome"].ToString()
                    };
                    dentistas.Add(dentista);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return dentistas;
        }

    }

}