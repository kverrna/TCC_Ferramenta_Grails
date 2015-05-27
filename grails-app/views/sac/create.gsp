
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'sac.label', default: 'Sac')}" />
		<center><title>Dúvidas,sugestões e Reclamações</title></center>
	</head>
	<body>
		
		<div id="create-sac" class="content scaffold-create" role="main">
			<center><h1>Dúvidas,sugestões e Reclamações</h1></center>
			<br>
			<br>
			<br>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${sacInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${sacInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:sacInstance, action:'save']" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="Enviar" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

