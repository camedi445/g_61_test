
## Juliana Betancur Blandón
Para la refactorización del proyecto se ha realizado:
- Creación de carpetas para separación de responsabilidades basada en MVC. models, services, controllers, providers, views con screens y widgets.
- Se encapsuló toda la lógica de http y api en un solo servicio.
- Controlador con riverpod: controllers/character_controller.dart extiende StateNotifier<AsyncValue<List<Character>>>.
- Centraliza la carga, manejo de errores y refresco de datos con StateNotifier (CharacterController) que encapsula la lógica de fetch, loading y error.
- Providers bien definidos
- Uso de riverpod en la UI: En lugar de setState para cargar datos, la UI “escucha” al provider con ref.watch(...).
- Extracción de screens y widgets
- Gestión de pestañas con IndexedStack: El índice del BottomNavigationBar se gestiona con un provider, eliminando setState en el widget principal.
- Mejor legibilidad y mantenibilidad
