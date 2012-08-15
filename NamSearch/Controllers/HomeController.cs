using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using System.Web.UI.WebControls;
using NamSearch.Core.Domain;
using NamSearch.Helpers;
using NamSearch.Models;
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

        public System.Linq.Expressions.Expression<Func<DataNam, bool>> NamSearchExpression { get; set; }

        public HomeController(IRepositoryWithTypedId<DataNam, Guid> dataNamRepository, IDataNamQueryService dataNamQueryService, IRepositoryWithTypedId<Vlan, string> vlanRepository)
        {
            _dataNamRepository = dataNamRepository;
            _dataNamQueryService = dataNamQueryService;
            _vlanRepository = vlanRepository;
        }

        [HandleTransactionsManually]
        public ActionResult Index()
        {
            var viewModel = new NamSearchModel();
            var buildings = _dataNamQueryService.GetBuildings();
            var vlans = _vlanRepository.GetAll();
            var departments = _dataNamQueryService.GetDepartments();

            // Couldn't get straight-up ILists<string> to bind correctly to
            // drop-down lists, so added code that changed them to dictionaries, which works correctly.
            viewModel.Buildings = buildings.ToDictionary(v => v, v => v);
            viewModel.Departments = departments.ToDictionary(v => v, v => v);

            viewModel.Vlans = vlans;
            return View(viewModel);
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
            var vlan = _vlanRepository.GetNullableById(id);

            return View(vlan);
        }

        /// <summary>
        /// "Anding" NAM search logic requested by Tom Pomroy.
        /// Uses predicate builder to keep query logic as simple and straight forward as possible.
        /// </summary>
        /// <param name="namNumber"></param>
        /// <param name="roomNumber"></param>
        /// <param name="vlan"></param>
        /// <param name="building"></param>
        /// <param name="department"></param>
        /// <returns></returns>
        public ActionResult NamsBySearchParams(string namNumber, string roomNumber, string vlan, string building, string department)
        {
            var hasNamNumber = !(String.IsNullOrEmpty(namNumber) || namNumber.Equals("0"));
            var hasRoomNumber = !(String.IsNullOrEmpty(roomNumber) || roomNumber.Equals("0"));
            var hasVlanId = !(String.IsNullOrEmpty(vlan) || vlan.Equals("0"));
            var hasBuildingId = !(String.IsNullOrEmpty(building) || building.Equals("0"));
            var hasDepartmentId = !(String.IsNullOrEmpty(department) || department.Equals("0"));
            var hasSearchParameters = hasNamNumber || hasRoomNumber || hasVlanId || hasBuildingId || hasDepartmentId
                                          ? true
                                          : false;

            var retval = new List<DataNam>();

            if (hasSearchParameters)
            {
                NamSearchExpression = PredicateBuilder.True<DataNam>();

                if (hasNamNumber)
                {
                    NamSearchExpression = NamSearchExpression.And(p => p.NamNumber.Equals(namNumber));
                }
                if (hasRoomNumber)
                {
                    NamSearchExpression = NamSearchExpression.And(p => p.Room.Equals(roomNumber));
                }
                if (hasVlanId)
                {
                    NamSearchExpression =
                        NamSearchExpression.And(p => p.Vlan.Name.Equals(vlan));
                }
                if (hasBuildingId)
                {
                    NamSearchExpression =
                        NamSearchExpression.And(p => p.Building.Equals(building));
                }
                if (hasDepartmentId)
                {
                    NamSearchExpression =
                        NamSearchExpression.And(p => p.Department.Equals(department));
                }

                retval = _dataNamRepository
                    .Queryable
                    .Where(NamSearchExpression)
                    .OrderBy(t => t.NamNumber)
                    .ToList();

                return View(retval);
            }
            else
            {
                return RedirectToAction("Index");
            }
        }
    }
}