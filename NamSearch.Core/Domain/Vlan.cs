using System;
using System.Collections.Generic;
using UCDArch.Core.DomainModel;

namespace NamSearch.Core.Domain
{
    public class Vlan : DomainObject
    {
        public virtual string Name { get; set; }

        public virtual IList<TechContact> Contacts { get; set; }
    }
}