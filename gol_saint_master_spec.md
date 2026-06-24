# 📋 Flutter Project Master Spec: [Gol Saint]

Este es un documento maestro de requerimientos estructurado para agilizar la creación y mantenimiento de proyectos en Flutter con agentes de IA. Se debe llenar una sola vez y usarse como contexto principal para cualquier interacción futura.

---

## 1. Información General
* **Nombre del Proyecto:** [Gol Saint]
* **Descripción:** [Aplicación móvil para predecir resultados deportivos de fútbol mediante Algoritmos matematicos y estadísticos, Big Data Analytics e Inteligencia Artificial y asistir a los usuarios en sus apuestas.]
* **Objetivo Principal:** [Predecir resultados deportivos mediante Big Data Analytics y asistir a los usuarios en sus apuestas, basado en patrones históricos, desempeño reciente, estadísticas de jugadores, forma de los equipos, condiciones del partido y otros factores relevantes para maximizar la precisión de las predicciones.]
* **Problema que resuelve:** [Falta de información centralizada, precisa y basada en datos estadísticos y modelos predictivos para tomar decisiones informadas en apuestas deportivas, lo que genera incertidumbre, pérdidas financieras y decisiones basadas en intuición en lugar de datos.]
* **Usuarios Objetivo:** [Apostadores deportivos, aficionados al fútbol, analistas de datos.]
* **Modelo de Negocio:** [Freemium + Suscripciones + Publicidad.]
* **Fecha:** [16/06/2026]
* **Versión:** [1.0.0]

---

## 2. Tecnologías
* **Frontend:** [Flutter (Última versión estable)]
* **Animaciones Interactivas:** [Rive (Última versión estable)]
* **Backend:** [Spring Boot 4.0.0 y Java 25]
* **Base de datos:** [No SQL Mongo DB]
* **Cache:** [Redis]
* **Storage:** [S3]
* **Autenticación:** [xxx por definir]
* **Pasarela de pago:** [xxx por definir]
* **Hosting:** [AWS]
* **Notificaciones:** [xxx por definir]
* **Analítica:** [xxx por definir]

---

## 3. Arquitectura
**Arquitectura Global:**
* [xxx por definir] Monolito
* [xxx por definir] Microservicios
* [xxx por definir] Serverless

**Patrón de Diseño (Frontend):**
* [x] Clean Architecture
* [ ] MVC
* [ ] MVVM
* [ ] Bloc

---

## 4. Roles de Usuario
* **Rol 1:** [Administrador]
  * **Permisos:** [Acceso total al sistema, gestión de usuarios, gestión de modelos de IA, configuración de la app.]
* **Rol 2:** [Usuario Premium]
  * **Permisos:** [Acceso a predicciones avanzadas, sin publicidad, estadísticas detalladas, soporte prioritario.]
* **Rol 3:** [Usuario Gratuito]
  * **Permisos:** [Acceso a predicciones básicas, visualización de publicidad, historial limitado.]

---

## 5. Módulos
**Módulo:** [Predicciones]
* **Objetivo:** [Mostrar análisis de partidos.]
* **Funciones:** 
  * [IA predictiva]
  * [Historial]
  * [Favoritos]
* **Pantallas:** 
  * [Lista partidos]
  * [Detalle partido]
  * [Estadísticas]

**Módulo:** [Modelos IA]
* **Objetivo:** [Permitir que los usuarios seleccionen distintos motores de predicción según su perfil de riesgo.]
* **Funciones:** 
  * [Conservador, Balanceado, Agresivo]
  * [Value Bets, Over/Under, Ambos Equipos Marcan (BTTS)]
* **Pantallas:** 
  * [Selección de Modelo]
  * [Detalle y Rendimiento del Modelo]

---

## 6. Arquitectura de Navegación (Responsive)
**Móvil (< 768px): Bottom Navigation Bar**
* Inicio, Predicciones, Combinadas, Resultados, Perfil.
* *Objetivo:* Navegación rápida con una sola mano, menor consumo de espacio visual.

**Tablet (768px - 1200px): Navigation Rail**
* Dashboard, Predicciones, Combinadas, Historial, Resultados, Configuración.
* *Objetivo:* Menú lateral compacto, iconos permanentes visibles.

**Escritorio y Web (> 1200px): Persistent Sidebar Layout**
* *Sidebar:* Logo, Dashboard, Predicciones, Generar Combinadas, Modelos IA, Historial, Resultados, Ranking, Configuración.
* *Panel Principal:* Calendario, Filtros, Predicciones, Estadísticas, Análisis IA, Gráficos.
* *Objetivo:* Maximizar productividad y facilitar análisis avanzados.

---

## 7. Pantallas
**Pantalla:** [Login]
* **Objetivo:** [Autenticar al usuario en la plataforma.]
* **Componentes:** 
  * [Email]
  * [Password]
  * [Recordarme]
* **Botones:** 
  * [Iniciar Sesión]
  * [Recuperar Contraseña]
* **Eventos:** [xxx por definir]
* **Validaciones:** [xxx por definir]
* **Estados:** [xxx por definir]

**Pantalla:** [Lista de Partidos]
* **Objetivo:** [Mostrar los partidos disponibles para predicción.]
* **Componentes:** 
  * [PredictionMatchCard]
  * [Filtros de ligas]
  * [Selector de fecha]
* **Botones:** 
  * [Ver detalle]
* **Eventos:** [xxx por definir]
* **Validaciones:** [xxx por definir]
* **Estados:** [xxx por definir]

---

## 8. Base de Datos
**Colección/Tabla:** [Usuarios]
* **Campos:** [id, nombre, email, pais, idioma, plan, fechaRegistro]
* **Tipo:** [No SQL Mongo DB]
* **Obligatorio:** [email, password, fechaRegistro]

**Colección/Tabla:** [Predicciones]
* **Campos:** [xxx por definir]
* **Tipo:** [No SQL Mongo DB]
* **Obligatorio:** [xxx por definir]

---

## 9. APIs
**Endpoint:** [POST /api/login]
* **Método:** [POST]
* **Entrada:** [email, password]
* **Salida:** [token, usuario]
* **Seguridad:** [xxx por definir]

**Endpoint:** [xxx por definir]
* **Método:** [xxx por definir]
* **Entrada:** [xxx por definir]
* **Salida:** [xxx por definir]
* **Seguridad:** [xxx por definir]

---

## 10. Diseño UI y Design Tokens
* **Color Primario:** [Negro profundo]
* **Color Secundario:** [Azul eléctrico]
* **Color de Acento:** [Naranja de acento]
* **Tema:**
  * [ ] Claro
  * [x] Oscuro (Tema por defecto)
* **Tipografía / Fuente Principal:** [Google Fonts - Inter]
* **Estilo:** [Deportivo futurista, animaciones suaves y ligeras]
* **Componentes clave:** [Uso de tarjetas (Cards) para predicciones]
* **Espaciado base:** [Múltiplos de 8px]
* **Bordes redondeados (Radius):** [12px para tarjetas, 8px para botones]
* **Paquete de Iconos:** [Cupertino Icons / FontAwesome / Material]

---

## 11. Monetización
**¿Cómo gana dinero?**
* [x] Suscripción
* [x] Publicidad
* [ ] Venta de Datos
* [x] Afiliados
* [ ] Marketplace
* [ ] Licencias

**Estrategia Gol Saint:**
* [Premium mensual]
* [Premium anual]
* [Publicidad]
* [Programa de afiliados]

---

## 12. Inteligencia Artificial
* **Modelo:** [XGBoost]
* **Datos de entrenamiento:** [xxx por definir]
* **Frecuencia:** [xxx por definir]
* **Variables:** 
  * [Forma reciente]
  * [Goles]
  * [Lesiones]
  * [Localía]
  * [Clima]

---

## 13. Roadmap
* **MVP:** [Lanzamiento de predicciones básicas con modelo de IA y monetización por publicidad.]
* **Versión 1:** [Implementación de suscripciones Premium y estadísticas avanzadas.]
* **Versión 2:** [xxx por definir]
* **Versión 3:** [xxx por definir]

---

## 14. Reglas para los Agentes IA
**SIEMPRE:**
- Generar código producción.
- Aplicar Clean Architecture.
- Optimizar memoria.
- Optimizar CPU.
- Optimizar consultas BD.
- Usar nombres en español.
- No generar código de ejemplo.
- Generar código completo.
- Incluir seguridad.
- Incluir manejo de errores.
- Incluir pruebas.

---

## 15. Estructura de Carpetas y Breakpoints (Flutter)
**Breakpoints Oficiales:**
* Mobile: `< 768 px`
* Tablet: `768 - 1200 px`
* Desktop/Web: `> 1200 px`

**Regla de Diseño Responsive:**
Cada plataforma debe tener su propio layout principal evitando múltiples condicionales distribuidos por toda la aplicación.

**Estructura de Carpetas Sugerida (Frontend):**
```text
lib/
 ├─ core/
 ├─ features/
 ├─ shared/
 ├─ mobile/
 ├─ tablet/
 ├─ desktop/
 ├─ widgets/
 └─ main.dart
```

**Backend:**
* **¿Va a tener Backend?** [Sí, Spring Boot 4.0.0]
* **Tecnologías a usar:** [Java 25, MongoDB, Redis, S3]

---

## 🔥 Recomendación Adicional (Gol Saint)
Para este proyecto en específico, la documentación principal se divide en los siguientes dominios:
* Requerimientos funcionales
* Requerimientos no funcionales
* Arquitectura
* Base de datos MongoDB
* Diseño UI
* IA predictiva
* Monetización
* Roadmap

---

## 16. Requerimientos Funcionales
* **RF-001:** [El usuario podrá registrarse.]
* **RF-002:** [El usuario podrá iniciar sesión.]
* **RF-003:** [El usuario podrá guardar predicciones.]
* **RF-004:** [xxx por definir]

---

## 17. Requerimientos No Funcionales
* **RNF-001:** [Tiempo de respuesta menor a 2 segundos.]
* **RNF-002:** [Disponibilidad 99.9%.]
* **RNF-003:** [Compatible con Android, iOS y Web.]
* **RNF-004:** [xxx por definir]

---

## 18. Casos de Uso
**Actor:** [Usuario]
* **Caso:** [Crear cuenta]
* **Flujo:**
  1. [Ingresa correo]
  2. [Ingresa contraseña]
  3. [Confirma]
  4. [Sistema valida]
  5. [Sistema crea cuenta]

**Actor:** [xxx por definir]
* **Caso:** [xxx por definir]
* **Flujo:**
  1. [xxx por definir]

---

## 19. Reglas de Negocio
* **RN-001:** [Un usuario gratuito puede ver máximo 5 predicciones diarias.]
* **RN-002:** [Solo usuarios Premium pueden acceder a modelos avanzados.]
* **RN-003:** [Una suscripción vencida pierde acceso.]
* **RN-004:** [xxx por definir]

---

## 20. 🚨 Restricciones del Dominio (CRITICAL)
* **SOCCER DATA ONLY:** [Prohibición estricta de introducir datos, APIs o lógica de otros deportes. Todo debe girar en torno al fútbol.]
* **APIs Externas:** [Utilizar exclusivamente APIs de datos de fútbol (ej. Football-Data.org o TheSportsDB).]
* **UP-TO-DATE DEPENDENCIES & COMPILATION:** [Todas las dependencias, librerías y programas utilizados deben mantenerse en sus versiones estables más actualizadas. Queda prohibido el uso de versiones obsoletas para evitar incompatibilidades futuras con nuevas plataformas (ej. restricciones de alineación de página de 16 KB en Android 15/16) y asegurar la longevidad del sistema por más de 5 años.]

---

## 21. Convenciones de Código y Librerías Estándar
**Librerías / Tech Stack Detallado:**
* **Manejo de Estado:** [Ej: Bloc / Cubit]
* **Inyección de Dependencias:** [Ej: get_it + injectable]
* **Inmutabilidad y JSON:** [Ej: Freezed + json_serializable]
* **Navegación:** [Ej: go_router]
* **Peticiones HTTP:** [Ej: dio + retrofit]

**Buenas Prácticas y Límites Cognitivos:**
* **Nomenclatura:** [Usar camelCase para variables/funciones, PascalCase para clases, snake_case para archivos.]
* **Calidad de Código:** [Código limpio, altamente reutilizable, DRY (Don't Repeat Yourself) y KISS.]
* **Límites de Tamaño:** [Archivos: Máximo 200 líneas (alerta), 300 (refactorizar). Métodos: Máximo 30 líneas.]
* **Idioma en Código:** [Código 100% en inglés. Comentarios (DartDoc/JavaDoc) 100% en español. UI en español.]

---

## 22. Diccionario de Dominio (Ubiquitous Language)
* **Cuota** = `Odds` (No *Quota*)
* **Apuesta** = `Bet`
* **Pronosticador** = `Tipster`
* **Empate** = `Draw`
* **[xxx por definir]** = `[xxx por definir]`

---

## 23. Estrategia de Pruebas (Testing)
* **Regla:** [Solo pruebas unitarias para la capa Domain y Data. Ignorar UI testing en el MVP. Cobertura mínima del 80%.]
* **Herramientas:** [flutter_test, mocktail]

---

## 24. Configuración de Entornos y CI/CD
* **Entornos:** [Dev, Staging, Prod]
* **Distribución:** [Fastlane / Codemagic / GitHub Actions]

---

## 25. Observabilidad (Manejo de Errores y Analítica)
* **Crashlytics:** [Ej: Sentry o Firebase Crashlytics]
* **Eventos de Usuario:** [Ej: Firebase Analytics o Mixpanel]

---

## 26. Optimización y Rendimiento (Flutter)
* **Widgets:** [Usar `const` siempre que sea posible para optimizar el árbol de widgets.]
* **Listas:** [Usar siempre `ListView.builder` para renderizar listas largas.]
* **Complejidad:** [Evaluar la complejidad temporal O(n) y espacial en la lógica crítica de negocio.]

---

## 27. Documentación Obligatoria
Todo archivo debe incluir en su cabecera/título principal el autor: **Autor: Rubiel Andres Diaz**.
Toda clase pública y toda función pública debe documentarse sin excepción. No documentar obviedades.

**Reglas por Tecnología:**
* **Java:** JavaDoc obligatorio. Autor: Rubiel Andres Diaz.
* **Dart / Flutter:** DartDoc obligatorio (comentarios con `///`). Autor: Rubiel Andres Diaz.
* **Otras Tecnologías:** Usar la convención oficial de Docs de la tecnología. Autor: Rubiel Andres Diaz.


**Contenido Obligatorio de la Documentación:**
* Qué hace.
* Parámetros.
* Retorno.
* Posibles excepciones.
* Restricciones importantes.

---

## 28. Definition of Done (Criterios de Aceptación)
* [ ] Código limpio y debidamente formateado.
* [ ] DartDoc/JavaDoc completo según la regla de la Sección 27.
* [ ] Validaciones robustas de entradas y null-safety aplicadas.
* [ ] Internacionalización (i18n) implementada (sin textos quemados en los Widgets).

---

## 29. Prompt Maestro
**Al iniciar cualquier interacción con este documento, el agente debe leer lo siguiente:**

> Actúa como Arquitecto Senior Flutter.
> 
> Toda propuesta debe:
> - Respetar estrictamente la regla SOCCER DATA ONLY.
> - Reducir costos cloud.
> - Escalar a 1 millón de usuarios.
> - Seguir Clean Architecture.
> - Optimizar CPU, RAM y BD.
> - Explicar riesgos.
> - Explicar monetización.
> - Entregar código listo para producción.
