# Fake Store App

Es una aplicación que muestra una lista de productos obtenidos de una API fake externa. La aplicación permite a los usuarios ver los productos en una cuadrícula, hacer clic en ellos para ver más detalles y cambiar entre temas claro y oscuro.

## Cómo ejecutar la aplicación

1. Es necesario tener Flutter instalado.

2. Clona este repositorio:

   ```
   git clone https://github.com/ju-lienz/flutter-mobile-developer-challenge.git
   ```

3. Navega al directorio del proyecto

4. Obtén las dependencias del proyecto:

   ```
   flutter pub get
   ```

5. Ejecuta la aplicación:
   ```
   flutter run
   ```

## Decisiones arquitectónicas

1. **Patrón Bloc**: Se utilizó el patrón Bloc como gestor de estado para la aplicación.

2. **Inyección de dependencias**: Se implementó una inyección de dependencias simple utilizando el widget `BlocProvider`.

3. **Modelo de datos**: Se creó un modelo de datos `Product` para representar los productos en la aplicación.

4. **Servicios**: Se implementó un `ApiService` para manejar las llamadas a la API externa. La API utilizada es: https://fakestoreapi.com

5. **Tema oscuro y claro**: Se implementó la seleccion de temas utilizando `ThemeBloc` para permitir al usuario cambiar entre temas claro y oscuro.

6. **Nevagación**: Se implementó, como metodo de navegación, `go_router`.

## Desafíos enfrentados durante el desarrollo

1. **Gestión del estado**: Implementar bloc correctamente para manejar el estado de la aplicación fue un desafío ya que no cuento con demasiada experiencia con ese gestor de esto. Se resolvió mediante el estudio de la documentación y ejemplos.

2. **Manejo de errores**: Implementar un manejo de errores, especialmente para las llamadas a la API, fue un desafío. Dicho desafio se resolvió utilizando bloques try-catch y estados de error específicos en el bloc.

## Cómo ejecutar las pruebas

Para ejecutar las pruebas unitarias, usa el siguiente comando en la raíz del proyecto:

```
flutter test
```
