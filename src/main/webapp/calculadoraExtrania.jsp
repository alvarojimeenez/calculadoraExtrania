<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="calculadoraExtrania.Calculator" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/estilos.css" type="text/css">
</head>
<body align="center">
<%! 
String cadenaNumeros = "";
String almacenarResultado = "";
%>

<%
	String send = request.getParameter("send");
	String calculate = request.getParameter("calculate");
	String delete = request.getParameter("delete");
	String number = request.getParameter("number");
	String operador = request.getParameter("operator");
	
	Calculator c = new Calculator(cadenaNumeros);
	if (send!=null){
		if (almacenarResultado.isEmpty()){
		cadenaNumeros+=number+operador;
		}else{
		cadenaNumeros = almacenarResultado;
		cadenaNumeros+=number+operador;
		almacenarResultado ="";
		};
	}
	if(calculate!=null){
		if (cadenaNumeros!=null && c.validarCadena()==true && !cadenaNumeros.isEmpty()){
			almacenarResultado = c.operar();
			cadenaNumeros= cadenaNumeros+"=" + almacenarResultado;		
		}else {
			cadenaNumeros = "Error";
			almacenarResultado = "";
		}
	}
	if (delete!=null){
		cadenaNumeros= c.borrar();
	}
	


%>
	<form action="calculadoraExtrania.jsp" method="post">
		<h1>Calculator</h1>
		<input class="resultado" value="<%= cadenaNumeros %>"></input>
		<br><br><br>
		<label>Number: <input type="number" step="any" name="number"></label>
		<br><br>
		<label class="signo">Sign:</label>
		<select name="operator">
			<option value=""></option>
			<option value="+">+</option>
			<option value="-">-</option>
		</select>
		<br><br>
		<input type="submit" name="send" value="Send">
		<input type="submit" name="calculate" value="Calculate">
		<input type="submit" name="delete" value="Delete">
		<br><br>
	</form>

</body>
</html>