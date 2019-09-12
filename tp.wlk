
object puenteDeBrooklyn{
	method criterio(persona){
		return persona.pesoDelPaquete() <= 1000
	}	
}
object laMatrix{
	method criterio(persona){
		return persona.puedeLlamar()
	}
}
///////////////////////////////////lugares
object veladores{
	const pesoPropio = 20
	var pago = true
	method pesoPropio(){
		return pesoPropio
	}
	method pagoOno(){
		return pago
	}
	method puedeLlevar(persona,destino){
		return pago && persona.puedePasar(destino)
	}		
}

object paquetito{
	const pesoPropio = 0
	var pago = true
	method pagoOno(){
		return pago
	}
	method puedeLlevar(persona,destino){
		return true
	}	
} 
object paquetitoViajero{
	var lugares = [laMatrix,puenteDeBrooklyn]
	var precioPorLugar = 100
	var pago = true
	var precio = precioPorLugar * lugares.size()
	method pagoOno(){
		return pago
	}
	
}
 
/////////////////////////////////paquetes
object camion{ 
	var pesoPropio = 700
	var acoplados = 0
	method pesoPaquete(persona){
		return pesoPropio + (acoplados * 500) + persona.peso()
	}
}
object bici{
	method pesoPaquete(persona){
		return persona.peso() + 1
	}
}
///////////////////////////////transportes



object roberto{
	var pesoPropio = 70
	var transporte = camion
	var patrimonio = 0
	method peso(){
		return pesoPropio 
	}
	method pesoDelPaquete(){
		return transporte.pesoPaquete(self)
	}
	method puedePasar(destino){
		return destino.criterio(self)
	}

	method puedeLlamar(){
		return false
	} 	
}




object chuckNorris{
	const pesoPropio = 900
	var patrimonio = 500
	method pesoPropio(){
		return pesoPropio 
	}
	
	method puedeLlamar(){
		return true
	}
	method puedePasar(destino){
		return destino.criterio(self)
	}
	method pesoDelPaquete(paquete){
		return pesoPropio + paquete.pesoPropio()
	}
}
object neo{
	const pesoPropio = 0
	var patrimonio = 200
	method peso(){
		return pesoPropio 
	}
	method pesoDelPaquete(paquete){
		return pesoPropio + paquete.pesoPropio()
	}
	method puedeLlamar(){
		return patrimonio > 100
	}
}
//////////////////////////////////empleados
object fedEx {
	var empleados = [roberto,chuckNorris]
	 method empleados(){
	 	return empleados
	 }
	method contratarEmpleado(empleado){
		 empleados.add(empleado)
	}
	method despedirEmpleado(empleado){
		return empleados.remove(empleado)
	}
	method recorteDePresupuesto(){
		empleados.clear()
	}
	method mensajeriaGrandeOno(){
		return empleados.size() > 2
	}
	method puedeElPrimero(paquete,destino){
		return paquete.puedeLlevar(empleados.head(),destino)
	}
	method pesoDelUltimo(){
		return empleados.last().pesoPropio()
	}
}
///////////////////////////////empresas
