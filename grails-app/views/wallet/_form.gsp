<%@ page import="com.Wallet" %>



<div class="fieldcontain ${hasErrors(bean: walletInstance, field: 'stocks', 'error')} ">
	<label for="stocks">
		<g:message code="wallet.stocks.label" default="Ações Sugeridas" />
		
	</label>
	<br>
	
	<g:select name="stocks" from="${listStocks}" multiple="multiple" optionKey="id" size="5" required="" value="${walletInstance?.stocks*.id}" class="many-to-many"/>
	<br>
	<br>
	<br>

</div>


