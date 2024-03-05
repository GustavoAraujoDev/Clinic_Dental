using AppFullDent.DAO;
using AppFullDent.Models;
using AppFullDent.service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AppFullDent
{
	public partial class WebForm4 : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}
		protected void btnSubmit_Click(object sender, EventArgs e)
		{
            AgendamentoService agendamentoService = new AgendamentoService();
			AgendamentoDAO agendamentoDAO = new AgendamentoDAO();
			string Phone = txtTelefone.Text;
			List<Agendamento> agendamento = agendamentoService.GetTelefone(Phone);
            Repeater1.DataSource = agendamento;
            Repeater1.DataBind();
		}

        protected void btnExcluir_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "Excluir")
            {
                string nome = e.CommandArgument.ToString();

                // Chame o método para excluir a linha correspondente no banco de dados
                AgendamentoDAO agendamentoDAO = new AgendamentoDAO();
                agendamentoDAO.Delete(nome);
                atualizar();
                // Exiba uma mensagem de sucesso ou faça qualquer outra ação necessária
                Response.Write("Linha excluída com sucesso.");
            }
        }
        protected void atualizar()
        {
            AgendamentoService agendamentoService = new AgendamentoService();
            AgendamentoDAO agendamentoDAO = new AgendamentoDAO();
            string Phone = txtTelefone.Text;
            List<Agendamento> agendamento = agendamentoService.GetTelefone(Phone);
            Repeater1.DataSource = agendamento;
            Repeater1.DataBind();
        }

        protected void Editar_Click(object sender, EventArgs e)
        {
            int index = int.Parse((sender as Button).CommandArgument);
            var item = Repeater1.Items[index];

            txtEditNome.Text = (item.FindControl("lblNome") as Label).Text;
            txtEditTelefone.Text = (item.FindControl("lblTelefone") as Label).Text;
            txtEditEmail.Text = (item.FindControl("lblEmail") as Label).Text;
            txtEditRua.Text = (item.FindControl("lblRua") as Label).Text;
            txtEditNumero.Text = (item.FindControl("lblNumero") as Label).Text;
            txtEditCidade.Text = (item.FindControl("lblCidade") as Label).Text;
            txtEditClinica.Text = (item.FindControl("lblClinica") as Label).Text;
            txtEditDentista.Text = (item.FindControl("lblDentista") as Label).Text;
            txtEditData.Text = (item.FindControl("lblData") as Label).Text;
            txtEditProcedimento.Text = (item.FindControl("lblProcedimento") as Label).Text;

            ScriptManager.RegisterStartupScript(this, this.GetType(), "editModalScript", "showEditModal();", true);
        }

        protected void btnSalvarEdicao_Click(object sender, EventArgs e)
        {
            AgendamentoDAO agendamentoDAO = new AgendamentoDAO();
            Agendamento agendamento = new Agendamento();
            agendamento.Nome = txtEditNome.Text;
            agendamento.Telefone = txtEditTelefone.Text;
            agendamento.Email = txtEditEmail.Text;
            agendamento.Rua = txtEditRua.Text;
            agendamento.Numero = txtEditNumero.Text;
            agendamento.Cidade = txtEditCidade.Text;
            agendamento.Clinica = txtEditClinica.Text;
            agendamento.Dentista = txtEditDentista.Text;
            agendamento.Data = txtEditData.Text;
            agendamento.Procedimento = txtEditProcedimento.Text;

            agendamentoDAO.Update(agendamento);

            // Atualizar a lista após a edição
            // Coloque aqui o código para atualizar a lista

            ScriptManager.RegisterStartupScript(this, this.GetType(), "editModalScript", "hideEditModal();", true);
        }


    }
}