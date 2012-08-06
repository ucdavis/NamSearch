using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using UCDArch.Core.DomainModel;

namespace NamSearch.Core.Domain
{
    public class TechContact : DomainObject
    {
        public virtual string Name { get; set; }

        public virtual string Phone { get; set; }

        public virtual string Email { get; set; }
    }
}