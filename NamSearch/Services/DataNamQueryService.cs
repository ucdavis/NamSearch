using System.Linq;
using NamSearch.Helpers;
using NHibernate.Linq;
using UCDArch.Core.PersistanceSupport;
using NamSearch.Core.Domain;
using System;

namespace NamSearch.Services
{
    public interface IDataNamQueryService
    {
        IQueryable<string> GetBuildings();
        IQueryable<string> GetDepartments();
        IQueryable<string> GetVlans();
    }

    public class DataNamQueryService : IDataNamQueryService
    {
        private readonly IRepositoryWithTypedId<DataNam, Guid> _dataNamRepository;

        public DataNamQueryService(IRepositoryWithTypedId<DataNam, Guid> dataNamRepository)
        {
            _dataNamRepository = dataNamRepository;
        }

        private INHibernateQueryable<DataNam> DataNamQueryable
        {
            get
            {
                return _dataNamRepository.Queryable.NhQueryable();
            }
        }

        public IQueryable<string> GetBuildings()
        {
            var query = DataNamQueryable;
            query.QueryOptions.SetCachable(true);

            return query.OrderBy(x => x.Building).Select(x => x.Building).Distinct();
        }

        public IQueryable<string> GetDepartments()
        {
            var query = DataNamQueryable;
            query.QueryOptions.SetCachable(true);

            return query.OrderBy(x => x.Department).Select(x => x.Department).Distinct();
        }

        public IQueryable<string> GetVlans()
        {
            var query = DataNamQueryable;
            query.QueryOptions.SetCachable(true);

            return query.OrderBy(x => x.Vlan).Select(x => x.Vlan).Distinct();
        }
    }
}