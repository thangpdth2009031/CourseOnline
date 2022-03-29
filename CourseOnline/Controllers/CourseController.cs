using CourseOnline.Dao;
using CourseOnline.Models;
using System;
using System.Collections.Generic;
using System.Diagnostics;
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
        public ActionResult Detail(int id)
        {
            var course = db.Courses.FirstOrDefault(x => x.Id == id);
            Debug.WriteLine("Course:");
            Console.WriteLine(course);
            /*Debug.WriteLine(course.CourseName);
            var topics = db.Topics.Where(x => x.CourseId == course.Id);*/
            
/*
            Debug.WriteLine("Topics:");
            Debug.WriteLine(topics.OrderBy(x => x.Id));
            var model = new CourseDao().ListAllTopic(id);  */          
            return View(course);
        }
        public ActionResult ListCourse(int id)
        {
            var categories = db.Categories.FirstOrDefault(x => x.Id == id);
            Debug.WriteLine("categories:");
            Console.WriteLine(categories);
            return View(categories);
        }
       
        public ActionResult ListCategory()
        {
            var model = new CourseDao().ListAllCate();
            Debug.WriteLine(model);
            return View(model);
        }   
        public PartialViewResult ListCategoryHeader()
        {
            var model = new CourseDao().ListAllCate();
            Debug.WriteLine(model);
            return PartialView(model);
        }
        [HttpPost]
        public ActionResult Search(string searchString)
        {
            var categories = db.Categories.Where(s => s.Name.Contains(searchString));
            //OR
            //var certificate = db.certificate_mst.Search(s => s.CertificateNo, searchString));
            return View(categories);
        }
    }
}