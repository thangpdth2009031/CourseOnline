namespace CourseOnline.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;
    using System.Web;

    [Table("User")]
    public partial class User
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public User()
        {
            Orders = new HashSet<Order>();
            Avatar = "~/FileUploads/images/Avatar_user/avatar-default.jpg";
        }

        public int Id { get; set; }

        [Required(ErrorMessage = "Please enter your username")]
        [StringLength(50)]
        
        public string UserName { get; set; }

        [Required(ErrorMessage = "Please enter your password")]       
        [RegularExpression(@"^.{6,}$", ErrorMessage = "Minimum 6 characters required")]
        public string Password { get; set; }

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

        public string Avatar { get; set; }

        [Column(TypeName = "date")]
        public DateTime DateOfBirth { get; set; }

        public int Gender { get; set; }

        public string Address { get; set; }

        public bool Status { get; set; }
        
        public DateTime? CreatedAt { get; set; } = DateTime.Now;

        public DateTime? UpdatedAt { get; set; } = DateTime.Now;
        [NotMapped]
        public HttpPostedFileBase ImageUpload { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Order> Orders { get; set; }

        public virtual Role Role { get; set; }
    }
}
