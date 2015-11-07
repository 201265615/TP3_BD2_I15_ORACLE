-----------------------------------------------------------
-- Autor: Kevin Alonso Escobar Miranda, Moises Viales Espinoza, Marcos Calderon Badilla
-- Fecha: 22/05/2015
-- Descripcion: Para un artículo determinado listar sus componentes. //with encryption
-- @pCodigo: codigo del articulo
-----------------------------------------------------------
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'SP_ComponentesArticulo')
DROP PROCEDURE SP_ComponentesArticulo
GO
CREATE PROCEDURE SP_ComponentesArticulo  --<Prefijo>SP_accionObjeto
@pCodigo VARCHAR(20)

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
		
		SELECT C.codComponente, (SELECT descripcion FROM T_Articulos WHERE codigo = C.codComponente) descripcion 
		FROM T_Componentes C
		WHERE codArticulo = @pCodigo

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
	
RETURN 0






-----------------------------------------------------------
-- Autor: Kevin Alonso Escobar Miranda, Moises Viales Espinoza, Marcos Calderon Badilla
-- Fecha: 22/05/2015
-- Descripcion: Para un componente determinado listar los articulos a los que pertenece. //with encryption
-- @@pCodComponente: codigo del componente
-----------------------------------------------------------
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'SP_ArticulosComponente')
DROP PROCEDURE SP_ArticulosComponente
GO
CREATE PROCEDURE SP_ArticulosComponente  --<Prefijo>SP_accionObjeto
@pCodComponente varchar(20)

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
		
		SELECT C.codArticulo, (SELECT descripcion FROM T_Articulos WHERE codigo = C.codArticulo) descripcion
		FROM T_Componentes C
		WHERE C.codComponente = @pCodComponente

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
	
RETURN 0



-----------------------------------------------------------
-- Autor: Kevin Alonso Escobar Miranda, Moises Viales Espinoza, Marcos Calderon Badilla
-- Fecha: 27/05/2015
-- Descripcion: Inserta una nueva factura
-- @pCodUserRegistro: nombre del usuario
-----------------------------------------------------------
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'SP_InsertarFactura')
DROP PROCEDURE SP_InsertarFactura
GO
CREATE PROCEDURE SP_InsertarFactura  --<Prefijo>SP_accionObjeto
@pCodUserRegistro varchar(20)

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
		
		INSERT INTO T_FacturaCompras(fecCompra,fecRegistro,codUserRegistro) VALUES(GETDATE(),GETDATE(),@pCodUserRegistro);

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
	
RETURN 0




-----------------------------------------------------------
-- Autor: Kevin Alonso Escobar Miranda, Moises Viales Espinoza, Marcos Calderon Badilla
-- Fecha: 27/05/2015
-- Descripcion: Inserta una nueva linea en una factura factura
-- @pCodFactura: codigo de la factura
-- @pCodArticulo: codigo del articulo que se inserta en la linea de la factura
-- @pCantidad: cantidad que se agregaran a los articulos
-- @pPrecioDolares: precio que se le actualizara a los articulos
-----------------------------------------------------------
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'SP_InsertarLineaFactura')
DROP PROCEDURE SP_InsertarLineaFactura
GO
CREATE PROCEDURE SP_InsertarLineaFactura  --<Prefijo>SP_accionObjeto
@pCodFactura int,
@pCodArticulo varchar(20),
@pCantidad int,
@pPrecioDolares decimal(17,2)
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
		
		INSERT INTO T_LineasFacturaCompras(codFactura,codArticulo,cantidad,precioDolares) VALUES(@pCodFactura,@pCodArticulo,@pCantidad,@pPrecioDolares);

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
	
RETURN 0





-----------------------------------------------------------
-- Autor: Kevin Alonso Escobar Miranda, Moises Viales Espinoza, Marcos Calderon Badilla
-- Fecha: 27/05/2015
-- Descripcion: Elimina una cotizacion y todos sus articulos cotizados
-- @pCodCotizacion: codigo de la cotizacion
-----------------------------------------------------------
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'SP_EliminarCotizacion')
DROP PROCEDURE SP_EliminarCotizacion
GO
CREATE PROCEDURE SP_EliminarCotizacion  --<Prefijo>SP_accionObjeto
@pCodCotizacion int
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
		
		DELETE FROM T_Cotizaciones WHERE numero = @pCodCotizacion;

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
	
RETURN 0

