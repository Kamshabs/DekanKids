using DokanApp.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Globalization;
using System.Linq;
using System.Reflection;
using System.Threading;
using System.Web;
using System.Web.Mvc;
using System.Web.SessionState;

namespace DokanApp.Controllers
{

    public class DefaultController : Controller
    {
        dekandbEntities db = new dekandbEntities();

        private void languageswitch(string language)
        {
            Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(language);
            Thread.CurrentThread.CurrentUICulture = new CultureInfo(language);
            if (language == "ar-KW")
            {
                ViewBag.language = "ar-KW";
                ViewBag.flag = "~/Contents/img/Kflag.png";
            }
            else
                ViewBag.language = "en-US";
            //            NSLocale *locale = [NSLocale currentLocale];
            //NSString *country = [locale displayNameForKey:NSLocaleIdentifier value:[locale localeIdentifier]];

            //            if (navigator.geolocation) { 
            //    navigator.geolocation.getCurrentPosition(function(position) {  

            //        alert(position.coords.latitude + ", " + position.coords.longitude);

            //        // Use the latitude and location as you wish. You may set a marker
            //        // on Google Maps, for example.
            //    }); 
            //} 
            //else {
            //    alert("Geolocation services are not supported by your browser.");
            //}  

        }

        private string Currencyswitch(string Currency)
        {
            if (Currency != null)
            {
                if (Currency == "KWD")
                {
                    ViewBag.Currency = "KWD";
                }
                if (Currency == "USD")
                {
                    ViewBag.Currency = "USD";
                }
                return Currency = ViewBag.Currency;
            }
            else
            {
                ViewBag.Currency = "KWD";
                return Currency = "KWD";
            }

        }


        public ActionResult Index(string language, string Currency)
        {
            ViewBag.Currency = "KWD";

            languageswitch(language);
            Currency = Currencyswitch(Currency);
            return View();
        }

        [HttpGet]
        public ActionResult Login(string language)
        {
            languageswitch(language);
            return View();
        }

        [HttpPost]
        public ActionResult Login(UserProfile userprofile)
        {

            if (ModelState.IsValid) //this is to check validity
            {

                var v = db.UserProfiles.Where(a => a.Username.Equals(userprofile.Username) && a.Password.Equals(userprofile.Password) && a.Isdeleted == false).FirstOrDefault();

                if (v != null)
                {
                    if (v.Role == "member")
                    {
                        Session["LoggedUserID"] = v.RegId.ToString();
                        Session["LoggedUserFullname"] = v.FullName.ToString();
                        return RedirectToAction("Index", "default");
                    }
                }


            }

            return View();
        }


        [HttpPost]
        public ActionResult register(UserProfile userprofile)
        {
            userprofile.Isdeleted = false;
            userprofile.Role = "member";
            db.UserProfiles.Add(userprofile);
            db.SaveChanges();
            ModelState.Clear();
            return RedirectToAction("Index", "default");
        }

        public ActionResult logout()
        {
            Session.Clear();
            return RedirectToAction("Index", "default");
        }

        [HttpGet]
        public ActionResult contactus(string language)
        {
            languageswitch(language);
            return View();
        }
        [ActionName("ProductList")]
        public ActionResult ProductList(string language)
        {
            languageswitch(language);
            return View();
        }

        public ActionResult ProductToCategories(int id, string language)
        {
            languageswitch(language);
            List<SubCategory> sb = db.SubCategories.Where(a => a.CategoryID == id).ToList();
            return View("ProductList", sb);
        }

    }
}