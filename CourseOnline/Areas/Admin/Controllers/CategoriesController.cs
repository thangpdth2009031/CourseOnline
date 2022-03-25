using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using CourseOnline.Models;
using PagedList;

namespace CourseOnline.Areas.Admin.Controllers
{
    public class CategoriesController : Controller
    {
        private CourseDbContext db = new CourseDbContext();

        // GET: Admin/Categories
        public ActionResult Index()
        {
            var categories = db.Categories.Include(c => c.Category1);            
            return View(categories.ToList());            
        }

        // GET: Admin/Categories/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Category category = db.Categories.Find(id);
            if (category == null)
            {
                return HttpNotFound();
            }
            return View(category);
        }

        // GET: Admin/Categories/Create
        public ActionResult Create()
        {
            ViewBag.ParentId = new SelectList(db.Categories, "Id", "Name");
            return View();
        }

        // POST: Admin/Categories/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,ParentId,Name,Image,NumberOfCourse,CreatedAt,UpdatedAt,Status, ImageSlide")] Category category)
        {
            if (ModelState.IsValid)
            {
                category.Status = true;
                category.CreatedAt = DateTime.Now;
                category.UpdatedAt = DateTime.Now;
                db.Categories.Add(category);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ParentId = new SelectList(db.Categories, "Id", "Name", category.ParentId);
            return View(category);
        }

        // GET: Admin/Categories/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Category category = db.Categories.Find(id);
            if (category == null)
            {
                return HttpNotFound();
            }
            ViewBag.ParentId = new SelectList(db.Categories, "Id", "Name", category.ParentId);
            return View(category);
        }

        // POST: Admin/Categories/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,ParentId,Name,Image,NumberOfCourse,CreatedAt,UpdatedAt,Status,ImageSlide")] Category category)
        {
            if (ModelState.IsValid)
            {
                category.UpdatedAt = DateTime.Now;
                db.Entry(category).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ParentId = new SelectList(db.Categories, "Id", "Name", category.ParentId);
            return View(category);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string[] ids)
        {
            /*User user = db.Users.Find(ids);
            db.Users.Remove(user);
            db.SaveChanges();
            return RedirectToAction("Index");*/
            if (ids == null || ids.Length == 0)
            {
                ModelState.AddModelError("", "No item selected to delete");
                return View();
            }
            List<int> TaskIds = ids.Select(x => Int32.Parse(x)).ToList();
            for (var i = 0; i < TaskIds.Count(); i++)
            {
                var todo = db.Categories.Find(TaskIds[i]);
                todo.Status = false;
                db.Entry(todo).State = EntityState.Modified;
                db.SaveChanges();
            }

            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
