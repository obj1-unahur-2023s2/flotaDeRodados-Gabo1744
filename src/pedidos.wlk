import rodados.*
import wollok.game.*

class Pedido {
	var property distancia
	var property tiempoMaximo
	var property cantPasajeros
	const coloresIncompatibles = #{}
	
	method agregarColorIncompatible(color){
		coloresIncompatibles.add(color)
	}
	method esColorIncompatible(color) = coloresIncompatibles.contains(color)
	method velocidadRequerida() = distancia / tiempoMaximo
	method puedeSatisfacerPedido(unRodado){
		return (unRodado.velocidad() - self.velocidadRequerida()) >= 10 
		and unRodado.capacidad() >= cantPasajeros 
		and not coloresIncompatibles.contains(unRodado.color())
	}
	method acelerar(){
		tiempoMaximo -= 1
	}
	method relajar(){
		tiempoMaximo += 1
	}
}
