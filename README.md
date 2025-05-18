# noti_app

# 📱 Noticias App

Aplicación Flutter para consultar noticias y gestionar favoritos utilizando arquitectura limpia, go_router para navegación, flutter_bloc para estado y Hive para persistencia local.
Para esta app se utilizo  Flutter ver. 3.29.2 
---

## 🧩 Características

- Noticias desde [NewsAPI.org](https://newsapi.org)
- Navegación entre tabs con `BottomNavigationBar`
- Marcado de artículos como favoritos
- Persistencia local con Hive
- Separación por capas (`data`, `domain`, `presentation`)
- Bloc para gestión de estado (`flutter_bloc`)
- Navegación estructurada con `go_router` y `ShellRoute`

---

## 📦 Tecnologías Usadas

| Herramienta       | Rol                               |
|-------------------|-----------------------------------|
| Flutter           | Framework principal               |
| flutter_bloc      | Gestión de estado                 |
| go_router         | Navegación                        |
| dio               | Consumo de API HTTP               |
| hive              | Base de datos local persistente   |
| build_runner      | Generación de código para Hive    |

---

## 🏗️ Estructura del Proyecto

```text
lib/
├── config/                 # Configuración global y entorno
│   ├── constans/           # Configuración de variables constantes y variables globales
│   ├── router/             # Configuración de go_router
│   └── theme/              # Configuración de temas globales
├── features/
│   └── news/
│       ├── data/           # modelos, datasourcesImpl y repositorio
│       ├── domain/         # entidades, datasources y repositorio abstracto
│       └── presentation/   # UI, bloc y widgets
├── app.dart
└── main.dart


##  Guia de instalación por terminal

1. Clonar el repositorio
git clone https://github.com/Thony091/noti-app.git
cd noti_app

2. Instalar dependencias
flutter pub get

3. Ejecutar la aplicación
flutter run

