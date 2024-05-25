# Trabajo Práctico Cuatrimestral EQUIPO A1

## Integrantes
- Mauro Asselborn
- Daniel Fernandez
- Nahuel Zarate

## Descripción del Proyecto

El propósito de este proyecto es desarrollar una aplicación web para administrar las compras y ventas de un negocio multipropósito. El sistema permitirá gestionar clientes, proveedores, productos, y el registro de ventas y compras.

## Características Principales

### Gestión de Productos
- **Categorías y Marcas**: Los productos estarán organizados por marcas y tipos y/o categorías, las cuales serán administrables.
- **Proveedores**: Los productos estarán asociados a uno o más proveedores.
- **Stock**: Cada producto contará con un stock actual y un stock mínimo para proyectar las compras.
- **Administración**: El usuario podrá crear nuevas marcas, tipos, productos, proveedores, y realizar nuevas asociaciones o modificaciones.

### Registro de Compras
- **Proveedor**: Registro del proveedor de la compra.
- **Líneas de Stock**: Actualización del stock actual y registro de precios de compra.
- **Detalles**: Registro detallado de los productos comprados.

### Registro de Ventas
- **Clientes**: Los clientes deben estar registrados en el sistema para poder realizar compras.
- **Formulario de Venta**: Asignación del cliente y productos con cantidades, precios unitarios, parciales y finales.
- **Validación de Stock**: El sistema valida las cantidades de stock para evitar vender productos no disponibles.
- **Descuentos de Stock**: Actualización del stock tras cada venta.
- **Reporte de Factura**: Generación de un reporte con la factura, incluyendo un número de factura único.

### Cálculo de Precios
- **Porcentajes de Ganancia**: Cada producto tendrá un porcentaje de ganancia asignado.
- **Cálculo de Precio de Venta**: Basado en el precio de compra más reciente y el porcentaje de ganancia.

### Seguridad
- **Acceso con Usuario y Contraseña**: El sistema manejará seguridad con autenticación.
- **Perfiles de Usuario**: 
  - **Vendedor**: Permite registrar ventas.
  - **Administrador**: Permite acceso total a todas las funcionalidades.

## Tecnologías Utilizadas
- **Frontend**: ASP.NET Web Forms
- **Backend**: ASP.NET
- **Base de Datos**: SQL Server
- **Autenticación**: ASP.NET Identity

## Instalación y Configuración

### Requisitos Previos
- Visual Studio 2019 o superior
- SQL Server

### Pasos de Instalación
1. **Clonar el repositorio**:
    ```bash
    git clone https://github.com/mauroasselborn/tp-cuatrimestral-equipo-a1.git
    ```
2. **Abrir el proyecto en Visual Studio**:
    - Abrir Visual Studio.
    - Seleccionar `Open a project or solution`.
    - Navegar a la carpeta donde se clonó el repositorio y seleccionar el archivo `.sln`.

3. **Configurar la cadena de conexión**:
    - Abrir el archivo `Web.config`.
    - Buscar el nodo `<connectionStrings>` y actualizar la cadena de conexión para apuntar a tu instancia de SQL Server:
      ```xml
      <connectionStrings>
          <add name="DefaultConnection" connectionString="Server=tu_servidor;Database=nombre_base_datos;User Id=tu_usuario;Password=tu_contraseña;" providerName="System.Data.SqlClient" />
      </connectionStrings>
      ```

4. **Restaurar paquetes NuGet**:
    - En el explorador de soluciones, clic derecho en la solución y seleccionar `Restore NuGet Packages`.

5. **Migrar y actualizar la base de datos**:
    - Abrir la Consola del Administrador de Paquetes (Tools > NuGet Package Manager > Package Manager Console).
    - Ejecutar el comando `Update-Database` para aplicar las migraciones pendientes a la base de datos.

6. **Ejecutar la aplicación**:
    - Presionar `F5` para compilar y ejecutar la aplicación.

## Uso
- **Administración de Productos**: Acceder a la sección de administración para crear y modificar productos, marcas, tipos y proveedores.
- **Registro de Compras**: Utilizar el formulario de compras para registrar nuevas adquisiciones y actualizar el stock.
- **Registro de Ventas**: Utilizar el formulario de ventas para registrar nuevas ventas y generar facturas.
- **Gestión de Usuarios**: Administrar los usuarios y sus permisos desde la sección de seguridad.
