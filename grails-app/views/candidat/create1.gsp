<%@ page import="com.rabbahsoft.diorhprofiler.Candidat" %>
<!DOCTYPE html>
<html>

    <head>
        <meta name="layout" content="globallayout" />
        <g:set var="entityName" value="${message(code: 'candidat.label', default: 'Candidat')}" />
        <g:javascript src="jquery.js" />
<g:javascript src="jquery-ui.min.js" />
<script src="http://code.jquery.com/jquery-2.0.2.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/2.0.4/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.8/angular.min.js"></script>
<script src="https://rawgithub.com/cletourneau/angular-bootstrap-datepicker/master/dist/angular-bootstrap-datepicker.js" charset="utf-8"></script>





</head>
<body>
 <div>
        <div data-ng-controller="AppCtrl">
            <input id="datepicker" type="text" data-ng-datepicker data-ng-options="datepickerOptions" data-ng-model="date">
            <input id="datepickerMirror" type="text" data-ng-model="date">
        </div>
</div>

</body>
</html>
