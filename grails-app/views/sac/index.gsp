
<%@ page import="com.Sac" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'sac.label', default: 'Sac')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-sac" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-sac" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="assunto" title="${message(code: 'sac.assunto.label', default: 'Assunto')}" />
					
						<g:sortableColumn property="email" title="${message(code: 'sac.email.label', default: 'Email')}" />
					
						<g:sortableColumn property="mensagem" title="${message(code: 'sac.mensagem.label', default: 'Mensagem')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${sacInstanceList}" status="i" var="sacInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${sacInstance.id}">${fieldValue(bean: sacInstance, field: "assunto")}</g:link></td>
					
						<td>${fieldValue(bean: sacInstance, field: "email")}</td>
					
						<td>${fieldValue(bean: sacInstance, field: "mensagem")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${sacInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
