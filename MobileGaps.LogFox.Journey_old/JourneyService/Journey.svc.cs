﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using System.Xml.Linq;

namespace JourneyService
{
    // NOTE: You can use: the "Rename" command on the "Refactor" menu to change the class name "Journey" in code, svc and config file together.
    public class Journey :IJourney
    {
        [WebGet(UriTemplate = "{journey_guid}")]
        public  XElement GetJourneyDetails(string journey_guid)
        {
            XElement journey = new XElement("JourneyDetails",
                new XElement("JourneyId", journey_guid),
                new XElement("JourneyDetails","The details will follow here."));

            return journey;
        }

        public void PpostJoourneyLeg()
        {
        }
       
    }
}
