using CourseOnline.Dao;
using CourseOnline.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CourseOnline.Controllers
{
    public class CourseController : Controller
    {
        // GET: Course
        CourseDbContext db = new CourseDbContext();
        public ActionResult Index()
        {
            var model = new CourseDao().ListAll();
            return View(model);
        }
        public ActionResult Detail(long id)
        {
            var course = new CourseDao().ViewDetail(id);
            return View(course);
        }

    }
}