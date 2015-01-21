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

ws = CreateObject("webservice", "http://dev.subaruadfund.com/cfcs/subaruPOP.cfc?wsdl"); 
qry = ws.getUser( userName="010101e",
				  password=" " ); 
writeOutPut(serializeJSON(qry));
</cfscript>