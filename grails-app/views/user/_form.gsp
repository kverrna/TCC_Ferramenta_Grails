<%@ page import="com.springSecurity.User" %>


<!--
<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'accountExpired', 'error')} ">
	<label for="accountExpired">
		<g:message code="user.accountExpired.label" default="Account Expired" />
		
	</label>
	<g:checkBox name="accountExpired" value="${userInstance?.accountExpired}" />

</div>

-->

<!--

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'accountLocked', 'error')} ">
	<label for="accountLocked">
		<g:message code="user.accountLocked.label" default="Account Locked" />
		
	</label>
	<g:checkBox name="accountLocked" value="${userInstance?.accountLocked}" />

</div>

-->
<!--
<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="user.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${userInstance?.enabled}" />

</div>
-->

<!--
<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'passwordExpired', 'error')} ">
	<label for="passwordExpired">
		<g:message code="user.passwordExpired.label" default="Password Expired" />
		
	</label>
	<g:checkBox name="passwordExpired" value="${userInstance?.passwordExpired}" />

</div>
-->

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'username', 'error')} ">
	<label for="username">
		<g:message code="user.username.label" default="Login" />
		
	</label>
	<g:textField name="username" value="${userInstance?.username}" />

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} ">
	<label for="password">
		<g:message code="user.password.label" default="Senha" />
		
	</label>
	<g:passwordField  name="password"  value="${userInstance?.password}" />

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'profile', 'error')} ">
	<label for="profile">
		<g:message code="user.profile.label" default="Perfil" />
		
	</label>
	<g:select  name="profile" from="${['Conservador','Moderado','Corajoso']}" keys="${[2,1,0]}" value="${userInstance?.profile}" />

</div>
<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'investmentValue', 'error')} ">
	<label for="investmentValue">
		<g:message code="user.investmentValue.label" default="Valor de invertimento" />
		
	</label>
	
	<g:textField name="investmentValue" value="${userInstance?.investmentValue}" />

</div>

