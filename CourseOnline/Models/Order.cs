namespace CourseOnline.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Order
    {
        public int Id { get; set; }

        public int? UserId { get; set; }

        public double TotalPrice { get; set; }

        public bool? IsCheckout { get; set; }

        public bool? Status { get; set; }

        public DateTime? CreatedAt { get; set; }

        public DateTime? UpdatedAt { get; set; }

        public int? CourseId { get; set; }

        public virtual User User { get; set; }
    }
}
