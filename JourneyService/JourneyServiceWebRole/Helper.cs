using System.Xml.Linq;
using System.Xml.Serialization;
using System.IO;
using System.Xml;
using System.Text;

namespace MobileGaps.Logfox.JourneyWebService
{
    public static class Helper
    {
        

        /// <summary>
        /// Performs the deserialization.
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="xelement">The xelement.</param>
        /// <returns></returns>
        public static T Deserialize<T>(XElement xelement)
        {
            var xmlSerializer = new XmlSerializer(typeof(T));
            var memoryStream = new MemoryStream(Encoding.UTF8.GetBytes(xelement.ToString()), false);
            XmlReader reader = new XmlTextReader(memoryStream);
            object deserialized = xmlSerializer.Deserialize(reader);
            return (T)deserialized;
        }


        /// <summary>
        /// Gets the XElement for a class.
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="toSerialize">To serialize.</param>
        /// <param name="responseXml">The response XML.</param>
        public static XElement Serialize<T>(T toSerialize)
        {
            var xmlSerializer = new XmlSerializer(typeof(T));
            var memoryStream = new MemoryStream();
            var xmlTextWriter = new XmlTextWriter(memoryStream, null);
            xmlSerializer.Serialize(xmlTextWriter, toSerialize);
            // Rewind the Stream.
            memoryStream.Seek(0, SeekOrigin.Begin);

            var xmlDocument = new XmlDocument();
            // load from stream;
            xmlDocument.Load(memoryStream);
            XElement responseXml = XElement.Load(new XmlNodeReader(xmlDocument));
            return responseXml;
        }
    }
}