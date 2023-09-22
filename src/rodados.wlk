import wollok.game.*

class Corsa{
	var property color
	var property position = game.at(0,0)
	
	method capacidad() = 4
	method velocidad() = 150
	method peso() = 1300
}

class Kwid{
	var property tieneTanqueAdicional
	
	method capacidad() = if(tieneTanqueAdicional){3}else{4}
	method velocidad() = if(tieneTanqueAdicional){120}else{110}
	method peso() = if(tieneTanqueAdicional){1350}else{1200}
	method color() = "azul"
}

object trafic{
	var interior
	var motor
	
	method asignarInteriorYMotor(unInterior,unMotor){
		interior = unInterior
		motor = unMotor
	}
	method capacidad() = interior.capacidad()
	method velocidad() = motor.velocidad()
	method peso() = 4000 + interior.peso() + motor.peso()
	method color() = "blanco"
}

object comodo{
	method capacidad() = 5
	method peso() = 700
}
object popular{
	method capacidad() = 12
	method peso() = 1000
}
object pulenta{
	method velocidad() = 130
	method peso() = 800
}
object bataton{
	method velocidad() = 80
	method peso() = 500
}

class AutoEspecial{
	var property capacidad
	var property velocidad
	var property peso
	var property color
}