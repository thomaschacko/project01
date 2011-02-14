using System;
using System.Web.Routing;
using System.ServiceModel.Activation;

namespace MobileGaps.Logfox.JourneyWebService
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            RouteTable.Routes.Add(
               new ServiceRoute(
                   "api", new WebServiceHostFactory(),
                   typeof(Journey)));

        }

    }
}