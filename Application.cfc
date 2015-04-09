/*
	Application.cfc

	Order of function processing:
		1. onApplicationStart (if not run before for this application)
		2. onSessionStart (if not run before for this session)
		3. onRequestStart
		4. onRequest/onCFCRequest
		5. onRequestEnd

		onApplicationEnd, onSessionEnd, and onError are triggered by specific events.
*/
component {
	/* 
		Application variables
		https://wikidocs.adobe.com/wiki/display/coldfusionen/Application+variables
	*/
	THIS.name = "YourAppName";
	THIS.applicationTimeout = createTimeSpan(1,0,0,0);
	THIS.sessionTimeout = createTimeSpan(1,0,0,0);
	THIS.sessionManagement = true;
	THIS.setClientCookies = false;

	/* 
		cfsetting page settings.
		https://wikidocs.adobe.com/wiki/display/coldfusionen/cfsetting
		Controls aspects of page processing, such as the output of HTML code in pages.
		These settings can be overridden in page templates.
	*/
	cfsetting(requestTimeout=20, enableCFoutputOnly=false, showDebugOutput=false);

	/*
		onApplicationStart Callback
		https://wikidocs.adobe.com/wiki/display/coldfusionen/onApplicationStart
		First function run when ColdFusion receives the first request for a page in the application.
	*/
	public boolean function onApplicationStart() {
		return true;
	}

	/*
		onApplicationEnd Callback
		https://wikidocs.adobe.com/wiki/display/coldfusionen/onApplicationEnd
		Last function run when Application times out or server is shut down.
	*/
	public void function onApplicationEnd(struct applicationScope={}) {
		return;
	}

	/*
		onSessionStart Callback
		https://wikidocs.adobe.com/wiki/display/coldfusionen/onSessionStart
		Run when first setting up a session.
	*/
	public void function onSessionStart() {
		return;
	}

	/*
		onSessionEnd Callback
		https://wikidocs.adobe.com/wiki/display/coldfusionen/onSessionEnd
		Run when a session ends.
	*/
	public void function onSessionEnd(required struct sessionScope, struct applicationScope={}) {
		return;
	}
	
	/*
		onRequestStart Callback
		https://wikidocs.adobe.com/wiki/display/coldfusionen/onRequestStart
		First page-processing function run when a page request starts.
		Return False to prevent ColdFusion from processing the request.
	*/
	public boolean function onRequestStart(required string targetPage) {
		return true;
	}

	/*
		onRequest Callback
		https://wikidocs.adobe.com/wiki/display/coldfusionen/onRequest
		Runs when a request starts, after the onRequestStart event handler.
		This callback is optional. If you implement this method, it must explicitly call the requested page to process it.
	*/
	public void function onRequest(required string targetPage) {
		include arguments.targetPage;
		return;
	}

	/*
		onCFCRequest Callback
		https://wikidocs.adobe.com/wiki/display/coldfusionen/onCFCRequest
		Intercepts any HTTP or AMF calls to an application based on CFC request.
		Whereas onRequest handles only requests made to ColdFusion templates, this function controls Ajax, Web Service, and Flash Remoting requests.
	*/
	public void function onCFCRequest(string cfcname, string method, struct args) {
		return;
	}

	/*
		onRequestEnd Callback
		https://wikidocs.adobe.com/wiki/display/coldfusionen/onRequestEnd
		Runs at the end of a request, after all other CFML code.
	*/
	public void function onRequestEnd() {
		return;
	}

	/*
		onAbort Callback
		https://wikidocs.adobe.com/wiki/display/coldfusionen/onAbort
		Runs when you execute the CFML tag cfabort or cfscript "abort".
		If showError attribute is specified in cfabort, onError method is executed instead of onAbort.
		When using cfabort, cflocation, or cfcontent tags, the onAbort method is invoked instead on onRequestEnd.
	*/
	public void function onAbort(required string targetPage) {
		return;
	}

	/*
		onError Callback
		https://wikidocs.adobe.com/wiki/display/coldfusionen/onError
		Runs when an uncaught exception occurs in the application.
		This method overrides any error handlers that you set in the ColdFusion Administrator or in cferror tags. It does not override try/catch blocks.
	*/
	public void function onError(required any exception, required string eventName) {
		return;
	}

	/*
		onMissingTemplate Callback
		https://wikidocs.adobe.com/wiki/display/coldfusionen/onMissingTemplate
		Runs when a request specifies a non-existent CFML page.
		True, or no return value, specifies that the event has been processed. If the function returns false, ColdFusion invokes the standard error handler.
	*/
	public boolean function onMissingTemplate(required string targetPage) {
		return true;
	}
}