Feature: Soporte de concurrencia de usuarios en zona piloto
  Como administrador del sistema
  Quiero que la plataforma soporte al menos 500 usuarios concurrentes sin caídas
  Para garantizar continuidad operativa durante los picos de publicación

  Scenario Outline: Estabilidad del servidor ante carga simultánea
    Given que la plataforma CoseLab se encuentra desplegada en entorno de pruebas
    When se simulan "<usuarios_concurrentes>" peticiones simultáneas de consulta y reserva
    Then la tasa de disponibilidad del servicio se mantiene en "<disponibilidad_min>" % sin errores 500

    Examples:
      | usuarios_concurrentes | disponibilidad_min |
      | 250                   | 99.9               |
      | 500                   | 99.5               |
