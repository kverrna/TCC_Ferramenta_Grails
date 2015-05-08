
<%@ page import="com.Wallet" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'wallet.label', default: 'Wallet')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}">Página Inicial</a></li>
				
			</ul>
		</div>
		<div id="show-wallet" class="content scaffold-show" role="main">
			<h1>Composição da sua Carteira</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list wallet">
			
				<g:if test="${walletInstance?.stocks}">
				<li class="fieldcontain">
					<span id="stocks-label" class="property-label"><g:message code="wallet.stocks.label" default="Ações" /></span>
					
						<g:each in="${walletInstance.stocks}" var="s">
						<br>
						<span class="property-value" aria-labelledby="stocks-label"><g:link controller="stock" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
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
					
					<g:actionSubmit class="edit" action="edit" value="Editar" />
					
					<g:actionSubmit class="delete" action="delete" value="Apagar" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Você tem certeza?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
