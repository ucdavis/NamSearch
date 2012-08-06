using System;
using System.Linq;
using System.Web.Mvc;
using NamSearch.Core.Domain;
using NamSearch.Services;
using UCDArch.Core.PersistanceSupport;
using UCDArch.Web.Attributes;

namespace NamSearch.Controllers
{
    [Authorize]
    public class HomeController : ApplicationController
    {
        private readonly IRepositoryWithTypedId<DataNam, Guid> _dataNamRepository;
        private readonly IRepositoryWithTypedId<Vlan, string> _vlanRepository;
        private readonly IDataNamQueryService _dataNamQueryService;

        public HomeController(IRepositoryWithTypedId<DataNam, Guid> dataNamRepository, IDataNamQueryService dataNamQueryService, IRepositoryWithTypedId<Vlan, string> vlanRepository)
        {
            _dataNamRepository = dataNamRepository;
            _dataNamQueryService = dataNamQueryService;
            _vlanRepository = vlanRepository;
        }

        [HandleTransactionsManually]
        public ActionResult Index()
        {
            return View();
        }

        [HandleTransactionsManually]
        public ActionResult About()
        {
            return View();
        }

        public ActionResult Buildings()
        {
            var buildings = _dataNamQueryService.GetBuildings();

            return View(buildings.ToList());
        }

        public ActionResult NamsByBuilding(string name)
        {
            var nams =
                _dataNamRepository.Queryable
                                    .Where(x => x.Building == name)
                                    .OrderBy(x => x.Building);

            return View(nams.ToList());
        }

        public ActionResult Departments()
        {
            var departments = _dataNamQueryService.GetDepartments();

            return View(departments.ToList());
        }

        public ActionResult NamsByDepartment(string name)
        {
            var nams =
                _dataNamRepository.Queryable
                                    .Where(x => x.Department == name)
                                    .OrderBy(x => x.Department);

            return View(nams.ToList());
        }

        public ActionResult Vlans()
        {
            var vlans = _dataNamQueryService.GetVlans();

            return View(vlans.ToList());
        }

        public ActionResult NamsByVlan(string name)
        {
            var nams =
                _dataNamRepository.Queryable
                                    .Where(x => x.Vlan.Name == name)
                                    .OrderBy(x => x.Vlan.Name);

            return View(nams.ToList());
        }

        [HandleTransactionsManually]
        public ActionResult SearchByNamNumber()
        {
            return View();
        }

        public ActionResult NamsByNumber(string number)
        {
            var nams = _dataNamRepository.Queryable
                .Where(x => x.NamNumber.Contains(number))
                .OrderBy(x => x.NamNumber);

            return View(nams.ToList());
        }

        public ActionResult DisplayNam(Guid id)
        {
            var nam = _dataNamRepository.GetNullableById(id);

            return View(nam);
        }

        public ActionResult DisplayContact(string id)
        {
            var vlan =
                _vlanRepository.GetNullableById(id);

            return View(vlan);
        }
    }
}