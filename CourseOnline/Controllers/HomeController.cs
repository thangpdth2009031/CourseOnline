using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CourseOnline.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Index2()
        {
            return View();
        }

        public ActionResult About()
        {            
            return View();
        }

        public ActionResult Course()
        {
            return View();
        }

        public ActionResult Team()
        {
            return View();
        }

        public ActionResult Testimonial()
        {
            return View();
        }

        public ActionResult Login()
        {
            return View();
        }
        public ActionResult Logitn()
        {
            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}