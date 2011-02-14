using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net;
using Gigya.Socialize.SDK;
using System.Xml.Linq;
using System.Xml.Serialization;
using System.IO;
using System.Xml;

namespace journeyServiceTesting
{
    public class Program
    {
        static void Main(string[] args)
        {
           string uid = "_gid_2zHHec/df9E8dinS+JtlYG42ZmBBHfjDJdrNKnKlXb8=";

            //string uid = "_gid_QmRG9Xql3msxv9NGvWBdoB2vx6nfoo1zwDyYKMtMIEo=";

            

            string methodName = "socialize.getUserInfo";


            const string apiKey = "2_9ddReqCkefQkoDfCf7j7IJSiDtNeY0aEwi4IYtNo4QDsxcTcwaLW4LV8xpzir_RV";
            const string secretKey = "10wwA3bsY3KC4Zd875+DRObeqBRNymg4mzGWAfoFIFk=";

            GSRequest request = new GSRequest(apiKey, secretKey, methodName, false);
            // Step 2 - Adding parameters  
            request.setParam("uid", uid);  // set the "uid" parameter to user's ID           
            // Step 3 - Sending the request  
            GSResponse response = request.send();
            string nickname = response.getString("nickname", "");


            AccountRequest ar = new AccountRequest();
            ar.City = response.getString("city", "");
            ar.CountryName = response.getString("country", "");
            ar.FirstName = response.getString("firstName", "");
            ar.LastName = response.getString("lastName", "");
            ar.GigyaLoginProvider = response.getString("loginProvider", "");
            ar.NickName = response.getString("nickname", "");

            ar.GigyaUID = uid;

            XElement arRequest = Serialize(ar);

        }

        public static XElement Serialize<T>(T toSerialize)
        {
            XElement responseXml = null;
            var xmlSerializer = new XmlSerializer(typeof(T));
            var memoryStream = new MemoryStream();
            var xmlTextWriter = new XmlTextWriter(memoryStream, null);
            xmlSerializer.Serialize(xmlTextWriter, toSerialize);
            // Rewind the Stream.
            memoryStream.Seek(0, SeekOrigin.Begin);
            responseXml = XElement.Load(memoryStream);
            memoryStream.Dispose();
            return responseXml;
        }

    }
}
