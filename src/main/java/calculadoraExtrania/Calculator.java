package calculadoraExtrania;

public class Calculator{
	
	String cadena; 
	
	public Calculator(String cadena) {
			this.cadena = cadena;
	}
	
	public String operar() {
		double result = 0;
		String numberCadena = "";
		String operator = "";
		if (validarCadena()==true) {
			for (int i = 0; i<this.cadena.length(); i++) {
				if (Character.isDigit(this.cadena.charAt(i)) || cadena.charAt(i)=='.' || (cadena.charAt(i)== '-' && i==0)) {
					numberCadena+=String.valueOf(this.cadena.charAt(i));
				}
				else if (!Character.isDigit(this.cadena.charAt(i)) && operator.isEmpty()){
					result+=Double.valueOf(numberCadena);
					operator+=String.valueOf(this.cadena.charAt(i));
					numberCadena = "";
				}
				else{
					if (operator.equals("+")){
						result+=Double.valueOf(numberCadena);
					}else {
						result-=Double.valueOf(numberCadena);
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
		}
		return String.valueOf(result);
	}
	
	public String borrar() {
		return "";
	}
	
	public boolean validarCadena() {
		boolean result = true;
		for (int i = 0; i<this.cadena.length(); i++) {
			if ((this.cadena.charAt(i)== '+' && this.cadena.charAt(i+1)== '+') 
				|| (this.cadena.charAt(i)== '+' && this.cadena.charAt(i+1)== '-') 
				|| (this.cadena.charAt(i)== '-' && this.cadena.charAt(i+1)== '+') 
				|| (this.cadena.charAt(i)== '-' && this.cadena.charAt(i+1)== '-')) {
				result = false;
			}
		}
		return result;
	}
}
