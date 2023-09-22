import rodados.*
import pedidos.*
import wollok.game.*

class Dependencia{
	const empleados = 0
	const flotaDeRodados = []
	const registroDePedidos = []
	
	method agregarPedido(pedido){
		registroDePedidos.add(pedido)
	}
	method quitarPedido(pedido){
		registroDePedidos.remove(pedido)
	}
	method cantDePasajerosDePedidos(){
		return registroDePedidos.sum({p => p.cantPasajeros()})
	}
	method rodadosQueNoSatisfacenLosPedidos(){
		return flotaDeRodados.filter({r => registroDePedidos.all({p => not p.puedeSatisfacerPedido(r)})})
	}
	method esColorIncompatibleEnTodosLosPedidos(color){
		return registroDePedidos.all({p => p.esColorIncompatible(color)})
	}
	method relajarPedidos(){
		registroDePedidos.forEach({p => p.relajar()})
	}
	
	method agregarAFlota(rodado){
		flotaDeRodados.add(rodado)
	}
	method quitarDeFlota(rodado){
		flotaDeRodados.remove(rodado)
	}
	method pesoTotalFlota() = flotaDeRodados.sum({f => f.peso() })
	method cantidadDeRodados() = flotaDeRodados.size()
	method todosSuperanXVelocidad(velocidad) = flotaDeRodados.all({f => f.velocidad() >= velocidad})
	method estaBienEquipada(){
		return self.cantidadDeRodados() >= 3 and self.todosSuperanXVelocidad(100)
	}
	method capacidadTotalEnColor(color){
		return flotaDeRodados.filter({f => f.color() == color}).sum({f => f.capacidad()})
	}
	method rodadoMasRapido(){
		if (flotaDeRodados.isEmpty()){
			self.error("No se puede calcular el maximo")
		}
		return flotaDeRodados.max({f => f.velocidad()})
	}
	method colorDelRodadoMasRapido(){
		return self.rodadoMasRapido().color()
	}
	method capacidadTotalRodados(){
		return flotaDeRodados.sum({f => f.capacidad()})
	}
	method capacidadFaltante(){
		return 0.max(empleados - self.capacidadTotalRodados())
	}
	method esGrande() = empleados >= 40 and self.cantidadDeRodados() >= 5
}
