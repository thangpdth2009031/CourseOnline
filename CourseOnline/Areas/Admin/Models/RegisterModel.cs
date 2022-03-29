using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;
using CourseOnline.Models;

namespace CourseOnline.Areas.Admin.Models
{
    public class RegisterModel
    {
        [Key]
        // public long ID { set; get; }
        //
        // [Display(Name = "Tên đăng nhập")]
        // [Required(ErrorMessage = "Yêu cầu nhập tên đăng nhập")]
        //
        // public string UserName { set; get; }
        //
        // [Display(Name = "Mật khẩu")]
        // [StringLength(50, MinimumLength = 6, ErrorMessage = "Độ dài mật khẩu ít nhất 6 ký tự.")]
        // [Required(ErrorMessage = "Yêu cầu nhập mật khẩu")]
        // public string Password { set; get; }
        //
        // [Display(Name = "Xác nhận mật khẩu")]
        // [Compare("Password", ErrorMessage = "Xác nhận mật khẩu không đúng.")]
        // public string ConfirmPassword { set; get; }
        //
        // [Display(Name = "Họ tên")]
        // [Required(ErrorMessage = "Yêu cầu nhập họ tên")]
        // public string Name { set; get; }
        //
        // [Display(Name = "Địa chỉ")]
        // public string Address { set; get; }
        //
        // [Required(ErrorMessage = "Yêu cầu nhập email")]
        // [Display(Name = "Email")]
        // public string Email { set; get; }
        //
        // [Display(Name = "Điện thoại")]
        // public string Phone { set; get; }
        //
        // public bool Status { get; set; }

        // [Display(Name = "Tỉnh/thành")]
        // public string ProvinceID { set; get; }
        //
        //
        // [Display(Name = "Quận/Quyện")]
        // public string DistrictID { set; get; }
        public int Id { get; set; }

        [Required(ErrorMessage = "Please enter your username")]
        [StringLength(50)]

        public string UserName { get; set; }
        [Required(ErrorMessage = "Please enter your password")]

        [StringLength(250, ErrorMessage = "Maximum 100 characters")]
        [DataType(DataType.Password)]
        [Display(Name = "Password: ")]

        // [RegularExpression(@"^.{6,}$", ErrorMessage = "Minimum 6 characters required")]
        public string Password { get; set; }

        [StringLength(250, ErrorMessage = "Maximum 100 characters")]
        [DataType(DataType.Password)]
        [Display(Name = "Password: ")]
        //
        // [RegularExpression(@"^.{6,}$", ErrorMessage = "Minimum 6 characters required")]
        public string ConfirmPassword { get; set; }

        public int RoleId { get; set; }

        [Required(ErrorMessage = "Please enter your full name")]
        public string FullName { get; set; }

        [StringLength(250)]
        [Display(Name = "Email address")]
        [Required(ErrorMessage = "Please enter your email")]
        [EmailAddress(ErrorMessage = "Email address is not valid")]
        public string Email { get; set; }

        [StringLength(20)]
        public string Phone { get; set; }

        public DateTime DateOfBirth { get; set; }

        public int Gender { get; set; }

        public string Address { get; set; }

        public bool Status { get; set; }

        // public DateTime? CreatedAt { get; set; } = DateTime.Now;
        //
        // public DateTime? UpdatedAt { get; set; } = DateTime.Now;
        // [NotMapped]
        // public HttpPostedFileBase ImageUpload { get; set; }
        //
        // [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        // public virtual ICollection<Order> Orders { get; set; }
        //
        // public virtual Role Role { get; set; }
    }
}