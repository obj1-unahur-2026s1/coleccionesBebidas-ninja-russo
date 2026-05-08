object whisky {
  method rendimientoQueOtorga(dosisConsumida) = 0.9 ** dosisConsumida
}

object terere {
  method rendimientoQueOtorga(dosisConsumida) = 1.max(0.1 * dosisConsumida)
}

object cianuro {
  method rendimientoQueOtorga(dosisConsumida) = 0
}

object licuado {
  const nutrientes = []

  method rendimientoQueOtorga(dosisConsumida) = (0.001 * dosisConsumida) * nutrientes.sum()
  
  method agregarIngrediente(ingrediente) = {nutrientes.add(ingrediente.nutriente())}
}

object aguaSaborizada {
  var property bebidaAdicional = whisky

  method rendimientoQueOtorga(dosisConsumida) = { 1 + bebidaAdicional.rendimientoQueOtorga(dosisConsumida * 0.25)}
}

object coctel {
  const bebidas = []

  method rendimientoQueOtorga(dosisConsumida) = {bebidas.fold(1, {acum, b => acum * b.rendimientoQueOtorga(dosisConsumida)})}

  method agregarBebida(bebida) = bebidas.add(bebida)
}