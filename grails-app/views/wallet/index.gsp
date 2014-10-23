
<%@ page import="com.Wallet" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'wallet.label', default: 'Wallet')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}">Doar Dinheiro para o Ramon</a></li>
				
			</ul>
		</div>
		<div id="list-wallet" class="content scaffold-list" role="main">
			<h1>Carteira</h1>
			<g:if test="${flash.message}">

				<div class="message" role="status">${flash.message}</div>
			</g:if>

			
			<table border="1" style="width:50%">
			<thead>
					<tr>
					

						<g:sortableColumn property="userId" title="${message(code: 'wallet.userId.label', default: 'Carteira')}" />
					
						<g:sortableColumn property="walletRisck" title="${message(code: 'wallet.walletRisck.label', default: 'Risco')}" />
					
						<g:sortableColumn property="walletValue" title="${message(code: 'wallet.walletValue.label', default: 'Valor ')}" />
					
						<g:sortableColumn property="walltetPercent" title="${message(code: 'wallet.walltetPercent.label', default: 'Percentual de Lucro/Prejuizo')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${walletInstanceList}" status="i" var="walletInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${walletInstance.id}">${fieldValue(bean: walletInstance, field: "userId")}</g:link></td>
					
						<td>${fieldValue(bean: walletInstance, field: "walletRisck")}</td>
					
						<td>${fieldValue(bean: walletInstance, field: "walletValue")}</td>
					
						<td>${fieldValue(bean: walletInstance, field: "walltetPercent")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${walletInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
