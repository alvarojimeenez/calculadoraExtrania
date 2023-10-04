package calculadoraExtrania;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Calculator {
	
	String cadena; 
	
	public Calculator(String cadena) {
		this.cadena = cadena;
	}
	
	public String operar() {
		int result = 0;
		String numberCadena = "";
		String operator = "";
		
		for (int i = 0; i<this.cadena.length(); i++) {
			if (Character.isDigit(this.cadena.charAt(i))) {
				numberCadena+=String.valueOf(this.cadena.charAt(i));
			}
			
			else if (!Character.isDigit(this.cadena.charAt(i)) && operator.isEmpty()){
				result+=Integer.parseInt(numberCadena);
				operator+=String.valueOf(this.cadena.charAt(i));
				numberCadena = "";
			}
			else{
				if (operator.equals("+")){
					result+=Integer.valueOf(numberCadena);
				}else {
					result-=Integer.valueOf(numberCadena);
				}
				operator = "";
				numberCadena = "";
			}
		}
		if (operator.equals("+")){
			result+=Integer.valueOf(numberCadena);
		}else {
			result-=Integer.valueOf(numberCadena);
		}
		return String.valueOf(result);
	}
	
	public String borrar() {
		return "";
	}
	
}
