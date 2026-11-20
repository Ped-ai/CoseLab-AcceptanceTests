Feature: Procesamiento inmediato de códigos de validación de reserva
  Como vecino consumidor
  Quiero que la generación del código QR y PIN sea instantánea
  Para evitar demoras operativas al confirmar mi pedido

  Scenario Outline: Generación de credenciales de recojo en menos de 1 segundo
    Given que el usuario ha seleccionado un lote disponible y una franja válida
    When presiona el botón "Confirmar Reserva" para "<cantidad_kg>" kg
    Then el servicio backend genera el QR y PIN en menos de "<limite_segundos>" segundo

    Examples:
      | cantidad_kg | limite_segundos |
      | 1.0         | 1.0             |
      | 5.0         | 1.0             |
