using AppFullDent.DAO;
using AppFullDent.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace AppFullDent.service
{
    public class ClinicaService
    {
        public bool Cadastrar(Clinica clinica)
        {
            try
          {
                ClinicaDAO ClinicaDAO = new ClinicaDAO();
                ClinicaDAO.Insert(clinica);
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public List<Clinica> GetClinica()
        {
            List<Clinica> clinicas = new List<Clinica>();

            try
            {
                string sql = $"SELECT * FROM Clinica";
                Conexao conexao = new Conexao();
                DataView dataView = conexao.Excute(sql);

                foreach (DataRowView row in dataView)
                {
                    Clinica clinica = new Clinica
                    {
                        Nome = row["Nome"].ToString(),
                        Telefone = row["Telefone"].ToString(),
                        CNPJ = row["CNPJ"].ToString(),
                        Email = row["Email"].ToString(),
                        Rua = row["Rua"].ToString(),
                        Numero = row["Numero"].ToString(),
                        Cidade = row["Cidade"].ToString(),
                     
                    };
                    clinicas.Add(clinica);
                 };
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return clinicas;
        }

    }

}