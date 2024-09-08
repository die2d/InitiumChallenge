# InitiumChallenge
Prueba Técnica requerida

# Library Management API

Este proyecto es una API RESTful desarrollada en .NET Core para gestionar libros y usuarios en una biblioteca. La API permite a los usuarios autenticarse, gestionar libros y consultar libros registrados.

## Estructura del Proyecto

La solución está organizada en varias capas para mantener la separación de responsabilidades y seguir las mejores prácticas de Clean Code.


### Descripción de Carpetas

- **Controllers**: Contiene los controladores (`BooksController`, `UsersController`) que manejan las peticiones HTTP entrantes y delegan la lógica de negocio a los servicios.
- **Interfaces**: Define las interfaces (`IBookService`, `IUserService`, `IRepository<T>`) para la abstracción de los servicios y los repositorios.
- **Models**: Contiene las clases de modelo (`Book`, `User`) que representan las entidades de la base de datos.
- **Repositories**: Contiene la implementación genérica del repositorio (`Repository<T>`) que maneja la interacción con la base de datos.
- **Services**: Contiene los servicios (`BookService`, `UserService`) que implementan la lógica de negocio de la aplicación.
- **Data**: Contiene la clase `LibraryManagementDbContext` que representa el contexto de la base de datos utilizado por Entity Framework Core.

## Decisiones Técnicas

1. **Inyección de Dependencias (Dependency Injection)**: Se utiliza para desacoplar la lógica de negocio de la capa de acceso a datos. Las interfaces (`IBookService`, `IUserService`, `IRepository<T>`) se implementan y se inyectan en los controladores, lo que facilita la prueba y el mantenimiento.
   
2. **Entity Framework Core**: Utilizado para el acceso a la base de datos. `LibraryManagementDbContext` maneja las entidades y las migraciones para la base de datos SQL Server.

3. **Logging con ILogger**: Implementado en los servicios para registrar eventos clave, como intentos de autenticación, operaciones CRUD y errores. Esto ayuda a mantener un registro de la actividad y diagnosticar problemas.

4. **Autenticación con JWT**: La API utiliza JWT (JSON Web Tokens) para autenticar a los usuarios. Esto asegura que solo los usuarios autenticados puedan acceder a ciertos endpoints.

5. **Paginación y Filtros en Endpoints**: Implementación de filtros y paginación en los endpoints para optimizar las consultas y mejorar el rendimiento del sistema.

6. **Manejo de Errores**: Implementación de un manejo de errores adecuado en los controladores y servicios para retornar códigos de estado HTTP apropiados (404, 400, 500, etc.) en diferentes escenarios.

7. **Configuración desde appsettings.json**: Algunos parámetros, como el límite máximo de libros que un usuario puede registrar, se leen desde `appsettings.json` para facilitar la configuración sin necesidad de modificar el código.

## Endpoints Principales

1. **Consulta de Libros con Filtros**
   - `GET /api/books`: Permite obtener una lista de libros aplicando filtros opcionales por autor, año de publicación y género, con soporte para paginación.

2. **Registro de Libros por Usuarios**
   - `POST /api/users/{id}/books`: Permite a un usuario registrado añadir un libro a su lista de libros. Valida que el usuario existe y que no ha alcanzado el número máximo de libros.

3. **Consulta de Libros Registrados por Usuario**
   - `GET /api/users/me/books`: Permite a un usuario autenticado ver su lista de libros registrados, con soporte para paginación y filtro opcional por género.

## Requisitos Previos

- .NET 6 SDK o superior
- SQL Server o Azure SQL Database
- Visual Studio 2022 o cualquier editor compatible con .NET

## Configuración

1. Clona el repositorio: 
    ```bash
    git clone https://github.com/tu-repositorio.git
    ```
2. Configura la cadena de conexión a la base de datos en `appsettings.json`.
3. Ejecuta las migraciones de Entity Framework Core para crear la base de datos:
    ```bash
    dotnet ef database update
    ```
4. Ejecuta el proyecto:
    ```bash
    dotnet run
    ```

## Pruebas

El proyecto incluye pruebas unitarias que se pueden ejecutar con:
```bash
dotnet test


