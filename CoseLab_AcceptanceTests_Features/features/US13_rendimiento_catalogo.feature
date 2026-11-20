Feature: Tiempo de respuesta del catálogo de excedentes
  Como usuario de la aplicación
  Quiero que el catálogo y el mapa de excedentes carguen en menos de 2.0 segundos
  Para agilizar la consulta desde dispositivos móviles

  Scenario Outline: Carga rápida del catálogo bajo diferentes volúmenes de lotes
    Given que el usuario accede desde un dispositivo móvil con conexión 4G
    And existen "<cantidad_lotes>" lotes activos registrados en la zona piloto
    When solicita la vista principal del catálogo geolocalizado
    Then el sistema responde y renderiza los puntos en un tiempo menor a "<tiempo_max_s>" segundos

    Examples:
      | cantidad_lotes | tiempo_max_s |
      | 25             | 2.0          |
      | 100            | 2.0          |
