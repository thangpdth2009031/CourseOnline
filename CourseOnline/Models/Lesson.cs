namespace CourseOnline.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Lesson
    {
        public int Id { get; set; }

        [Required]
        public string LessonName { get; set; }

        [Required]
        public string UrlFile { get; set; }

        public double TimeVideo { get; set; }

        public int TopicId { get; set; }

        public DateTime CreatedAt { get; set; }

        public DateTime UpdatedAt { get; set; }

        public bool Status { get; set; }

        public virtual Topic Topic { get; set; }
    }
}
