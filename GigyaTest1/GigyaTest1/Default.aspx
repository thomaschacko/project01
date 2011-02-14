<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="GigyaTest1._Default" %>
 
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">

	<script type="text/javascript" src="http://cdn.gigya.com/js/socialize.js?apiKey=2_9ddReqCkefQkoDfCf7j7IJSiDtNeY0aEwi4IYtNo4QDsxcTcwaLW4LV8xpzir_RV">
	</SCRIPT>
	<script>
	    var conf =
        {
            APIKey: '2_9ddReqCkefQkoDfCf7j7IJSiDtNeY0aEwi4IYtNo4QDsxcTcwaLW4LV8xpzir_RV'
	, enabledProviders: 'google'
        };

	    // This method is activated when page is loaded
	    function onLoad() {
	        // register for login event
	        gigya.services.socialize.addEventHandlers(conf, {
	            context: { str: 'congrats on your' }
					, onLogin: onLoginHandler
					, onLogout: onLogoutHandler
	        });

	    }

	    // onLogin Event handler
	    function onLoginHandler(eventObj) {
	        alert(eventObj.context.str + ' ' + eventObj.eventName + ' to ' + eventObj.provider
				+ '!\n' + eventObj.provider + ' user ID: ' + eventObj.user.identities[eventObj.provider].providerUID);
	        // verify the signature ...
	        verifyTheSignature(eventObj.UID, eventObj.timestamp, eventObj.signature);

	        // Check whether the user is new by searching if eventObj.UID exists in your database
	        var newUser = true; // lets assume the user is new

	        if (newUser) {
	            // 1. Register user 
	            // 2. Store new user in DB
	            // 3. link site account to social network identity
	            //   3.1 first construct the linkAccounts parameters
	            var dateStr = Math.round(new Date().getTime() / 1000.0); // Current time in Unix format
	            //(i.e. the number of seconds since Jan. 1st 1970)

	            var siteUID = 'uTtCGqDTEtcZMGL08w'; // siteUID should be taken from the new user record
	            // you have stored in your DB in the previous step
	            var yourSig = createSignature(siteUID, dateStr);

	            var params = {
	                siteUID: siteUID,
	                timestamp: dateStr,
	                signature: yourSig
	            };

	            //   3.1 call linkAccounts method:
	            gigya.services.socialize.notifyRegistration(conf, params);
	        }

	        document.getElementById('status').style.color = "green";
	        document.getElementById('status').innerHTML = "Status: You are now signed in";

	    }

	    // Note: the actual signature calculation implementation should be on server side
	    function createSignature(UID, timestamp) {
	        encodedUID = encodeURIComponent(UID); // encode the UID parameter before sending it to the server.
	        // On server side use decodeURIComponent() function to decode an encoded UID
	        return '';
	    }

	    // Note: the actual signature calculation implementation should be on server side
	    function verifyTheSignature(UID, timestamp, signature) {
	        encodedUID = encodeURIComponent(UID); // encode the UID parameter before sending it to the server.
	        // On server side use decodeURIComponent() function to decode an encoded UID
	        alert('Your UID: ' + UID + '\n timestamp: ' + timestamp + '\n signature: ' + signature + '\n Your UID encoded: ' + encodedUID);
	    }

	    // Logout from Gigya platform. This method is activated when "Logout" button is clicked 
	    function logoutFromGS() {
	        gigya.services.socialize.logout(conf, {/*no required params*/
	    }); // logout from Gigya platform
	}

	// onLogout Event handler
	function onLogoutHandler(eventObj) {
	    document.getElementById('status').style.color = "red";
	    document.getElementById('status').innerHTML = "Status: You are now signed out";
	}

       
    </script>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
   <br />
	<h4>Please Sign In using one of the following providers:</h4><br /><br />
	<div id="loginDiv"></div>
	<script type="text/javascript">
	    gigya.services.socialize.showLoginUI(conf, {
	        height: 85
	        , width: 360
			, showTermsLink: false // remove 'Terms' link
			, hideGigyaLink: true // remove 'Gigya' link
			, buttonsStyle: 'fullLogo' // Change the default buttons design to "Full Logos" design
			, showWhatsThis: true // Pop-up a hint describing the Login Plugin, when the user rolls over the Gigya link.
	        , containerID: 'loginDiv' // The component will embed itself inside the loginDiv Div 
	    });
	</script>
    <br />
    <br /><br /><br />
	<h4>Click the button below to Sign Out from Gigya platform:</h4><br /><br />
    <input id="btnLogout" type="button" value="Sign Out" 
            onclick="logoutFromGS()"/>
    <br />
    <br />
    <div id="status"></div>
</asp:Content>
