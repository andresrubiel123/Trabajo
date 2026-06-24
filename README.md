# GOL SAINT ⚽🏆

**GOL SAINT** es una plataforma profesional de análisis de fútbol, predicciones y combinaciones de apuestas deportivas de alto rendimiento.

---

## 🏛️ Arquitectura del Sistema

La aplicación está diseñada bajo una arquitectura desacoplada de n-capas para optimizar velocidad, consumo de recursos y costos de API:

```mermaid
graph TD
    %% Frontend Layer
    subgraph Frontend [Aplicación Móvil - Cliente]
        Flutter[Flutter Mobile App]
        Sqflite[(SQLite Local Cache)]
        Flutter <-->|Almacenamiento Local| Sqflite
    end

    %% Backend Layer
    subgraph Backend [Servidor de Aplicaciones]
        SpringBoot[Spring Boot REST API]
        Controller[Controllers /api/*]
        SyncService[Sync Scheduler Cron Job]
        WebClient[WebClient API Client]
        
        SpringBoot --> Controller
        SpringBoot --> SyncService
        SyncService --> WebClient
    end

    %% Database Layer
    subgraph Database [Persistencia]
        MongoDB[(MongoDB - gol_saint DB)]
    end

    %% External APIs Layer
    subgraph ExternalAPIs [Proveedores de Datos Externos]
        FootballData[Football-Data.org API <br> - Partidos, Resultados, Ligas]
        TheSportsDB[TheSportsDB API <br> - Escudos, Jugadores, Medios]
    end

    %% Connections
    Flutter <-->|Peticiones HTTP REST| Controller
    Controller <-->|Spring Data MongoDB| MongoDB
    SyncService <-->|Persistencia y Caché| MongoDB
    WebClient -->|HTTP GET /v4/matches| FootballData
    WebClient -->|HTTP GET /searchteams.php| TheSportsDB

    %% Style
    style Flutter fill:#02569B,stroke:#0175C2,stroke-width:2px,color:#fff
    style SpringBoot fill:#6DB33F,stroke:#5ea035,stroke-width:2px,color:#fff
    style MongoDB fill:#47A248,stroke:#3F8F41,stroke-width:2px,color:#fff
    style Sqflite fill:#005177,stroke:#002b3f,stroke-width:2px,color:#fff
```

### Flujo de Sincronización y Caché (Evita límites de APIs externas)
1. Un **Cron Job (SyncService)** en Spring Boot se despierta cada 6 horas.
2. Consulta nuevos partidos y ligas a través de **Football-Data.org**.
3. Consulta detalles multimedia (escudos y jugadores) usando **TheSportsDB**.
4. Realiza la combinación de datos (Merge) en memoria y los persiste en la base de datos **MongoDB (`gol_saint`)**.
5. La app de **Flutter** consume directamente los endpoints del backend en milisegundos, sin golpear las APIs externas.

---

## 📂 Estructura del Proyecto

```text
ApuestasFutbol/ (GOL SAINT Workspace)
├── README.md (Este archivo)
├── backend/ (Servicios e Integración REST)
│   ├── pom.xml
│   ├── README.md (Documentación técnica del backend)
│   └── src/
│       └── main/
│           ├── java/com/golsaint/
│           │   ├── GolSaintApplication.java (Punto de entrada)
│           │   ├── controller/ (API Controllers)
│           │   ├── model/ (Documentos de MongoDB)
│           │   ├── repository/ (Interfaces Spring Data MongoDB)
│           │   └── service/ (Consumo de APIs y Scheduler)
│           └── resources/
│               ├── application.yml (Credenciales y propiedades)
│               └── DB Gol Saint.json (Estructura de la Base de Datos MongoDB)
└── lib/ (Código fuente de Flutter Mobile App)
    ├── main.dart
    └── ... (Componentes UI y Providers de Flutter)
```

---

## 🗄️ Estructura de Documentos y Colecciones en MongoDB

La estructura de base de datos no relacional optimizada está descrita en [DB Gol Saint.json](file:///c:/Andres/proyectos%20sofware/ApuestasFutbol/backend/src/main/resources/DB%20Gol%20Saint.json) y consta de las siguientes colecciones:

* **`paises`**: Ubicación y banderas oficiales de las competiciones y clubes.
* **`ligas`**: Ligas oficiales en las que participan los equipos.
* **`competiciones`**: Copas, ligas o torneos internacionales sincronizados.
* **`equipos`**: Clubes de fútbol con sus estadísticas, escudo e ID de proveedor externo.
* **`jugadores`** y **`jugador_ratings`**: Perfil de futbolistas con histórico temporal de habilidades (velocidad, pase, tiro, etc.).
* **`partidos`** y **`estadisticas_partido`**: Registro de enfrentamientos y métricas de juego (posesión, tiros, córners).
* **`cuotas`**: Histórico de cuotas en tiempo real por partido y casa de apuestas.
* **`combinaciones`** y **`combinacion_detalle`**: Algoritmo generador de apuestas múltiples con simulación de inversión y ganancias.
