
<%@ page import="com.About" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'about.label', default: 'About')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>

	<body>
		<b><center><h1>Sobre<h1></center></b>
		<br>
		<br>
		<br>
		
		<div id="introducao">
		<font size="4"> 
		
		Esta ferramenta de apoio a estratégias financeiras é resultado do Trabalho de Conclusão de Curso de Engenharia de Software da Universidade de Brasília. A ferramenta seleciona Ações de acordo com o perfil escolhido por você, sendo eles: Conservador; Moderado ou Corajoso. 
		<p><br>No perfil Conservador, são selecionadas Ações que representam riscos menores segundo os critérios estatísticos adotados. Neste perfil são utlizadas ainda estratégias consideradas conservadoras no ponto de vista da análise técnica de bolsa de valores. 
		<p><br>No Perfil Moderado, são selecionadas Ações cujo o risco é considerado mediano segundo os critérios da ferramenta. São utilizadas ainda estratégias equivalentes. 
		<p><br>No perfil Corajoso, são selecionadas Ações cujo os riscos são considerados altos segundo os critérios da ferramenta. São utilizadas, também, estratégias financeiras consideradas mais arriscadas. Caso você tenha alguma sugestão ou reclamação acerta dos perfis disponíveis nesta ferramenta envie uma mensagem para nós clicando <g:link controller="sac" action="create">Aqui!</g:link>
		</font>
		</div>

		<br>
		<br>
		<br>

		<div id="Estrategias">
		<b><center><h1>Estratégias adotadas<h1></center></b>
		<h2>Médias Móveis</h2>
		<font size="4"> 
		<p><br>Para os perfis Conservador e Moderado, a ferramenta utiliza estratégias baseadas em Médias Móveis simples e Exponenciais. Médias móveis são médias de preços que se deslocam no tempo, ou seja, para um novo valor de entrada, há a saída de um valor antigo do cálculo. Com as médias móveis é possível suavizar a movimentação do mercado e, dessa forma, identificar tendências. Ao se calcular uma média móvel, é escolhido primeiro qual a quantidade de valores que será utilizado no cálculo. Se utilizamos 5 valores, tem-se, então, uma média de 5 períodos, e assim por diante. Depois, define-se o tipo da média móvel. No caso desse estudo, serão as médias móveis simples e exponenciais.
		<br>
		<br>
		A média móvel simples é uma média com tempo de reação mais lento dentre as médias. Ela é bastante utilizada para identificar tendências de alta ou de baixa no Mercado Financeiro. Quanto maior a sua periodicidade, mais lenta ela será. Médias de alta periodicidade, normalmente, são utilizadas em estratégias de longo prazo.
		<br>
		<br>
		A Média Móvel Exponencial é mais ágil em relação à média simples. Ela confere peso maior aos valores mais recentes, e com isso se torna uma média mais sensível às oscilações do Mercado Financeiro.
		<br>
		<br>
		 Em estratégias baseadas em médias móveis é verificada o cruzamento destas médias onde no cruzamento da média de menor periodicidade com a maior, de baixo para cima, serão feitas ordens de compra de ações. Já no cruzamento inverso, serão feitas vendas. Esta ferramenta utiliza as periodicidades 13,21 e 34, como mostrado na figura abaixo.

		<br>
		<br>
		<center><g:img dir="images" file="mediasMoveis.png" width="800" height="400"/></center>

		</p>
		</font>
		<br>
		<br>
		<h2>CandleSticks</h2>
		<br>
		<br>
		<font size="4"> 
		<p>
			Esta estratégia foi elaborada com base no uso do gráfico de candlesticks e consiste na utilização de três padrões de formação de candlesticks. Nessa última, quando identificada a formação no gráfico da ação, é feita uma operação de compra ou de venda. A Figura abaixo apresenta estes três padrões, que são adotadas nesta ferramenta.
			<br>
			<br>
			
			<center><g:img dir="images" file="candles.png" width="800" height="400"/></center>
			
			<br>
			<br>
			O padrão de formação Darkcloud é composto por duas candlesticks, a primeira de alta, em branco, e a segunda de baixa, em vermelho. Elas são precedidas de uma tendência de alta confirmada da ação. A segunda candlestick tem valor de abertura superior ao valor de fechamento da primeira, e tem valor de fechamento superior ao valor de abertura da primeira candlestick. Este padrão de formação indica reversão da tendência de alta para baixa. Tal fato será utilizado para sinalizar oportunidades de venda de ações.
			<br>
			<br>
			O padrão de formação BearishEngulfing, assim como o Darkcloud, sinaliza a reversão de um tendência de alta de uma ação. No entanto, este padrão difere-se por sua segunda candlestick ter valor de fechamento inferior ao valor de abertura da primeira.
			<br>
			<br>
			O padrão de formação BullishEngulfing é um padrão de reversão de tendência similar ao BearishEngulfing. Este padrão é precedido de uma tendência de baixa, e sinaliza oportunidade de compra de ações. É composto por duas candlesticks, a primeira de baixa fecha de acordo com a tendência (i.e. uma candlestick de baixa). A segunda tem seu valor de abertura inferior ao valor de fechamento da primeira, e seu valor de fechamento maior do que o valor de abertura da primeira.
			<br>
			<br>

		</p>
		</font>
		</div>
		
	</body>
</html>
