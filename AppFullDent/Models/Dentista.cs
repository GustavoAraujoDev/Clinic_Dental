using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AppFullDent.Models
{
    public class Dentista
    {
        public string Nome { get; set; }
        public string CPF { get; set; }
        public string Telefone { get; set; }
        public string Clinica { get; set; }
        public List<string> Especialidade { get; set; }

        public Dentista()
        {
            Especialidade = new List<string>();
        }
    }
    

}