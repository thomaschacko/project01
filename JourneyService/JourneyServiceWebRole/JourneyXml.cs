namespace MobileGaps.Logfox.JourneyWebService
{
    [System.Xml.Serialization.XmlRootAttribute(ElementName="journey", Namespace="", IsNullable=false)]
    public class JourneyXml
    {
        public JourneyXml()
        {
            Economy = new JourneyEconomy();
            Leg = new JourneyLeg();
        }


        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute("key", Form = System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string JourneyKey { get; set; }

        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute("journeyid", Form = System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string JourneyId { get; set; }

        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute("purpose", Form = System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string Purpose { get; set; }

        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute("economy", Form = System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public JourneyEconomy Economy { get; set; }

        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute("leg", Form = System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public JourneyLeg Leg { get; set; }  
    }
}