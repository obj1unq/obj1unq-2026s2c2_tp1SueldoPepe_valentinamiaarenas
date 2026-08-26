object pepe {
    var categoria = gerente
    var bonoResultado = bonoNulo
    var presentismo = bonoPresentismoNulo
    var faltasActuales = 0
    
    method categoria(_categoria) {
        categoria = _categoria
    }

    method bonoResultado(_bonoResultado) {
        bonoResultado = _bonoResultado
    }

    method presentismo(_presentismo) {
        presentismo = _presentismo
    }

    method faltasActuales(_faltasActuales) {
        faltasActuales = _faltasActuales
    }

    method faltas() {
        return faltasActuales
    }

	method sueldo() {
        return categoria.sueldoNeto() + bonoResultado.bono(self) + presentismo.bonoPresentismo(self)
    }

    method sueldoNeto() {
        return categoria.sueldoNeto()
    }

    method bono() {
        return bonoResultado.bono()
    }

    method bonoPresentismo() {
        return presentismo.bonoPresentismo()
    }
}

object moria {
    var categoria = cadete
    var bonoResultado = bonoNulo

    method categoria(_categoria) {
        categoria = _categoria
    }

    method bonoResultado(_bonoResultado) {
        bonoResultado = _bonoResultado
    }

    method sueldo() {
        return self.sueldoNeto() + bonoResultado.bono(self)
    }

    method sueldoNeto() {
        return categoria.sueldoNeto() * 1.3
    }

}

object roque {
    var neto = 28000
    var bonoResultado = bonoNulo

    method sueldo() {
        return self.sueldoNeto() + bonoResultado.bono(self) + neto
    }

    method sueldoNeto() {
        return neto
    }

    method bonoResultado(_bonoResultado) {
        bonoResultado = _bonoResultado
    }

    method neto(_neto) {
        neto = _neto
    }
}

object ernesto {
    var compañero = moria
    var presentismo = normal
    
    method sueldo() {
        return self.sueldoNeto() + presentismo.bonoPresentismo(0)
    }

    method sueldoNeto() {
        return compañero.sueldoNeto()
    }

    method compañero(_compañero) {
        compañero = _compañero
    }

    method presentismo(_presentismo) {
        presentismo = _presentismo
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
    method bono(empleado) {
        return empleado.sueldoNeto() * 0.1
    }
}

object montoFijo {
    method bono(empleado) {
        return 800
    }
}

object bonoNulo {
    method bono(empleado) {
        return 0
    }
}

object normal {
    method bonoPresentismo(empleado) {
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
    method bonoPresentismo(empleado) {
        if (empleado.faltas() == 0) {
            return 100
        } else {
            return 0
        }
    }
}

object demagogico {
    method bonoPresentismo(empleado) {
        if (empleado.sueldoNeto() < 18000) {
            return 500
        } else {
            return 300
        }
    }
}

object bonoPresentismoNulo {
    method bonoPresentismo(empleado) {
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
    var categoria = ""

    method categiriaBase(_categoria) {
        categoria = _categoria
    }
    method sueldoNeto() {
        return categoria.sueldoNeto() / 2
    }
}


