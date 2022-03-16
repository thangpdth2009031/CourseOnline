using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CourseOnline.Areas.Admin.Controllers
{
    public class HomeAdminController : Controller
    {
        // GET: Admin/HomeAdmin
        public ActionResult Index()
        {
            return View();
        }// GET: Admin/Dattest
        public ActionResult Index2()
        {
            return View();
        }

        public ActionResult Charts()
        {
            return View();
        }

        public ActionResult Widgets()
        {
            return View();
        }

        public ActionResult Tables()
        {
            return View();
        }

        public ActionResult Form()
        {
            return View();
        }

        public ActionResult FormWizard()
        {
            return View();
        }

        public ActionResult RegisterAdmin()
        {
            return View();
        }
    }
}