<!DOCTYPE html>
<%-- <html lang="${org.springframework.web.servlet.support.RequestContextUtils.getLocale(request).toString().replace('_', '-')}"> --%>
<html lang="${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'}">

<head>
	<title><g:layoutTitle default="${meta(name:'app.name')}" /></title>
	
    <meta charset="utf-8">
    <meta name="viewport"		content="width=device-width, initial-scale=1.0">
    <meta name="description"	content="">
    <meta name="author"			content="">
    <link href="${resource(dir:'css',file:'bootstrap_head.css')}" type="text/css" rel="stylesheet" />
    <link href="${resource(dir:'css',file:'cssadded.css')}" type="text/css" rel="stylesheet" />
    <link href="${resource(dir:'css',file:'bootstrap_utils_head.css')}" type="text/css" rel="stylesheet" />
    <link href="${resource(dir:'css',file:'BreadCrumb.css')}" type="text/css" rel="stylesheet" />
    <link href="${resource(dir:'css',file:'bootstrap-multiselect.css')}" type="text/css" rel="stylesheet" />
    <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
    <g:javascript src="bootstrap_utils_defer.js" />
    <g:javascript src="bootstrap_defer.js" />
    <g:javascript src="bootstrap-multiselect.js" />
    <g:javascript src="kickstart.js" />
    <g:javascript src="jquery.jBreadCrumb.1.1.min.js" />
    <link rel="apple-touch-icon"	href="assets/ico/apple-touch-icon.png">
    <link rel="apple-touch-icon"	href="assets/ico/apple-touch-icon-72x72.png"	sizes="72x72">
    <link rel="apple-touch-icon"	href="assets/ico/apple-touch-icon-114x114.png"	sizes="114x114">
	<%-- Manual switch for the skin can be found in /view/_menu/_config.gsp --%>
	<r:require modules="jquery"/> <%-- jQuery is required for Bootstrap! --%>
	<r:layoutResources />
	<g:layoutHead />
        <modalbox:modalIncludes/>
	<!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
	<!--[if lt IE 9]>
		<script src="https://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
	<%-- For Javascript see end of body --%>
</head>
<body>
	<!-- Enable to overwrite Header by individual page -->
	<g:render template="/layouts/contentmodal"/>														

	<!-- Enable to overwrite Footer by individual page -->
	<!-- Enable to insert additional components (e.g., modals, javascript, etc.) by any individual page -->
	<!-- Included Javascript files and other resources -->
	<r:layoutResources />
</body>

</html>