
--  Stores procedure 1
CREATE PROCEDURE Get_User_Services
    @UserID INT,
    @ServiceCount INT OUTPUT
AS
BEGIN
    SELECT s.Service_Type, usr.Service_startdate, usr.Service_enddate
    FROM User_service_record usr
    JOIN Services s ON usr.ServiceID = s.ServiceID
    WHERE usr.UserID = @UserID;

    SELECT @ServiceCount = COUNT(*) 
    FROM User_service_record
    WHERE UserID = @UserID;
END;


--  Stores procedure 2

CREATE PROCEDURE Calculate_Total_User_Charges
    @UserID INT,
    @StartDate DATE,
    @EndDate DATE,
    @TotalCharges DECIMAL(10,2) OUTPUT
AS
BEGIN
    SELECT @TotalCharges = SUM(Service_charge)
    FROM User_service_record
    WHERE UserID = @UserID
      AND Service_startdate >= @StartDate
      AND Service_enddate <= @EndDate;
END;

--  Stores procedure 3

CREATE PROCEDURE Get_Provider_Services 
    @ProviderID INT,
    @ServiceCount INT OUTPUT
AS
BEGIN
    SELECT Service_Type, Service_Address
    FROM Services
    WHERE ProviderID = @ProviderID;

    SELECT @ServiceCount = COUNT(*)
    FROM Services
    WHERE ProviderID = @ProviderID;
END;

--  Stores procedure 4

CREATE PROCEDURE Get_Payment_Details_by_User
    @UserID INT,
    @PaymentCount INT OUTPUT
AS
BEGIN
    SELECT p.PaymentMethod, p.PaymentDate, p.PaymentAddress
    FROM Payment p
    JOIN User_service_record usr ON p.RecordID = usr.RecordID
    WHERE usr.UserID = @UserID;

    SELECT @PaymentCount = COUNT(*)
    FROM Payment p
    JOIN User_service_record usr ON p.RecordID = usr.RecordID
    WHERE usr.UserID = @UserID;
END;

--  Stores procedure 5

CREATE PROCEDURE Get_Overdue_Payments
    @CurrentDate DATE,  -- Input parameter
    @OverdueCount INT OUTPUT  -- Output parameter
AS
BEGIN
    SELECT pr.Payment_Amount, pr.PaymentDueDate
    FROM Payment_Reminder pr
    WHERE pr.PaymentDueDate < @CurrentDate;

    SELECT @OverdueCount = COUNT(*)
    FROM Payment_Reminder
    WHERE PaymentDueDate < @CurrentDate;
END;
