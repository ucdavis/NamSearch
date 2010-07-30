using System.Web.Mvc;
using System.Web.Security;
using UCDArch.Web.Authentication;
using UCDArch.Web.Attributes;

namespace NamSearch.Controllers
{
    [HandleTransactionsManually]
    public class AccountController : ApplicationController
    {
        public ActionResult LogOn(string returnUrl)
        {
            return View();    
        }

        [HttpPost]
        [BypassAntiForgeryToken]
        public ActionResult LogOn(string returnUrl, string pass)
        {
            if (pass == "caes")
            {
                FormsAuthentication.SetAuthCookie("admin", false);
                return RedirectToAction("Index", "Home");
            }
            
            TempData["message"] = "Password incorrect";

            return View();
        }

        public ActionResult LogOff()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("LogOn");
        }
        //public ActionResult LogOn(string returnUrl)
        //{
        //    string resultUrl = CASHelper.Login(); //Do the CAS Login

        //    if (resultUrl != null)
        //    {
        //        return Redirect(resultUrl);
        //    }

        //    TempData["URL"] = returnUrl;


        //    return View();
        //}

        //public ActionResult LogOut()
        //{
        //    FormsAuthentication.SignOut();
        //    return Redirect("https://cas.ucdavis.edu/cas/logout");
        //}
    }
}
