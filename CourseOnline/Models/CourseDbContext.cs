using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace CourseOnline.Models
{
    public partial class CourseDbContext : DbContext
    {
        public CourseDbContext()
            : base("name=CourseDbConext")
        {
        }

        public virtual DbSet<Blog> Blogs { get; set; }
        public virtual DbSet<Category> Categories { get; set; }
        public virtual DbSet<Cours> Courses { get; set; }
        public virtual DbSet<Language> Languages { get; set; }
        public virtual DbSet<Lesson> Lessons { get; set; }
        public virtual DbSet<OrderDetail> OrderDetails { get; set; }
        public virtual DbSet<Order> Orders { get; set; }
        public virtual DbSet<Role> Roles { get; set; }
        public virtual DbSet<Topic> Topics { get; set; }
        public virtual DbSet<User> Users { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Blog>()
                .Property(e => e.Image)
                .IsUnicode(false);

            modelBuilder.Entity<Category>()
                .HasMany(e => e.Categories1)
                .WithRequired(e => e.Category1)
                .HasForeignKey(e => e.ParentId);

            /*modelBuilder.Entity<Category>()
                .HasMany(e => e.Courses)
                .WithRequired(e => e.Category)
                .WillCascadeOnDelete(false);*/

            modelBuilder.Entity<Cours>()
                .Property(e => e.Image)
                .IsUnicode(false);

            modelBuilder.Entity<Cours>()
                .Property(e => e.Document)
                .IsUnicode(false);

            modelBuilder.Entity<Cours>()
                .HasMany(e => e.Topics)
                .WithRequired(e => e.Cours)
                .HasForeignKey(e => e.CourseId)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Lesson>()
                .Property(e => e.LessonName)
                .IsUnicode(false);

            modelBuilder.Entity<Lesson>()
                .Property(e => e.UrlFile)
                .IsUnicode(false);

            modelBuilder.Entity<Order>()
                .HasMany(e => e.OrderDetails)
                .WithRequired(e => e.Order)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Role>()
                .Property(e => e.Name)
                .IsFixedLength();

            modelBuilder.Entity<Role>()
                .HasMany(e => e.Users)
                .WithRequired(e => e.Role)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Topic>()
                .HasMany(e => e.Lessons)
                .WithRequired(e => e.Topic)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<User>()
                .Property(e => e.UserName)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .Property(e => e.Phone)
                .IsFixedLength();

            modelBuilder.Entity<User>()
                .Property(e => e.Avatar)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .HasMany(e => e.Orders)
                .WithRequired(e => e.User)
                .WillCascadeOnDelete(false);
        }
    }
}
