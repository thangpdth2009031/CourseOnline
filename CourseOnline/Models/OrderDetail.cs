namespace CourseOnline.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class OrderDetail
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int CourseId { get; set; }

        [Key]
        [Column(Order = 1)]
        public int OrderId { get; set; }

        public double Discount { get; set; }

        public double UnitPrice { get; set; }

        public int Quantity { get; set; }

        public virtual Order Order { get; set; }
    }
}
