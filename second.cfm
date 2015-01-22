<!---<cfprocessingdirective suppresswhitespace="true">
<cfscript>
setting showdebugoutput="false";
/* 
callResult = structNew();
callResult.status = true;
callResult.message= 'Welcome!';
writeOutPut(serializeJSON(callResult));
*/
/*
cfhttp( method="post", url="http://dev.subaruadfund.com/cfcs/subaruPOP.cfc", result="apiResponse" ) {// getAsBinary = "yes"

	cfhttpParam( type="header", name="Content-Type", value="application/json" );
 	cfhttpParam( type="formfield", name="userName" value="010101e" );
	cfhttpParam( type="formfield", name="password" value=" " ); 
	
} // END: cfhttp.

writeDump(apiResponse);
/*/
try {

	ws = CreateObject("webservice", "http://dev.subaruadfund.com/cfcs/subaruPOP.cfc?wsdl"); 
	qry = ws.getUser( userName="010101e",
					  password=" " ); 
	writeOutPut(qry);
	
		/*writeOutPut('"CallResult":[{"MSG":"User Logged in","SUCCESS":true}];');*/
} catch (any e) {
	writeDump(e);
}
</cfscript>
</cfprocessingdirective>--->

<cfsetting showdebugoutput="false">
<cfprocessingdirective suppresswhitespace="true">
<cfset ws = CreateObject("webservice", "http://dev.subaruadfund.com/cfcs/subaruPOP.cfc?wsdl")>
<cfset callResult = ws.getUser( userName="010101e",
							    password=" " )>

<cfset responseString = serializeJSON(callResult)>
<!---<cfset responseBinary = toBinary(toBase64(responseString))>--->

<cfheader statuscode="#callResult.statusCode#" statustext="#callResult.statusText#">
<!---<cfheader name="content-length" value="#arrayLen(responseBinary)#" >
<cfcontent type="application/x-json" variable="#responseBinary#" >--->
<cfoutput>#responseString#</cfoutput>
	
</cfprocessingdirective>