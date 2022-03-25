using CourseOnline.Dao;
using CourseOnline.Models;
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
            var model = new CourseDao().ListAll();
            return View(model);
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
            var model = new CourseDao().ListAll();
            return View(model);
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

        public ActionResult Register()
        {
            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
        public ActionResult ContactTest()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult Category()
        {
            return View();
        }
    }
}