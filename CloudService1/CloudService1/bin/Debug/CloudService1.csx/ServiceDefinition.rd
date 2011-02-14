<?xml version="1.0" encoding="utf-8"?>
<serviceModel xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" name="CloudService1" generation="1" functional="0" release="0" Id="d6dc9294-30b6-4839-b542-c720f0b239fd" dslVersion="1.2.0.0" xmlns="http://schemas.microsoft.com/dsltools/RDSM">
  <groups>
    <group name="CloudService1Group" generation="1" functional="0" release="0">
      <componentports>
        <inPort name="WCFServiceWebRole1:HttpIn" protocol="http">
          <inToChannel>
            <lBChannelMoniker name="/CloudService1/CloudService1Group/LB:WCFServiceWebRole1:HttpIn" />
          </inToChannel>
        </inPort>
      </componentports>
      <settings>
        <aCS name="WCFServiceWebRole1Instances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/CloudService1/CloudService1Group/MapWCFServiceWebRole1Instances" />
          </maps>
        </aCS>
        <aCS name="WCFServiceWebRole1:DiagnosticsConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/CloudService1/CloudService1Group/MapWCFServiceWebRole1:DiagnosticsConnectionString" />
          </maps>
        </aCS>
      </settings>
      <channels>
        <lBChannel name="LB:WCFServiceWebRole1:HttpIn">
          <toPorts>
            <inPortMoniker name="/CloudService1/CloudService1Group/WCFServiceWebRole1/HttpIn" />
          </toPorts>
        </lBChannel>
      </channels>
      <maps>
        <map name="MapWCFServiceWebRole1Instances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/CloudService1/CloudService1Group/WCFServiceWebRole1Instances" />
          </setting>
        </map>
        <map name="MapWCFServiceWebRole1:DiagnosticsConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/CloudService1/CloudService1Group/WCFServiceWebRole1/DiagnosticsConnectionString" />
          </setting>
        </map>
      </maps>
      <components>
        <groupHascomponents>
          <role name="WCFServiceWebRole1" generation="1" functional="0" release="0" software="C:\sourcecode\CloudService1\CloudService1\bin\Debug\CloudService1.csx\roles\WCFServiceWebRole1" entryPoint="base\x64\WaWebHost.exe" parameters="" memIndex="1792" hostingEnvironment="frontendfulltrust" hostingEnvironmentVersion="2">
            <componentports>
              <inPort name="HttpIn" protocol="http" />
            </componentports>
            <settings>
              <aCS name="DiagnosticsConnectionString" defaultValue="" />
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;WCFServiceWebRole1&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;WCFServiceWebRole1&quot;&gt;&lt;e name=&quot;HttpIn&quot; /&gt;&lt;/r&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/CloudService1/CloudService1Group/WCFServiceWebRole1Instances" />
          </sCSPolicy>
        </groupHascomponents>
      </components>
      <sCSPolicy>
        <sCSPolicyID name="WCFServiceWebRole1Instances" defaultPolicy="[1,1,1]" />
      </sCSPolicy>
    </group>
  </groups>
  <implements>
    <implementation Id="6f244126-4ada-4054-9dd6-a983e2acf3e2" ref="Microsoft.RedDog.Contract\ServiceContract\CloudService1Contract@ServiceDefinition">
      <interfacereferences>
        <interfaceReference Id="2ac9a924-37a1-4c56-b3cf-34c5138257cf" ref="Microsoft.RedDog.Contract\Interface\WCFServiceWebRole1:HttpIn@ServiceDefinition">
          <inPort>
            <inPortMoniker name="/CloudService1/CloudService1Group/WCFServiceWebRole1:HttpIn" />
          </inPort>
        </interfaceReference>
      </interfacereferences>
    </implementation>
  </implements>
</serviceModel>