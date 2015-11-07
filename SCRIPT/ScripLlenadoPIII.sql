
--Desarrolle un “script” para la carga de los siguientes datos de prueba de al menos las siguientes tablas:
--  Familias
--  Monedas
--  Artículos
--  Componentes
--  Lista de precios


-------------------------------------------------
--insertar indices economicos
-------------------------------------------------
INSERT INTO t_indiceEconomicos(DESCRIPCION, NUMVALORESREALES, NUMMESES) VALUES('indice economico de ejemplo', 10, 2);

--para verificar
SELECT * FROM t_indiceEconomicos;


-------------------------------------------------
--insertar familias 
-------------------------------------------------
--CODINFICEECONOMICO por el momento es 1 para que sea el de ejemplo
--PORCIMPACOMPRA por el momento es 13 para que sea el de ejemplo
INSERT INTO t_familias(DESCRIPCION, PORCIMPACOMPRA, CODINDICEECONOMICO) VALUES('procesadores',13,1);
INSERT INTO t_familias(DESCRIPCION, PORCIMPACOMPRA, CODINDICEECONOMICO) VALUES('tarjetas de video',13,1);
INSERT INTO t_familias(DESCRIPCION, PORCIMPACOMPRA, CODINDICEECONOMICO) VALUES('discos duros',13,1);
INSERT INTO t_familias(DESCRIPCION, PORCIMPACOMPRA, CODINDICEECONOMICO) VALUES('memorias',13,1);
INSERT INTO t_familias(DESCRIPCION, PORCIMPACOMPRA, CODINDICEECONOMICO) VALUES('impresoras',13,1);
INSERT INTO t_familias(DESCRIPCION, PORCIMPACOMPRA, CODINDICEECONOMICO) VALUES('monitores',13,1);
INSERT INTO t_familias(DESCRIPCION, PORCIMPACOMPRA, CODINDICEECONOMICO) VALUES('escáneres',13,1);
INSERT INTO t_familias(DESCRIPCION, PORCIMPACOMPRA, CODINDICEECONOMICO) VALUES('unidades de CD-ROM',13,1);
INSERT INTO t_familias(DESCRIPCION, PORCIMPACOMPRA, CODINDICEECONOMICO) VALUES('CPU',13,1);
INSERT INTO t_familias(DESCRIPCION, PORCIMPACOMPRA, CODINDICEECONOMICO) VALUES('microcomputadores',13,1);
INSERT INTO t_familias(DESCRIPCION, PORCIMPACOMPRA, CODINDICEECONOMICO) VALUES('PLC',13,1);
INSERT INTO t_familias(DESCRIPCION, PORCIMPACOMPRA, CODINDICEECONOMICO) VALUES('soluciones integradas',13,1);
INSERT INTO t_familias(DESCRIPCION, PORCIMPACOMPRA, CODINDICEECONOMICO) VALUES('sistema operativo',13,1);
INSERT INTO t_familias(DESCRIPCION, PORCIMPACOMPRA, CODINDICEECONOMICO) VALUES('software de oficina',13,1);
INSERT INTO t_familias(DESCRIPCION, PORCIMPACOMPRA, CODINDICEECONOMICO) VALUES('ambiente de desarrollo',13,1);
INSERT INTO t_familias(DESCRIPCION, PORCIMPACOMPRA, CODINDICEECONOMICO) VALUES('software de base de datos',13,1);

--para verificar
SELECT * FROM t_familias;


-------------------------------------------------
--insertar monedas
-------------------------------------------------
INSERT INTO t_monedas(NOMBRE) VALUES('dolares');
INSERT INTO t_monedas(NOMBRE) VALUES('colones');

--para verificar
SELECT * FROM t_monedas;



-------------------------------------------------
--insertar unidades de medidas
-------------------------------------------------
INSERT INTO t_unidadMedidas(DESCRIPCION) VALUES('unidad estandar');

--para verificar
SELECT * FROM t_unidadMedidas;


-------------------------------------------------
--insertar marcas
-------------------------------------------------
INSERT INTO t_marcas(DESCRIPCION) VALUES('Samsung');
INSERT INTO t_marcas(DESCRIPCION) VALUES('Toshiba');
INSERT INTO t_marcas(DESCRIPCION) VALUES('Dell');
INSERT INTO t_marcas(DESCRIPCION) VALUES('Apple');
INSERT INTO t_marcas(DESCRIPCION) VALUES('Hitachi');

--para verificar
SELECT * FROM t_marcas;


-------------------------------------------------
--insertar estados de los articulos
-------------------------------------------------
INSERT INTO t_articuloEstados(DESCRIPCION) VALUES('Activo');
INSERT INTO t_articuloEstados(DESCRIPCION) VALUES('Inactivo');

--para verificar
SELECT * FROM t_articuloEstados;



-------------------------------------------------
--insertar permisos de usuarios
-------------------------------------------------
INSERT INTO t_permisoUsuarios(DESCRIPCION) VALUES('Todos');

--para verificar
SELECT * FROM t_permisoUsuarios;


-------------------------------------------------
--insertar tipos de usuarios
-------------------------------------------------
INSERT INTO t_tipoUsuarios(CODUSERPERMISO,DESCRIPCION) VALUES(1,'Administrador');

--para verificar
SELECT * FROM t_tipoUsuarios;



-------------------------------------------------
--insertar usuarios
-------------------------------------------------
INSERT INTO t_usuarios(NBRLOGIN, CLVLOGIN, CODUSERTIPO) VALUES('admin','admin',1);

--para verificar
SELECT * FROM t_usuarios;


-------------------------------------------------
--insertar articulos
-------------------------------------------------
INSERT INTO t_articulos(CODIGO, DESCRIPCION, UNDMEDIDA, CODMARCA, MODELO, FECREGISTRO, CODFAMILIA, CODESTARTICULO, CODUSERREGISTRO, CANTIDAD, CANTMAXIMA, CANTMINIMA, PRECIOMERCDOLARES, FECHAACTPRECIO)
VALUES('FTCO2175','Monitor pantalla plana de 21 pulgadas', 1, 1, 'Pantalla Plana', getdate(), 1, 1, 'admin', 10, 5, 20, 50, getdate());
INSERT INTO t_articulos(CODIGO, DESCRIPCION, UNDMEDIDA, CODMARCA, MODELO, FECREGISTRO, CODFAMILIA, CODESTARTICULO, CODUSERREGISTRO, CANTIDAD, CANTMAXIMA, CANTMINIMA, PRECIOMERCDOLARES, FECHAACTPRECIO)
VALUES('SL02.8G08ME500SSD','carcaza slim 8 GB RAM, 500 GB disco duro', 1, 2, 'CPU Slim', getdate(), 9, 1, 'admin', 5, 1, 10, 100, getdate());
INSERT INTO t_articulos(CODIGO, DESCRIPCION, UNDMEDIDA, CODMARCA, MODELO, FECREGISTRO, CODFAMILIA, CODESTARTICULO, CODUSERREGISTRO, CANTIDAD, CANTMAXIMA, CANTMINIMA, PRECIOMERCDOLARES, FECHAACTPRECIO)
VALUES('INCOHO','Impresora color inyeccion de tinta', 1, 1, 'Inyeccion', getdate(), 5, 1, 'admin', 3, 1, 10, 40, getdate());
INSERT INTO t_articulos(CODIGO, DESCRIPCION, UNDMEDIDA, CODMARCA, MODELO, FECREGISTRO, CODFAMILIA, CODESTARTICULO, CODUSERREGISTRO, CANTIDAD, CANTMAXIMA, CANTMINIMA, PRECIOMERCDOLARES, FECHAACTPRECIO)
VALUES('FP110','Fuente de poder 110V', 1, 5, '110V', getdate(), 9, 1, 'admin', 2, 1, 10, 25, getdate());

--para verificar
SELECT * FROM t_articulos;



-------------------------------------------------
--insertar componentes
-------------------------------------------------
INSERT INTO t_componentes(CODCOMPONENTE, CODARTICULO) VALUES('FP110','FP110');

--para verificar
SELECT * FROM t_componentes;



-------------------------------------------------
--insertar listas de precios
-------------------------------------------------
INSERT INTO t_listaPrecios(DESCRIPCION, GASTOADMIN, GASTOOTROS, UTILIDAD) VALUES('Sector publico', 150, 100, 50);
INSERT INTO t_listaPrecios(DESCRIPCION, GASTOADMIN, GASTOOTROS, UTILIDAD) VALUES('Sector privador', 120, 99, 60);
INSERT INTO t_listaPrecios(DESCRIPCION, GASTOADMIN, GASTOOTROS, UTILIDAD) VALUES('Cliente contado', 100, 80, 30);
INSERT INTO t_listaPrecios(DESCRIPCION, GASTOADMIN, GASTOOTROS, UTILIDAD) VALUES('Cliente frecuente-contado', 90, 80, 30);
INSERT INTO t_listaPrecios(DESCRIPCION, GASTOADMIN, GASTOOTROS, UTILIDAD) VALUES('Cliente credito', 200, 150, 50);
INSERT INTO t_listaPrecios(DESCRIPCION, GASTOADMIN, GASTOOTROS, UTILIDAD) VALUES('Importados', 150, 80, 35);

--para verificar
SELECT * FROM t_listaPrecios;




INSERT INTO T_CotizacionEstados(descripcion) VALUES('emitida');
INSERT INTO T_CotizacionEstados(descripcion) VALUES('no emitida');

INSERT INTO T_Paises(nombre) VALUES('Costa Rica');

INSERT INTO T_Provincias(nombre,codPais) VALUES('Cartago', (SELECT codPais FROM T_Paises WHERE nombre = 'Costa Rica'));

INSERT INTO T_Cuidades(nombre,codProvincia) VALUES('Cartago',(SELECT codProvincia FROM T_Provincias WHERE nombre = 'Cartago'));

INSERT INTO T_DetalleDireccion(codCiudad,aparPostal,detalle1,detalle2) VALUES((SELECT codCiudad FROM T_Cuidades WHERE nombre = 'Cartago'),'5051','Tec','ITCR');

INSERT INTO T_TipoEmpresa(nombre) VALUES ('proveedor');

INSERT INTO T_Empresa(cedulaJuridica,nombreComercial,direccion,codTipoEmpresa) VALUES ('12345','empresa proveedora',1,1);

INSERT INTO T_MesAnio(mes,anio) VALUES(1,2015);

INSERT INTO T_Cotizaciones(fecRegistro,cedJurCliente,condicionPago,condicionVenta,vigencia,observaciones,codMoneda,codEstadoCotiz,codListaPrecios,mesEntreg,anioEntreg)
					VALUES(GETDATE(),(SELECT cedulaJuridica FROM T_Empresa WHERE nombreComercial = 'empresa proveedora'),'Pago Contado','Venta Contado','vigente','Sin observaciones', (SELECT codigo FROM T_Monedas WHERE nombre = 'dolares'),(SELECT codigo FROM T_CotizacionEstados WHERE descripcion = 'emitida'),(SELECT codigo FROM T_ListaPrecios WHERE descripcion = 'sector publico'),1,2015);

INSERT INTO T_Cotizaciones(fecRegistro,cedJurCliente,condicionPago,condicionVenta,vigencia,observaciones,codMoneda,codEstadoCotiz,codListaPrecios,mesEntreg,anioEntreg)
					VALUES(GETDATE(),(SELECT cedulaJuridica FROM T_Empresa WHERE nombreComercial = 'empresa proveedora'),'Pago Contado','Venta Contado','vigente','Sin observaciones', (SELECT codigo FROM T_Monedas WHERE nombre = 'dolares'),(SELECT codigo FROM T_CotizacionEstados WHERE descripcion = 'emitida'),(SELECT codigo FROM T_ListaPrecios WHERE descripcion = 'sector publico'),1,2015);

INSERT INTO T_ArticulosCotizados(numCotizacion,codArticulo,undMedida,cantidad,porcenDescuento,costoUnitario,costoGrabado,montoLinea)
						VALUES(1000,'FP110',(SELECT codigo FROM T_UnidadMedidas WHERE descripcion = 'unidad estandar'),10,10,100,100,100);

INSERT INTO T_ArticulosCotizados(numCotizacion,codArticulo,undMedida,cantidad,porcenDescuento,costoUnitario,costoGrabado,montoLinea)
						VALUES(1001,'INCOHO',(SELECT codigo FROM T_UnidadMedidas WHERE descripcion = 'unidad estandar'),10,10,100,100,100);