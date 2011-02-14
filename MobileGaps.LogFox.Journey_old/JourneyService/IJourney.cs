using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using System.Xml.Linq;

namespace JourneyService
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IService1" in both code and config file together.
    [ServiceContract]
    public interface IJourney
    {
        [OperationContract]
        [WebGet(UriTemplate = "{journey_guid}")]
        XElement GetJourneyDetails(string journey_guid);

        [OperationContract]
        [WebInvoke(UriTemplate="{journey-guid}/leg/{leg-guid}",Method="POST")]
        void PpostJoourneyLeg();
    }

}
