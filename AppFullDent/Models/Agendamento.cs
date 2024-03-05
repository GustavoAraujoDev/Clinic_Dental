using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AppFullDent.Models
{
    public class Agendamento
    {
        public string Nome { get; set; }
        public string Rua { get; set; }
        public string Numero { get; set; }
        public string Cidade { get; set; }
        public string Telefone { get; set; }
        public string Email { get; set; }
        public string Clinica { get; set; }
        public string Dentista { get; set; }
        public string Data { get; set; }
        public string Procedimento { get; set; }

    }
}