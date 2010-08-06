using NamSearch.Core.Domain;

namespace NamSearch.Core.Mappings
{
    public sealed class DataNamMap : FluentNHibernate.Mapping.ClassMap<DataNam>
    {
        public DataNamMap()
        {
            Table("DataNams");
            ReadOnly();

            Id(x => x.Id).GeneratedBy.Guid();
            
            Map(x => x.NamNumber);
            Map(x => x.Department);
            Map(x => x.Status);
            Map(x => x.Building);
            Map(x => x.Room);
            Map(x => x.Vlan);

            Cache.ReadOnly();
        }
    }
}
