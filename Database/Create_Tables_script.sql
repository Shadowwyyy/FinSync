

--CREATE DATABASE DMDDPROJECT

-- Drop objects if they exist 
IF OBJECT_ID('User_Notification') IS NOT NULL DROP TABLE User_Notification;
IF OBJECT_ID('Usage_Log') IS NOT NULL DROP TABLE Usage_Log;
IF OBJECT_ID('EMI') IS NOT NULL DROP TABLE EMI;
IF OBJECT_ID('Membership') IS NOT NULL DROP TABLE Membership;
IF OBJECT_ID('Subscription') IS NOT NULL DROP TABLE Subscription;
IF OBJECT_ID('Plan') IS NOT NULL DROP TABLE [Plan];
IF OBJECT_ID('Payment_Reminder') IS NOT NULL DROP TABLE Payment_Reminder;
IF OBJECT_ID('Expiry') IS NOT NULL DROP TABLE Expiry;
IF OBJECT_ID('Payment') IS NOT NULL DROP TABLE Payment;
IF OBJECT_ID('User_service_record') IS NOT NULL DROP TABLE User_service_record;
IF OBJECT_ID('Services') IS NOT NULL DROP TABLE Services;
IF OBJECT_ID('Service_Provider') IS NOT NULL DROP TABLE Service_Provider;
IF OBJECT_ID('Notification') IS NOT NULL DROP TABLE Notification;
IF OBJECT_ID('User') IS NOT NULL DROP TABLE [User];

CREATE TABLE [User] (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    First_Name VARCHAR(25) NOT NULL,
    Last_Name VARCHAR(25) NOT NULL,
    Email VARCHAR(50) UNIQUE NOT NULL,
    Phone_Number VARCHAR(20),
    Date_Joined DATE,
    [UserPassword] VARCHAR(255) NOT NULL
);


CREATE TABLE Service_Provider (
    ProviderID INT IDENTITY(1,1) PRIMARY KEY,
    ProviderName VARCHAR(255) NOT NULL,
    Contact VARCHAR(255),
    EndDate DATE,
    StartDate DATE
);

CREATE TABLE Services (
    ServiceID INT IDENTITY(1,1) PRIMARY KEY,
    ProviderID INT,
    Service_Type VARCHAR(255),
    Service_Address VARCHAR(255),
    Login_Credential VARCHAR(255),
    FOREIGN KEY (ProviderID) REFERENCES Service_Provider(ProviderID)
);

CREATE TABLE User_service_record (
    RecordID INT IDENTITY(1,1) PRIMARY KEY,
    Service_startdate DATE,
    Service_enddate DATE,
    Service_charge DECIMAL(10,2) CHECK (Service_charge >= 0),
    ServiceID INT,
    UserID INT,
    FOREIGN KEY (ServiceID) REFERENCES Services(ServiceID),
    FOREIGN KEY (UserID) REFERENCES [User](UserID)
);

CREATE TABLE Payment (
    PaymentID INT IDENTITY(1,1) PRIMARY KEY,
    PaymentMethod VARCHAR(100) CHECK (PaymentMethod IN ('Credit Card', 'Debit Card', 'UPI', 'Net Banking','PayPal')), -- CHECK constraint
    PaymentDate DATE,
    PaymentAddress VARCHAR(255),
	RecordID INT,
    FOREIGN KEY (RecordID) REFERENCES User_service_record(RecordID)
);

CREATE TABLE Expiry (
    ExpiryID INT IDENTITY(1,1) PRIMARY KEY,
    Date_of_Expiry DATE,
    PaymentID INT,
    FOREIGN KEY (PaymentID) REFERENCES Payment(PaymentID)
);

CREATE TABLE Payment_Reminder (
    ReminderID INT IDENTITY(1,1) PRIMARY KEY,
    Payment_Amount DECIMAL(10,2) CHECK (Payment_Amount > 0), -- CHECK constraint
    PaymentDueDate DATE,
    PaymentID INT,
    FOREIGN KEY (PaymentID) REFERENCES Payment(PaymentID)
);

CREATE TABLE Notification (
    NotificationID INT IDENTITY(1,1) PRIMARY KEY,
    Notification_Date DATETIME,
    Status VARCHAR(20) 
);

CREATE TABLE User_Notification (
    UserNotificationID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT,
    NotificationID INT,
    FOREIGN KEY (UserID) REFERENCES [User](UserID),
    FOREIGN KEY (NotificationID) REFERENCES Notification(NotificationID)
);

CREATE TABLE [Plan] (
    PlanID INT IDENTITY(1,1) PRIMARY KEY,
    ServiceID INT,
    PlanName VARCHAR(255),
    PlanPrice DECIMAL(10,2),
    FOREIGN KEY (ServiceID) REFERENCES Services(ServiceID)
);

CREATE TABLE Usage_Log (
    LogID INT IDENTITY(1,1) PRIMARY KEY,
    Usage_Duration INT, 
    Usage_Date DATE,
    ServiceID INT,
	RecordID INT,
    FOREIGN KEY (ServiceID) REFERENCES Services(ServiceID),
	FOREIGN KEY (RecordID) REFERENCES User_service_record(RecordID)
);

CREATE TABLE Subscription (
    SubscriptionID INT IDENTITY(1,1) PRIMARY KEY,
    Auto_renewal_frequency INT,
	ServiceID INT,
    FOREIGN KEY (ServiceID) REFERENCES Services(ServiceID)
);

CREATE TABLE Membership (
    MembershipID INT IDENTITY(1,1) PRIMARY KEY,
    Membership_Location VARCHAR(255),
	ServiceID INT,
    FOREIGN KEY (ServiceID) REFERENCES Services(ServiceID)
);

CREATE TABLE EMI (
    EMIID INT IDENTITY(1,1) PRIMARY KEY,
    EMI_InterestRate DECIMAL(5,2),
	ServiceID INT,
    FOREIGN KEY (ServiceID) REFERENCES Services(ServiceID)
);




