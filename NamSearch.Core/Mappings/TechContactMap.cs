using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NamSearch.Core.Domain;

namespace NamSearch.Core.Mappings
{
    public class TechContactMap : FluentNHibernate.Mapping.ClassMap<TechContact>
    {
        public TechContactMap()
        {
            Table("TechContacts");
            ReadOnly();

            Id(x => x.Id).GeneratedBy.Identity();

            Map(x => x.Name);
            Map(x => x.Phone);
            Map(x => x.Email);

            Cache.ReadOnly();
        }
    }
}