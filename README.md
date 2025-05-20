# Taller Práctico Flutter - Rick y Morty

## Descripción

En este repositorio encontrarás una solución que tiene un menú principal con 3 opciones:

1. **Home**: Contiene una lista de personajes de Rick y Morty con vista detalle.
2. **Search**: Pantalla de búsqueda.
3. **Profile**: Pantalla de perfil.

La funcionalidad principal está en la primera opción, donde se implementa una vista de lista-detalle que consume la API pública de Rick y Morty.

## Objetivo del Taller

Tu trabajo como experto en Flutter es aplicar las mejores prácticas de programación vistas en clase para convertir esta solución en una aplicación escalable y mantenible.

## Requisitos

Para lograr este objetivo es indispensable que utilices:

- **Riverpod** como gestor de estado
- El patrón arquitectónico **MVC** (Modelo-Vista-Controlador)
- Una clara separación de responsabilidades entre las diferentes clases

## Tiempo y Entrega

- Duración de la actividad: **2 horas**
- Proceso de entrega:
  1. Crear una rama con tu solución
  2. A partir de esta rama, crear un Pull Request a la rama principal
  3. Incluir en el README una explicación detallada de los aspectos que mejoraste en la aplicación

## Criterios de Evaluación

Se valorará especialmente:

- La correcta implementación del patrón MVC
- El uso adecuado de Riverpod para la gestión del estado
- La separación de responsabilidades entre clases
- La claridad y mantenibilidad del código resultante
- La UI del detalle del personaje.

# Rick and Morty Flutter MVC + Riverpod

## Descripción
En este proyecto he construido una aplicación Flutter que consume la API pública de Rick and Morty para ofrecer:
- **Home**: listado de personajes con imagen, nombre y especie.  
- **Detail**: vista detallada de cada personaje al tocar un ítem.  
- **Search**: buscador de personajes por nombre.  
- **Profile**: pantalla de perfil de usuario (mock de datos).  

## Arquitectura y patrones
Trabajo con el patrón **MVC** (Modelo-Vista-Controlador) y **Riverpod** para la gestión del estado:
- **Models**: entidades Dart que representan los datos JSON (`lib/models`).  
- **Services**: capa de acceso a la API REST (`lib/services/api_service.dart`).  
- **Controllers**: lógica de negocio y carga de datos, cada uno extiende `StateNotifier` con su estado (`lib/controllers`).  
- **Providers**: conexión de los controllers a la UI mediante `StateNotifierProvider` (`lib/providers`).  
- **Views**: pantallas y widgets específicos de cada feature (`lib/views/...`).  
- **Core**: utilidades, constantes y widgets genéricos reutilizables (`lib/core`).


## Características principales
- Carga automática de la lista de personajes al iniciar la app.  
- Navegación tipada y segura entre rutas con `onGenerateRoute`.  
- Manejo de estados **loading**, **error** y **empty** en todas las pantallas.  
- Componentes UI extraídos a `core/widgets` para máxima reutilización.  
- Sin necesidad de API key: la Rick and Morty API es pública y gratuita.  

## Cómo ejecutar
1. Clona este repositorio y cambia a tu rama de trabajo.  
2. Desde la raíz, ejecuta:
   ```bash
   flutter pub get
   flutter run


