--Encryption

-- Step 1 Modify the [User] table to add columns for encrypted data
ALTER TABLE [User] 
ADD Encrypted_First_Name VARBINARY(256), 
    Encrypted_Last_Name VARBINARY(256), 
    Encrypted_Email VARBINARY(256);
	Encrypted_UserPassword VARBINARY(256);
GO

-- Step 2 Create a Master Key for the database
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'YourStrongPassword!';  -- Use a strong password
GO

-- Step 3 Create a Self-Signed Certificate
CREATE CERTIFICATE UserCert
WITH SUBJECT = 'User Data Encryption Certificate';
GO

-- Step 4 Create a Symmetric Key for encryption
CREATE SYMMETRIC KEY UserSymmetricKey
WITH ALGORITHM = AES_256
ENCRYPTION BY CERTIFICATE UserCert;
GO

-- Step 5 Open the Symmetric Key to use for encryption
OPEN SYMMETRIC KEY UserSymmetricKey
DECRYPTION BY CERTIFICATE UserCert;
GO

-- Step 6 Update the [User] table to encrypt the data
UPDATE [User]
SET Encrypted_First_Name = ENCRYPTBYKEY(KEY_GUID('UserSymmetricKey'), First_Name),
    Encrypted_Last_Name = ENCRYPTBYKEY(KEY_GUID('UserSymmetricKey'), Last_Name),
    Encrypted_Email = ENCRYPTBYKEY(KEY_GUID('UserSymmetricKey'), Email);
	Encrypted_Pasword = ENCRYPTBYKEY(KEY_GUID('UserSymmetricKey'), UserPassword);

GO

-- Step 7 Close the Symmetric Key
CLOSE SYMMETRIC KEY UserSymmetricKey;
GO

-- Step 8 Verify that the Symmetric Key and Certificate exist
SELECT name AS KeyName, symmetric_key_id AS KeyID, key_length AS KeyLength, algorithm_desc AS KeyAlgorithm
FROM sys.symmetric_keys;
GO

SELECT name AS CertName, certificate_id AS CertID, subject
FROM sys.certificates;
GO
