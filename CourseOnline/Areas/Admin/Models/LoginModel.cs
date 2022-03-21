using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace CourseOnline.Areas.Admin.Models
{
    public class LoginModel
    {
        
        [Required(ErrorMessage = "Vui Lòng nhập tên đăng nhập")]
        public string Username { get; set; }
        [Required(ErrorMessage = "Vui Lòng nhập tên mật khẩu")]
        public string Password { get; set; }
        public bool RememberMe { get; set; }
    }
}