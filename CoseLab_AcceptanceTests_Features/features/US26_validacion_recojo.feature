Feature: Validación de recojo presencial mediante código QR o PIN
  Como administrador de huerto
  Quiero escanear el código QR o ingresar el PIN del comprador al momento de la entrega
  Para validar el recojo presencial y cerrar la reserva en tiempo real

  Scenario Outline: Validación exitosa de entrega en el huerto
    Given que existe una reserva activa con identificador "<codigo>" en estado "Reservado"
    When el administrador valida el recojo mediante "<metodo>" en la aplicación
    Then el sistema actualiza el estado de la reserva a "Completado"
    And registra la hora exacta de entrega en el historial del huerto

    Examples:
      | codigo     | metodo         |
      | QR-88412   | Escaneo QR     |
      | PIN-492018 | Ingreso manual |

  Scenario Outline: Rechazo de código inválido o previamente utilizado
    Given que el administrador se encuentra en la pantalla de validación de entregas
    When ingresa el código "<codigo_invalido>" cuyo estado es "<estado_actual>"
    Then el sistema bloquea la entrega
    And muestra la alerta "<mensaje_error>"

    Examples:
      | codigo_invalido | estado_actual | mensaje_error                              |
      | PIN-492018      | Completado    | Este código ya fue utilizado anteriormente |
      | PIN-000000      | Inexistente   | Código de reserva inválido o no encontrado |
