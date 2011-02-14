<?xml version="1.0" encoding="utf-8"?>
<serviceModel xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" name="MobileGaps.LogFox.Journey" generation="1" functional="0" release="0" Id="d5d82437-f4b0-468a-875d-b7eda2584b10" dslVersion="1.2.0.0" xmlns="http://schemas.microsoft.com/dsltools/RDSM">
  <groups>
    <group name="MobileGaps.LogFox.JourneyGroup" generation="1" functional="0" release="0">
      <componentports>
        <inPort name="MobileGaps.LogFox.JourneyService:HttpIn" protocol="http">
          <inToChannel>
            <lBChannelMoniker name="/MobileGaps.LogFox.Journey/MobileGaps.LogFox.JourneyGroup/LB:MobileGaps.LogFox.JourneyService:HttpIn" />
          </inToChannel>
        </inPort>
      </componentports>
      <settings>
        <aCS name="MobileGaps.LogFox.JourneyServiceInstances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/MobileGaps.LogFox.Journey/MobileGaps.LogFox.JourneyGroup/MapMobileGaps.LogFox.JourneyServiceInstances" />
          </maps>
        </aCS>
        <aCS name="MobileGaps.LogFox.JourneyService:DiagnosticsConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/MobileGaps.LogFox.Journey/MobileGaps.LogFox.JourneyGroup/MapMobileGaps.LogFox.JourneyService:DiagnosticsConnectionString" />
          </maps>
        </aCS>
      </settings>
      <channels>
        <lBChannel name="LB:MobileGaps.LogFox.JourneyService:HttpIn">
          <toPorts>
            <inPortMoniker name="/MobileGaps.LogFox.Journey/MobileGaps.LogFox.JourneyGroup/MobileGaps.LogFox.JourneyService/HttpIn" />
          </toPorts>
        </lBChannel>
      </channels>
      <maps>
        <map name="MapMobileGaps.LogFox.JourneyServiceInstances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/MobileGaps.LogFox.Journey/MobileGaps.LogFox.JourneyGroup/MobileGaps.LogFox.JourneyServiceInstances" />
          </setting>
        </map>
        <map name="MapMobileGaps.LogFox.JourneyService:DiagnosticsConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/MobileGaps.LogFox.Journey/MobileGaps.LogFox.JourneyGroup/MobileGaps.LogFox.JourneyService/DiagnosticsConnectionString" />
          </setting>
        </map>
      </maps>
      <components>
        <groupHascomponents>
          <role name="MobileGaps.LogFox.JourneyService" generation="1" functional="0" release="0" software="C:\sourcecode\MobileGaps.LogFox.Journey\MobileGaps.LogFox.Journey\bin\Debug\MobileGaps.LogFox.Journey.csx\roles\MobileGaps.LogFox.JourneyService" entryPoint="base\x64\WaWebHost.exe" parameters="" memIndex="1792" hostingEnvironment="frontendfulltrust" hostingEnvironmentVersion="2">
            <componentports>
              <inPort name="HttpIn" protocol="http" />
            </componentports>
            <settings>
              <aCS name="DiagnosticsConnectionString" defaultValue="" />
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;MobileGaps.LogFox.JourneyService&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;MobileGaps.LogFox.JourneyService&quot;&gt;&lt;e name=&quot;HttpIn&quot; /&gt;&lt;/r&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/MobileGaps.LogFox.Journey/MobileGaps.LogFox.JourneyGroup/MobileGaps.LogFox.JourneyServiceInstances" />
          </sCSPolicy>
        </groupHascomponents>
      </components>
      <sCSPolicy>
        <sCSPolicyID name="MobileGaps.LogFox.JourneyServiceInstances" defaultPolicy="[1,1,1]" />
      </sCSPolicy>
    </group>
  </groups>
  <implements>
    <implementation Id="f0eb8ba0-d718-4e11-a10c-a63cf2e2c545" ref="Microsoft.RedDog.Contract\ServiceContract\MobileGaps.LogFox.JourneyContract@ServiceDefinition">
      <interfacereferences>
        <interfaceReference Id="90803fe4-354a-426b-8a5f-70104c5f835d" ref="Microsoft.RedDog.Contract\Interface\MobileGaps.LogFox.JourneyService:HttpIn@ServiceDefinition">
          <inPort>
            <inPortMoniker name="/MobileGaps.LogFox.Journey/MobileGaps.LogFox.JourneyGroup/MobileGaps.LogFox.JourneyService:HttpIn" />
          </inPort>
        </interfaceReference>
      </interfacereferences>
    </implementation>
  </implements>
</serviceModel>