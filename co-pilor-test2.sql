-- Create temp table
CREATE TABLE #TempTable (
    ID INT IDENTITY(1,1),
    FirstName VARCHAR(50),
    LastName VARCHAR(50)
);

-- Insert values into temp table
INSERT INTO #TempTable (FirstName, LastName)
VALUES ('John', 'Doe'),
       ('Jane', 'Smith'),
       ('Michael', 'Johnson');

-- Declare variables for loop
DECLARE @ID INT,
        @FirstName VARCHAR(50),
        @LastName VARCHAR(50);

-- Initialize variables
SELECT @ID = MIN(ID),
       @FirstName = MIN(FirstName),
       @LastName = MIN(LastName)
FROM #TempTable;

-- While loop to update Employee table
WHILE @ID IS NOT NULL
BEGIN
    UPDATE Employee
    SET FirstName = @FirstName,
        LastName = @LastName
    WHERE EmployeeId = @ID;

    -- Get next values from temp table
    SELECT @ID = MIN(ID),
           @FirstName = MIN(FirstName),
           @LastName = MIN(LastName)
    FROM #TempTable
    WHERE ID > @ID;
END;

-- Drop temp table
DROP TABLE #TempTable;


