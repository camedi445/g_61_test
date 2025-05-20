## Cambios realizados

### 1. **Separación de responsabilidades**
- Se dividió el código en diferentes archivos y carpetas para seguir el patrón **MVC**:
  - **Models**: Representan los datos de la aplicación.
  - **screens**: Contienen la interfaz de usuario.
  - **Domain**: Gestionan la lógica de negocio con un controlado.

### 2. **Estructura del proyecto**
Se reorganizó el proyecto con la siguiente estructura:

lib/
├── main.dart
├── models/
│   └── character.dart
├── domain/
│   └── character_controller.dart
├── providers/
│   └── character_provider.dart
└── ui/
    ├── screens/
    │   ├── home_screen.dart
    │   ├── search_screen.dart
    │   ├── profile_screen.dart
    │   └── detail_character_screen.dart

---

### 3. **Implementación de Riverpod**
- Se utilizó **Riverpod** para gestionar el estado de la aplicación.
- Se creó un archivo `character_provider.dart` en la carpeta `providers/` para manejar la lista de personajes.
- El proveedor `characterProvider` utiliza el controlador `CharacterController` para obtener los datos de la API y exponerlos a las vistas.

Ejemplo del proveedor:
```dart
final characterProvider = FutureProvider<List<Character>>((ref) async {
  final controller = CharacterController();
  return await controller.fetchCharacters();
});