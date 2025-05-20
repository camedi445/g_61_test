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

## Lo que se hizo
Refactorizamos lo que seria el main.dart en capas: el modelo (Character) solo guarda datos, el servicio (ApiService) habla con la API y convierte JSON, el controlador (CharacterController) orquesta esas llamadas, y la vista de las pantallas solo dibuja lo que le dicen. Además, movimos los indicadores de carga y errores a widgets comunes, y organizamos todo en carpetas (models/, services/, controllers/, providers/, screens/, widgets/).

Por ultimo, reemplazamos todos esos setState() y banderas manuales con un FutureProvider de Riverpod: en los screens hacemos ref.watch(charactersProvider) para saber si tienen que mostrar spinner, lista o mensaje de error. Adicional a todo eso, instalamos ya gregamos al archivo pubspec.yaml la instalcion de nuestro riverpord