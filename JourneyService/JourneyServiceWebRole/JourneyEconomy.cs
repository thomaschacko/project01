namespace MobileGaps.Logfox.JourneyWebService
{
    public class JourneyEconomy
    { 



        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute("currency", Form = System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string Currency { get; set; }

        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute("unit", Form = System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string Unit { get; set; }

        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute("allowance", Form = System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string Allowance { get; set; }
    }
}
