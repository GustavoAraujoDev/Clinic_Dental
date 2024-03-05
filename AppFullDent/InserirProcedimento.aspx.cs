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
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void btnInserir_Click(object sender, EventArgs e)
        {
            try
            {

            ProcedimentoService procedimentoService = new ProcedimentoService();
            
            Procedimento procedimento = new Procedimento
            {
                Nome = txtNome.Text,
                Codigo = txtCodigo.Text,
                CoberturaPlano9 = ddlCoberturaPlano9.Text,
                CoberturaPlanoUso = ddlCoberturaPlanoUso.Text,
                Valor = Txtvalor.Text,
            };
             procedimentoService.Cadastrar(procedimento);
            if (Page.IsValid)
            {
                Response.Write("Agendamento enviado com sucesso!");
            }
            else
            {
               
            }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}