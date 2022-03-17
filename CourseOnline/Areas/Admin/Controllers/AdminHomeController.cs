using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CourseOnline.Areas.Admin.Controllers
{
    public class AdminHomeController : Controller
    {
        // GET: Admin/Dattest
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
    }
}