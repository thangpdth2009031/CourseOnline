using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Mvc;
/*using BotDetect.Web.Mvc;*/
using CourseOnline.Areas.Admin.Models;
using CourseOnline.Common;
using CourseOnline.Dao;
using CourseOnline.Models;

namespace CourseOnline.Controllers
{
    
    public class UserController : Controller
    {
        private CourseDbContext db = new CourseDbContext();
        
        // private Uri RedirectUri
        // {
        //     get
        //     {
        //         var uriBuilder = new UriBuilder(Request.Url);
        //         uriBuilder.Query = null;
        //         uriBuilder.Fragment = null;
        //         uriBuilder.Path = Url.Action("FacebookCallback");
        //         return uriBuilder.Uri;
        //     }
        // }
        // GET: User
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult Register()
        {
            return View();
        }

        public ActionResult Login()
        {

            return View();
        }

        public ActionResult Logout()
        {
            Session[CommonConstants.USER_SESSION] = null;
            return Redirect("/");
        }

        [HttpPost]
        public ActionResult Login(LoginModel model)
        {
            if (ModelState.IsValid)
            {
                var dao = new UserDao();
                var result = dao.Login(model.Username, Encryptor.MD5Hash(model.Password));
                if (result == 1)
                {
                    var user = dao.GetById(model.Username);
                    var userSession = new UserLogin();
                    userSession.UserName = user.UserName;
                    userSession.UserId = user.Id;
                    Session.Add(CommonConstants.USER_SESSION, userSession);
                    return Redirect("/");
                }
                else if (result == 0)
                {
                    ModelState.AddModelError("", "Tài khoản không tồn tại.");
                }
                else if (result == -1)
                {
                    ModelState.AddModelError("", "Tài khoản đang bị khoá.");
                }
                else if (result == -2)
                {
                    ModelState.AddModelError("", "Mật khẩu không đúng.");
                }
                else
                {
                    ModelState.AddModelError("", "đăng nhập không đúng.");
                }
            }

            return View(model);
        }
       
        [HttpPost]
        [ValidateAntiForgeryToken]
        // [CaptchaValidation("CaptchaCode", "registerCapcha", "Mã xác nhận không đúng!")]*/
        public ActionResult Register(RegisterModel model)
        {
            if (ModelState.IsValid)
            {
                var dao = new UserDao();
                if (dao.CheckUserName(model.UserName))
                {
                    ModelState.AddModelError("", "Tên đăng nhập đã tồn tại");
                }
                else if (dao.CheckEmail(model.Email))
                {
                    ModelState.AddModelError("", "Email đã tồn tại");
                }
                else
                {
                    var user = new User();
                    user.UserName = model.UserName;
                    user.FullName = model.FullName;
                    user.Password = Encryptor.MD5Hash(model.Password);
                    user.Phone = model.Phone;
                    user.Email = model.Email;
                    user.Address = model.Address;
                    user.Avatar = "/aaaaa/aaa";
                    user.Gender = 1;
                    user.DateOfBirth = DateTime.Now;
                    user.Status = true;

                    // db.Users.Add(user);
                    // db.SaveChanges();
                    
                    // if (!string.IsNullOrEmpty(model.ProvinceID))
                    // {
                    //     user. = int.Parse(model.ProvinceID);
                    // }
                    // if (!string.IsNullOrEmpty(model.DistrictID))
                    // {
                    //     user.DistrictID = int.Parse(model.DistrictID);
                    // }
                    Debug.WriteLine(user.FullName);
                    var result = dao.Insert(user);
                    if (result > 0)
                    {
                        ViewBag.Success = "Đăng ký thành công";
                        model = new RegisterModel();
                    }
                    else
                    {
                        ModelState.AddModelError("", "Đăng ký không thành công.");
                    }
                }
            }
            return View(model);
        }
    }
}

