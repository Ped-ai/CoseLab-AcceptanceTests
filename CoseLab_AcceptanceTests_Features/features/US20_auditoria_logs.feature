Feature: Registro auditado de acciones técnicas (Logs)
  Como administrador del sistema
  Quiero que los eventos críticos de reserva y validación queden registrados en una bitácora
  Para asegurar trazabilidad y auditoría ante incidentes

  Scenario Outline: Registro automático de eventos críticos en log de auditoría
    Given que un usuario autenticado con ID "<usuario_id>" ejecuta la acción "<evento>"
    When la transacción es procesada por el servidor
    Then el sistema almacena un registro en la bitácora con marca de tiempo, "<usuario_id>", dirección IP y resultado "<estado>"

    Examples:
      | usuario_id | evento               | estado  |
      | USR-104    | CREACION_RESERVA     | EXITOSO |
      | ADM-012    | VALIDACION_QR_PIN    | EXITOSO |
      | USR-209    | INTENTO_QR_DUPLICADO | FALLIDO |
