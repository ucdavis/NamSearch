using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using NamSearch.Core.Domain;

namespace NamSearch.Models
{
    public class NamSearchModel
    {
        public string NamNumber { get; set; }

        public string Vlan { get; set; }

        public IList<Vlan> Vlans
        { get; set; }

        public String Building { get; set; }

        public Dictionary<string, string> Buildings
        { get; set; }

        public string Department { get; set; }

        public Dictionary<string, string> Departments
        { get; set; }

        public IList<DataNam> DataNams { get; set; }
    }
}