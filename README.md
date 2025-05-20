## Explicación Juan Fernando Álvarez Gómez

1. Riverpod: Se creó un Provider para la lista de personajes, y otro para un repositorio.

2. MVC: Se creó un datasource API, y se llamó desde un repositorio para que el provider de la lista de personajes (o controller) no se preocupe por si la data llega de una API o cualquier otro lugar. Por otro lado, la UI es la que consume este provider para mostrar los datos.

3. Separación de responsabilidades: Como se puede ver en la estructura del proyecto se separó por carpetas como fue sugerido en clase. Y la UI: También se separó por funcionalidad y dentro de cada carpeta está la screen y los widgets usados en dicha funcionalidad.