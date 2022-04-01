using CourseOnline.Common;
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
            return View(course);
        }
        public ActionResult ListCourse(int id)
        {
            var categories = db.Categories.Find(id);
            Debug.WriteLine("categories:");
            Console.WriteLine(categories);
            return View(categories);
        }
        [ChildActionOnly]
        public PartialViewResult ListCategory()
        {
            var model = new CourseDao().ListAllCate();
            Debug.WriteLine(model);            
            return PartialView(model);
        }   
        public PartialViewResult ListCategoryHeader()
        {

            var model = new CourseDao().ListAllCate();
            Debug.WriteLine(model);
            return PartialView(model);
        }
        /*  [HttpPost]
          public ActionResult Search(string searchString)
          {
              var course = db.Courses.Where(s => s.CourseName.Contains(searchString));
              //OR
              //var certificate = db.certificate_mst.Search(s => s.CertificateNo, searchString));
              return View(course);
          }*/
        public ActionResult Search(string keyword)
        {            
            var model = new CourseDao().Search(keyword);              
            return View(model);
        }
        [HttpPost]        
        [ValidateAntiForgeryToken]
        public ActionResult DangKi(Order order)
        {
            var session = (User)Session[CommonConstants.USER_SESSION];
            Console.WriteLine(session);
            var cour = db.Courses.FindAsync();            
            order.CourseId = cour.Id;
            order.UserId = session.Id;
            order.TotalPrice = 0;
            order.IsCheckout = true;
            order.Status = true;
            order.CreatedAt = DateTime.Now;
            order.UpdatedAt = DateTime.Now;
            db.Orders.Add(order);
            db.SaveChanges();
            return RedirectToAction("AccountProfile", "Account");
        }
    }
}