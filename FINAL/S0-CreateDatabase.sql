CREATE TABLE T_ArticulosCotizadosHisto (
  numCotizacion                    int NOT NULL, 
  codArticulo                      varchar(20) NOT NULL, 
  undMedida                        tinyint NOT NULL, 
  cantidad                         int NOT NULL, 
  porcenDescuento                  tinyint NOT NULL, 
  costoUnitario                    decimal(17, 2) NOT NULL, 
  montoLinea                       decimal(17, 2) NOT NULL, 
  T_CotizacionesHistonumCotizacion int NOT NULL);
CREATE TABLE T_CotizacionesHisto (
  numero            int IDENTITY(1, 1) NOT NULL, 
  fecRegistro       datetime NOT NULL, 
  cedJurCliente     int NOT NULL, 
  condicionPago     varchar(60) NOT NULL, 
  condicionVenta    varchar(60) NOT NULL, 
  vigencia          varchar(30) NOT NULL, 
  observaciones     varchar(100) NOT NULL, 
  codMoneda         tinyint NOT NULL, 
  codEstadoCotiz    tinyint NOT NULL, 
  codListaPrecios   int NOT NULL, 
  mesEntreg         tinyint NOT NULL, 
  AnioEntreg        smallint NOT NULL, 
  cotizacionBorrada int NOT NULL, 
  PRIMARY KEY (numero));
CREATE TABLE T_Componentes (
  codComponente varchar(20) NOT NULL, 
  codArticulo   varchar(20) NOT NULL);
CREATE TABLE T_MesAnio (
  fecha date NOT NULL, 
  PRIMARY KEY (fecha));
CREATE TABLE T_ProyeccionesListaPrecios (
  codArticulo              varchar(20) NOT NULL, 
  codListaPrecios          tinyint NOT NULL, 
  tipoCambioProyect        decimal(17, 2) NOT NULL, 
  precioMercDolaresProyect decimal(17, 2) NOT NULL, 
  fecha                    date NOT NULL);
CREATE TABLE T_EstadosTipoCambios (
  codigo tinyint IDENTITY(1, 1) NOT NULL, 
  nombre varchar(1) NOT NULL, 
  PRIMARY KEY (codigo));
CREATE TABLE T_TipoCambios (
  codMoneda1         tinyint NOT NULL, 
  codMoneda2         tinyint NOT NULL, 
  monto              decimal(17, 2) NOT NULL, 
  codIndiceEconomico tinyint NOT NULL, 
  estado             tinyint NOT NULL, 
  fecha              date NOT NULL);
CREATE TABLE T_LineasFacturaCompras (
  codFactura    int NOT NULL, 
  codArticulo   varchar(20) NOT NULL, 
  precioDolares decimal(17, 2) NOT NULL, 
  cantidad      int NOT NULL);
CREATE TABLE T_Marcas (
  codigo      tinyint IDENTITY(1, 1) NOT NULL, 
  descripcion varchar(20) NOT NULL, 
  PRIMARY KEY (codigo));
CREATE TABLE T_TipoErrores (
  codigo      tinyint IDENTITY(1, 1) NOT NULL, 
  descripcion varchar(15) NOT NULL, 
  PRIMARY KEY (codigo));
CREATE TABLE T_Bitacora (
  codigo       int IDENTITY(1, 1) NOT NULL, 
  codUser      varchar(10) NOT NULL, 
  codTipoError tinyint NOT NULL, 
  fechaHora    datetime NOT NULL, 
  PRIMARY KEY (codigo));
CREATE TABLE T_PermisoUsuarios (
  codigo      tinyint IDENTITY(1, 1) NOT NULL, 
  descripcion varchar(20) NOT NULL, 
  PRIMARY KEY (codigo));
CREATE TABLE T_TipoUsuarios (
  codigo         tinyint IDENTITY(1, 1) NOT NULL, 
  codUserPermiso tinyint NOT NULL, 
  descripcion    varchar(20) NOT NULL, 
  PRIMARY KEY (codigo));
CREATE TABLE T_Usuarios (
  nbrLogin    varchar(10) NOT NULL, 
  clvLogin    varchar(10) NOT NULL, 
  codUserTipo tinyint NOT NULL, 
  PRIMARY KEY (nbrLogin));
CREATE TABLE T_ArticulosCotizados (
  numCotizacion   int NOT NULL, 
  codArticulo     varchar(20) NOT NULL, 
  undMedida       tinyint NOT NULL, 
  cantidad        int NOT NULL, 
  porcenDescuento tinyint NOT NULL, 
  costoUnitario   decimal(17, 2) NOT NULL, 
  costoGrabado    decimal(17, 2) NOT NULL, 
  montoLinea      decimal(17, 2) NOT NULL);
CREATE TABLE T_Cotizaciones (
  numero          int IDENTITY(1000, 1) NOT NULL, 
  fecRegistro     datetime NOT NULL, 
  cedJurCliente   varchar(20) NOT NULL, 
  condicionPago   varchar(60) NOT NULL, 
  condicionVenta  varchar(60) NOT NULL, 
  vigencia        varchar(30) NOT NULL, 
  observaciones   varchar(100) NOT NULL, 
  fecha           date NOT NULL, 
  codMoneda       tinyint NOT NULL, 
  codEstadoCotiz  tinyint NOT NULL, 
  codListaPrecios tinyint NOT NULL, 
  PRIMARY KEY (numero));
CREATE TABLE T_CotizacionEstados (
  codigo      tinyint IDENTITY(1, 1) NOT NULL, 
  descripcion varchar(20) NOT NULL, 
  PRIMARY KEY (codigo));
CREATE TABLE T_Monedas (
  codigo tinyint IDENTITY(1, 1) NOT NULL, 
  nombre varchar(10) NOT NULL, 
  PRIMARY KEY (codigo));
CREATE TABLE T_FacturaCompras (
  codigo          int IDENTITY NOT NULL, 
  fecCompra       datetime NOT NULL, 
  fecRegistro     datetime NOT NULL, 
  codUserRegistro varchar(10) NOT NULL, 
  PRIMARY KEY (codigo));
CREATE TABLE T_TipoEmpresa (
  codTipoEmpresa tinyint IDENTITY(1, 1) NOT NULL, 
  nombre         varchar(20) NOT NULL, 
  PRIMARY KEY (codTipoEmpresa));
CREATE TABLE T_Contacto (
  codContacto     tinyint IDENTITY(1, 1) NOT NULL, 
  codTipoContacto tinyint NOT NULL, 
  valor           varchar(50) NOT NULL, 
  codEmpresa      varchar(20) NOT NULL, 
  PRIMARY KEY (codContacto));
CREATE TABLE T_TipoContactos (
  codTipoContacto tinyint IDENTITY NOT NULL, 
  nombre          int NOT NULL, 
  PRIMARY KEY (codTipoContacto));
CREATE TABLE T_Paises (
  codPais tinyint IDENTITY(1, 1) NOT NULL, 
  nombre  varchar(20) NOT NULL, 
  PRIMARY KEY (codPais));
CREATE TABLE T_Provincias (
  codProvincia tinyint IDENTITY(1, 1) NOT NULL, 
  codPais      tinyint NOT NULL, 
  nombre       varchar(20) NOT NULL, 
  PRIMARY KEY (codProvincia));
CREATE TABLE T_Cuidades (
  codCiudad    tinyint IDENTITY(1, 1) NOT NULL, 
  codProvincia tinyint NOT NULL, 
  nombre       varchar(20) NOT NULL, 
  PRIMARY KEY (codCiudad));
CREATE TABLE T_DetalleDireccion (
  codDetalle tinyint IDENTITY(1, 1) NOT NULL, 
  codCiudad  tinyint NOT NULL, 
  aparPostal varchar(10) NOT NULL, 
  detalle1   varchar(50) NOT NULL, 
  detalle2   varchar(50) NOT NULL, 
  PRIMARY KEY (codDetalle));
CREATE TABLE T_Empresa (
  cedulaJuridica  varchar(20) NOT NULL, 
  nombreComercial varchar(60) NOT NULL, 
  direccion       tinyint NOT NULL, 
  codTipoEmpresa  tinyint NOT NULL, 
  PRIMARY KEY (cedulaJuridica));
CREATE TABLE T_IndiceEconomicos (
  codigo           tinyint IDENTITY(1, 1) NOT NULL, 
  descripcion      varchar(40) NOT NULL, 
  numValoresReales int NOT NULL, 
  numMeses         int NOT NULL, 
  PRIMARY KEY (codigo));
CREATE TABLE T_ListaPrecioXArticulos (
  codListaPrecio tinyint NOT NULL, 
  codArticulo    varchar(20) NOT NULL, 
  PRIMARY KEY (codListaPrecio, 
  codArticulo));
CREATE TABLE T_ListaPrecios (
  codigo      tinyint IDENTITY(1, 1) NOT NULL, 
  descripcion varchar(40) NOT NULL, 
  gastoAdmin  tinyint NOT NULL, 
  gastoOtros  tinyint NOT NULL, 
  utilidad    tinyint NOT NULL, 
  PRIMARY KEY (codigo));
CREATE TABLE T_UnidadMedidas (
  codigo      tinyint IDENTITY(1, 1) NOT NULL, 
  descripcion varchar(40) NOT NULL, 
  PRIMARY KEY (codigo));
CREATE TABLE T_Familias (
  codigo             tinyint IDENTITY(1, 1) NOT NULL, 
  descripcion        varchar(40) NOT NULL, 
  porcImpACompra     tinyint NOT NULL, 
  codIndiceEconomico tinyint NOT NULL, 
  PRIMARY KEY (codigo));
CREATE TABLE T_ArticuloEstados (
  codigo      tinyint IDENTITY NOT NULL, 
  descripcion varchar(20) NOT NULL, 
  PRIMARY KEY (codigo));
CREATE TABLE T_Articulos (
  codigo            varchar(20) NOT NULL, 
  descripcion       varchar(40) NOT NULL, 
  undMedida         tinyint NOT NULL, 
  codMarca          tinyint NOT NULL, 
  modelo            varchar(15) NOT NULL, 
  fecRegistro       datetime NOT NULL, 
  codFamilia        tinyint NOT NULL, 
  codEstArticulo    tinyint NOT NULL, 
  codUserRegistro   varchar(10) NOT NULL, 
  cantidad          int NOT NULL, 
  cantMaxima        int NOT NULL, 
  cantMinima        int NOT NULL, 
  precioMercDolares decimal(17, 2) NOT NULL, 
  fechaActPrecio    datetime NOT NULL, 
  PRIMARY KEY (codigo));
ALTER TABLE T_ProyeccionesListaPrecios ADD CONSTRAINT FKT_Proyecci566293 FOREIGN KEY (codListaPrecios, codArticulo) REFERENCES T_ListaPrecioXArticulos (codListaPrecio, codArticulo);
ALTER TABLE T_Articulos ADD CONSTRAINT FKT_Articulo848891 FOREIGN KEY (codMarca) REFERENCES T_Marcas (codigo);
ALTER TABLE T_Bitacora ADD CONSTRAINT FKT_Bitacora251134 FOREIGN KEY (codTipoError) REFERENCES T_TipoErrores (codigo);
ALTER TABLE T_Bitacora ADD CONSTRAINT FKT_Bitacora84906 FOREIGN KEY (codUser) REFERENCES T_Usuarios (nbrLogin);
ALTER TABLE T_Articulos ADD CONSTRAINT FKT_Articulo578076 FOREIGN KEY (codUserRegistro) REFERENCES T_Usuarios (nbrLogin);
ALTER TABLE T_FacturaCompras ADD CONSTRAINT FKT_FacturaC28973 FOREIGN KEY (codUserRegistro) REFERENCES T_Usuarios (nbrLogin);
ALTER TABLE T_Usuarios ADD CONSTRAINT FKT_Usuarios41238 FOREIGN KEY (codUserTipo) REFERENCES T_TipoUsuarios (codigo);
ALTER TABLE T_TipoUsuarios ADD CONSTRAINT FKT_TipoUsua556339 FOREIGN KEY (codUserPermiso) REFERENCES T_PermisoUsuarios (codigo);
ALTER TABLE T_ListaPrecioXArticulos ADD CONSTRAINT FKT_ListaPre160880 FOREIGN KEY (codArticulo) REFERENCES T_Articulos (codigo);
ALTER TABLE T_ListaPrecioXArticulos ADD CONSTRAINT FKT_ListaPre78013 FOREIGN KEY (codListaPrecio) REFERENCES T_ListaPrecios (codigo);
ALTER TABLE T_ArticulosCotizados ADD CONSTRAINT FKT_Articulo382695 FOREIGN KEY (codArticulo) REFERENCES T_Articulos (codigo);
ALTER TABLE T_ArticulosCotizados ADD CONSTRAINT FKT_Articulo522199 FOREIGN KEY (undMedida) REFERENCES T_UnidadMedidas (codigo);
ALTER TABLE T_ArticulosCotizados ADD CONSTRAINT FKT_Articulo50573 FOREIGN KEY (numCotizacion) REFERENCES T_Cotizaciones (numero) ON DELETE Cascade;
ALTER TABLE T_Cotizaciones ADD CONSTRAINT FKT_Cotizaci429323 FOREIGN KEY (cedJurCliente) REFERENCES T_Empresa (cedulaJuridica);
ALTER TABLE T_Cotizaciones ADD CONSTRAINT FKT_Cotizaci717841 FOREIGN KEY (codEstadoCotiz) REFERENCES T_CotizacionEstados (codigo);
ALTER TABLE T_Cotizaciones ADD CONSTRAINT FKT_Cotizaci656953 FOREIGN KEY (codMoneda) REFERENCES T_Monedas (codigo);
ALTER TABLE T_Empresa ADD CONSTRAINT FKT_Empresa228590 FOREIGN KEY (codTipoEmpresa) REFERENCES T_TipoEmpresa (codTipoEmpresa);
ALTER TABLE T_Contacto ADD CONSTRAINT FKT_Contacto536274 FOREIGN KEY (codEmpresa) REFERENCES T_Empresa (cedulaJuridica);
ALTER TABLE T_Contacto ADD CONSTRAINT FKT_Contacto759656 FOREIGN KEY (codTipoContacto) REFERENCES T_TipoContactos (codTipoContacto);
ALTER TABLE T_Empresa ADD CONSTRAINT FKT_Empresa469254 FOREIGN KEY (direccion) REFERENCES T_DetalleDireccion (codDetalle);
ALTER TABLE T_DetalleDireccion ADD CONSTRAINT FKT_DetalleD350223 FOREIGN KEY (codCiudad) REFERENCES T_Cuidades (codCiudad);
ALTER TABLE T_Cuidades ADD CONSTRAINT FKT_Cuidades473810 FOREIGN KEY (codProvincia) REFERENCES T_Provincias (codProvincia);
ALTER TABLE T_Provincias ADD CONSTRAINT FKT_Provinci451632 FOREIGN KEY (codPais) REFERENCES T_Paises (codPais);
ALTER TABLE T_Articulos ADD CONSTRAINT FKT_Articulo570863 FOREIGN KEY (undMedida) REFERENCES T_UnidadMedidas (codigo);
ALTER TABLE T_Articulos ADD CONSTRAINT FKT_Articulo904486 FOREIGN KEY (codFamilia) REFERENCES T_Familias (codigo);
ALTER TABLE T_Articulos ADD CONSTRAINT FKT_Articulo840016 FOREIGN KEY (codEstArticulo) REFERENCES T_ArticuloEstados (codigo);
ALTER TABLE T_Componentes ADD CONSTRAINT FKT_Componen233783 FOREIGN KEY (codComponente) REFERENCES T_Articulos (codigo);
ALTER TABLE T_Componentes ADD CONSTRAINT FKT_Componen774059 FOREIGN KEY (codArticulo) REFERENCES T_Articulos (codigo);
ALTER TABLE T_ProyeccionesListaPrecios ADD CONSTRAINT FKT_Proyecci161174 FOREIGN KEY (fecha) REFERENCES T_MesAnio (fecha);
ALTER TABLE T_Cotizaciones ADD CONSTRAINT FKT_Cotizaci920077 FOREIGN KEY (codListaPrecios) REFERENCES T_ListaPrecios (codigo);
ALTER TABLE T_TipoCambios ADD CONSTRAINT FKT_TipoCamb146673 FOREIGN KEY (codIndiceEconomico) REFERENCES T_IndiceEconomicos (codigo);
ALTER TABLE T_TipoCambios ADD CONSTRAINT FKT_TipoCamb620101 FOREIGN KEY (codMoneda2) REFERENCES T_Monedas (codigo);
ALTER TABLE T_TipoCambios ADD CONSTRAINT FKT_TipoCamb651026 FOREIGN KEY (estado) REFERENCES T_EstadosTipoCambios (codigo);
ALTER TABLE T_TipoCambios ADD CONSTRAINT FKT_TipoCamb620100 FOREIGN KEY (codMoneda1) REFERENCES T_Monedas (codigo);
ALTER TABLE T_LineasFacturaCompras ADD CONSTRAINT FKT_LineasFa50873 FOREIGN KEY (codFactura) REFERENCES T_FacturaCompras (codigo);
ALTER TABLE T_LineasFacturaCompras ADD CONSTRAINT FKT_LineasFa481568 FOREIGN KEY (codArticulo) REFERENCES T_Articulos (codigo);
ALTER TABLE T_Familias ADD CONSTRAINT FKT_Familias219097 FOREIGN KEY (codIndiceEconomico) REFERENCES T_IndiceEconomicos (codigo);
ALTER TABLE T_Cotizaciones ADD CONSTRAINT FKT_Cotizaci821678 FOREIGN KEY (fecha) REFERENCES T_MesAnio (fecha);
ALTER TABLE T_TipoCambios ADD CONSTRAINT FKT_TipoCamb323093 FOREIGN KEY (fecha) REFERENCES T_MesAnio (fecha);
ALTER TABLE T_ArticulosCotizadosHisto ADD CONSTRAINT FKT_Articulo626287 FOREIGN KEY (numCotizacion) REFERENCES T_CotizacionesHisto (numero);
