-- nonclustered indexes

-- nonclustered index 1

CREATE NONCLUSTERED INDEX IX_User_Email
ON [User] (Email);

-- nonclustered index 2

CREATE NONCLUSTERED INDEX IX_Services_Service_Type
ON Services (Service_Type);

-- nonclustered index 3

CREATE NONCLUSTERED INDEX IX_Payment_PaymentDate
ON Payment (PaymentDate);

-- nonclustered index 4

CREATE NONCLUSTERED INDEX IX_User_service_record_Service_startdate
ON User_service_record (Service_startdate);

-- nonclustered index 5

CREATE NONCLUSTERED INDEX IX_Service_Provider_ProviderName
ON Service_Provider (ProviderName);
