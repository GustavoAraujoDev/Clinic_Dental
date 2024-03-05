using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AppFullDent
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAgendarServico_Click(object sender, EventArgs e)
        {
            Response.Redirect("agendamento.aspx");
        }

        protected void btnVerInformacoes_Click(object sender, EventArgs e)
        {
            Response.Redirect("Informacao.aspx");
        }

    }
}