ALTER VIEW empleados AS
SELECT CONCAT(first_name,' ', last_name) as fullName, salary_per_hour From empoyees

SELECT * FROM empleados

CREATE PROCEDURE Insertar_Empleados_ALOLOCO ( 
	@alias varchar(50),
	@salary money,
	@NOI INT
) as
BEGIN
	declare @n int 
	select @n = 1
	while @n >=1 and @n <= @NOI
	begin
	SET @salary = FLOOR(@salary + RAND() * (@salary + 1000 ))
	
	INSERT INTO empoyees (first_name, last_name, schedule, salary_per_hour)
	VALUES('Mr',@alias,'Asignable'+' '+@n ,@salary)
	
	end
END


ALTER PROCEDURE Insertar_Empleados_ALOLOCO ( 
	@alias varchar(50),
	@salary money,
	@NOI INT
) as
BEGIN
	declare @n int 
	select @n = 1
	while @n >=1 and @n <= @NOI
	begin
	SET @salary = FLOOR(@salary + RAND() * (@salary + 1000 ))
	
	INSERT INTO empoyees (first_name, last_name, schedule, salary_per_hour)
	VALUES('Mr',@alias,'Asignable'+' '+CAST(@n AS varchar(10)) ,@salary)
	set @n= @n+1;
	end
END