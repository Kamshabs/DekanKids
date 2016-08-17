using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DokanApp.Models
{
    public static class MyMenu
    {
        /// <summary>
        /// Get List of All Menu Items from Database
        /// </summary>      
        /// <returns>Returns List<Menus> object</returns>
        public static List<Category> GetMenus()
        {
            using (var context = new dekandbEntities())
            {
                return context.Categories.ToList();
            }
        }
    }
}