# GOL SAINT - Backend API ⚙️☕

Módulo de servicios en Spring Boot encargado de integrar las APIs externas de fútbol, persistir los datos en MongoDB y servir los datos unificados a la aplicación móvil Flutter.

---

## 🛠️ Especificaciones Técnicas

| Componente | Tecnología |
| :--- | :--- |
| Lenguaje | Java 25 |
| Framework | Spring Boot 4.1.0 |
| ORM / Driver | Spring Data MongoDB |
| Base de Datos | MongoDB (Base de datos: `gol_saint`) |
| Cliente HTTP | Spring WebFlux (WebClient) |
| Scheduler | `@Scheduled` (cron cada 6 horas) |

---

## 🔌 Integración de APIs Externas

### Football-Data.org
- **Usuario:** `Rubiel_Full_Stack`
- **Plan:** Gratuito (para siempre)
- **Autenticación:** Header `X-Auth-Token`

#### Competiciones disponibles:
| Código | Competición |
| :---: | :--- |
| `WC` | Copa Mundial de la FIFA |
| `CL` | Liga de Campeones de la UEFA |
| `BL1` | Bundesliga |
| `DED` | Eredivisie |
| `BSA` | Campeonato Brasileiro Série A |
| `PD` | Primera División (La Liga) |
| `FL1` | Ligue 1 |
| `ELC` | Campeonato (Championship) |
| `PPL` | Primeira Liga |
| `EC` | Campeonato de Europa |
| `SA` | Serie A |
| `PL` | Premier League |

### TheSportsDB
- **Usuario:** `RubielFullStack`
- **Plan:** Gratuito (V1 API - Key 123)
- **Autenticación:** API Key en la URL

#### Datos que proporciona a GOL SAINT:
- 🛡️ Escudos de equipos (`strTeamBadge`)
- 🏟️ Información de estadios
- 👤 Jugadores y sus fotos
- 🌍 Información de países y ligas

---

## 🏛️ Arquitectura de Servicios

```text
FutbolController  ←→  (Endpoints REST para Flutter)
       ↓
  SyncService      ←   Cron Job (cada 6 horas)
       ↓                    ↓
FootballDataService    SportsDbService
       ↓                    ↓
Football-Data.org      TheSportsDB
  (partidos,ligas)   (escudos,jugadores)
       ↓                    ↓
       └──────┬─────────────┘
              ↓
        Merge / Fusión en memoria
              ↓
       MongoDB (gol_saint DB)
              ↓
       Flutter App (Cliente)
```

---

## 🚀 Instrucciones de Ejecución

### 1. Prerequisitos
- MongoDB activo en puerto `27017`
- Java 25 instalado en el sistema

### 2. Configuración
Edita `src/main/resources/application.yml` si necesitas cambiar la URI de la base de datos:
```yaml
spring:
  mongodb:
    uri: mongodb://localhost:27017/gol_saint
```

### 3. Ejecutar
```bash
mvn spring-boot:run
```
La API arranca en `http://localhost:8080`

---

## 📡 Endpoints REST (`/api`)

| Método | Ruta | Descripción |
| :--- | :--- | :--- |
| `GET` | `/api/partidos` | Lista todos los partidos |
| `GET` | `/api/partidos/{id}/estadisticas` | Estadísticas de un partido |
| `GET` | `/api/partidos/{id}/cuotas` | Cuotas de apuestas del partido |
| `POST` | `/api/partidos/{id}/cuotas` | Registrar cuotas |
| `GET` | `/api/equipos` | Lista de equipos con escudos |
| `GET` | `/api/equipos/{id}/jugadores` | Plantilla de un equipo |
| `GET` | `/api/paises` | Lista de países |
| `GET` | `/api/ligas` | Lista de ligas |
| `GET` | `/api/competiciones` | Lista de competiciones |
| `GET` | `/api/jugadores/{id}/ratings` | Historial de rendimiento |
| `POST` | `/api/jugadores/{id}/ratings` | Nuevo registro de rendimiento |
| `GET` | `/api/combinaciones` | Apuestas combinadas generadas |
| `POST` | `/api/combinaciones` | Crear nueva combinación |
| `GET` | `/api/combinaciones/{id}/detalles` | Partidos de una combinación |
| `POST` | `/api/sync` | Forzar sincronización inmediata |
