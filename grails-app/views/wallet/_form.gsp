<%@ page import="com.Wallet" %>



<div class="fieldcontain ${hasErrors(bean: walletInstance, field: 'stocks', 'error')} ">
	<label for="stocks">
		<g:message code="wallet.stocks.label" default="Stocks" />
		
	</label>
	<g:select name="stocks" from="${com.Stock.list()}" multiple="multiple" optionKey="id" size="5" required="" value="${walletInstance?.stocks*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: walletInstance, field: 'userId', 'error')} ">
	<label for="userId">
		<g:message code="wallet.userId.label" default="User Id" />
		
	</label>
	<g:textField name="userId" value="${walletInstance?.userId}" />

</div>

<div class="fieldcontain ${hasErrors(bean: walletInstance, field: 'walletRisck', 'error')} ">
	<label for="walletRisck">
		<g:message code="wallet.walletRisck.label" default="Wallet Risck" />
		
	</label>
	<g:field type="number" name="walletRisck" value="${walletInstance.walletRisck}" />

</div>

<div class="fieldcontain ${hasErrors(bean: walletInstance, field: 'walletValue', 'error')} ">
	<label for="walletValue">
		<g:message code="wallet.walletValue.label" default="Wallet Value" />
		
	</label>
	<g:field type="number" name="walletValue" value="${walletInstance.walletValue}" />

</div>

<div class="fieldcontain ${hasErrors(bean: walletInstance, field: 'walltetPercent', 'error')} ">
	<label for="walltetPercent">
		<g:message code="wallet.walltetPercent.label" default="Walltet Percent" />
		
	</label>
	<g:field type="number" name="walltetPercent" value="${walletInstance.walltetPercent}" />

</div>

