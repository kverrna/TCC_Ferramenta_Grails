
<%@ page import="com.Wallet" %>
<!DOCTYPE html>
<html>
	<head>
    <meta http-equiv="refresh" content="6">

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


<g:if test="${walletInstanceList}==null">
<h1>aoooaaaH</h1>
</g:if>
<g:else>

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
</g:else>




			<div class="pagination">
				<g:paginate total="${walletInstanceCount ?: 0}" />
			</div>
		</div>


		<div id="list-wallet" class="content scaffold-list" role="main">
        			<h1>Ativos</h1>

<g:if test="${walletInstanceList}==null">
<h1>aoooaaaH</h1>
</g:if>
<g:else>

<table border="1" style="width:50%">
<thead>
<tr>


<g:sortableColumn property="userId" title="${message(code: 'wallet.userId.label', default: 'Nome')}" />

<g:sortableColumn property="walletRisck" title="${message(code: 'wallet.walletRisck.label', default: 'Quantidade')}" />

<g:sortableColumn property="walletValue" title="${message(code: 'wallet.walletValue.label', default: 'Valor ')}" />

<g:sortableColumn property="walltetPercent" title="${message(code: 'wallet.walltetPercent.label', default: 'Sugestão')}" />

</tr>
</thead>
<tbody>
<g:each in="${stockInstanceList}" status="i" var="stockInstance">
<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

<td><g:link action="show" id="${stockInstance.id}">${fieldValue(bean: stockInstance, field: "codeName")}</g:link></td>

<td>${fieldValue(bean: stockInstance, field: "qtd")}</td>

<td>${fieldValue(bean: stockInstance, field: "currentPrice")}</td>

<td>${fieldValue(bean: stockInstance, field: "walltetPercent")}


<g:if test="${stockInstance.suggestion==20}">

<a href="${createLink(action: 'saveSuggestionApprove', controller: 'stock', params:[codeName :"${stockInstance.codeName}", userName: "${stockInstance.userId}",op:21])}" class="btn green">Comprar</a>

</g:if>

<g:if test="${stockInstance.suggestion==10}">

<a href="${createLink(action: 'saveSuggestionApprove', controller: 'stock', params:[codeName :"${stockInstance.codeName}", userName: "${stockInstance.userId}",op:10])}" class="btn red">Vender</a>


</g:if>

<g:if test="${stockInstance.suggestion==00}">


<h4 style="padding: 7px 7px;
font-size: 14px;
font-weight: 400;
text-align: center;
width:50px;
cursor: pointer;
color: #000;
background-color: #D3D3D3;"></h4>

</g:if>

</td>

</tr>
</g:each>
</tbody>
</table>

</g:else>



        		</div>


	</body>
</html>
