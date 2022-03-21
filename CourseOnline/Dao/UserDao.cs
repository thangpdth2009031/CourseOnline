using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CourseOnline.Models;

namespace CourseOnline.Dao
{
    public class UserDao
    {
        private CourseDbContext db = null;

        public UserDao()
        {
            db = new CourseDbContext();
        }
        public long Insert(User entity)
        {
            db.Users.Add(entity);
            db.SaveChanges();
            return entity.Id;
        }
        public User GetById(string userName)
        {
            return db.Users.SingleOrDefault(x => x.UserName == userName);
        }

      
        public long InsertForFacebook(User entity)
        {
            var user = db.Users.SingleOrDefault(x => x.UserName == entity.UserName);
            if (user == null)
            {
                db.Users.Add(entity);
                db.SaveChanges();
                return entity.Id;
            }
            else
            {
                return user.Id;
            }
        }
        public int Login(string userName, string passWord)
        {
            var result = db.Users.SingleOrDefault(x => x.UserName == userName);
            if (result == null)
            {
                return 0;
            }
            else
            {
                if (result.Status == false)
                {
                    return -1;

                }
                else
                {
                    if (result.Password == passWord)

                        return 1;

                    else

                        return -2;

                }

            }


        }

    }
}