
<%@ page import="com.Stock" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'stock.label', default: 'Stock')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-stock" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-stock" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="avarangeReturn_15" title="${message(code: 'stock.avarangeReturn_15.label', default: 'Avarange Return15')}" />
					
						<g:sortableColumn property="avarangeReturn_30" title="${message(code: 'stock.avarangeReturn_30.label', default: 'Avarange Return30')}" />
					
						<g:sortableColumn property="codeName" title="${message(code: 'stock.codeName.label', default: 'Code Name')}" />
					
						<g:sortableColumn property="standardDeviation_15" title="${message(code: 'stock.standardDeviation_15.label', default: 'Standard Deviation15')}" />
					
						<g:sortableColumn property="standardDeviation_30" title="${message(code: 'stock.standardDeviation_30.label', default: 'Standard Deviation30')}" />
					
						<g:sortableColumn property="varianceCoeffientt_15" title="${message(code: 'stock.varianceCoeffientt_15.label', default: 'Variance Coeffientt15')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${stockInstanceList}" status="i" var="stockInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${stockInstance.id}">${fieldValue(bean: stockInstance, field: "avarangeReturn_15")}</g:link></td>
					
						<td>${fieldValue(bean: stockInstance, field: "avarangeReturn_30")}</td>
					
						<td>${fieldValue(bean: stockInstance, field: "codeName")}</td>
					
						<td>${fieldValue(bean: stockInstance, field: "standardDeviation_15")}</td>
					
						<td>${fieldValue(bean: stockInstance, field: "standardDeviation_30")}</td>
					
						<td>${fieldValue(bean: stockInstance, field: "varianceCoeffientt_15")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${stockInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
