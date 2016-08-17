using Finance.CurrencyConverter;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace DokanApp
{
    public class MvcApplication : System.Web.HttpApplication
    {
        #region
        public static double rate = 0;
        #endregion

        protected void Application_Start()
        {
            string fromm = "KWD";
            string Too = "USD";

            // Get live Currency Exchange Rate
            CurrencyConverter cc = new CurrencyConverter();
            CurrencyData cd = cc.GetCurrencyData(fromm, Too);
            rate = cd.Rate;

            AreaRegistration.RegisterAllAreas();
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            

        }
    }
}
