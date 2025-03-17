-- views 1
CREATE VIEW User_Service_Details AS
SELECT u.First_Name, u.Last_Name, s.Service_Type, sp.ProviderName, usr.Service_startdate, usr.Service_enddate, usr.Service_charge
FROM [User] u
JOIN User_service_record usr ON u.UserID = usr.UserID
JOIN Services s ON usr.ServiceID = s.ServiceID
JOIN Service_Provider sp ON s.ProviderID = sp.ProviderID;


-- views 2

CREATE VIEW Provider_Service_Summary AS
SELECT sp.ProviderName, s.Service_Type, COUNT(DISTINCT usr.UserID) AS NumberOfUsers
FROM Service_Provider sp
JOIN Services s ON sp.ProviderID = s.ProviderID
LEFT JOIN User_service_record usr ON s.ServiceID = usr.ServiceID
GROUP BY sp.ProviderName, s.Service_Type;

-- views 3

CREATE VIEW Payment_Summary_by_Method AS
SELECT PaymentMethod, COUNT(*) AS NumberOfPayments, SUM(Payment_Amount) AS TotalPaymentAmount -- Added TotalPaymentAmount
FROM Payment
JOIN Payment_Reminder pr ON Payment.PaymentID = pr.PaymentID  -- Join with Payment_Reminder
GROUP BY PaymentMethod;


-- views 4


CREATE VIEW Expiry_Report AS
SELECT p.PaymentID, p.PaymentMethod, e.Date_of_Expiry
FROM Payment p
JOIN Expiry e ON p.PaymentID = e.PaymentID
WHERE e.Date_of_Expiry < DATEADD(month, 1, GETDATE()); -- Payments expiring within the next month


-- views 5


CREATE VIEW Usage_Log_Summary AS
SELECT s.Service_Type, sp.ProviderName, SUM(ul.Usage_Duration) AS TotalUsageDuration, 
       AVG(ul.Usage_Duration) AS AverageUsageDuration
FROM Usage_Log ul
JOIN Services s ON ul.ServiceID = s.ServiceID
JOIN Service_Provider sp ON s.ProviderID = sp.ProviderID
GROUP BY s.Service_Type, sp.ProviderName;
