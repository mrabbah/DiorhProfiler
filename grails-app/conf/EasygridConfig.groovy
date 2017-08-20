//import com.google.visualization.datasource.datatable.value.ValueType
import org.grails.plugin.easygrid.AutocompleteService
import org.grails.plugin.easygrid.EasygridExportService
import org.grails.plugin.easygrid.FilterFormService
import org.grails.plugin.easygrid.GridUtils
import org.grails.plugin.easygrid.datasource.CustomDatasourceService
import org.grails.plugin.easygrid.datasource.GormDatasourceService
import org.grails.plugin.easygrid.datasource.ListDatasourceService
import org.grails.plugin.easygrid.grids.ClassicGridService
import org.grails.plugin.easygrid.grids.DataTablesGridService
import org.grails.plugin.easygrid.grids.JqueryGridService
import org.grails.plugin.easygrid.grids.VisualizationGridService

import java.awt.Color
import java.text.SimpleDateFormat

def stdDateFormat = 'dd/MM/yyyy'
easygrid {

    
    //default values added to each defined grid  ( if they are not already set )
    defaults {
        
        //labelFormat = "#{grails.util.GrailsNameUtils.getNaturalName(column.name)}"
        
        defaultMaxRows = 10 // the max no of rows displayed in the grid

        //used for automatically generating label messages from the column name
        //this will be transformed into a SimpleTemplateEngine instance ( '#' will be replaced with '$') and the binding variables will be: labelPrefix , column, gridConfig
        labelFormat = '#{labelPrefix}.#{column.name}.label'

        //called before inline editing : transforms the parameters into the actual object to be stored
        beforeSave = { params -> params }

        gridImpl = 'jqgrid' // the default grid implementation

        //used by jqgrid
        enableFilter = true
        addNavGrid = true

        //the id column
        idColName = 'id'

        //default export settings for various formats
        export {
            exportService = EasygridExportService
            maxRows = 10000 // maximum rows to be exported - to avoid out of memory exceptions

            //this section provides default values for the different export formats
            // for more options check out the export plugin

            // csv settings
            csv {
                separator = ','
                quoteCharacter = '"'
            }
            csv['header.enabled'] = true

            // excel settings
            excel['header.enabled'] = true
            //property that aggregates the widths defined per column
            excel['column.widths'] = { gridConfig ->
                def widths = []
                GridUtils.eachColumn(gridConfig, true) { column ->
                    widths.add(column?.export?.width ?: 0.2)
                }
                widths
            }

            // pdf settings
            pdf['header.enabled'] = true
            pdf['column.widths'] = { gridConfig ->
                def widths = []
                GridUtils.eachColumn(gridConfig, true) { column ->
                    widths.add(column?.export?.width ?: 0.2)
                }
                widths
            }
            pdf['border.color'] = Color.BLACK
            pdf['pdf.orientation'] = 'landscape'

            // rtf settings
            rtf['header.enabled'] = true
            rtf {
            }

            // ods settings
            ods {
            }

            // xml settings
            xml['xml.root'] = { gridConfig ->
                //defaults to the export title
                gridConfig.export.export_title
            }
            xml {
            }
        }

        // jqgrid default properties
        // check the jqgrid documentation
        jqgrid {
            width = '"100%"'
            height = 250
            // number of rows to display by default
            rowNum = 20
        }

        dataTables {
        }

        visualization {
            page = "'enable'"
            allowHtml = true
            alternatingRowStyle = true
//            showRowNumber = false
            pageSize = 10
        }

        // default security provider
        securityProvider = { grid, oper ->
            return true
/*
            if (!grid.roles) {
                return true
            }
            def grantedRoles
            if (Map.isAssignableFrom(grid.roles.getClass())) {
                grantedRoles = grid.roles.findAll { op, role -> oper == op }.collect { op, role -> role }
            } else if (List.isAssignableFrom(grid.roles.getClass())) {
                grantedRoles = grid.roles
            } else {
                grantedRoles = [grid.roles]
            }
            SpringSecurityUtils.ifAllGranted(grantedRoles.inject('') { roles, role -> "${roles},${role}" })
*/
        }

        //default autocomplete settings
        autocomplete {
            idProp = 'id'  // the name of the property of the id of the selected element (optionKey - in the replaced select tag)
            maxRows = 10 // the max no of elements to be displayed by the jquery autocomplete box
            template = '/templates/easygrid/autocompleteRenderer' //the default autocomplete renderer
            autocompleteService = AutocompleteService
        }
    }

    // each grid has a "type" - which must be one of the datasources defined here
    dataSourceImplementations {
        // renamed for consistency
        gorm {
            // mandatory attribute: domainClass or initialCriteria
            dataSourceService = GormDatasourceService
            filters {
                //default search closures
                text = { filter -> ilike(filter.filterable.name, "%${filter.paramValue}%") }
                number = { filter -> eq(filter.filterable.name, filter.paramValue as int) }
                integerF = { filter -> eq(filter.filterable.name, filter.paramValue as Integer) }
                longF = { filter -> eq(filter.filterable.name, filter.paramValue as Long) }
                doubleF = { filter -> eq(filter.filterable.name, filter.paramValue as Double) }
                floatF = { filter -> eq(filter.filterable.name, filter.paramValue as Float) }
                bigDecimalF = { filter -> eq(filter.filterable.name, filter.paramValue as BigDecimal) }
                date = { filter -> eq(filter.filterable.name, new SimpleDateFormat(stdDateFormat).parse(filter.paramValue)) }
            }
        }

        list {
            //mandatory attributes: context, attributeName
            dataSourceService = ListDatasourceService
            filters {
                //default search closures
                text = { filter, row -> row[filter.filterable.name].contains filter.paramValue }
                number = { filter, row -> row[filter.filterable.name] == filter.paramValue as int }
                integerF = { filter, row -> row[filter.filterable.name] == filter.paramValue as Integer }
                longF = { filter, row -> row[filter.filterable.name] == filter.paramValue as Long }
                doubleF = { filter, row -> row[filter.filterable.name] == filter.paramValue as Double }
                floatF = { filter, row -> row[filter.filterable.name] == filter.paramValue as Float }
                bigDecimalF = { filter, row -> row[filter.filterable.name] == filter.paramValue as BigDecimal }
                date = { filter, row -> row[filter.filterable.name] == new SimpleDateFormat(stdDateFormat).parse(filter.paramValue) }
            }
        }

        custom {
            // mandatory attributes: 'dataProvider', 'dataCount'
            dataSourceService = CustomDatasourceService
        }
    }

    // these are the actual UI grid implementations
    // will be specified in the grid config using the 'gridImpl' property
    gridImplementations {

        //grails classic implementation - for demo purposes
        classic {
            gridRenderer = '/templates/easygrid/classicGridRenderer'
            gridImplService = ClassicGridService
            inlineEdit = false
            formats = [
                    (Date): { it.format(stdDateFormat) },
                    (Boolean): { it ? "Yes" : "No" }
            ]
        }

        //  jqgrid implementation
        jqgrid {
            gridRenderer = '/templates/easygrid/jqGridRenderer'          //  a gsp template that will be rendered
            gridImplService = JqueryGridService  // the service class for this implementation
            inlineEdit = true    // specifies that this implementation allows inline Editing

            // there are 3 options to format the data
            // using the value closure in the column
            // using the named formatters ( defined below )
            // using the default type formats ( defined here ) - where you specify the type of data & the format closure
            formats = [
                    (Date): { it.format(stdDateFormat) },
                    (Calendar): { Calendar cal -> cal.format(stdDateFormat) },
                    (Boolean): { it ? "Yes" : "No" }
            ]
        }

        //  jquery datatables implementation
        dataTables {
            gridImplService = DataTablesGridService
            gridRenderer = '/templates/easygrid/dataTablesGridRenderer'
            inlineEdit = false
            formats = [
                    (Date): { it.format(stdDateFormat) },
                    (Boolean): { it ? "Yes" : "No" }
            ]
        }

        // google visualization implementation
        visualization {
            gridImplService = VisualizationGridService
            gridRenderer = '/templates/easygrid/visualizationGridRenderer'
            inlineEdit = false
            formats = [
                    (Date): { def cal = com.ibm.icu.util.Calendar.getInstance(); cal.setTime(it); cal.setTimeZone(com.ibm.icu.util.TimeZone.getTimeZone("GMT")); cal }, //wtf?
            ]
        }

    }

    // section to define per column configurations
    columns {

        //default values for the columns
        defaults {
            enableFilter = true
            showInSelection = true
            sortable = true
            jqgrid {
                editable = true
            }
            classic {
                sortable = true
            }
            visualization {
                search = false
                searchType = 'text'
                valueType = ValueType.TEXT
            }
            dataTables {
                sWidth = "'100%'"
                sClass = "''"
            }
            export {
                width = 25
            }
        }

        // predefined column types  (set of configurations)
        // used to avoid code duplication
        types {
            id {
                property = 'id'

                jqgrid {
                    width = 40
                    fixed = true
                    search = false
                    editable = false
//                formatter = 'editFormatter'
                }
                visualization {
                    valueType = ValueType.NUMBER
                }
                export {
                    width = 10
                }

            }

            actions {
                value = { '' }
                jqgrid {
                    formatter = '"actions"'
                    editable = false
                    sortable = false
                    resizable = false
                    fixed = true
                    width = 60
                    search = false
                    formatoptions = '{"keys":true}'
                }
                export {
                    hidden = true
                }
            }

            version {
                property = 'version'
                jqgrid {
                    hidden = true
                }
                export {
                    hidden = true
                }
                visualization {
                    valueType = ValueType.NUMBER
                }
            }
        }
    }

    //section to define the filter form configurations
    filterForm {
        defaults {
            filterFormService = FilterFormService
            filterFormTemplate = '/templates/filterFormRenderer'
        }
    }

    // here we define different formatters
    // these are closures  which are called before the data is displayed to format the cell data
    // these are specified in the column section using : formatName
    formats {
        stdDateFormatter = {
            it.format(stdDateFormat)
        }
        visualizationDateFormatter = {
            def cal = com.ibm.icu.util.Calendar.getInstance(); cal.setTime(it); cal.setTimeZone(TimeZone.getTimeZone("GMT") as com.ibm.icu.util.TimeZone); cal
        }
        stdBoolFormatter = {
            it ? "Yes" : "No"
        }
    }
}