# noti_app

# 📱 Noticias App

**NotiApp** es una aplicación móvil desarrollada en Flutter que permite a los usuarios explorar las últimas noticias, buscar artículos por tema y guardar sus favoritos para leerlos más tarde. La aplicación está construida siguiendo los principios de la **Arquitectura Limpia**, garantizando un código escalable, mantenible y testeable.
Para esta app se utilizo  Flutter ver. 3.29.2 
---

## 🧩 Características

*   📰 **Feed de Noticias en Tiempo Real:** Visualiza las noticias más recientes obtenidas desde la API de [NewsAPI.org](https://newsapi.org).
*   🔍 **Búsqueda Avanzada:** Encuentra artículos específicos utilizando un campo de búsqueda dinámico.
*   ❤️ **Gestión de Favoritos:** Guarda tus artículos preferidos para un acceso rápido y léelos sin conexión.
*   🚀 **Animaciones Fluidas:** Experiencia de usuario mejorada con animaciones sutiles y transiciones limpias.
*   📱 **Diseño Responsivo:** Interfaz adaptada para funcionar correctamente en diferentes tamaños de pantalla.

---

## 📦 Tecnologías Usadas

Esta aplicación aprovecha un conjunto de herramientas modernas y robustas del ecosistema de Flutter:

| Herramienta        | Rol                                       |
| ------------------ | ----------------------------------------- |
| **Flutter 3.29.2+**| Framework principal para el desarrollo UI. |
| **flutter_bloc**   | Gestión de estado declarativa y predecible. |
| **go_router**      | Navegación estructurada y basada en rutas. |
| **dio**            | Cliente HTTP para un consumo de API eficiente. |
| **hive**           | Base de datos NoSQL local, ligera y rápida. |
| **equatable**      | Simplifica comparaciones de objetos en Bloc. |
| **intl**           | Formateo y localización (ej. fechas).    |
| **animate_do**     | Para animaciones de entrada sencillas.   |
| **build_runner**   | Generación de código para Hive y otros.   |

---

## 🏗️ Estructura del Proyecto

El proyecto sigue los principios de la **Arquitectura Limpia**, separando las responsabilidades en tres capas principales para desacoplar la lógica de negocio de la UI y los detalles de implementación.

```text
├── core/
│   └── errors/ # Definición y control de errores de la aplicación.
│   
├── config/
│   ├── constants/ # Variables de entorno y constantes globales.
│   ├── router/ # Configuración de rutas y navegación con go_router.
│   └── theme/ # Definición de temas (claro/oscuro) de la aplicación.
│
├── features/
│   └── news/
│       ├── infrastructure/
│       │   ├── datasources/ # Implementaciones concretas (API remota, DB local).
│       │   ├── models/ # Modelos de datos para la capa de data (DTOs).
│       │   ├── mappers/ # Mapeos de modelos a entidades.
│       │   └── repositories/ # Implementación del repositorio de dominio.
│       │
│       ├── domain/
│       │   ├── datasources/ # Contratos (interfaces) de los datasources.
│       │   ├── entities/ # Objetos de negocio puros, sin dependencias.
│       │   └── repositories/ # Contratos (interfaces) de los repositorios.
│       │
│       └── presentation/
│           ├── blocs/ # Lógica de estado (Blocs y Cubits).
│           ├── pages/ # Pantallas principales de la aplicación.
│           └── shared/ # Widgets reutilizables.
│
├── app.dart # Widget raíz que configura la aplicación.
└── main.dart # Punto de entrada de la aplicación.
```

### Flujo de Datos

1.  **UI (Presentation):** Un widget solicita datos o dispara una acción (ej. `context.read<NewsBloc>().add(FetchNews())`).
2.  **Bloc (Presentation):** Recibe el evento, interactúa con un `UseCase`o directamente con el `Repository` del dominio.
3.  **Repository (Domain):** Define el contrato (`abstract class`) que la capa de datos debe implementar.
4.  **RepositoryImpl (Data):** Implementa el contrato, decide si obtener los datos del `RemoteDataSource` (API) o del `LocalDataSource` (Hive).
5.  **DataSource (Data):** Realiza la llamada a la API con `dio` o la consulta a la base de datos con `Hive`.
6.  Los datos regresan por el mismo camino, transformándose de `Model` (Data) a `Entity` (Domain) antes de llegar al Bloc, que actualiza el estado y reconstruye la UI.

---

### Pasos de Instalación

1.  **Clona el repositorio:**
    ```bash
    git clone https://github.com/Thony091/noti-app.git
    cd noti-app
    ```

2.  **Crea el archivo de configuración de entorno:**
    Cambia el nombre al archivo llamado `.env.template` a `.env` en la raíz del proyecto y añade tu API Key:
    ```
    NEWS_API_KEY="TU_API_KEY_AQUÍ"
    ```
    *Nota: Asegúrate de que tu código esté preparado para leer esta variable (por ejemplo, usando `flutter_dotenv`).*

3.  **Instala las dependencias:**
    ```bash
    flutter pub get
    ```

4.  **Genera los archivos de Hive:**
    Si realizas cambios en los modelos de Hive, necesitarás ejecutar `build_runner`:
    ```bash
    flutter pub run build_runner build --delete-conflicting-outputs
    ```

5.  **Ejecuta la aplicación:**
    ```bash
    flutter run
    ```