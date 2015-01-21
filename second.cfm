<cfscript>
setting showdebugoutput="false"; 
callResult = structNew();
callResult.status = true;
callResult.message= 'Welcome!';
writeOutPut(serializeJSON(callResult));
</cfscript>