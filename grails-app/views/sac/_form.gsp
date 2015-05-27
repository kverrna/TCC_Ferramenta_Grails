
<%@ page import="com.Sac" %>



<table style="width:50%">
  
<div class="fieldcontain ${hasErrors(bean: sacInstance, field: 'assunto', 'error')} ">
	<td><label for="assunto">
		<g:message code="sac.assunto.label" default="Assunto" /></td>
		
	</label>
	<td>
	<g:select  name="profile" from="${['Elogio','Sugestão','Dúvida','Reclamação']}" keys="${['Elogio','Sugestão','Dúvida','Reclamação']}" value="${sacInstance?.assunto}" />
	</td>

</div>
  <tr>
   <div class="fieldcontain ${hasErrors(bean: sacInstance, field: 'email', 'error')} ">
	<td><label for="email">
		<g:message code="sac.email.label" default="Email" /></td>
		
	</label>
	<td><g:textField name="email" value="${sacInstance?.email}" /></td>

</div>
<tr>
<div class="fieldcontain ${hasErrors(bean: sacInstance, field: 'mensagem', 'error')} ">
	<td><label for="mensagem">
		<g:message code="sac.mensagem.label" default="Mensagem" />
		
	</label></td>
	<td><g:textField name="mensagem" value="${sacInstance?.mensagem}" /></td>

</div>
<tr/>



</table>

