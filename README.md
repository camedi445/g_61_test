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

---

# Mejoras Implementados

## Patrón Arquitectónico MVC

- **Modelo**: Se creo la clase `Character` en `models/character.dart` para representar los datos de los personajes de forma estructurada.
- **Vista**: Las interfaces de usuario están separadas en `views/home_screen.dart` y `views/character_detail_screen.dart`, enfocándose únicamente en la presentación.
- **Controlador**: se creo la lógica de negocio para obtener los datos de la API se ha encapsulado en `controllers/character_controller.dart`.

## Gestión de Estado con Riverpod
se implemento Riverpod como gestor de estado, reemplazando el uso de `setState()`:

- Creación de providers en `providers/character_providers.dart` para:
  - Gestionar la obtención de personajes (`charactersProvider`)
  - Mantener el estado del personaje seleccionado (`selectedCharacterProvider`)
- Uso de `ConsumerWidget` y `ConsumerStatefulWidget` para consumir los providers
- Uso de `ref.watch()` para observar cambios en el estado
- Uso de `ref.read()` para modificar el estado cuando sea necesario

## Separación de Responsabilidades

Lse aplico una mejora en la separacion de responsabilidades en donde:

- **Obtención de Datos**: El controlador se encarga de hacer las peticiones HTTP
- **Manejo de Estado**: Los providers gestionan el estado de la aplicación
- **Presentación**: Las vistas solo renderizan la UI basándose en el estado actual
- **Navegación**: La navegación entre pantallas se maneja de forma declarativa

## Estructura del Proyecto

La estructura de carpetas ahora refleja la arquitectura MVC:

```
lib/
  ├── main.dart
  ├── controllers/
  │   └── 
  ├── models/
  │   └── 
  ├── providers/
  │   └── 
  └── views/
      ├── 
      └── 
```

## Beneficios de las Mejoras

- **Escalabilidad**: Ahroa es mas facil agregar funcionalidades sin afectar el código existente
- **Mantenibilidad**: El codigo es un poco mas  fácil de mantener al tener responsabilidades mas claras y directas
- **Testeabilidad**: La separación de lógica facilita la escritura de tests unitarios
- **Reutilizacion**: Los componentes podran ahora reutilizarse en diferentes partes de la aplicacion


