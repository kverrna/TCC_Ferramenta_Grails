<%@ page import="com.Stock" %>



<div class="fieldcontain ${hasErrors(bean: stockInstance, field: 'avarangeReturn_15', 'error')} ">
	<label for="avarangeReturn_15">
		<g:message code="stock.avarangeReturn_15.label" default="Avarange Return15" />
		
	</label>
	<g:field type="number" name="avarangeReturn_15" value="${stockInstance.avarangeReturn_15}" />

</div>

<div class="fieldcontain ${hasErrors(bean: stockInstance, field: 'avarangeReturn_30', 'error')} ">
	<label for="avarangeReturn_30">
		<g:message code="stock.avarangeReturn_30.label" default="Avarange Return30" />
		
	</label>
	<g:field type="number" name="avarangeReturn_30" value="${stockInstance.avarangeReturn_30}" />

</div>

<div class="fieldcontain ${hasErrors(bean: stockInstance, field: 'codeName', 'error')} ">
	<label for="codeName">
		<g:message code="stock.codeName.label" default="Code Name" />
		
	</label>
	<g:textField name="codeName" value="${stockInstance?.codeName}" />

</div>

<div class="fieldcontain ${hasErrors(bean: stockInstance, field: 'standardDeviation_15', 'error')} ">
	<label for="standardDeviation_15">
		<g:message code="stock.standardDeviation_15.label" default="Standard Deviation15" />
		
	</label>
	<g:field type="number" name="standardDeviation_15" value="${stockInstance.standardDeviation_15}" />

</div>

<div class="fieldcontain ${hasErrors(bean: stockInstance, field: 'standardDeviation_30', 'error')} ">
	<label for="standardDeviation_30">
		<g:message code="stock.standardDeviation_30.label" default="Standard Deviation30" />
		
	</label>
	<g:field type="number" name="standardDeviation_30" value="${stockInstance.standardDeviation_30}" />

</div>

<div class="fieldcontain ${hasErrors(bean: stockInstance, field: 'varianceCoeffientt_15', 'error')} ">
	<label for="varianceCoeffientt_15">
		<g:message code="stock.varianceCoeffientt_15.label" default="Variance Coeffientt15" />
		
	</label>
	<g:field type="number" name="varianceCoeffientt_15" value="${stockInstance.varianceCoeffientt_15}" />

</div>

<div class="fieldcontain ${hasErrors(bean: stockInstance, field: 'varianceCoeffientt_30', 'error')} ">
	<label for="varianceCoeffientt_30">
		<g:message code="stock.varianceCoeffientt_30.label" default="Variance Coeffientt30" />
		
	</label>
	<g:field type="number" name="varianceCoeffientt_30" value="${stockInstance.varianceCoeffientt_30}" />

</div>

<div class="fieldcontain ${hasErrors(bean: stockInstance, field: 'variance_15', 'error')} ">
	<label for="variance_15">
		<g:message code="stock.variance_15.label" default="Variance15" />
		
	</label>
	<g:field type="number" name="variance_15" value="${stockInstance.variance_15}" />

</div>

<div class="fieldcontain ${hasErrors(bean: stockInstance, field: 'variance_30', 'error')} ">
	<label for="variance_30">
		<g:message code="stock.variance_30.label" default="Variance30" />
		
	</label>
	<g:field type="number" name="variance_30" value="${stockInstance.variance_30}" />

</div>

