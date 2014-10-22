
<%@ page import="com.Wallet" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'wallet.label', default: 'Wallet')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-wallet" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-wallet" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list wallet">
			
				<g:if test="${walletInstance?.stocks}">
				<li class="fieldcontain">
					<span id="stocks-label" class="property-label"><g:message code="wallet.stocks.label" default="Stocks" /></span>
					
						<g:each in="${walletInstance.stocks}" var="s">
						<span class="property-value" aria-labelledby="stocks-label"><g:link controller="stock" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${walletInstance?.userId}">
				<li class="fieldcontain">
					<span id="userId-label" class="property-label"><g:message code="wallet.userId.label" default="User Id" /></span>
					
						<span class="property-value" aria-labelledby="userId-label"><g:fieldValue bean="${walletInstance}" field="userId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${walletInstance?.walletRisck}">
				<li class="fieldcontain">
					<span id="walletRisck-label" class="property-label"><g:message code="wallet.walletRisck.label" default="Wallet Risck" /></span>
					
						<span class="property-value" aria-labelledby="walletRisck-label"><g:fieldValue bean="${walletInstance}" field="walletRisck"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${walletInstance?.walletValue}">
				<li class="fieldcontain">
					<span id="walletValue-label" class="property-label"><g:message code="wallet.walletValue.label" default="Wallet Value" /></span>
					
						<span class="property-value" aria-labelledby="walletValue-label"><g:fieldValue bean="${walletInstance}" field="walletValue"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${walletInstance?.walltetPercent}">
				<li class="fieldcontain">
					<span id="walltetPercent-label" class="property-label"><g:message code="wallet.walltetPercent.label" default="Walltet Percent" /></span>
					
						<span class="property-value" aria-labelledby="walltetPercent-label"><g:fieldValue bean="${walletInstance}" field="walltetPercent"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:walletInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${walletInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
