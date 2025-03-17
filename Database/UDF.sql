--UDF


--UDF 1

CREATE FUNCTION Calculate_Days_Subscribed (@RecordID INT)
RETURNS INT
AS
BEGIN
    DECLARE @DaysSubscribed INT;
    SELECT @DaysSubscribed = DATEDIFF(day, Service_startdate, Service_enddate)
    FROM User_service_record
    WHERE RecordID = @RecordID;

    RETURN @DaysSubscribed;
END;

--UDF 2

CREATE FUNCTION Get_User_Email (@UserID INT)
RETURNS VARCHAR(50)
AS
BEGIN
    DECLARE @Email VARCHAR(50);
    SELECT @Email = Email
    FROM [User]
    WHERE UserID = @UserID;

    RETURN @Email;
END;


--UDF 3

CREATE FUNCTION Is_Service_Active (@UserID INT, @ServiceID INT)
RETURNS BIT
AS
BEGIN
    DECLARE @IsActive BIT;
    SELECT @IsActive = CASE 
                        WHEN EXISTS (
                            SELECT 1
                            FROM User_service_record
                            WHERE UserID = @UserID
                            AND ServiceID = @ServiceID
                            AND GETDATE() BETWEEN Service_startdate AND Service_enddate
                        ) THEN 1
                        ELSE 0
                       END;
    RETURN @IsActive;
END;


--UDF 4


CREATE FUNCTION Get_Provider_Contact (@ProviderName VARCHAR(255))
RETURNS VARCHAR(255)
AS
BEGIN
    DECLARE @Contact VARCHAR(255);
    SELECT @Contact = Contact
    FROM Service_Provider
    WHERE ProviderName = @ProviderName;
    RETURN @Contact;
END;



--UDF 5



CREATE FUNCTION Calculate_Remaining_Expiry_Days (@PaymentID INT)
RETURNS INT
AS
BEGIN
    DECLARE @RemainingDays INT;
    SELECT @RemainingDays = DATEDIFF(day, GETDATE(), Date_of_Expiry)
    FROM Expiry
    WHERE PaymentID = @PaymentID;
    RETURN @RemainingDays;
END;