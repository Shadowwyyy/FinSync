---- Drop all tables if they exist
--DROP TABLE IF EXISTS User_Notification;
--DROP TABLE IF EXISTS Usage_Log;
--DROP TABLE IF EXISTS EMI;
--DROP TABLE IF EXISTS Membership;
--DROP TABLE IF EXISTS Subscription;
--DROP TABLE IF EXISTS [Plan];
--DROP TABLE IF EXISTS Payment_Reminder;
--DROP TABLE IF EXISTS Expiry;
--DROP TABLE IF EXISTS Payment;
--DROP TABLE IF EXISTS User_service_record;
--DROP TABLE IF EXISTS Services;
--DROP TABLE IF EXISTS Service_Provider;
--DROP TABLE IF EXISTS Notification;
--DROP TABLE IF EXISTS [User];

--select * from [User];

INSERT INTO [User] (First_Name, Last_Name, Email, Phone_Number, Date_Joined, [UserPassword]) VALUES 
('John', 'Doe', 'john.doe@example.com', '123-456-7890', '2023-01-15', 'hashed_password_1'),
('Jane', 'Smith', 'jane.smith@example.com', '987-654-3210', '2023-01-20', 'hashed_password_2'),
('Michael', 'Brown', 'michael.brown@example.com', '444-555-6666', '2023-02-25', 'hashed_password_3'),
('Sarah', 'Wilson', 'sarah.wilson@example.com', '555-888-9999', '2023-04-30', 'hashed_password_4'),
('David', 'Anderson', 'david.anderson@example.com', '777-123-4444', '2023-05-05', 'hashed_password_5'),
('Emily', 'Davis', 'emily.davis@example.com', '777-888-9999', '2023-02-12', 'hashed_password_6'),
('Kevin', 'Johnson', 'kevin.johnson@example.com', '000-111-2222', '2023-03-01', 'hashed_password_7'),
('Ashley', 'Moore', 'ashley.moore@example.com', '333-444-5555', '2023-03-18', 'hashed_password_8'),
('Jessica', 'Taylor', 'jessica.taylor@example.com', '999-000-1111', '2023-04-22', 'hashed_password_9'),
('Robert', 'Lee', 'robert.lee@example.com', '222-333-4444', '2023-05-15', 'hashed_password_10'),
('Emma', 'White', 'emma.white@example.com', '666-777-8888', '2023-06-10', 'hashed_password_11'),
('Daniel', 'Harris', 'daniel.harris@example.com', '111-222-3333', '2023-06-25', 'hashed_password_12'),
('Olivia', 'Martin', 'olivia.martin@example.com', '444-666-7777', '2023-07-05', 'hashed_password_13'),
('Ryan', 'Thompson', 'ryan.thompson@example.com', '888-999-0000', '2023-07-20', 'hashed_password_14'),
('Sophia', 'Garcia', 'sophia.garcia@example.com', '555-111-2222', '2023-08-01', 'hashed_password_15'),
('Matthew', 'Martinez', 'matthew.martinez@example.com', '777-444-5555', '2023-08-15', 'hashed_password_16'),
('Ava', 'Robinson', 'ava.robinson@example.com', '222-888-9999', '2023-09-01', 'hashed_password_17'),
('Christopher', 'Clark', 'christopher.clark@example.com', '666-333-4444', '2023-09-15', 'hashed_password_18'),
('Isabella', 'Rodriguez', 'isabella.rodriguez@example.com', '444-777-8888', '2023-10-01', 'hashed_password_19'),
('William', 'Lewis', 'william.lewis@example.com', '999-555-6666', '2023-10-15', 'hashed_password_20'),
('Mia', 'Lee', 'mia.lee@example.com', '333-666-7777', '2023-11-01', 'hashed_password_21'),
('James', 'Walker', 'james.walker@example.com', '777-222-3333', '2023-11-15', 'hashed_password_22'),
('Charlotte', 'Hall', 'charlotte.hall@example.com', '555-999-0000', '2023-12-01', 'hashed_password_23'),
('Alexander', 'Allen', 'alexander.allen@example.com', '888-444-5555', '2023-12-15', 'hashed_password_24'),
('Amelia', 'Young', 'amelia.young@example.com', '222-777-8888', '2024-01-01', 'hashed_password_25');


-- Service Provider 
INSERT INTO Service_Provider (ProviderName, Contact, EndDate, StartDate) VALUES
('Streaming Co', 'contact@streaming.com', '2025-12-31', '2020-01-01'),
('Social Media Inc', 'info@social.com', NULL, '2018-05-15'),
('Music Streaming Ltd', 'music@streaming.com', '2024-12-31', '2019-03-20'),
('Online Education Platform', 'learn@online.com', NULL, '2021-01-05'),
('Fitness App Co', 'fit@app.com', '2025-06-30', '2022-06-10'),
('Streaming Co', 'support@streaming.com', '2026-12-31', '2021-02-15'),
('Social Media Inc', 'support@social.com', NULL, '2019-07-20'),
('Gaming Company', 'play@games.com', '2024-09-30', '2020-04-03'),
('Food Delivery Service', 'eat@food.com', NULL, '2022-02-12'),
('Travel Booking Website', 'travel@booking.com', '2025-08-31', '2021-12-28'),
('Streaming Co', 'business@streaming.com', '2025-12-31', '2022-03-10'),
('Music Streaming Ltd', 'support@music.com', NULL, '2020-05-15'),
('Online Education Platform', 'support@learn.com', '2024-12-31', '2022-01-20'),
('Fitness App Co', 'support@fit.com', NULL, '2023-01-15'),
('Gaming Company', 'support@games.com', '2025-03-31', '2021-08-22'),
('Food Delivery Service', 'support@food.com', NULL, '2023-04-01'),
('Travel Booking Website', 'support@travel.com', '2024-12-31', '2022-06-15'),
('Streaming Co', 'enterprise@streaming.com', NULL, '2023-01-10'),
('Social Media Inc', 'enterprise@social.com', '2025-09-30', '2022-11-05'),
('Music Streaming Ltd', 'enterprise@music.com', NULL, '2023-02-20'),
('Online Education Platform', 'enterprise@learn.com', '2024-06-30', '2022-09-12'),
('Fitness App Co', 'enterprise@fit.com', NULL, '2023-03-15'),
('Gaming Company', 'enterprise@games.com', '2025-12-31', '2022-07-28'),
('Food Delivery Service', 'enterprise@food.com', NULL, '2023-05-01'),
('Travel Booking Website', 'enterprise@travel.com', '2024-12-31', '2022-10-15');


INSERT INTO Services (ProviderID, Service_Type, Service_Address, Login_Credential) VALUES
(1, 'Streaming', '123 Main St', 'user123'),
(2, 'Social Media', '456 Oak Ave', 'pass456'),
(1, 'Music Streaming', '789 Pine Ln', 'musiclover'),
(3, 'Online Courses', '101 Elm St', 'student123'),
(4, 'Fitness App', '222 Maple Dr', 'fituser456'),
(2, 'Social Media', '333 Birch Rd', 'social789'),
(1, 'Streaming', '444 Cedar Ln', 'stream101'),
(3, 'Online Courses', '555 Willow St', 'learn1234'),
(4, 'Fitness App', '666 Oak St', 'fitness456'),
(5, 'E-commerce', '777 Pine Ave', 'shop789'),
(2, 'Social Media', '888 Elm Rd', 'social101'),
(1, 'Music Streaming', '999 Maple St', 'music202'),
(3, 'Online Courses', '111 Cedar Ave', 'study303'),
(4, 'Fitness App', '222 Pine Ln', 'fit404'),
(5, 'E-commerce', '333 Oak Rd', 'shop505'),
(1, 'Streaming', '444 Birch St', 'stream606'),
(2, 'Social Media', '555 Maple Ave', 'social707'),
(3, 'Online Courses', '666 Cedar Rd', 'learn808'),
(4, 'Fitness App', '777 Pine St', 'fit909'),
(5, 'E-commerce', '888 Oak Ln', 'shop1010'),
(1, 'Music Streaming', '999 Elm Ave', 'music1111'),
(2, 'Social Media', '111 Willow Rd', 'social1212'),
(3, 'Online Courses', '222 Birch Ln', 'study1313'),
(4, 'Fitness App', '333 Cedar St', 'fit1414'),
(5, 'E-commerce', '444 Maple Rd', 'shop1515');



-- User_service_record Table Data
INSERT INTO User_service_record (Service_startdate, Service_enddate, Service_charge, ServiceID, UserID) VALUES
('2023-01-01', '2023-01-31', 9.99, 1, 1),
('2023-01-15', '2023-02-14', 12.99, 2, 2),
('2023-02-01', '2023-02-28', 7.99, 3, 3),
('2023-02-15', '2023-03-14', 15.99, 4, 4),
('2023-03-01', '2023-03-31', 11.99, 5, 5),
('2023-03-15', '2023-04-14', 9.99, 1, 6),
('2023-04-01', '2023-04-30', 12.99, 2, 7),
('2023-04-15', '2023-05-14', 7.99, 3, 8),
('2023-05-01', '2023-05-31', 15.99, 4, 9),
('2023-05-15', '2023-06-14', 11.99, 5, 10),
('2023-06-01', '2023-06-30', 9.99, 1, 11),
('2023-06-15', '2023-07-14', 12.99, 2, 12),
('2023-07-01', '2023-07-31', 7.99, 3, 13),
('2023-07-15', '2023-08-14', 15.99, 4, 14),
('2023-08-01', '2023-08-31', 11.99, 5, 15),
('2023-08-15', '2023-09-14', 9.99, 1, 16),
('2023-09-01', '2023-09-30', 12.99, 2, 17),
('2023-09-15', '2023-10-14', 7.99, 3, 18),
('2023-10-01', '2023-10-31', 15.99, 4, 19),
('2023-10-15', '2023-11-14', 11.99, 5, 20),
('2023-11-01', '2023-11-30', 9.99, 1, 21),
('2023-11-15', '2023-12-14', 12.99, 2, 22),
('2023-12-01', '2023-12-31', 7.99, 3, 23),
('2023-12-15', '2024-01-14', 15.99, 4, 24),
('2024-01-01', '2024-01-31', 11.99, 5, 25);


INSERT INTO Payment (PaymentMethod, PaymentDate, PaymentAddress, RecordID) VALUES
('Credit Card', '2023-01-05', '123 Billing St', 1),
('Debit Card', '2023-01-20', '456 Payment Ave', 2),
('UPI', '2023-02-05', '789 Online Rd', 3),
('Net Banking', '2023-02-20', '101 E-payment Ln', 4),
('Credit Card', '2023-03-05', '222 Credit Card St', 5),
('UPI', '2023-03-20', '333 PayPal Ave', 6),
('UPI', '2023-04-05', '444 UPI Ln', 7),
('Credit Card', '2023-04-20', '555 Credit Card St', 8),
('Debit Card', '2023-05-05', '666 Debit Card Rd', 9),
('Net Banking', '2023-05-20', '777 Net Banking Ln', 10),
('UPI', '2023-06-05', '888 PayPal St', 11),
('Credit Card', '2023-06-20', '999 Credit Card Ave', 12),
('UPI', '2023-07-05', '111 UPI Rd', 13),
('Debit Card', '2023-07-20', '222 Debit Card Ln', 14),
('Credit Card', '2023-08-05', '333 Credit Card St', 15),
('Net Banking', '2023-08-20', '444 Net Banking Ave', 16),
('PayPal', '2023-09-05', '555 PayPal Rd', 17),
('UPI', '2023-09-20', '666 UPI Ln', 18),
('Credit Card', '2023-10-05', '777 Credit Card St', 19),
('Debit Card', '2023-10-20', '888 Debit Card Ave', 20),
('Net Banking', '2023-11-05', '999 Net Banking Rd', 21),
('PayPal', '2023-11-20', '111 PayPal Ln', 22),
('Credit Card', '2023-12-05', '222 Credit Card St', 23),
('UPI', '2023-12-20', '333 UPI Ave', 24),
('Debit Card', '2024-01-05', '444 Debit Card Rd', 25);


-- Now insert into Expiry table with valid PaymentIDs
INSERT INTO Expiry (Date_of_Expiry, PaymentID) VALUES
('2024-01-05', 1),
('2024-01-20', 2),
('2024-02-05', 3),
('2024-02-20', 4),
('2024-03-05', 5),
('2024-03-20', 6),
('2024-04-05', 7),
('2024-04-20', 8),
('2024-05-05', 9),
('2024-05-20', 10),
('2024-06-05', 11),
('2024-06-20', 12),
('2024-07-05', 13),
('2024-07-20', 14),
('2024-08-05', 15),
('2024-08-20', 16),
('2024-09-05', 17),
('2024-09-20', 18),
('2024-10-05', 19),
('2024-10-20', 20),
('2024-11-05', 21),
('2024-11-20', 22),
('2024-12-05', 23),
('2024-12-20', 24),
('2025-01-05', 25);


-- Now insert into Payment_Reminder with valid PaymentIDs
INSERT INTO Payment_Reminder (Payment_Amount, PaymentDueDate, PaymentID) VALUES
(9.99, '2023-01-26', 1),
(12.99, '2023-01-31', 2),
(7.99, '2023-02-05', 3),
(15.99, '2023-02-10', 4),
(11.99, '2023-02-15', 5),
(9.99, '2023-03-20', 6),
(12.99, '2023-03-25', 7),
(7.99, '2023-03-30', 8),
(15.99, '2023-04-05', 9),
(11.99, '2023-04-10', 10),
(9.99, '2023-04-15', 11),
(12.99, '2023-05-20', 12),
(7.99, '2023-05-25', 13),
(15.99, '2023-05-30', 14),
(11.99, '2023-06-05', 15),
(9.99, '2023-06-10', 16),
(12.99, '2023-06-15', 17),
(7.99, '2023-07-20', 18),
(15.99, '2023-07-25', 19),
(11.99, '2023-07-30', 20),
(9.99, '2023-08-05', 21),
(12.99, '2023-08-10', 22),
(7.99, '2023-08-15', 23),
(15.99, '2023-09-20', 24),
(11.99, '2023-09-25', 25);




-- Notification table 
INSERT INTO Notification (Notification_Date, Status) VALUES
('2024-01-01 10:00:00', 'Sent'),
('2024-01-02 14:30:00', 'Read'),
('2024-01-03 09:15:00', 'Delivered'),
('2024-01-04 11:45:00', 'Opened'),
('2024-01-05 16:20:00', 'Clicked'),
('2024-01-06 13:00:00', 'Sent'),
('2024-01-07 08:50:00', 'Read'),
('2024-01-08 15:35:00', 'Delivered'),
('2024-01-09 12:10:00', 'Opened'),
('2024-01-10 17:55:00', 'Clicked'),
('2024-01-11 10:30:00', 'Sent'),
('2024-01-12 14:45:00', 'Read'),
('2024-01-13 09:20:00', 'Delivered'),
('2024-01-14 11:15:00', 'Opened'),
('2024-01-15 16:40:00', 'Clicked'),
('2024-01-16 13:25:00', 'Sent'),
('2024-01-17 08:30:00', 'Read'),
('2024-01-18 15:50:00', 'Delivered'),
('2024-01-19 12:35:00', 'Opened'),
('2024-01-20 17:20:00', 'Clicked'),
('2024-01-21 10:45:00', 'Sent'),
('2024-01-22 14:15:00', 'Read'),
('2024-01-23 09:40:00', 'Delivered'),
('2024-01-24 11:25:00', 'Opened'),
('2024-01-25 16:50:00', 'Clicked');


-- User_Notification table 
INSERT INTO User_Notification (UserID, NotificationID) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
(6, 6), (7, 7), (8, 8), (9, 9), (10, 10),
(1, 11), (2, 12), (3, 13), (4, 14), (5, 15),
(6, 16), (7, 17), (8, 18), (9, 19), (10, 20),
(1, 21), (2, 22), (3, 23), (4, 24), (5, 25);


-- Plan table 
INSERT INTO [Plan] (ServiceID, PlanName, PlanPrice) VALUES
(1, 'Basic Streaming', 9.99),
(1, 'Premium Streaming', 14.99),
(1, 'Family Streaming', 19.99),
(2, 'Social Media Basic', 5.99),
(2, 'Social Media Pro', 12.99),
(2, 'Social Media Business', 24.99),
(3, 'Music Free', 0.00),
(3, 'Music Premium', 7.99),
(3, 'Music Family', 14.99),
(4, 'Fitness Basic', 4.99),
(4, 'Fitness Plus', 9.99),
(4, 'Fitness Premium', 19.99),
(5, 'E-commerce Basic', 0.00),
(5, 'E-commerce Pro', 29.99),
(5, 'E-commerce Enterprise', 99.99),
(1, 'Ultra HD Streaming', 24.99),
(2, 'Social Media Enterprise', 49.99),
(3, 'Music Premium Plus', 11.99),
(4, 'Fitness Family', 29.99),
(5, 'E-commerce Plus', 49.99),
(1, 'Student Streaming', 4.99),
(2, 'Social Media Student', 2.99),
(3, 'Music Student', 4.99),
(4, 'Fitness Student', 3.99),
(5, 'E-commerce Starter', 9.99);


-- Usage_Log table 
INSERT INTO Usage_Log (Usage_Duration, Usage_Date, ServiceID, RecordID) VALUES
(120, '2024-01-01', 1, 1),
(45, '2024-01-01', 2, 2),
(90, '2024-01-01', 3, 3),
(180, '2024-01-02', 1, 4),
(60, '2024-01-02', 2, 5),
(150, '2024-01-02', 3, 6),
(30, '2024-01-03', 1, 7),
(75, '2024-01-03', 2, 8),
(120, '2024-01-03', 3, 9),
(240, '2024-01-04', 1, 10),
(90, '2024-01-04', 2, 11),
(180, '2024-01-04', 3, 12),
(60, '2024-01-05', 1, 13),
(120, '2024-01-05', 2, 14),
(150, '2024-01-05', 3, 15),
(200, '2024-01-06', 1, 16),
(45, '2024-01-06', 2, 17),
(90, '2024-01-06', 3, 18),
(160, '2024-01-07', 1, 19),
(75, '2024-01-07', 2, 20),
(130, '2024-01-07', 3, 21),
(220, '2024-01-08', 1, 22),
(40, '2024-01-08', 2, 23),
(100, '2024-01-08', 3, 24),
(170, '2024-01-08', 1, 25);




-- Subscription table continued 
INSERT INTO Subscription (Auto_renewal_frequency, ServiceID) VALUES
(1, 1), (12, 1), (3, 1), (6, 1), (1, 1),
(1, 2), (12, 2), (3, 2), (6, 2), (1, 2),
(1, 3), (12, 3), (3, 3), (6, 3), (1, 3),
(1, 4), (12, 4), (3, 4), (6, 4), (1, 4),
(1, 5), (12, 5), (3, 5), (6, 5), (1, 5);


-- EMI table 
INSERT INTO EMI (EMI_InterestRate, ServiceID) VALUES
(10.99, 1), (9.99, 1), (11.99, 1), (8.99, 1), (12.99, 1),
(11.50, 2), (10.50, 2), (12.50, 2), (9.50, 2), (13.50, 2),
(8.75, 3), (7.75, 3), (9.75, 3), (6.75, 3), (10.75, 3),
(9.25, 4), (8.25, 4), (10.25, 4), (7.25, 4), (11.25, 4),
(10.00, 5), (9.00, 5), (11.00, 5), (8.00, 5), (12.00, 5);

INSERT INTO Membership (Membership_Location, ServiceID) VALUES 
('California', 1), ('California', 1), ('California', 1),
('New York', 1), ('New York', 1), ('New York', 1),
('Texas', 1), ('Texas', 1), ('Florida', 1), ('Illinois', 1),

('Arizona', 2), ('Arizona', 2), ('Colorado', 2), ('Colorado', 2),
('Massachusetts', 2), ('Tennessee', 2), ('Missouri', 2), ('Wisconsin', 2),
('Maryland', 2), ('Minnesota', 2),

('North Carolina', 3), ('North Carolina', 3), ('Virginia', 3), ('Virginia', 3),
('Alabama', 3), ('South Carolina', 3), ('Kentucky', 3), ('Oklahoma', 3),
('Connecticut', 3), ('Indiana', 3),

('New Jersey', 4), ('New Jersey', 4), ('Iowa', 4), ('Iowa', 4),
('Kansas', 4), ('Mississippi', 4), ('Arkansas', 4), ('West Virginia', 4),
('New Mexico', 4), ('Hawaii', 4),

('Delaware', 5), ('Delaware', 5), ('New Hampshire', 5), ('New Hampshire', 5),
('Rhode Island', 5), ('Montana', 5), ('Alaska', 5), ('Vermont', 5),
('Wyoming', 5), ('North Dakota', 5);