using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Runtime.Serialization;

namespace MobileGaps.Logfox.JourneyWebService
{
    [DataContract(Namespace = "")] 
    public class AccountRequest
    {
        [DataMember]
        public int CountryCode { get; set; }
        [DataMember]
        public string DeviceId { get; set; }
        [DataMember]
        public string EmailId { get; set; }
        [DataMember]
        public string GigyaUID { get; set; }
        [DataMember]
        public string Password { get; set; } 
    }
}
 