using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace journeyServiceTesting
{ 
    public class AccountRequest
    { 
        public string DeviceId { get; set; } 
        public int CountryCode { get; set; } 
        public string EmailId { get; set; } 
        public string Password { get; set; } 
        public string GigyaUID { get; set; } 
        public string GigyaLoginProvider { get; set; } 
        public string NickName { get; set; } 
        public string FirstName { get; set; } 
        public string LastName { get; set; } 
        public string City { get; set; } 
        public string CountryName { get; set; } 
    }
}
