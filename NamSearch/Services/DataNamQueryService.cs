using System;
using System.Linq;
using NamSearch.Core.Domain;
using NamSearch.Helpers;
using NHibernate.Linq;
using UCDArch.Core.PersistanceSupport;

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

        public IQueryable<string> GetBuildings()
        {
            return _dataNamRepository.Queryable.Cache().OrderBy(x => x.Building).Select(x => x.Building).Distinct();
        }

        public IQueryable<string> GetDepartments()
        {
            return _dataNamRepository.Queryable.Cache().OrderBy(x => x.Department).Select(x => x.Department).Distinct();
        }

        public IQueryable<String> GetVlans()
        {
            return _dataNamRepository.Queryable.Cache().OrderBy(x => x.Vlan.Name).Select(x => x.Vlan.Name).Distinct();
        }
    }
}