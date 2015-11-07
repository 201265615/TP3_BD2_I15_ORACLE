-----------------------------------------------------------
-- Autor: Kevin Alonso Escobar Miranda, Moises Viales Espinoza, Marcos Calderon Badilla
-- Fecha: 22/05/2015
-- Descripcion: actualizar de los precios de los artículos cuando se registran las facturas de los proveedores. //with encryption
-----------------------------------------------------------
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'TR' AND name = 'AFT_INS_PrecioFac_UPD_Artic')
DROP TRIGGER AFT_INS_PrecioFac_UPD_Artic
GO
CREATE TRIGGER AFT_INS_PrecioFac_UPD_Artic
ON T_LineasFacturaCompras
 
AFTER INSERT
NOT FOR REPLICATION
AS 
    SET NOCOUNT ON  -- apagar el envio de metadatos
     
    -- Variables para control de transaccion
    DECLARE @ErrorNumber INT, @ErrorSeverity INT, @ErrorState INT, @CustomError INT
    DECLARE @Message VARCHAR(200)
    DECLARE @InicieTransaccion BIT
 
    -- Realizar todas las operaciones de lectura posibles y precalculos que 
    -- no sean parte o que puedan realizarse fuera de la transaccion
     
     
    SET @InicieTransaccion = 0 -- control de transacciones
    IF @@TRANCOUNT=0 BEGIN
        SET @InicieTransaccion = 1
        SET TRANSACTION ISOLATION LEVEL READ COMMITTED
        BEGIN TRANSACTION      
    END        
     
    BEGIN TRY -- control de excepciones
     
        --SELECT * FROM INSERTED I;
         
        UPDATE A
        SET codUserRegistro = 'admin',
            A.cantidad = A.cantidad + I.cantidad,
            fechaActPrecio = GETDATE(),
            precioMercDolares = I.precioDolares
        FROM T_Articulos A JOIN INSERTED I
            ON A.codigo = I.codArticulo;
         
 
        IF @InicieTransaccion=1 BEGIN
            COMMIT
        END    
    END TRY
    BEGIN CATCH
        SET @ErrorNumber = ERROR_NUMBER()
        SET @ErrorSeverity = ERROR_SEVERITY()
        SET @ErrorState = ERROR_STATE()
        SET @Message = ERROR_MESSAGE()
         
        IF @InicieTransaccion=1 BEGIN
            ROLLBACK
        END
        RAISERROR('%s - Error Number: %i', 
            @ErrorSeverity, @ErrorState, @Message, @CustomError)
    END CATCH   
     
RETURN
 
 
 
 
 
 
-----------------------------------------------------------
-- Autor: Kevin Alonso Escobar Miranda, Moises Viales Espinoza, Marcos Calderon Badilla
-- Fecha: 22/05/2015
-- Descripcion: tal que antes  de  eliminar  una cotización, cuyo estado sea emitida, grabe en tablas de históricos los datos de  ésta y sus líneas //with encryption
-----------------------------------------------------------
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'TR' AND name = 'BEF_DEL_COTIZ_INS_HISTO')
DROP TRIGGER BEF_DEL_COTIZ_INS_HISTO
GO
CREATE TRIGGER BEF_DEL_COTIZ_INS_HISTO
ON T_Cotizaciones
 
INSTEAD OF DELETE
NOT FOR REPLICATION
AS
    SET NOCOUNT ON  -- apagar el envio de metadatos
      
    -- Variables para control de transaccion
    DECLARE @ErrorNumber INT, @ErrorSeverity INT, @ErrorState INT, @CustomError INT
    DECLARE @Message VARCHAR(200)
    DECLARE @InicieTransaccion BIT
  
    -- Realizar todas las operaciones de lectura posibles y precalculos que 
    -- no sean parte o que puedan realizarse fuera de la transaccion
     --print 'Inicio'
      
    SET @InicieTransaccion = 0 -- control de transacciones
    IF @@TRANCOUNT=0 BEGIN
        SET @InicieTransaccion = 1
        SET TRANSACTION ISOLATION LEVEL READ COMMITTED
        BEGIN TRANSACTION     
    END       
      
    BEGIN TRY -- control de excepciones
     IF ((SELECT codEstadoCotiz FROM DELETED) = (SELECT codigo FROM T_CotizacionEstados WHERE descripcion = 'emitida')) BEGIN
        -- INSERTAR LA COTIZACION EN EL HISTORIAL
        INSERT INTO T_CotizacionesHisto(
            fecRegistro,
            cedJurCliente,
            condicionPago,
            condicionVenta,
            vigencia,
            observaciones,
            codMoneda,
            codEstadoCotiz,
            codListaPrecios,
            mesEntreg,
            AnioEntreg,
            cotizacionBorrada
        )
        VALUES(
             
            (SELECT fecRegistro FROM DELETED),
            (SELECT cedJurCliente FROM DELETED),
            (SELECT condicionPago FROM DELETED),
            (SELECT condicionVenta FROM DELETED),
            (SELECT vigencia FROM DELETED),
            (SELECT observaciones FROM DELETED),
            (SELECT codMoneda FROM DELETED),
            (SELECT codEstadoCotiz FROM DELETED),
            (SELECT codListaPrecios FROM DELETED),
            (SELECT month(fecha) FROM DELETED),
            (SELECT year(fecha) FROM DELETED),
            (SELECT numero FROM DELETED)
        );
          
         --print 'despues insertar cotizaioneshisto'
          
        -- CURSOR QUE RECORRE LOS ARTICULOS COTIZADOS DE LA COTIZCION A ELIMINAR 
        -- Declaracion de variables para el cursor
        DECLARE @Id int,
             
            @v_codArticulo varchar(20),
            @v_undMedida tinyint,
            @v_cantidad int,
            @v_porcenDecuento tinyint,
            @v_costoUnitario decimal(17,2),
            @v_montoLinea decimal(17,2)
              
        -- Declaración del cursor
        DECLARE cursor_ArticulosCotizados CURSOR FOR
        SELECT
 
            AC.codArticulo,
            AC.undMedida,
            AC.cantidad,
            AC.porcenDescuento,
            AC.costoUnitario,
            AC.montoLinea
        FROM T_ArticulosCotizados AC where AC.numCotizacion = (SELECT numero FROM DELETED)
  
        --print 'despues crear cursor'
        -- Apertura del cursor
        OPEN cursor_ArticulosCotizados
  
        -- Lectura de la primera fila del cursor
        FETCH cursor_ArticulosCotizados INTO
             
            @v_codArticulo,
            @v_undMedida,
            @v_cantidad,
            @v_porcenDecuento,
            @v_costoUnitario,
            @v_montoLinea
          
        --print 'antes del while'
        --print @@FETCH_STATUS
        WHILE (@@FETCH_STATUS = 0 )
          
        -- Realizar accion  
        BEGIN
  
            INSERT INTO T_ArticulosCotizadosHisto(
                numCotizacion,
                codArticulo,
                undMedida,
                cantidad,
                porcenDescuento,
                costoUnitario,
                montoLinea,
                T_CotizacionesHistonumCotizacion)
            VALUES(
                (SELECT numero FROM T_CotizacionesHisto WHERE cotizacionBorrada = (SELECT numero FROM DELETED)), -- Selecciona el ultimo insertado
                @v_codArticulo,
                @v_undMedida,
                @v_cantidad,
                @v_porcenDecuento,
                @v_costoUnitario,
                @v_montoLinea,
                (SELECT numero FROM DELETED)
            )
      
     --print 'despues insertar articuloshisto'
 
            -- Lectura de la siguiente fila del cursor
            FETCH cursor_ArticulosCotizados INTO
                 
                @v_codArticulo,
                @v_undMedida,
                @v_cantidad,
                @v_porcenDecuento,
                @v_costoUnitario,
                @v_montoLinea
                  
        END
        
 
         -- Cierre del cursor
        CLOSE cursor_ArticulosCotizados
        -- Liberar los recursos
        DEALLOCATE cursor_ArticulosCotizados
 
        END -- en del if para verificar que solo sea emitida
 
        DELETE FROM T_Cotizaciones WHERE numero = (SELECT numero FROM DELETED); --borrar todas las lineas de cotizacion aunque no sea emitida
 
 
        IF @InicieTransaccion=1 BEGIN
            COMMIT
        END   
    END TRY
    BEGIN CATCH
        SET @ErrorNumber = ERROR_NUMBER()
        SET @ErrorSeverity = ERROR_SEVERITY()
        SET @ErrorState = ERROR_STATE()
        SET @Message = ERROR_MESSAGE()
          
        IF @InicieTransaccion=1 BEGIN
            ROLLBACK
        END
        RAISERROR('%s - Error Number: %i', 
            @ErrorSeverity, @ErrorState, @Message, @CustomError)
    END CATCH   
      
RETURN