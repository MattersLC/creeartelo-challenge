# 📅 Eventos App - Flutter Demo

Una aplicación móvil construida con **Flutter** que permite visualizar eventos próximos, buscar por nombre, ver detalles, y agregar a favoritos con persistencia local usando SQLite. Este proyecto está diseñado como una demostración de arquitectura limpia y buenas prácticas.

---

## 🧠 Arquitectura Elegida: **Clean Architecture + MVVM**

Opté por una combinación de **Clean Architecture** y el patrón **MVVM (Model-View-ViewModel)** porque:

- **Separación de responsabilidades** clara entre UI, lógica de presentación, lógica de negocio y datos.
- Facilita el mantenimiento, escalabilidad y testing.
- Evita el acoplamiento entre las capas.

---

## 🗂️ Estructura del Proyecto

lib/
│
├── core/database/          # 🗃️ Acceso a base de datos local (SQLite)
│   └── database_helper.dart
│
├── global/                 # 📦 Atributos adicionales (paleta de color custom)
│   └── event_colors.dart
│
├── models/                 # 📦 Modelos de datos (entidades del dominio)
│   └── event.dart
│
├── services/               # 🌐 Servicios (fuentes de datos: API/local)
│   └── event_service.dart
│
├── view_models/            # 🧠 Lógica de presentación (ViewModels)
│   └── event_view_model.dart
│
├── views/                  # 📱 Pantallas principales (Vistas)
│   ├── event_list_view.dart
│   ├── favorites_list_view.dart
│   └── event_details_view.dart
│
├── widgets/                # 🧩 Widgets reutilizables de UI
│   └── event_card.dart
│
├── assets/                 # 📂 Archivos estáticos (mock JSON, imágenes)
│   └── events.json
│
└── main.dart               # 🚀 Punto de entrada de la aplicación


---

## 💡 Principios de Programación Aplicados

- **Responsabilidad Única (SRP)**: Cada clase tiene una única función.
- **Inversión de Dependencias**: Las vistas no conocen directamente los servicios o la base de datos.
- **Open/Closed**: El sistema es abierto a extensión, cerrado a modificación.
- **DRY**: Componentes reutilizables como `EventCard`.

---

## 🧩 Patrones de Diseño Utilizados

- **MVVM (Model-View-ViewModel)**: Facilita la separación entre UI y lógica.
- **Repository Pattern (implícito)**: `EventService` actúa como fuente única de datos.
- **Observer (Provider)**: UI escucha cambios del ViewModel.
- **Factory Pattern**: para construir los modelos desde JSON/mapas.

---

## 🛠️ Instalación y Ejecución

1. Clona este repositorio:
   ```bash
   git clone https://github.com/[tu_usuario]/creaartelo-challenge.git
   cd eventos_app
