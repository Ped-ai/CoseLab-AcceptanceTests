Feature: Carga de evidencia visual del stock
  Como productor agrícola urbano
  Quiero adjuntar fotografías o videos reales de la cosecha actual
  Para brindar transparencia sobre la frescura y calidad a los compradores

  Scenario Outline: Adjuntar evidencia multimedia válida al lote
    Given que el productor está completando los datos de un nuevo lote de cosecha
    When adjunta el archivo "<archivo>" de formato "<formato>" y tamaño "<tamano_mb>" MB
    And guarda la publicación
    Then el sistema almacena el archivo en la nube
    And muestra la vista previa del stock en la ficha pública del lote

    Examples:
      | archivo          | formato | tamano_mb |
      | lote_lechuga.jpg | JPG     | 2.4       |
      | cosecha_hoy.png  | PNG     | 3.1       |
      | video_huerto.mp4 | MP4     | 8.5       |

  Scenario: Rechazo de archivo con formato no permitido
    Given que el productor está creando una publicación de excedente
    When intenta subir el archivo "inventario.pdf" en el campo de evidencia visual
    Then el sistema rechaza la carga
    And muestra el mensaje "Formato no soportado. Adjunte imágenes JPG/PNG o video MP4"
