using System.Linq;
using System.Web.Mvc;
using NamSearch.Core.Domain;
using UCDArch.Core.PersistanceSupport;
using System;
using UCDArch.Web.Attributes;

namespace NamSearch.Controllers
{
    [Authorize]
    public class HomeController : ApplicationController
    {
        private readonly IRepositoryWithTypedId<DataNam, Guid> _dataNamRepository;

        public HomeController(IRepositoryWithTypedId<DataNam, Guid> dataNamRepository)
        {
            _dataNamRepository = dataNamRepository;
        }

        [HandleTransactionsManually]
        public ActionResult Index()
        {
            ViewData["Message"] = "Welcome to ASP.NET MVC!";

            return View();
        }

        [HandleTransactionsManually]
        public ActionResult Info()
        {
            return PartialView("Info");
        }

        [HandleTransactionsManually]
        public ActionResult About()
        {
            return View();
        }

        public ActionResult Buildings()
        {
            var buildings = _dataNamRepository.Queryable.OrderBy(x=>x.Building).Select(x => x.Building).Distinct();
            
            return PartialView(buildings.ToList());
        }

        public ActionResult NamsByBuilding(string name)
        {
            var nams =
                _dataNamRepository.Queryable
                                    .Where(x => x.Building == name)
                                    .OrderBy(x => x.Building);

            return PartialView(nams.ToList());
        }

        public ActionResult Departments()
        {
            var departments = _dataNamRepository.Queryable.OrderBy(x => x.Department).Select(x => x.Department).Distinct();

            return PartialView(departments.ToList());

        }

        public ActionResult NamsByDepartment(string name)
        {
            var nams =
                _dataNamRepository.Queryable
                                    .Where(x => x.Department == name)
                                    .OrderBy(x => x.Department);

            return PartialView(nams.ToList());
        }

        public ActionResult Vlans()
        {
            var vlans = _dataNamRepository.Queryable.OrderBy(x => x.Vlan).Select(x => x.Vlan).Distinct();

            return PartialView(vlans.ToList());

        }

        public ActionResult NamsByVlan(string name)
        {
            var nams =
                _dataNamRepository.Queryable
                                    .Where(x => x.Vlan == name)
                                    .OrderBy(x => x.Vlan);

            return PartialView(nams.ToList());
        }

        [HandleTransactionsManually]
        public ActionResult SearchByNamNumber()
        {
            return PartialView();
        }

        public ActionResult NamsByNumber(string number)
        {
            var nams = _dataNamRepository.Queryable
                .Where(x => x.NamNumber.Contains(number))
                .OrderBy(x => x.NamNumber);

            return PartialView(nams.ToList());
        }

        public ActionResult DisplayNam(Guid id)
        {
            var nam = _dataNamRepository.GetById(id);

            return View(nam);
        }
    }
}
