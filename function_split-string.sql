CREATE FUNCTION split_string
(
	@input varchar(MAX),
	@delimiter char(1)
)
RETURNS @result TABLE(
	kata varchar(50)
)
BEGIN
	DECLARE @splitted TABLE(
		kata varchar(50)
	)

	INSERT INTO @splitted
	SELECT *
	FROM string_split(@input, @delimiter)

	DECLARE cursorSplit CURSOR
	FOR
	SELECT kata
	FROM @splitted
	
	OPEN cursorSplit

	DECLARE @temp varchar(50)

	FETCH NEXT FROM cursorSplit INTO @temp
	WHILE @@FETCH_STATUS = 0
	BEGIN
		IF (@temp != '')
		BEGIN
			INSERT INTO @result
			SELECT @temp
		END
		FETCH NEXT FROM cursorSplit INTO @temp
	END

	CLOSE cursorSplit
	DEALLOCATE cursorSplit

	RETURN
END