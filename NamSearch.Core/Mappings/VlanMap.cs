using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NamSearch.Core.Domain;

namespace NamSearch.Core.Mappings
{
    public class VlanMap : FluentNHibernate.Mapping.ClassMap<Vlan>
    {
        public VlanMap()
        {
            Table("Vlans");
            ReadOnly();

            Id(x => x.Name).GeneratedBy.Assigned();

            Map(x => x.Name);

            HasManyToMany(x => x.Contacts)
                .Table("VlanNameXTechContactId")
                .Cascade.None()
                .ParentKeyColumn("VlanName")
                .ChildKeyColumn("TechContactId");

            Cache.ReadOnly();
        }
    }
}