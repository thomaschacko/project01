<?xml version="1.0" encoding="utf-8"?>
<serviceModel xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" name="JourneyService" generation="1" functional="0" release="0" Id="2d953f39-52fe-446a-972d-3c26e969cadd" dslVersion="1.2.0.0" xmlns="http://schemas.microsoft.com/dsltools/RDSM">
  <groups>
    <group name="JourneyServiceGroup" generation="1" functional="0" release="0">
      <componentports>
        <inPort name="MobileGaps.Logfox.JourneyWebService:HttpIn" protocol="http">
          <inToChannel>
            <lBChannelMoniker name="/JourneyService/JourneyServiceGroup/LB:MobileGaps.Logfox.JourneyWebService:HttpIn" />
          </inToChannel>
        </inPort>
      </componentports>
      <settings>
        <aCS name="MobileGaps.Logfox.JourneyWebServiceInstances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/JourneyService/JourneyServiceGroup/MapMobileGaps.Logfox.JourneyWebServiceInstances" />
          </maps>
        </aCS>
        <aCS name="MobileGaps.Logfox.JourneyWebService:DiagnosticsConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/JourneyService/JourneyServiceGroup/MapMobileGaps.Logfox.JourneyWebService:DiagnosticsConnectionString" />
          </maps>
        </aCS>
      </settings>
      <channels>
        <lBChannel name="LB:MobileGaps.Logfox.JourneyWebService:HttpIn">
          <toPorts>
            <inPortMoniker name="/JourneyService/JourneyServiceGroup/MobileGaps.Logfox.JourneyWebService/HttpIn" />
          </toPorts>
        </lBChannel>
      </channels>
      <maps>
        <map name="MapMobileGaps.Logfox.JourneyWebServiceInstances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/JourneyService/JourneyServiceGroup/MobileGaps.Logfox.JourneyWebServiceInstances" />
          </setting>
        </map>
        <map name="MapMobileGaps.Logfox.JourneyWebService:DiagnosticsConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/JourneyService/JourneyServiceGroup/MobileGaps.Logfox.JourneyWebService/DiagnosticsConnectionString" />
          </setting>
        </map>
      </maps>
      <components>
        <groupHascomponents>
          <role name="MobileGaps.Logfox.JourneyWebService" generation="1" functional="0" release="0" software="C:\sourcecode\JourneyService\JourneyService\bin\Debug\MobileGaps.Logfox.JourneyService.csx\roles\MobileGaps.Logfox.JourneyWebService" entryPoint="base\x64\WaWebHost.exe" parameters="" memIndex="1792" hostingEnvironment="frontendfulltrust" hostingEnvironmentVersion="2">
            <componentports>
              <inPort name="HttpIn" protocol="http" />
            </componentports>
            <settings>
              <aCS name="DiagnosticsConnectionString" defaultValue="" />
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;MobileGaps.Logfox.JourneyWebService&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;MobileGaps.Logfox.JourneyWebService&quot;&gt;&lt;e name=&quot;HttpIn&quot; /&gt;&lt;/r&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/JourneyService/JourneyServiceGroup/MobileGaps.Logfox.JourneyWebServiceInstances" />
          </sCSPolicy>
        </groupHascomponents>
      </components>
      <sCSPolicy>
        <sCSPolicyID name="MobileGaps.Logfox.JourneyWebServiceInstances" defaultPolicy="[1,1,1]" />
      </sCSPolicy>
    </group>
  </groups>
  <implements>
    <implementation Id="08d73999-3572-4cfe-8f23-f5e834003fe4" ref="Microsoft.RedDog.Contract\ServiceContract\JourneyServiceContract@ServiceDefinition">
      <interfacereferences>
        <interfaceReference Id="fc03bd2e-a635-4cab-b00a-e797834b4018" ref="Microsoft.RedDog.Contract\Interface\MobileGaps.Logfox.JourneyWebService:HttpIn@ServiceDefinition">
          <inPort>
            <inPortMoniker name="/JourneyService/JourneyServiceGroup/MobileGaps.Logfox.JourneyWebService:HttpIn" />
          </inPort>
        </interfaceReference>
      </interfacereferences>
    </implementation>
  </implements>
</serviceModel>