--DML TRIGGER


-- 1. Trigger to update the User_service_record end date when a payment is made.
CREATE TRIGGER TR_PaymentMade_UpdateUserRecordEndDate
ON Payment
AFTER INSERT
AS
BEGIN
    UPDATE User_service_record
    SET Service_enddate = DATEADD(month, 1, Service_enddate)  -- Extend by one month (adjust as needed)
    WHERE RecordID IN (SELECT RecordID FROM inserted); -- Use inserted table to get affected records
END;


-- 2. Trigger to prevent deleting a service provider if they have active services.
CREATE TRIGGER TR_PreventDeleteServiceProvider
ON Service_Provider
INSTEAD OF DELETE  -- Use INSTEAD OF for DELETE triggers
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM deleted d  -- deleted pseudo-table for deleted records
        JOIN Services s ON d.ProviderID = s.ProviderID
        JOIN User_service_record usr ON s.ServiceID = usr.ServiceID
        WHERE usr.Service_enddate >= GETDATE() -- Check for active user records
    )
    BEGIN
        RAISERROR('Cannot delete provider with active services.', 16, 1);
        ROLLBACK TRANSACTION;  -- Prevent the deletion
    END;
    ELSE
    BEGIN
        -- Allow the deletion if no active services
        DELETE FROM Service_Provider
        WHERE ProviderID IN (SELECT ProviderID FROM deleted);
    END;
END;