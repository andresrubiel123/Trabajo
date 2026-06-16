# 📋 Flutter Project Master Spec: [Gol Saint]

Este es un documento maestro de requerimientos estructurado para agilizar la creación y mantenimiento de proyectos en Flutter con agentes de IA. Se debe llenar una sola vez y usarse como contexto principal para cualquier interacción futura.

---

## 1. Información General
* **Nombre del Proyecto:** [Gol Saint]
* **Descripción:** [Aplicación móvil para predecir resultados deportivos de fútbol mediante Inteligencia Artificial y asistir a los usuarios en sus apuestas.]
* **Objetivo Principal:** [Predecir resultados deportivos mediante IA.]
* **Problema que resuelve:** [Falta de información centralizada, precisa y basada en datos estadísticos y modelos predictivos para tomar decisiones informadas en apuestas deportivas.]
* **Usuarios Objetivo:** [Apostadores deportivos, aficionados al fútbol, analistas de datos.]
* **Modelo de Negocio:** [Freemium + Suscripciones + Publicidad.]
* **Fecha:** [16/06/2026]
* **Versión:** [1.0.0]

---

## 2. Tecnologías
* **Frontend:** [Flutter]
* **Backend:** [xxx por definir]
* **Base de datos:** [No SQL Mongo DB]
* **Autenticación:** [xxx por definir]
* **Pasarela de pago:** [xxx por definir]
* **Hosting:** [xxx por definir]
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

**Módulo:** [xxx por definir]
* **Objetivo:** [xxx por definir]
* **Funciones:** 
  * [xxx por definir]
* **Pantallas:** 
  * [xxx por definir]

---

## 6. Navegación
[Splash]
↓
[Login]
↓
[Dashboard]
 ├─ [Predicciones]
 ├─ [Estadísticas]
 ├─ [Perfil]
 └─ [Configuración]

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

## 10. Diseño UI
* **Color Primario:** [xxx por definir]
* **Color Secundario:** [xxx por definir]
* **Tema:**
  * [xxx por definir] Claro
  * [xxx por definir] Oscuro
* **Tipografía:** [xxx por definir]
* **Estilo:** [Moderno Deportivo]

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

## 15. Backend y Árbol de Carpetas
**¿Va a tener Backend?** [xxx por definir]
**Tecnologías a usar:** [xxx por definir]

**Árbol de carpetas sugerido (Backend):**
```
[xxx por definir]
```

**Árbol de carpetas actual (Frontend - Flutter):**
```
lib/
 ├─ core/
 ├─ features/
 │   └─ predicciones/
 │       └─ presentation/
 │           └─ widgets/
 │               └─ prediction_match_card.dart
 ├─ main.dart
```

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

## 16. Prompt Maestro
**Al iniciar cualquier interacción con este documento, el agente debe leer lo siguiente:**

> Actúa como Arquitecto Senior Flutter.
> 
> Toda propuesta debe:
> - Reducir costos cloud.
> - Escalar a 1 millón de usuarios.
> - Seguir Clean Architecture.
> - Optimizar CPU, RAM y BD.
> - Explicar riesgos.
> - Explicar monetización.
> - Entregar código listo para producción.
