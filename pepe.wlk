object pepe {
    var categoria = gerente
    var bonoPorResultados = bonoNulo
    var bonoPorPresentismo = bonoPresentismoNulo
    var faltas = 0
    
    method categoria(_categoria) {
        categoria = _categoria
    }

    method categoria() {
        return categoria
    }

    method bonoPorResultados(_bonoPorResultados) {
        bonoPorResultados = _bonoPorResultados
    }

    method bonoPorPresentismo(_bonoPorPresentismo) {
        bonoPorPresentismo = _bonoPorPresentismo
    }

    method faltas(_faltas) {
        faltas = _faltas
    }

    method faltas() {
        return faltas
    }

	method sueldo() {
        return self.sueldoNeto() + bonoPorResultados.monto(self) + bonoPorPresentismo.monto(self)
    }

    method sueldoNeto() {
        return categoria.sueldoNeto()
    }

    method bonoPorResultado() {
        return bonoPorResultados.monto()
    }

    method bonoPorPresentismo() {
        return bonoPorPresentismo.monto()
    }
}

object moria {
    var categoria = cadete
    var bonoPorResultados = bonoNulo

    method categoria(_categoria) {
        categoria = _categoria
    }

    method categoria() {
        return categoria
    }

    method bonoPorResultados(_bonoPorResultados) {
        bonoPorResultados = _bonoPorResultados
    }

    method sueldo() {
        return self.sueldoNeto() + bonoPorResultados.monto(self)
    }

    method sueldoNeto() {
        return categoria.sueldoNeto() * 1.3
    }
}

object roque {
    var neto = 28000 //Asumo que puede variar porque no se comenta que sea un neto fijo
    var bonoPorResultados = bonoNulo

    method sueldo() {
        return self.sueldoNeto() + bonoPorResultados.monto(self) + 9000
    }

    method sueldoNeto() {
        return neto
    }

    method bonoPorResultados(_bonoPorResultados) {
        bonoPorResultados = _bonoPorResultados
    }

    method bonoPorResultados() {
        return bonoPorResultados
    }

    method neto(_neto) {
        neto = _neto
    }
}

object ernesto {
    var compañero = moria
    var bonoPorPresentismo = normal
    const faltas = 0

    method sueldo() {
        return self.sueldoNeto() + bonoPorPresentismo.monto(self)
    }

    method sueldoNeto() {
        return compañero.sueldoNeto()
    }

    method compañero(_compañero) {
        compañero = _compañero
    }

    method compañero() {
        return compañero
    }

    method bonoPorPresentismo(_bonoPorPresentismo) {
        bonoPorPresentismo = _bonoPorPresentismo
    }

    method faltas() {
        return faltas
    }
}

object gerente {
    method sueldoNeto() {
        return 150000
    }
}

object cadete {
    method sueldoNeto() {
        return 20000
    }
}

object porcentaje {
    method monto(empleado) {
        return empleado.sueldoNeto() * 0.1
    }
}

object montoFijo {
    method monto(empleado) {
        return 800
    }
}

object bonoNulo {
    method monto(empleado) {
        return 0
    }
}

object normal {
    method monto(empleado) {
        if (empleado.faltas() == 0) {
            return 2000
        } else if (empleado.faltas() == 1) {
            return 1000
        } else {
            return 0
        }
    }
}

object ajuste {
    method monto(empleado) {
        if (empleado.faltas() == 0) {
            return 100
        } else {
            return 0
        }
    }
}

object demagogico {
    method monto(empleado) {
        if (empleado.sueldoNeto() < 18000) {
            return 500
        } else {
            return 300
        }
    }
}

object bonoPresentismoNulo {
    method monto(empleado) {
        return 0
    }
}

object vendedor {
    var aumentoPorVentas = false

    method sueldoNeto() {
        if(aumentoPorVentas) {
            return 16000 * 1.25
        } else {
            return 16000
        }
    }

    method activarAumentoPorVentas() {
        aumentoPorVentas = true
    }

    method desactivarAumentoPorVentas() {
        aumentoPorVentas = false
    }
}

object medioTiempo {
    var categoria = gerente

    method categoria(_categoria) { 
        categoria = _categoria
    }
    method sueldoNeto() {
        return categoria.sueldoNeto() / 2
    }
}


