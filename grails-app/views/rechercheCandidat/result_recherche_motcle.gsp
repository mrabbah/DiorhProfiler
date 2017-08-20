
<%@ page import="org.springframework.util.ClassUtils" %>
<%@ page import="grails.plugin.searchable.internal.lucene.LuceneUtils" %>
<%@ page import="grails.plugin.searchable.internal.util.StringQueryUtils" %>

<!DOCTYPE html>
<html>

  <head>
    <meta name="layout" content="globallayout" />
    <title>Résultat recherche CV</title>
    <style type="text/css">
      * {
        font-family: Arial, sans-serif;
        padding: 0;
        margin: 0;
      }

      body {
        font-size: 0.9em;
        padding: .5em;
      }

      #header form input {
        padding: .1em;
      }

      #header .hint {
        color: gray;
      }

      #header h1 a {
        text-decoration: none;
        font-family: Georgia, serif;
        color: dimgray;
      }

      #header h1 {
        letter-spacing: -0.1em;
        float: left;
      }

      #header h1 span {
        font-family: Georgia, serif;
        color: #424242;
      }

      #header form {
        margin-left: 22em;
        padding-top: .1em;
      }

      .title {
        margin: 1em 0;
        padding: .3em .5em;
        text-align: right;
        background-color: seashell;
        border-top: 1px solid lightblue;
      }

      .result {
        margin-bottom: 1em;
      }

      .result .displayLink {
        color: green;
      }

      .result .name {
        font-size: larger;
      }

      .paging a.step {
        padding: 0 .3em;
      }

      .paging span.currentStep {
        font-weight: bold;
      }

      ul {
        margin: 1em 2em;
      }

      li, p {
        margin-bottom: 1em;
      }
    </style>
    <script type="text/javascript">
        var focusQueryInput = function() {
            document.getElementById("motCle").focus();
        }
    </script>

  </head>

  <body onload="focusQueryInput();">
  <g:if test="${!layout_nosecondarymenu}">
    <g:render template="submenubar"/>														
  </g:if>
  <div id="header">
    Mot clé :
    <g:form url='[controller: "rechercheCandidat", action: "create"]' id="searchableForm" name="searchableForm" method="get">
      <g:textField name="motCle" value="${params.motCle}" size="50"/> <input type="submit" value="Lancer une nouvelle recherche" />
    </g:form>
    <div style="clear: both; display: none;" class="hint"> <a href="http://lucene.apache.org/core/2_9_4/queryparsersyntax.html">Aide sur la syntaxe de recherche</a></div>
  </div>
  <div id="main">
    <g:set var="haveQuery" value="${params.motCle?.trim()}" />
    <g:set var="haveResults" value="${searchResult?.results}" />
    <div class="title">
      <span>
        <g:if test="${haveQuery && haveResults}">
          Consultation <strong>${searchResult.offset + 1}</strong> - <strong>${searchResult.results.size() + searchResult.offset}</strong> de <strong>${searchResult.total}</strong>
          résultat pour l'expression : <strong>${params.motCle}</strong>
        </g:if>
        <g:else>
          &nbsp;
        </g:else>
      </span>
    </div>

    <g:if test="${haveQuery && !haveResults && !parseException}">
      <p>Désolé aucun résultat trouvé - <strong>${params.motCle}</strong></p>
      <g:if test="${!searchResult?.suggestedQuery}">
        <p>Suggestions:</p>
        <ul>
          <li>Testez la requête suivante: <g:link controller="rechercheCandidat" action="list" params="[motCle: params.motCle, suggestQuery: true]">Recherchez avec le mot clé suivant</g:link><br />          
          </li>
        </ul>
      </g:if>
    </g:if>

    <g:if test="${searchResult?.suggestedQuery}">
      <p>Voulez vous dire? <g:link controller="rechercheCandidat" action="list" params="[motCle: searchResult.suggestedQuery]">${StringQueryUtils.highlightTermDiffs(params.motCle.trim(), searchResult.suggestedQuery)}</g:link>?</p>
    </g:if>

    <g:if test="${parseException}">
      <p>Votre recherche - <strong>${params.motCle}</strong> - est invalide.</p>
      <p>Suggestions:</p>
      <ul>
        <li>Fixez votre requête: voir <a href="http://lucene.apache.org/core/2_9_4/queryparsersyntax.html">Lucene query syntax</a> pour plus d'exemple</li>
        <g:if test="${LuceneUtils.motCleueryHasSpecialCharacters(params.motCle)}">
          <li>Remove special characters like <strong>" - [ ]</strong>, before searching, eg, <em><strong>${LuceneUtils.cleanQuery(params.motCle)}</strong></em><br />            
          </li>
          <li>Escape special characters like <strong>" - [ ]</strong> with <strong>\</strong>, eg, <em><strong>${LuceneUtils.escapeQuery(params.motCle)}</strong></em><br />
          </li>
        </g:if>
      </ul>
    </g:if>

    <g:if test="${haveResults}">
      <div class="results">
        <g:each var="result" in="${searchResult.results}" status="index">
          <div class="result">
            <g:set var="className" value="${ClassUtils.getShortName(result.getClass())}" />
            <g:set var="link" value="${createLink(controller: className[0].toLowerCase() + className[1..-1], action: 'show', id: result.id)}" />
            <g:if test="${className == 'Attachment'}">
              <div class="name"><a href="${createLink(controller: 'rechercheCandidat', action: 'download', id: result.id)}">${className} #${result.id}</a></div>
            </g:if>
            <g:else>
              <div class="name"><a href="${link}">${className} #${result.id}</a></div>
            </g:else>

            <g:set var="desc" value="${result.toString()}" />
            <g:if test="${desc.size() > 120}"><g:set var="desc" value="${desc[0..120] + '...'}" /></g:if>
            <div class="desc">${desc.encodeAsHTML()}</div>
            <div class="displayLink">${link}</div>
          </div>
        </g:each>
      </div>

      <div>
        <div class="paging">
          <g:if test="${haveResults}">
            Page:
            <g:set var="totalPages" value="${Math.ceil(searchResult.total / searchResult.max)}" />
            <g:if test="${totalPages == 1}"><span class="currentStep">1</span></g:if>
            <g:else><g:paginate controller="rechercheCandidat" action="list" params="[motCle: params.motCle]" total="${searchResult.total}" prev="&lt; précédent" next="suivant &gt;"/></g:else>
          </g:if>
        </div>
      </div>
    </g:if>
  </div>
</body>

</html>

