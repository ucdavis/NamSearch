using System.Linq;
using System.Web.Mvc;
using NamSearch.Core.Domain;
using UCDArch.Core.PersistanceSupport;
using System;

namespace NamSearch.Controllers
{
    public class HomeController : ApplicationController
    {
        private readonly IRepositoryWithTypedId<DataNam, Guid> _dataNamRepository;

        public HomeController(IRepositoryWithTypedId<DataNam, Guid> dataNamRepository)
        {
            _dataNamRepository = dataNamRepository;
        }

        public ActionResult Index()
        {
            ViewData["Message"] = "Welcome to ASP.NET MVC!";

            return View();
        }

        public ActionResult Info()
        {
            return PartialView("Info");
        }

        public ActionResult About()
        {
            return View();
        }

        public ActionResult Buildings()
        {
            var buildings = _dataNamRepository.Queryable.OrderBy(x=>x.Department).Select(x => x.Department).Distinct();
            
            return PartialView(buildings.ToList());
        }

        public ActionResult NamsByBuilding(string name)
        {
            var nams =
                _dataNamRepository.Queryable
                                    .Where(x => x.Department == name)
                                    .OrderBy(x => x.Department);

            return PartialView(nams.ToList());
        }
    }
}
