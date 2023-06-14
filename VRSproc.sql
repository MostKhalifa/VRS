--*************************SECTION 1 As an unregistered customer I should be able to:*************************

--a) Register to the website as a customer by providing my ssn, name (First and last name), email, address and password.


create database VRS

use VRS

GO

CREATE PROC CustomerRegister 
 @ssn VARCHAR(14),
 @name VARCHAR(25),
 @password VARCHAR (20),
 @email VARCHAR(50),
 @address VARCHAR(40)
AS    
INSERT INTO Customer (ssn,name,password,email,address)
VALUES (@ssn,@name,@password,@email,@address)
GO

--b) Register to the website as an employee by providing my ssn, name (First and last name), email, address, password, hours_per_week.

CREATE PROC EmployeeRegister 
 @ssn VARCHAR(14),
 @name VARCHAR(25),
 @password VARCHAR (20),
 @email VARCHAR(50),
 @address VARCHAR(40),
 @hours_per_week INT
AS    
INSERT INTO Employee (ssn,name,password,email,address,hours_per_week)
VALUES (@ssn,@name,@password,@email,@address,@hours_per_week)
GO

--c) Get the number of available customers.


go

CREATE PROC allCustomerView
AS
    SELECT ssn, name, email, address
    from Customer
GO

CREATE PROC customerCount 
    @count INT OUTPUT
AS
    SELECT @count = count(*) 
    FROM Customer
GO

--d) Get the number of available vehicles.

CREATE PROC vehicleCount
    @count INT OUTPUT
AS
    SELECT @count = count(*) 
    FROM Vehicle
GO

declare @count int
exec vehicleCount @count output
print @count
GO

--e) Get the number of rents that already occurred.

CREATE PROC rentCount
    @count INT OUTPUT
AS
    SELECT @count = count(*) 
    FROM Rents_for_time
GO

--*************************SECTION 2 As a registered customer I should be able to:*************************

--a) Login using my ssn and password.
GO

GO

CREATE PROC getSessionSsn
    @email VARCHAR(50),
    @password VARCHAR(20),
    @ssn VARCHAR(14) OUTPUT
    AS
    BEGIN
    IF EXISTS(SELECT ssn FROM Customer WHERE email=@email AND password=@password)
    BEGIN
    SELECT @ssn = ssn 
    FROM Customer 
    WHERE email=@email AND password=@password
    END
    ELSE IF EXISTS(SELECT ssn FROM Employee WHERE email=@email AND password=@password)
    BEGIN
    SELECT @ssn = ssn 
    FROM Employee 
    WHERE email=@email AND password=@password
    END
    END

GO


CREATE PROC allLogin
@email VARCHAR(50),
@password VARCHAR(20),
@success BIT OUTPUT,
@type INT OUTPUT,
@ssn VARCHAR(14) OUTPUT
AS
BEGIN
IF EXISTS(
SELECT email, password
From Customer c left outer join Rents_for_time r on c.ssn = r.customer
WHERE c.email=@email AND c.password=@password AND r.customer is Null)
BEGIN
SET @success=1
SET @type = 0
SELECT @ssn=c.ssn
FROM Customer c
WHERE c.email=@email AND c.password=@password
END
ELSE IF EXISTS(
SELECT email, password
FROM Employee e
WHERE e.email=@email AND e.password=@password)
BEGIN
SET @success=1
SET @type = 1
SELECT @ssn=e.ssn
FROM Employee e
WHERE e.email=@email AND e.password=@password
END
ELSE IF EXISTS(
SELECT email, password
From Customer c left outer join Rents_for_time r on c.ssn = r.customer
WHERE c.email=@email AND c.password=@password AND r.customer is NOT Null)
BEGIN
SET @success=1
SET @type = 2
SELECT @ssn=c.ssn
FROM Customer c
WHERE c.email=@email AND c.password=@password
END
ELSE
SET @success=0
END



--CREATE PROC customerLogin
--    @ssn VARCHAR(14),
--    @password VARCHAR(20),
--    @success BIT OUTPUT
--    AS
--    IF(EXISTS(SELECT *
--    FROM Customer C
--    WHERE C.ssn = @ssn))
--        SET @success = 1;
--    ELSE
--        SET @success = 0;
GO

--b) View and update my profile.


CREATE PROC ViewCustProfile
    @ssn VARCHAR(14)
    AS
    SELECT C.ssn, name, email, address, phone
    FROM Customer C inner join CustomerPhone CP on C.ssn = CP.ssn
    WHERE C.ssn = @ssn
GO

CREATE PROC UpdateCustProfile
    @ssn VARCHAR(14),
    @name VARCHAR(25),
    @password VARCHAR(20),
    @email VARCHAR(50),
    @address VARCHAR(40),
    @success BIT = 0 OUTPUT
    AS
    IF(@ssn IS NULL OR @name IS NULL OR @password IS NULL OR @email IS NULL OR @address IS NULL)
    SET @success = 0
    ELSE
    BEGIN
    UPDATE Customer
    SET
        [ssn] = @ssn,
        [name] = @name,
        [password] = @password,
        [email] = @email,
        [address] = @address
    WHERE ssn = @ssn
    SET @success = 1;
    END

GO

--c) Add my phone number(s).

CREATE PROC addMobile
    @ssn VARCHAR (14),
    @phone_number VARCHAR(11)
    AS
    INSERT INTO CustomerPhone VALUES (@ssn, @phone_number);
GO

--d) add online payment details.

CREATE PROC addOnlinePayment
    @ssn VARCHAR (14),
    @credit_card_number VARCHAR(16),
    @cvv VARCHAR(3),
    @expire DATETIME
    AS
    INSERT INTO Payment_type VALUES (@ssn, @credit_card_number);
    INSERT INTO Credit VALUES (@ssn, @credit_card_number, @cvv, @expire);
GO

--e) View all available vehicles each with its average rating.

CREATE PROC viewVehicleRating
    AS
    SELECT R.vehicle, AVG(R.rating) AS 'Rating'
    FROM Vehicle AS V INNER JOIN VehicleRating AS R ON V.id = R.vehicle
    WHERE V.[status] = 'available'
    GROUP BY R.vehicle
GO



--f) View all available insurances with different types.

CREATE PROC viewInsurances
    AS
    SELECT *
    FROM Insurance
GO

--g) View all extras for rent.

CREATE PROC viewExtra
    AS
    SELECT *
    FROM Extra
    WHERE rented_by IS NULL
GO

--h) Rent a vehicle for a specified time-frame.


CREATE PROC rentTime
    @vehicle int,
    @insurance VARCHAR(15),
    @customer_ssn VARCHAR(14),
    @time DATETIME,
    @destination VARCHAR(40)
    AS
    DECLARE @allow int = 0; 
    SELECT @allow = COUNT(*)
    FROM Vehicle
    WHERE Vehicle.[status] = 'available' AND id = @vehicle
    IF (@allow > 0)
    BEGIN
        INSERT INTO Rents_for_time
        VALUES (
            @vehicle,
            @insurance,
            @customer_ssn,
            @time,
            @destination
        );
        UPDATE Vehicle
        SET [status] = 'rented'
        WHERE id = @vehicle
    END
GO

--i) View all information of my previous accidents.

CREATE PROC viewMyAccidents
    @customer_ssn VARCHAR(14)
    AS
    SELECT *
    FROM 
        Customer AS C 
        INNER JOIN 
        Accident_info AS I 
        ON C.ssn = I.customer
        INNER JOIN Accident A
        ON A.id = I.accident_id
        INNER JOIN Vehicle V
        ON V.id = I.vehicle
    WHERE C.ssn = @customer_ssn 
GO

--j) View any pending payements if any.

CREATE PROC viewRemainingPayments
    @customer_ssn VARCHAR(14)
    AS
    SELECT P.*
    FROM Payment_info P INNER JOIN Customer C ON P.customer = C.ssn
    WHERE @customer_ssn = C.ssn
GO

--k) Delete one of my credit cards.

CREATE PROC deleteCreditCard
    @customer_ssn VARCHAR(14),
    @credit_card_number VARCHAR(16)
    AS
    DELETE FROM Credit
    WHERE customer = @customer_ssn AND number = @credit_card_number
    DELETE FROM Payment_type
    WHERE customer = @customer_ssn AND number = @credit_card_number

    exec deleteCreditCard '1000', '4569854123654757'
GO

CREATE TRIGGER deleteCard
ON Credit
AFTER delete
AS
declare @customer_ssn VARCHAR(14)
DECLARE @credit_card_number varchar(16)
Select*
from Credit
where customer = @customer_ssn AND number = @credit_card_number
Begin
RAISERROR('Invalid Record.', 16, 1)
end

delete from Credit
where number = '4569854123654757'
GO

--l) Search for vehicles that are in one of three locations provided.

CREATE PROC searchForVehicles
    @location1 VARCHAR(40), 
    @location2 VARCHAR(40), 
    @location3 VARCHAR(40)
    AS
    SELECT *
    FROM Vehicle
    WHERE 
        gps_loc = @location1 OR
        gps_loc = @location2 OR
        gps_loc = @location3
GO

CREATE PROC getNonRentedVehicles
    AS
    SELECT V.id, V.rate, V.brand, V.model, V.class, V.gps_loc,V.location
    FROM Vehicle V
    WHERE V.status = 'available' and V.id not in (
        SELECT R.vehicle
        FROM Rents_for_time R
    )
GO

--m) Order all vehicles that are not rented by brand/class/rate.
CREATE PROC orderVehiclesByBrand
    AS
    SELECT   V.id, V.rate, V.brand, V.model, V.class, V.gps_loc,V.location
    FROM Vehicle V
    WHERE V.[status] = 'available'
    ORDER BY brand
GO

CREATE PROC orderVehiclesByClass
    AS
    SELECT   V.id, V.rate, V.brand, V.model, V.class, V.gps_loc,V.location
    FROM Vehicle V
    WHERE V.[status] = 'available'
    ORDER BY class
GO

CREATE PROC orderVehiclesByRate
    AS
    SELECT   V.id, V.rate, V.brand, V.model, V.class, V.gps_loc,V.location
    FROM Vehicle V
    WHERE V.[status] = 'available'
    ORDER BY rate
GO

--n) Get the count of accidents covered by each insurance.

CREATE PROC countAccidentsPerInsurance
    AS
    SELECT COUNT(*) AS num_of_accidents, insurance
    FROM Responsible_Insurance
    GROUP BY insurance
GO

--o) Get the vehicles that were never rented before.

CREATE PROC getNonRentedVehicles
    AS
    SELECT *
    FROM Vehicle V
    WHERE V.id not in (
        SELECT R.vehicle
        FROM Rents_for_time R
    )
GO

--p) View all insurances available sorted by rate.

CREATE PROC viewInsurancesRates
    AS
    SELECT *
    FROM Insurance
    ORDER BY rate
GO

--*************************SECTION 3 As a customer renting a vehicle I should be able to:*************************

--a) Submit an accident with info.

CREATE PROC accidentSubmission 
@ssn VARCHAR(14),
@vehicle INT,
@description VARCHAR(100)
AS
DECLARE @acc_id INT
INSERT INTO Accident VALUES(@description)
SELECT @acc_id = id
FROM Accident
WHERE description = @description
INSERT INTO Accident_info VALUES(@acc_id, @ssn, @vehicle)
GO


--b) Rent an extra item.

CREATE PROC rentExtra
@ssn VARCHAR (14),
@id INT
AS
UPDATE Extra
SET rented_by = @ssn
WHERE id = @id
GO

--c) Return an extra item.

CREATE PROC returnExtra
@ssn VARCHAR (14),
@id INT
AS
UPDATE Extra
SET rented_by = NULL
WHERE id = @id
GO

--d) View Extra items ordered by rate descendingly.

CREATE PROC viewExtraOrdered
AS
SELECT *
FROM Extra
ORDER BY rate DESC
GO

--e) View the minimum rate of each Extra type.

CREATE PROC viewMinPerType
AS
SELECT type, MIN(rate)
FROM Extra 
GROUP BY type
GO

--f) Get the count of how many times the currently rented vehicle was rented.

CREATE PROC numberOfRents
@id INT,
@count INT OUTPUT
AS
SELECT @count=COUNT(*)
FROM Rents_for_time
WHERE vehicle = @id
GO


--g) Evaluate the currently rented vehicle from 0 to 10.

CREATE PROC evaluateVehicle
@customer_ssn VARCHAR(14),
@vehicle INT,
@rating INT
AS
if @rating > 10 OR @rating < 0
print 'Please insert a value between 0 and 10 inclusive'
else begin
INSERT INTO VehicleRating VALUES(@vehicle, @customer_ssn, @rating)
SELECT * FROM VehicleRating
end
GO

--h) Update the location of the vehicle.

CREATE PROC updateLocation
@vehicle INT,
@location VARCHAR(40),
@succes_bit bit OUTPUT
AS
UPDATE Vehicle
SET gps_loc = @location
WHERE id = @vehicle
SET @succes_bit = 1
GO

-- i) View average rating of the vehicle currently rented.

CREATE PROC viewAverageRating
@vehicle INT,
@rating DECIMAL OUTPUT
AS
SELECT @rating = AVG(rating)
FROM VehicleRating
WHERE vehicle = @vehicle
GO

--j) View accident details previously happened to the currently rented vehicle.

CREATE PROC viewAccidentsForCurrentVehicle
@vehicle INT
AS
SELECT [description]
FROM Accident_info AI INNER JOIN Accident A ON AI.accident_id = A.id
WHERE vehicle = @vehicle
GO

--*************************SECTION 4 As a logged in employee I should be able to:*************************

--a) View and update my profile.

--View:

CREATE PROC ViewEmpProfile
@ssn VARCHAR(14)
AS
SELECT *
FROM Employee e
WHERE @ssn = e.ssn
GO

--Update:

CREATE PROC UpdateEmpProfile
@ssn varchar(14),
@address varchar(40),
@hours_per_week int,
@email varchar(40),
@name varchar(25),
@password varchar(20),
@success BIT OUTPUT
AS
IF(@ssn IS NULL OR @name IS NULL OR @password IS NULL OR @email IS NULL OR @address IS NULL OR @hours_per_week IS NULL  )
    SET @success = 0
    ELSE
    BEGIN
UPDATE Employee  
SET Employee.name = @name, Employee.password = @password, Employee.email = @email, Employee.address = @address, Employee.hours_per_week = @hours_per_week
WHERE Employee.ssn = @ssn
SET @success = 1
END
GO

--b) Add a newly acquired Extra.

 CREATE PROC AddExtra 
 @type VARCHAR(15),
 @rate DECIMAL
AS    
INSERT INTO Extra (type,rate)
VALUES (@type,@rate)
GO

--c) View all available vehicles.

CREATE PROC viewVehicles 
AS 
Select * 
FROM Vehicle
Where status ='available'
GO

CREATE PROC viewOnlinePayment
@ssn VARCHAR (14)
AS
Select*
from Credit
where customer = @ssn
GO

CREATE PROC viewVehicle
    AS
    SELECT V.id, V.rate, V.brand, V.model, V.class, V.gps_loc,V.location
    FROM Vehicle V
    WHERE V.[status] = 'available'
GO

--d) Provide a gift-card to an employee.

CREATE PROC ProvideGift 
@customer_ssn varchar(14),
@employee_ssn varchar(14),
@amount decimal 
AS 
INSERT INTO Gift_Card
VALUES (@customer_ssn,@employee_ssn,@amount)
GO

--e) Add an available insurance.
-- INSERT INSURANCE TO SUPER CLASS THEN CHECK THE TYPE TO INSERT TO SUBCLASS

CREATE PROC AddInsurance 
@insurance varchar(15),
@rate decimal,
@type varchar(8),
@liablity_amount decimal 
AS 
INSERT INTO Insurance 
Values(@insurance,@rate)
    IF (@type = 'Basic' ) 
        INSERT INTO Basic
        Values(@insurance)
    ELSE IF (@type = 'Advanced') 
        INSERT INTO Advanced 
        VALUES (@insurance,@liablity_amount)
    ELSE IF (@type = 'Premium') 
        INSERT INTO Premium
        VALUES (@insurance)
GO


--Add a new Vehicle.
CREATE PROC AddVehicle
@class varchar(20),
@brand Varchar(20),
@model varchar(20),
@gps_loc varchar(40),
@rate int
AS
INSERT INTO Vehicle (owned,status, rate,class,brand,model, current_milage,gps_loc,location)
VALUES (0,'available',@rate,@class,@brand,@model,0,@gps_loc,1)

GO
--f) Add a new Location.

CREATE PROC AddLocation 
@pin_number varchar(10),
@gps_location varchar(40)
AS
INSERT INTO Location 
VALUES (@pin_number,@gps_location)
GO

CREATE PROC ListAllVehicles
AS
select *
FROM Vehicle
GO

exec ListAllVehicles

--g) List the currently rented vehicles.

GO

CREATE PROC ListRentedVehicles 
AS 
Select * 
FROM Vehicle
Where status ='rented'
GO

--h) List all cutomer names currently renting a vehicle.

GO

CREATE PROC ListCustomersNotCurrentlyRentingSsn 
AS 
Select c.ssn
FROM Customer c INNER JOIN Rents_for_time r ON c.ssn = r.customer INNER JOIN Vehicle v ON v.id = r.vehicle 
WHERE v.status = null
GO


GO


CREATE PROC ListCustomersCurrentlyRentingSsn 
AS 
Select c.*
FROM Customer c INNER JOIN Rents_for_time r ON c.ssn = r.customer INNER JOIN Vehicle v ON v.id = r.vehicle 
WHERE v.status = 'rented'
GO

GO

CREATE PROC ListCustomersCurrentlyRenting 
AS 
Select c.*
FROM Customer c INNER JOIN Rents_for_time r ON c.ssn = r.customer INNER JOIN Vehicle v ON v.id = r.vehicle 
WHERE v.status = 'rented'
GO
--i) List all customer information whose names start with a specific character.

CREATE PROC CustomersStartingWithACharacter 
@character varchar(1)
AS
SELECT * 
FROM Customer 
WHERE Customer.name Like @character +'%'
GO

--j) Update an Extra item to a specific rate.

CREATE PROC UpdateExtraRate
@id int,
@rate decimal
AS
UPDATE Extra 
SET Extra.rate = @rate
WHERE Extra.id = @id 
GO

CREATE PROC viewAllExtra
AS
SELECT *
FROM Extra

GO

--k) Increment all Extra items of a specific type by a specific value.

CREATE PROC UpdateExtratypeWithVal
@type varchar(15),
@value decimal,
@success BIT OUTPUT
AS
UPDATE Extra 
SET Extra.rate = Extra.rate + @value
WHERE Extra.type = @type
SET @success = 1 
GO

--l) Issue a bill for an accident.
-- CREATE A PAYMENT INFO FOR THE SPECFIC PAYMENT 
-- ASSUME THE NUMBER OF INSTALLMENTS = 1 
-- ADD THE CUSTOMER PARTAKING IN THE CUSTOM ER AS PART OF THE PAYMENT INFO 

CREATE PROC IssueBill 
@insurance varchar(15),
@accident int,
@bill decimal,
@installments_number int
AS
INSERT INTO Responsible_Insurance(insurance, accident, bill, number_of_installments)
VALUES (@insurance, @accident, @bill,@installments_number)
GO

--m) List all customer information who have an unused gift-card.
    
CREATE PROC CustomerWithGift
AS 
SELECT Customer.* 
FROM Customer INNER JOIN Gift_card ON Customer.ssn = Gift_card.customer
GO

--n) Issue installments as per the number of installments for a certain accident separated by 1 month each.
-- GET THE NUMBER OF INSTALLMENTS AND TOTAL PRICE FOR A CERTAIN ACCIDENT 
-- FIND THE AMOUNT OF 1 INSTALLMENTS
-- FIND THE CUSTOMER RESPONSIBLE FOR THE ACCIDENT (ASK ABOUT RETURNING A TABLE INTO A VARIABLE )
-- ADD A RECORD TO THE PAYMENT INFO WITH THE AMOUNT PER INSTALLMENT FO THE NUBMER OF MONTSH NEEEDED

CREATE PROC IssueInstallments 
@insurance varchar(15),
@accident int 
AS 
DECLARE @installmentPrice DECIMAL
DECLARE @Totalprice Decimal
DECLARE @months int
DECLARE @cust varchar(14)
SELECT  @Totalprice = bill , @months =  number_of_installments
FROM Responsible_Insurance 
WHERE insurance = @insurance AND accident = @accident
SET @installmentPrice = @totalprice / @months 

SELECT @cust = Customer.ssn
FROM Customer INNER JOIN Accident_info ON Customer.ssn = Accident_info.customer
WHERE Accident_info.accident_id = @accident

DECLARE @counter INT 
SET @counter = 0
WHILE (@counter < @months)
BEGIN
INSERT INTO Payment_info (value,exp_date,customer)
VALUES (@installmentPrice,DATEADD(month,@counter,GETDATE()),@cust)
SET @counter = @counter + 1 
END
GO

--o) List customers along with their due bills (if any).

CREATE PROC ListCustomersWithBills 
AS
SELECT * 
FROM Customer INNER JOIN Payment_info ON Customer.ssn = Payment_info.customer
GO

--p) Update the battery level of a scooter and the motor diesel needed.

-- Battery:
CREATE PROC UpdateBattery 
@vehicle int, 
@battery decimal
AS 
UPDATE Scooter 
SET battery = @battery
WHERE id = @vehicle
GO

--Motor Diesel:
CREATE PROC UpdateDiesel 
@vehicle int,
@kiloLeft decimal
AS 
UPDATE Motorcycle 
SET motor = @kiloLeft
WHERE id = @vehicle
GO

--update status of vehicle
CREATE PROC updateStatus
@vehicle int,
@status varchar(20)
AS
UPDATE vehicle
SET status = @status
WHERE id = @vehicle
GO


--q) View all Extra items that are currently rented.

CREATE PROC ViewExtra1
AS
SELECT *
FROM Extra 
WHERE rented_by = NULL
GO

--r) View all insurance info with no due bills.

CREATE PROC ViewInsuranceWithNoBills 
AS 
SELECT *
FROM Insurance LEFT OUTER JOIN Responsible_Insurance ON Insurance.number = Responsible_Insurance.insurance
WHERE Responsible_Insurance.insurance = NULl 
GO

--s) Delete payments with an expire date earlier than a specific date.

CREATE PROC DeleteExpiredPayments 
@date DATETIME
AS
DELETE 
FROM Payment_info  
WHERE Payment_info.exp_date < @date  
GO

--t) View customer details who have rented all available vehicles.
-- COUNT number of vehicles, and search for customers who have rented the same amount of distinct vehicles

CREATE PROC ViewPremiumCustomers
AS 
DECLARE @countV INT
SELECT @countV = COUNT(DISTINCT Vehicle.id)
FROM Vehicle

SELECT *
FROM Customer c
WHERE @countV = (SELECT COUNT(DISTINCT r.vehicle) 
                FROM Rents_for_time r 
                WHERE r.customer = c.ssn)
GO


--u) Get all locations at which there is currently a vehicle.
-- GET THE LOCATIONS FROM THE VEHICLE TABLE, SELECT DISTINCT LOCATIONS

CREATE PROC getLocationsOfVehicles
AS 
SELECT DISTINCT l.pin_number,l.gps_loc 
FROM Location l  INNER JOIN Vehicle v ON l.pin_number = v.location 
GO

--v) Get all locations at which there is no vehicles.
-- OUTER JOIN LOCATIONS AND VEHICLES, SLELCE LOCATIONS WHICH HAVE NO CORRESPONDING VEHICLE 
GO

CREATE PROC getEmptyLocations 
AS 
SELECT L.*
FROM Location L WHERE L.pin_number NOT IN(SELECT V.location FROM Vehicle V)
GO

--w) Get the customer information with the greatest gift card amount.
-- FIND THE MAXIMUM GIFT CARD AMOUNT 
-- FIND CUSTOMER WHO OWN GIFT CARD WITH THAT AMOUNT, AND SHOW THEIR INFORMATION 
-- NEEDS ALOT OF TESTING 

CREATE PROC greatestGiftCard 
AS 
DECLARE @amount DECIMAL

SELECT  DISTINCT @amount = MAX(Gift_Card.amount)
FROM  Gift_Card 

SELECT Customer.* 
FROM Customer INNER JOIN Gift_Card ON Customer.ssn = Gift_Card.customer
WHERE Gift_Card.amount = @amount
GO

--x) Get the vehicles that are either unavailable or have a battery level 0 or have less than 30 kilometers left.
-- Join vehicles with motorcycles and scooters and search for vehicles unavailable, with empty battery, or with km left < 30

CREATE PROC GetUnavailableVehicles
AS 
SELECT Vehicle.*
FROM Vehicle LEFT OUTER JOIN Scooter ON Vehicle.id = Scooter.id LEFT OUTER JOIN Motorcycle  ON Vehicle.id= Motorcycle.id 
WHERE Vehicle.status = 'unavailable' OR  Scooter.battery = 0 OR Motorcycle.motor <30
GO
