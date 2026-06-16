# GOL SAINT - AI Development Instructions & Engineering Standard

Este documento tiene prioridad sobre las convenciones por defecto del modelo de IA. Toda respuesta relacionada con código debe cumplir estas reglas salvo instrucción explícita del usuario.

**Autor:** Rubiel Andrés Díaz
**Versión:** 3.0 (Adaptado para GOL SAINT)
**Objetivo:** Desarrollar software profesional, escalable, mantenible, seguro, multilenguaje y optimizado para el dominio de análisis de fútbol. Siempre actuar con el rol de Ingeniero de Software Senior.

---

# 🚨 CRITICAL RULE: SOCCER DATA ONLY
* **Scope**: Este repositorio, su base de datos, sus APIs del backend y las características del frontend son única y exclusivamente para **fútbol (soccer/football)**.
* **No Other Sports**: Bajo ninguna circunstancia se deben introducir o integrar datos, colecciones, modelos o APIs relacionados con otros deportes (ej. baloncesto, tenis, béisbol, fútbol americano).
* **External APIs**: Todas las APIs externas deben consumir fuentes de datos de fútbol (ej. Football-Data.org y los endpoints relacionados con fútbol de TheSportsDB).

---

# FILOSOFÍA GOL SAINT

Todo desarrollo debe priorizar:
1. Legibilidad
2. Reutilización
3. Mantenimiento
4. Escalabilidad
5. Documentación
6. Testing
7. Seguridad
8. Rendimiento
9. Optimización de costos
10. Simplicidad

---

# PRINCIPIOS DE DESARROLLO

Aplicar siempre:
* Clean Architecture
* SOLID
* DRY
* KISS
* Separation of Concerns
* Fail Fast
* Defensive Programming

El código debe ser entendido por otro desarrollador en menos de 5 minutos.
Primero claridad.
Luego rendimiento.
Luego complejidad.
Nunca sacrificar mantenibilidad por optimizaciones prematuras.

---

# STACK TECNOLÓGICO OFICIAL

## Frontend
* Dart
* Flutter Web / Mobile

## Backend
* Java 17+
* Spring Boot 3.x

## Base de Datos
* MongoDB (NoSQL) - Base de datos: `gol_saint`

## Control de Versiones
* Git
* GitHub

---

# IDIOMA DEL PROYECTO

## Código
Todo el código debe estar en inglés (nombres de variables, métodos, clases, colecciones y campos).

## Comentarios
Todos los comentarios deben estar en español.

## Documentación
Toda la documentación técnica debe estar en español.

---

# CONVENCIONES DE NOMENCLATURA

## Variables
Utilizar camelCase.
Ejemplos:
```text
userName
customerAddress
productPrice
```
Prohibido:
```text
x
dato
valor
temp
```
Los nombres deben describir claramente su propósito.

---

## Métodos
Utilizar camelCase.
Ejemplos:
```text
calculateTotal()
validateAccess()
generateInvoice()
```
Los métodos deben iniciar con un verbo.

---

## Clases
Utilizar PascalCase.
Ejemplos:
```text
UserService
ProductRepository
InventoryController
```

---

## Constantes
Utilizar UPPER_SNAKE_CASE.
Ejemplos:
```text
MAX_LOGIN_ATTEMPTS
DEFAULT_LANGUAGE
MAX_FILE_SIZE
```

---

# DOCUMENTACIÓN

Toda clase pública debe documentarse.
Toda función pública debe documentarse.

## Java
JavaDoc obligatorio.

## Dart / Flutter
DartDoc obligatorio (comentarios con `///`).

La documentación debe explicar:
* Qué hace.
* Parámetros.
* Retorno.
* Posibles excepciones.
* Restricciones importantes.

No documentar obviedades.

---

# TIPADO Y VALIDACIONES

Siempre utilizar tipos explícitos.
Validar todos los datos de entrada en el Backend y en el Frontend.
Nunca confiar en datos provenientes de clientes o de APIs externas sin validar.
Aplicar:
* Null checks y null-safety de Dart.
* Validaciones de formato.
* Validaciones de longitud.
* Validaciones de rango.

---

# REGLAS DE TAMAÑO

## Archivos
Ideal: 100 - 150 líneas
Advertencia: 200 líneas
Refactorizar: 300 líneas
Prohibido: 400+ líneas

---

## Métodos
Ideal: 10 - 20 líneas
Aceptable: 30 líneas
Refactorizar: 50+ líneas

---

## Responsabilidad Única
Cada archivo debe tener una sola responsabilidad.
Cada clase debe tener una sola responsabilidad.
Cada método debe hacer una sola cosa.

---

# ARQUITECTURA BACKEND (SPRING BOOT + MONGODB)

Organizar por módulos funcionales.
Prohibido organizar únicamente por capas globales.

# REGLAS SPRING BOOT

Utilizar:
* Controller
* Service
* Repository (heredando de `MongoRepository`)
* Entity/Document (usando `@Document` de Spring Data MongoDB)
* DTO
* Mapper
* Validator

Prohibido:
* Lógica de negocio en Controllers.
* Acceso directo a BD desde Controllers.
Toda lógica de negocio debe pasar por Services.

---

# REGLAS DART / FLUTTER

* Utilizar `const` siempre que sea posible para constructores de widgets y valores constantes para optimizar el árbol de widgets.
* Utilizar `final` para variables locales e instancias de clases que no cambiarán.
* Seguir las directrices de `analysis_options.yaml` del proyecto.

---

# BASE DE DATOS (MONGODB)

* Diseñar esquemas eficientes utilizando referencias `@DocumentReference` o documentos embebidos según los patrones de acceso.
* Crear índices en campos clave de consulta para asegurar el óptimo rendimiento en consultas recurrentes.
* Evitar consultas pesadas de múltiples niveles que afecten el rendimiento.

---

# SEGURIDAD

Validar todas las entradas en controladores y servicios.
Proteger contra ataques comunes (Inyección, XSS, CSRF, Path Traversal, Broken Authentication).
Utilizar algoritmos criptográficos seguros (como BCrypt) para contraseñas de usuario.
Nunca almacenar secretos o contraseñas en texto plano.
Utilizar variables de entorno (`.env` o variables del sistema) para credenciales y API keys.

---

# RENDIMIENTO

Analizar siempre:
* Complejidad Temporal: O(1), O(log n), O(n), O(n log n).
* Complejidad Espacial: consumo de memoria, especialmente en móviles al renderizar listas largas (usar `ListView.builder` en Flutter).
* Evitar bucles anidados innecesarios o consultas repetitivas de base de datos.

---

# TESTING

Generar:
* Unit Tests
* Integration Tests

Cobertura mínima objetivo: 80%.
Toda lógica crítica del negocio (cálculo de cuotas, combinaciones de apuestas, predicciones) debe estar cubierta por pruebas.

---

# COSTOS CLOUD

Evaluar siempre el consumo de CPU, RAM, disco y transferencia de red.
Optimizar el número de llamadas a las APIs externas y base de datos para minimizar costos.

---

# DEFINICIÓN DE CALIDAD

Una solución se considera terminada cuando incluye:
* Código limpio y formateado.
* Documentación obligatoria (JavaDoc / DartDoc).
* Validaciones robustas.
* Seguridad.
* Testing.
* Internacionalización implementada.
* Estructura modular.
* Preparación para producción.

No generar código de demostración cuando se solicite código real. Generar siempre soluciones listas para producción.
