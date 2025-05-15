# noti_app

# 📱 Noticias App

Aplicación Flutter para consultar noticias y gestionar favoritos utilizando arquitectura limpia, go_router para navegación, flutter_bloc para estado e Isar para persistencia local.
Para esta app se utilizo  Flutter ver 3.29.2 
---

## 🧩 Características

- Noticias desde [NewsAPI.org](https://newsapi.org)
- Navegación entre tabs con `BottomNavigationBar`
- Marcado de artículos como favoritos
- Persistencia local con Isar
- Separación por capas (`data`, `domain`, `presentation`)
- Bloc para gestión de estado (`flutter_bloc`)
- Navegación estructurada con `go_router` y `ShellRoute`

---

## 📦 Tecnologías Usadas

| Herramienta       | Rol                              |
|-------------------|-----------------------------------|
| Flutter           | Framework principal               |
| flutter_bloc      | Gestión de estado                 |
| go_router         | Navegación                        |
| dio               | Consumo de API HTTP               |
| build_runner      | Generación de código para Isar    |

---

## 🏗️ Estructura del Proyecto

```text
lib/
├── config/                 # Configuración global y entorno
├── core/                   # (opcional) herramientas compartidas
├── features/
│   └── news/
│       ├── data/           # modelos, datasources y repositorio
│       ├── domain/         # entidades, usecases y repositorio abstracto
│       └── presentation/   # UI, bloc y widgets
├── router/                 # Configuración de go_router
├── injection_container.dart
├── app.dart
└── main.dart
