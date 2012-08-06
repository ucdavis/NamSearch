using System;
using UCDArch.Core.DomainModel;

namespace NamSearch.Core.Domain
{
    public class DataNam : DomainObjectWithTypedId<Guid>
    {
        public virtual string NamNumber { get; set; }

        public virtual string Department { get; set; }

        public virtual string Status { get; set; }

        public virtual string Building { get; set; }

        public virtual string Room { get; set; }

        //public virtual string Vlan { get; set; }
        public virtual Vlan Vlan { get; set; }
    }
}