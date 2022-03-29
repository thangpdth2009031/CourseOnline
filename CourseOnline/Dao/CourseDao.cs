using CourseOnline.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CourseOnline.Dao
{
    public class CourseDao
    {
        CourseDbContext db = null;
        public CourseDao()
        {
            db = new CourseDbContext();
        }

        public List<Cours> ListAll()
        {
            return db.Courses.Where(x => x.Status == true).OrderBy(x => x.Id).ToList();
        }  
        public List<Category> ListAllCate()
        {
            return db.Categories.Where(x => x.Status == true).OrderBy(x => x.Id).ToList();
        }    
    }
}