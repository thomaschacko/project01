using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Runtime.Serialization;

namespace MobileGaps.Logfox.JourneyWebService
{
    [DataContract(Namespace = "")] 
    public class AccountResponse
    {
        [DataMember]
        public Guid AccountId { get; set; }
        [DataMember]
        public AccountConfiguration Configuration { get; set; }

    }

    [DataContract(Namespace = "")] 
    public class AccountConfiguration
    {

    }

}