
<%@ page import="com.Stock" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'stock.label', default: 'Stock')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-stock" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-stock" class="content scaffold-show" role="main">
			<h1>"Ações na sua Carteira"</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list stock">
			
				<g:if test="${stockInstance?.avarangeReturn_15}">
				<li class="fieldcontain">
					<span id="avarangeReturn_15-label" class="property-label"><g:message code="stock.avarangeReturn_15.label" default="Avarange Return15" /></span>
					
						<span class="property-value" aria-labelledby="avarangeReturn_15-label"><g:fieldValue bean="${stockInstance}" field="avarangeReturn_15"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${stockInstance?.avarangeReturn_30}">
				<li class="fieldcontain">
					<span id="avarangeReturn_30-label" class="property-label"><g:message code="stock.avarangeReturn_30.label" default="Avarange Return30" /></span>
					
						<span class="property-value" aria-labelledby="avarangeReturn_30-label"><g:fieldValue bean="${stockInstance}" field="avarangeReturn_30"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${stockInstance?.codeName}">
				<li class="fieldcontain">
					<span id="codeName-label" class="property-label"><g:message code="stock.codeName.label" default="Code Name" /></span>
					
						<span class="property-value" aria-labelledby="codeName-label"><g:fieldValue bean="${stockInstance}" field="codeName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${stockInstance?.standardDeviation_15}">
				<li class="fieldcontain">
					<span id="standardDeviation_15-label" class="property-label"><g:message code="stock.standardDeviation_15.label" default="Standard Deviation15" /></span>
					
						<span class="property-value" aria-labelledby="standardDeviation_15-label"><g:fieldValue bean="${stockInstance}" field="standardDeviation_15"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${stockInstance?.standardDeviation_30}">
				<li class="fieldcontain">
					<span id="standardDeviation_30-label" class="property-label"><g:message code="stock.standardDeviation_30.label" default="Standard Deviation30" /></span>
					
						<span class="property-value" aria-labelledby="standardDeviation_30-label"><g:fieldValue bean="${stockInstance}" field="standardDeviation_30"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${stockInstance?.varianceCoeffientt_15}">
				<li class="fieldcontain">
					<span id="varianceCoeffientt_15-label" class="property-label"><g:message code="stock.varianceCoeffientt_15.label" default="Variance Coeffientt15" /></span>
					
						<span class="property-value" aria-labelledby="varianceCoeffientt_15-label"><g:fieldValue bean="${stockInstance}" field="varianceCoeffientt_15"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${stockInstance?.varianceCoeffientt_30}">
				<li class="fieldcontain">
					<span id="varianceCoeffientt_30-label" class="property-label"><g:message code="stock.varianceCoeffientt_30.label" default="Variance Coeffientt30" /></span>
					
						<span class="property-value" aria-labelledby="varianceCoeffientt_30-label"><g:fieldValue bean="${stockInstance}" field="varianceCoeffientt_30"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${stockInstance?.variance_15}">
				<li class="fieldcontain">
					<span id="variance_15-label" class="property-label"><g:message code="stock.variance_15.label" default="Variance15" /></span>
					
						<span class="property-value" aria-labelledby="variance_15-label"><g:fieldValue bean="${stockInstance}" field="variance_15"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${stockInstance?.variance_30}">
				<li class="fieldcontain">
					<span id="variance_30-label" class="property-label"><g:message code="stock.variance_30.label" default="Variance30" /></span>
					
						<span class="property-value" aria-labelledby="variance_30-label"><g:fieldValue bean="${stockInstance}" field="variance_30"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:stockInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${stockInstance}"><g:message code="default.button.edit.label" default="Editar" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
