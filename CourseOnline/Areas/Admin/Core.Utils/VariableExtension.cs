using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CourseOnline.Areas.Admin.Core.Utils
{
    public class VariableExtension
    {
    }
    public class SelectListModel
    {
        public object Key { get; set; }
        public string Value { get; set; }
    }
    public static class GenderKey
    {
        public const int Male = 1;
        public const int FeMale = 0;

        public static List<SelectListModel> GetGender()
        {
            return new List<SelectListModel>() {
                new SelectListModel{Key=1,Value="Nam" },
                new SelectListModel{Key=0,Value="Nữ" }
            };
        }

        public static string GetEmployeeType(int type)
        {
            switch (type)
            {
                case 0:
                    return "Nữ";

                case 1:
                    return "Nam";

                default:
                    return "Unknown";
            }
        }
    }
}