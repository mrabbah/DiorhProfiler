<% import grails.persistence.Event %>
<%=packageName%>
<!DOCTYPE html>
<html>

  <head>
    <meta name="layout" content="kickstart" />
  <g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
  <style type="text/css" media="screen">
@media screen and (min-width: 768px) {
.modal-dialog {
width: 300px;
margin: 30px auto;
}
    .modal-content {
      -webkit-box-shadow: 0 5px 15px rgba(0, 0, 0, 0.5);
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.5);
    }
    }
  </style>
</head>

<body>

  <section id="show-${domainClass.propertyName}" class="first">
    <div class="row">
      <div class="col-sm-12">
        <div class="panel panel-danger">
          <div class="panel-heading">
            <h3 class="panel-title">Détail</h3>
          </div>
          <div class="panel-body">
            <table class="table table-striped table-bordered table-condensed">
              <tbody>
    <%  excludedProps = Event.allEvents.toList() << 'id' << 'version'
    allowedNames = domainClass.persistentProperties*.name << 'dateCreated' << 'lastUpdated'
    props = domainClass.properties.findAll { allowedNames.contains(it.name) && !excludedProps.contains(it.name) && (domainClass.constrainedProperties[it.name] ? domainClass.constrainedProperties[it.name].display : true) }
    Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
    props.each { p -> %>
                <tr class="prop">
                  <td valign="top" class="name"><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}" /></td>
      <%  if (p.isEnum()) { %>
              <td valign="top" class="value">\${${propertyName}?.${p.name}?.encodeAsHTML()}</td>
        <%  } else if (p.oneToMany || p.manyToMany) { %>
              <td valign="top" style="text-align: left;" class="value">
                <ul>
                  <g:each in="\${${propertyName}.${p.name}}" var="${p.name[0]}">
                    <li><g:link controller="${p.referencedDomainClass?.propertyName}" action="show" id="\${${p.name[0]}.id}">\${${p.name[0]}?.encodeAsHTML()}</g:link></li>
                  </g:each>
                </ul>
              </td>
        <%  } else if (p.manyToOne || p.oneToOne) { %>
              <td valign="top" class="value"><g:link controller="${p.referencedDomainClass?.propertyName}" action="show" id="\${${propertyName}?.${p.name}?.id}">\${${propertyName}?.${p.name}?.encodeAsHTML()}</g:link></td>
        <%  } else if (p.type == Boolean || p.type == boolean) { %>
              <td valign="top" class="value"><g:formatBoolean boolean="\${${propertyName}?.${p.name}}" /></td>
        <%  } else if (p.type == Date || p.type == java.sql.Date || p.type == java.sql.Time || p.type == Calendar) { %>
              <td valign="top" class="value"><g:formatDate date="\${${propertyName}?.${p.name}}" /></td>
        <%  } else if(!p.type.isArray()) { %>
              <td valign="top" class="value">\${fieldValue(bean: ${propertyName}, field: "${p.name}")}</td>
        <%  } %>
              </tr>
      <%  } %>
              </tbody>
            </table>
          </div>
          </div>
          </div>
          </div>
            </section>

            </body>

            </html>
