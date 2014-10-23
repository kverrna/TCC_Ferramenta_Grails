<%@ page import="com.Wallet" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'wallet.label', default: 'Wallet')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}">Página inicial</a></li>
				
				
			</ul>
		</div>
		<div id="edit-wallet" class="content scaffold-edit" role="main">
			<h1>Editar Carteira</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${walletInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${walletInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:walletInstance, action:'update']" method="PUT" >
				<g:hiddenField name="version" value="${walletInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="Salvar"/>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
