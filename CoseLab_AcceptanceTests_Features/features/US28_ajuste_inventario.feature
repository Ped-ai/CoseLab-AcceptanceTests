Feature: Ajuste manual y actualización de inventario
  Como administrador de huerto
  Quiero modificar o pausar el stock de un lote publicado ante imprevistos agrícolas
  Para evitar sobre-reservas de productos no disponibles

  Scenario Outline: Reducción de stock disponible por merma imprevista
    Given que existe un lote activo de "Tomate cherry" con stock actual de "<stock_inicial>" kg
    When el administrador reduce el stock disponible en "<merma_kg>" kg por deterioro térmico
    Then el sistema actualiza el inventario público a "<stock_final>" kg inmediatamente

    Examples:
      | stock_inicial | merma_kg | stock_final |
      | 25.0          | 5.0      | 20.0        |
      | 12.5          | 2.5      | 10.0        |

  Scenario: Pausa temporal de un lote publicado
    Given que el huerto tiene un lote activo en horario de atención
    When el administrador activa la opción "Pausar Lote"
    Then el lote cambia a estado "Pausado" y deja de recibir nuevas reservas en el catálogo
