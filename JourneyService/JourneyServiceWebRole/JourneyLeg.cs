namespace MobileGaps.Logfox.JourneyWebService
{
    public class JourneyLeg
    { 
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute("legid", Form = System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string Legid {  get; set; }

        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute("start", Form = System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string Start { get; set; }

        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute("end", Form = System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string End { get; set; }

        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute("origin", Form = System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string Origin { get; set; }

        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute("destination", Form = System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string Destination { get; set; }

        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute("distance", Form = System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string Distance { get; set; }
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute("rounded", Form = System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string Rounded { get; set; }
    }
}
