<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="calculadoraExtrania.Calculator" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body align="center">
<%! 
String cadenaNumeros = "";
%>

<%
	String send = request.getParameter("send");
	String calculate = request.getParameter("calculate");
	String delete = request.getParameter("delete");
	String number = request.getParameter("number");
	String operador = request.getParameter("operator");
	
	
	Calculator c = new Calculator(cadenaNumeros);

	if (send!=null){
		cadenaNumeros+=number+operador;
	}
	if(calculate!=null){
		cadenaNumeros= c.operar();
	}
	if (delete!=null){
		cadenaNumeros= c.borrar();
	}

%>
	<form action="calculadoraExtrania.jsp" method="post">
		<h1>Calculator</h1>
	<textarea> <%= cadenaNumeros %></textarea>
		<br>
		<label>Number: <input type="number" name="number"></label>
		<br><br>
		<label>Introduce signo:</label>
		<select name="operator">
			<option value="">Sign</option>
			<option value="+">+</option>
			<option value="-">-</option>
		</select>
		<br><br>
		<input type="submit" name="send" value="Send">
		<input type="submit" name="calculate" value="Calculate">
		<input type="submit" name="delete" value="Delete">
	</form>

</body>
</html>