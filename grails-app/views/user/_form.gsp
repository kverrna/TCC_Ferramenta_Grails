<%@ page import="com.springSecurity.User" %>


<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'username', 'error')} ">
	<label for="username">
		<g:message code="user.username.label" default="Usuário " />
		
	</label>
	
	<br>
	<g:textField name="username" value="${userInstance?.username}" />

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} ">
	<label for="password">
		<g:message code="user.password.label" default="Senha " />
		
	</label>
	
	<br>
	<g:passwordField name="password" value="${userInstance?.password}" />

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'profile', 'error')} ">
	<label for="profile">
		<g:message code="user.profile.label" default="Perfil" />
		
	</label>
	
	<br>
	<g:select  name="profile" from="${['Conservador','Moderado','Corajoso']}" keys="${[2,1,0]}" value="${userInstance?.profile}" />

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'investmentValue', 'error')} ">
	<label for="investmentValue">
		<g:message code="user.investmentValue.label" default="Valor de investimento" />
		
	</label>
	<br>
	<g:field type="number" name="investmentValue" value="${userInstance.investmentValue}" />

</div>
<br>
<br>



