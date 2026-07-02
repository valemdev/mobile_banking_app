# Arquitectura del Proyecto

## Clean Architecture

Para este proyecto se escogió una arquitectura limpia, es decir **"Clean Architecture"**, dado que es una aplicación bancaria se desea que pueda ser fácilmente escalable y testeable, dado que se tienen muchas funcionalidades y esto permite agregar nuevas **feature** sin romper el resto del código o modificarlo en su totalidad.

### Partes importantes de esta arquitectura

Las partes importantes de esta arquitectura son el **DataSource** y el **Repository**, dado que estas capas nos permiten poder cambiar de APIs, bases de datos o librerías sin romper la UI o el resto del código. Por lo que es importante tener claro que para nosotros el tener una buena implementación de estas capas es clave para poder escalar el aplicativo.

---

## ¿Por qué "Clean Architecture" y no otra arquitectura como MVVM?

Porque, como se mencionó anteriormente, esta es una aplicación bancaria, por lo que debe ser robusta y debe tener la posibilidad de ser fácilmente testeable y escalable.

Dado que **MVVM** está bien, pero no escala para proyectos grandes y no es tan robusto como lo es **Clean Architecture**.

---

# Librerías Utilizadas

## Dio

Se utilizó **Dio** para el llamado a **endpoints**, dado que es mucho más fácil de utilizar que otros paquetes como **http**, los cuales requieren un poco más de configuración.



## Riverpod

Se decidió utilizar **Riverpod** sobre **BLoC**, dado que es un manejador de estados mucho más fácil de implementar y es bastante flexible. Al no ser tan robusto como **BLoC**, permite realizar cosas más sencillas como la inyección de dependencias.

## SharedPreferences

Se utilizó la librería **shared_preferences**, dado que fue la opción recomendada para el almacenamiento local en el dispositivo. Esto debido a que su forma de almacenamiento es **clave-valor** y ofrece un alto rendimiento.

Esta dependencia no es una opción si lo que se desea almacenar son datos sensibles. Sin embargo, en nuestro caso sí es una opción adecuada, dado que únicamente almacenamos datos de preferencia de visualización o el idioma en el cual el usuario desea visualizar el aplicativo.

## Intl

Se utilizó la librería **intl**, dado que es una dependencia oficial, fácil de utilizar y escalable.

Comparada con otras librerías como **easy_localization**, **intl** ofrece una solución más robusta y alineada con el ecosistema oficial de Flutter.


## Freezed

Se utilizó la librería **Freezed** dado que permite reducir la cantidad de código repetitivo en la creación de modelos y estados dentro del aplicativo. Además, facilita el mantenimiento del código al generar automáticamente funcionalidades como `copyWith`, comparación por valor e inmutabilidad de los objetos.

Esta dependencia se integra de forma natural con **Riverpod** y con la estructura definida en **Clean Architecture**, permitiendo que los modelos y estados sean más fáciles de mantener y extender a medida que el aplicativo crece.