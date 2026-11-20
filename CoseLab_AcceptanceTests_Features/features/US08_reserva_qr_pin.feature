Feature: Reserva de alimentos y generación de código QR/PIN
  Como usuario de la aplicación
  Quiero reservar un lote disponible y recibir un código de validación QR y PIN
  Para asegurar mi entrega presencial sin errores ni sobre-reservas

  Scenario Outline: Reserva exitosa y generación de código único
    Given que el lote "<cultivo>" tiene un stock disponible de "<stock_inicial>" kg
    And el vecino selecciona la franja horaria "<franja>"
    When confirma la reserva de "<cantidad_reserva>" kg
    Then el sistema descuenta el inventario dejando "<stock_restante>" kg disponibles
    And genera un código QR único y un PIN de 6 dígitos con estado "Reservado"

    Examples:
      | cultivo          | stock_inicial | franja           | cantidad_reserva | stock_restante |
      | Lechuga orgánica | 15.0          | 16:00 - 17:00 PM | 2.0              | 13.0           |
      | Mandarina        | 30.0          | 17:00 - 18:00 PM | 5.0              | 25.0           |
      | Albahaca fresca  | 8.0           | 10:00 - 11:00 AM | 1.5              | 6.5            |

  Scenario: Bloqueo de reserva por stock insuficiente
    Given que el lote "Tomate italiano" cuenta con 2.0 kg disponibles
    When el usuario intenta reservar 4.0 kg del mismo lote
    Then el sistema rechaza la operación
    And muestra la alerta "Stock insuficiente. Cantidad máxima disponible: 2.0 kg"
