using System;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Xml.Linq;
using System.ServiceModel.Activation;
using Gigya.Socialize.SDK;
using System.Configuration;

namespace MobileGaps.Logfox.JourneyWebService
{
    [ServiceContract]
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    public class Journey  
    { 
        [WebInvoke(UriTemplate="account/new",Method= "POST")]
        public AccountResponse StartANewAccount(AccountRequest accountRequest)
        {

            string uid = accountRequest.GigyaUID;  

            string methodName = "socialize.getUserInfo";

            string apiKey = ConfigurationManager.AppSettings["apikey"];
            string secretKey = ConfigurationManager.AppSettings["secretkey"];

            GSRequest request = new GSRequest(apiKey, secretKey, methodName, false);
            // Step 2 - Adding parameters  
            request.setParam("uid", uid);  // set the "uid" parameter to user's ID           
            // Step 3 - Sending the request  
            GSResponse response = request.send();
            string nickname = response.getString("nickname", "");

             
            string City = response.getString("city", "");
            string CountryName = response.getString("country", "");
            string FirstName = response.getString("firstName", "");
            string LastName = response.getString("lastName", "");
            string GigyaLoginProvider = response.getString("loginProvider", "");
            string NickName = response.getString("nickname", ""); 


            Guid? account_id=null;
            using (JourneyDbDataContext journeyDbContext = new JourneyDbDataContext())
            {
                journeyDbContext.AddAccount(accountRequest.GigyaUID, accountRequest.EmailId, accountRequest.Password, accountRequest.DeviceId, accountRequest.CountryCode, GigyaLoginProvider, NickName, FirstName, LastName, City, CountryName, ref account_id);

            }

            AccountResponse ar = new AccountResponse();
            if (account_id.HasValue)
                ar.AccountId = account_id.Value;
            ar.Configuration = new AccountConfiguration();
            return ar;
        }



        [WebInvoke(UriTemplate = "account/identify", Method = "POST")]
        public AccountResponse IdentifyAccount(AccountRequest accountRequest)
        {
            Guid? account_id=null;
            using (JourneyDbDataContext journeyDbContext = new JourneyDbDataContext())
            {
                journeyDbContext.GetAccount(accountRequest.GigyaUID, accountRequest.EmailId, accountRequest.Password, ref account_id);
            }

            AccountResponse ar = new AccountResponse();
            if(account_id.HasValue)
                ar.AccountId = account_id.Value;
            ar.Configuration = new AccountConfiguration();


            return ar;
        }

        [OperationContract]
        [WebInvoke(UriTemplate = "account/{account_guid}/journey/{journey_guid}/leg/{leg_guid}", Method = "POST")]
        public void PostJourneyLeg(string account_guid,string journey_guid, string leg_guid, XElement journeyLeg)
        {
            //Guid? accountId =  Guid.NewGuid();
            Guid? accountId = Guid.Parse(account_guid);
            Guid? journeyId = Guid.Parse(journey_guid);
            Guid? legId = Guid.Parse(leg_guid); 
            using (JourneyDbDataContext journeyDbContext = new JourneyDbDataContext())
            {
                journeyDbContext.AddLeg(accountId, journeyId, legId, journeyLeg);
            }
             
        }

        [OperationContract]
        [WebInvoke(UriTemplate = "account/{account_guid}/journey/{journey_guid}", Method = "GET")]
        public XElement GetAJourney(string account_guid, string journey_guid)
        {
            Guid? accountId = Guid.Parse(account_guid);
             Guid? journeyId = Guid.Parse(journey_guid);
             XElement journeyXml = null;
            using (JourneyDbDataContext journeyDbContext = new JourneyDbDataContext())
            {
                journeyDbContext.GetJourney(accountId, journeyId, ref journeyXml);
            }
            return journeyXml;
        }

        [OperationContract]
        [WebInvoke(UriTemplate = "account/{account_guid}/journey", Method = "GET")]
        public XElement GetJourneyList(string account_guid)
        {
            Guid? accountId = Guid.Parse(account_guid); 
            XElement journeyXml = null;
            using (JourneyDbDataContext journeyDbContext = new JourneyDbDataContext())
            {
                journeyDbContext.GetJourneyList(accountId, ref journeyXml);
            }
            return journeyXml;
        }
    }
}
