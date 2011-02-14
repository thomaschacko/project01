<?xml version="1.0" encoding="utf-8"?>
<serviceModel xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" name="JourneyService" generation="1" functional="0" release="0" Id="203d0b74-d617-4447-b9f4-3b7a1853697b" dslVersion="1.2.0.0" xmlns="http://schemas.microsoft.com/dsltools/RDSM">
  <groups>
    <group name="JourneyServiceGroup" generation="1" functional="0" release="0">
      <componentports>
        <inPort name="JourneyWebService:HttpIn" protocol="http">
          <inToChannel>
            <lBChannelMoniker name="/JourneyService/JourneyServiceGroup/LB:JourneyWebService:HttpIn" />
          </inToChannel>
        </inPort>
      </componentports>
      <settings>
        <aCS name="JourneyWebServiceInstances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/JourneyService/JourneyServiceGroup/MapJourneyWebServiceInstances" />
          </maps>
        </aCS>
        <aCS name="JourneyWebService:DiagnosticsConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/JourneyService/JourneyServiceGroup/MapJourneyWebService:DiagnosticsConnectionString" />
          </maps>
        </aCS>
      </settings>
      <channels>
        <lBChannel name="LB:JourneyWebService:HttpIn">
          <toPorts>
            <inPortMoniker name="/JourneyService/JourneyServiceGroup/JourneyWebService/HttpIn" />
          </toPorts>
        </lBChannel>
      </channels>
      <maps>
        <map name="MapJourneyWebServiceInstances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/JourneyService/JourneyServiceGroup/JourneyWebServiceInstances" />
          </setting>
        </map>
        <map name="MapJourneyWebService:DiagnosticsConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/JourneyService/JourneyServiceGroup/JourneyWebService/DiagnosticsConnectionString" />
          </setting>
        </map>
      </maps>
      <components>
        <groupHascomponents>
          <role name="JourneyWebService" generation="1" functional="0" release="0" software="C:\sourcecode\JourneyService\JourneyService\bin\Debug\JourneyService.csx\roles\JourneyWebService" entryPoint="base\x64\WaWebHost.exe" parameters="" memIndex="1792" hostingEnvironment="frontendfulltrust" hostingEnvironmentVersion="2">
            <componentports>
              <inPort name="HttpIn" protocol="http" />
            </componentports>
            <settings>
              <aCS name="DiagnosticsConnectionString" defaultValue="" />
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;JourneyWebService&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;JourneyWebService&quot;&gt;&lt;e name=&quot;HttpIn&quot; /&gt;&lt;/r&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/JourneyService/JourneyServiceGroup/JourneyWebServiceInstances" />
          </sCSPolicy>
        </groupHascomponents>
      </components>
      <sCSPolicy>
        <sCSPolicyID name="JourneyWebServiceInstances" defaultPolicy="[1,1,1]" />
      </sCSPolicy>
    </group>
  </groups>
  <implements>
    <implementation Id="33b63116-44a3-44b7-b76d-589c1969225b" ref="Microsoft.RedDog.Contract\ServiceContract\JourneyServiceContract@ServiceDefinition">
      <interfacereferences>
        <interfaceReference Id="50f2529f-0588-4791-964f-71f52f6eebb4" ref="Microsoft.RedDog.Contract\Interface\JourneyWebService:HttpIn@ServiceDefinition">
          <inPort>
            <inPortMoniker name="/JourneyService/JourneyServiceGroup/JourneyWebService:HttpIn" />
          </inPort>
        </interfaceReference>
      </interfacereferences>
    </implementation>
  </implements>
</serviceModel>