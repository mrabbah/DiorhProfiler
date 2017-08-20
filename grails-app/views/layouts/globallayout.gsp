<!DOCTYPE html>
<%-- <html lang="${org.springframework.web.servlet.support.RequestContextUtils.getLocale(request).toString().replace('_', '-')}"> --%>
<html lang="${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'}">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<!--<meta http-equiv="content-type" content="text/html; charset=ISO-8859-1" /> -->
<head>
	<title><g:layoutTitle default="DIORH Profiler" /></title>
	
<!--    <meta charset="utf-8">-->
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author"	content="">
    <link href="${resource(dir:'css',file:'bootstrap_head.css')}" type="text/css" rel="stylesheet" />
    <link href="${resource(dir:'css',file:'cssadded.css')}" type="text/css" rel="stylesheet" />
    <link href="${resource(dir:'css',file:'bootstrap_utils_head.css')}" type="text/css" rel="stylesheet" />
    <link href="${resource(dir:'css',file:'BreadCrumb.css')}" type="text/css" rel="stylesheet" />
    <link href="${resource(dir:'css',file:'bootstrap-multiselect.css')}" type="text/css" rel="stylesheet" />  
    <link href="${resource(dir:'css',file:'Datepicker.css')}" type="text/css" rel="stylesheet" />  
    <link href="${resource(dir:'css',file:'prettify.css')}" type="text/css" rel="stylesheet" />  
    <link href="${resource(dir:'css',file:'jquery-ui.datepicker.css')}" type="text/css" rel="stylesheet" />
    <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
    <g:javascript src="jquery.min.js" />
    <g:javascript src="bootstrap.min.js" />
    <g:javascript src="jquery.jBreadCrumb.1.1.min.js" />
    <g:javascript src="test.js" />
    <link rel="apple-touch-icon"	href="assets/ico/apple-touch-icon.png">
    <link rel="apple-touch-icon"	href="assets/ico/apple-touch-icon-72x72.png"	sizes="72x72">
    <link rel="apple-touch-icon"	href="assets/ico/apple-touch-icon-114x114.png"	sizes="114x114">
<%-- Manual switch for the skin can be found in /view/_menu/_config.gsp --%>
	<!--<r:layoutResources />-->
	<g:layoutHead />
        <!--<modalbox:modalIncludes/>-->
	<!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
	<!--[if lt IE 9]>
		<script src="https://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

	<%-- For Javascript see end of body --%>
</head>

<body>

	<g:render template="/layouts/globalcontent"/>														

	<!-- Enable to overwrite Footer by individual page -->
	

	<!-- Enable to insert additional components (e.g., modals, javascript, etc.) by any individual page -->
	<g:if test="${ pageProperty(name:'page.include.bottom') }">
   		<g:pageProperty name="page.include.bottom" />
	</g:if>
	<g:else>
		<!-- Insert a modal dialog for registering (for an open site registering is possible on any page) -->
		<g:render template="/_common/modals/registerDialog" model="[item: item]"/>
	</g:else>
	
	<!-- Included Javascript files and other resources -->
	<r:layoutResources />
       
</body>

</html>