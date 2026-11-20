Feature: Publicación de excedentes de cosecha
  Como administrador de huerto urbano
  Quiero registrar lotes de excedentes indicando cultivo, cantidad en kg y estado de madurez
  Para publicar la oferta disponible y evitar el desperdicio de alimentos

  Scenario Outline: Registro exitoso de lote de excedentes
    Given que el administrador del huerto "Biohuerto San Miguel" ha iniciado sesión
    And se encuentra en el formulario "Publicar nuevo lote"
    When ingresa el cultivo "<cultivo>", la cantidad "<cantidad_kg>" kg, el nivel de madurez "<madurez>" y destino "<destino>"
    And confirma la publicación del lote
    Then el sistema registra el lote con estado "Activo"
    And muestra la oferta en el catálogo local con "<cantidad_kg>" kg disponibles

    Examples:
      | cultivo          | cantidad_kg | madurez     | destino         |
      | Lechuga orgánica | 15.5        | Fresco      | Consumo directo |
      | Tomate italiano  | 20.0        | Maduro      | Conservas       |
      | Hojas de acelga  | 12.0        | Sobremaduro | Compostaje      |

  Scenario Outline: Rechazo de publicación por cantidad inválida
    Given que el administrador del huerto ha iniciado sesión en el panel de gestión
    When intenta registrar el cultivo "<cultivo>" con una cantidad inválida de "<cantidad_invalida>" kg
    Then el sistema impide la publicación del lote
    And muestra el mensaje de validación "<mensaje_error>"


    Examples:
      | cultivo   | cantidad_invalida | mensaje_error                               |
      | Albahaca  | 0                 | La cantidad debe ser mayor a 0 kg           |
      | Zanahoria | -5                | No se permiten valores negativos en el stock |
