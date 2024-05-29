CREATE TABLE Airplane_type (
  A_ID INT PRIMARY KEY,
  Capacity INT,
  A_weight INT,
  Company VARCHAR(15)
);

INSERT INTO Airplane_type VALUES 
  (738, 853, 394, 'Indigo'),
  (777, 800, 380, 'Vistara'),
  (750, 790, 364, 'AirIndia'),
  (790, 850, 390, 'SpiceJet'),
  (745, 770, 405, 'GoAir'),
  (768, 867, 387, 'AirAsia'),
  (821, 790, 355, 'TruJet'),
  (785, 835, 410, 'Alliance Air');

CREATE TABLE Route (
  Route_ID INT PRIMARY KEY,
  Take_Off_point VARCHAR(15),
  Destination VARCHAR(15),
  R_type VARCHAR(15),
  Airfare INT
);

INSERT INTO Route VALUES
  (168806, 'London', 'Delhi', 'Direct', 27341),
  (157306, 'NewJersey', 'Mumbai', '2Hr Break', 34837),
  (178916, 'Washington', 'Jodhpur', '3Hr Break', 42176),
  (324567, 'Chennai', 'Denmark', 'Direct', 27373),
  (452368, 'Chandigarh', 'NewYork', '3Hr Break', 44592),
  (894521, 'Daman', 'Delhi', 'Direct', 8777),
  (578425, 'Beijing', 'Punjab', 'Direct', 9578),
  (421523, 'Hyderabad', 'Jammu & Kashmir', 'Direct', 4459);

CREATE TABLE Flight (
  Flight_ID VARCHAR(15) PRIMARY KEY,
  Departure DATETIME,
  Arrival DATETIME,
  Flight_date DATE,
  A_ID INT,
  FOREIGN KEY (A_ID) REFERENCES Airplane_type(A_ID)
);

INSERT INTO Flight VALUES
  ('AI2014', '2021-01-12 08:45:00', '2021-01-12 22:25:00', '2021-01-12', 738),
  ('QR2305', '2020-12-26 12:05:00', '2020-12-27 12:25:00', '2020-12-26', 777),
  ('EY1234', '2021-02-10 05:00:00', '2021-02-10 22:30:00', '2021-02-10', 750),
  ('LH9876', '2021-02-25 10:15:00', '2021-02-25 23:00:00', '2021-02-25', 790),
  ('BA1689', '2021-03-02 02:15:00', '2021-03-02 22:00:00', '2021-03-02', 745),
  ('AA4367', '2021-03-25 00:05:00', '2021-03-25 02:15:00', '2021-03-25', 768),
  ('CT7812', '2021-04-04 14:15:00', '2021-04-04 20:00:00', '2021-04-04', 821),
  ('PF4521', '2020-12-25 17:00:00', '2020-12-25 22:30:00', '2020-12-25', 785);

CREATE TABLE AirFare (
  Fare_ID INT PRIMARY KEY,
  Charge_Amount INT,
  Description VARCHAR(25),
  Flight_ID VARCHAR(15),
  FOREIGN KEY (Flight_ID) REFERENCES Flight(Flight_ID)
);

INSERT INTO AirFare VALUES
  (1, 27341, 'Standard Single', 'AI2014'),
  (4, 34837, 'Standard Return', 'QR2305'),
  (2, 42176, 'Key Fare Single', 'EY1234'),
  (3, 27373, 'Business Return', 'LH9876'),
  (6, 44592, 'Advanced Purchase', 'BA1689'),
  (5, 8777, 'Superpex Return', 'AA4367'),
  (7, 9578, 'Standard Return', 'CT7812'),
  (8, 4459, 'Superpex Return', 'PF4521');

CREATE TABLE Passengers (
  Ps_ID INT PRIMARY KEY,
  Ps_Name VARCHAR(20),
  Address VARCHAR(50),
  Age INT,
  Sex CHAR(1),
  Contacts VARCHAR(10),
  Flight_ID VARCHAR(15),
  FOREIGN KEY (Flight_ID) REFERENCES Flight(Flight_ID)
);

INSERT INTO Passengers VALUES
  (1, 'Steve Smith', '2230 Northside, Apt 11, London', 30, 'M', '8080367290', 'AI2014'),
  (2, 'Ankita Ahir', '3456 Vikas Apts, Apt 102, New Jersey', 26, 'F', '8080367280', 'QR2305'),
  (4, 'Akhilesh Joshi', '345 Chatam courts, Apt 678, Chennai', 29, 'M', '9080369290', 'EY1234'),
  (3, 'Khyati Mishra', '7820 Mccallum courts, Apt 234, Washington', 30, 'F', '8082267280', 'LH9876'),
  (5, 'Rom Solanki', '1234 Baker Apts, Apt 208, Chandigarh', 60, 'M', '9004568903', 'EY1234'),
  (6, 'Lakshmi Sharma', '1110 Fir hills, Apt 90, Daman', 30, 'F', '7666190505', 'AA4367'),
  (8, 'Manan Lakhani', '7720 Mccallum Blvd, Apt 77, Beijing', 45, 'M', '8124579635', 'CT7812'),
  (7, 'Ria Gupta', 'B402, Aditya Apt, Hyderabad', 34, 'F', '9819414036', 'EY1234');

CREATE TABLE Countries (
  Country_code INT PRIMARY KEY,
  Country_Name VARCHAR(30)
);

INSERT INTO Countries VALUES
  (44, 'England'),
  (1, 'USA'),
  (91, 'India'),
  (45, 'Kingdom of Denmark'),
  (64, 'New Zealand'),
  (971, 'UAE'),
  (213, 'Algeria'),
  (55, 'Brazil');

CREATE TABLE Airport (
  Air_code VARCHAR(10) PRIMARY KEY,
  Air_Name VARCHAR(50),
  City VARCHAR(20),
  State VARCHAR(20),
  Country_code INT,
  FOREIGN KEY (Country_code) REFERENCES Countries(Country_code)
);

INSERT INTO Airport VALUES
  ('DEL', 'Indira Gandhi International Airport', 'Delhi', 'UP', 91),
  ('BOM', 'Chhatrapati Shivaji Maharaj International Airport', 'Mumbai', 'Maharashtra', 91),
  ('LCY', 'London City Airport', 'Newham', 'London', 44),
  ('EWR', 'Newark Liberty International Airport', 'Newark', 'New Jersey', 1),
  ('JFK', 'John F. Kennedy International Airport', 'New York City', 'New York', 1),
  ('CPH', 'Copenhagen Airport', 'Copenhagen', 'Denmark', 45),
  ('AIP', 'Adampur Airport', 'Jalandhar', 'Punjab', 91),
  ('IXJ', 'Satwari Airport', 'Jammu', 'Jammu & Kashmir', 91);

CREATE TABLE Employees (
  Emp_ID INT PRIMARY KEY,
  Username VARCHAR(20),
  Password VARCHAR(20),
  E_Name VARCHAR(20),
  Address VARCHAR(50),
  Age INT,
  Email_ID VARCHAR(50),
  Contact VARCHAR(20),
  Air_code VARCHAR(10),
  FOREIGN KEY (Air_code) REFERENCES Airport(Air_code)
);

INSERT INTO Employees VALUES
  (1234, 'rekha1234', 'password123', 'Rekha Tiwary', '202-Meeta Apt,Yogi Nagar,Mumbai', 30, 'rekha1234@gmail.com', '+918530324018', 'DEL'),
  (3246, 'john2346', 'password456', 'John Dsouza', '302-Fountain Apt,ElizaBeth Street,Newham', 26, 'john2346@gmail.com', '+447911123456', 'BOM'),
  (9321, 'sanjay78', 'password789', 'Sanjay Rathod', '62-Patwa Apt,Pradeep Nagar,Delhi', 36, 'sanjay78@gmail.com', '+917504681201', 'LCY');


CREATE TABLE Admins (
  Admin_ID INT PRIMARY KEY,
  Username VARCHAR(20),
  Password VARCHAR(20),
  A_Name VARCHAR(20),
  Email_ID VARCHAR(50)
);

INSERT INTO Admins VALUES
  (101, 'admin_user', 'admin_password', 'John Doe', 'admin@airline.com'),
  (102, 'admin_jane', 'admin_password123', 'Jane Smith', 'admin_jane@airline.com');


CREATE TABLE Can_Land (
  Air_code VARCHAR(10),
  Flight_ID VARCHAR(15),
  PRIMARY KEY (Air_code, Flight_ID),
  FOREIGN KEY (Air_code) REFERENCES Airport(Air_code),
  FOREIGN KEY (Flight_ID) REFERENCES Flight(Flight_ID)
);

INSERT INTO Can_Land VALUES
  ('DEL', 'AI2014'),
  ('BOM', 'QR2305'),
  ('LCY', 'EY1234'),
  ('EWR', 'LH9876'),
  ('JFK', 'BA1689'),
  ('CPH', 'AA4367'),
  ('AIP', 'CT7812'),
  ('IXJ', 'PF4521');

CREATE TABLE Transactions (
  TS_ID BIGINT PRIMARY KEY,
  Booking_Date DATE,
  Departure_Date DATE,
  TS_Type VARCHAR(20),
  Emp_ID INT,
  Ps_ID INT,
  Flight_ID VARCHAR(15),
  Charge_Amount INT,
  FOREIGN KEY (Emp_ID) REFERENCES Employees(Emp_ID),
  FOREIGN KEY (Ps_ID) REFERENCES Passengers(Ps_ID),
  FOREIGN KEY (Flight_ID) REFERENCES Flight(Flight_ID)
);

INSERT INTO Transactions VALUES
  (12345678, '2021-02-21', '2021-02-22', 'Google Pay', 1234, 1, 'AI2014', 27341),
  (45612789, '2021-01-12', '2021-01-14', 'Credit Card', 3246, 2, 'QR2305', 34837),
  (56987123, '2020-12-05', '2020-12-02', 'Paytm', 9321, 4, 'EY1234', 42176),
  (45321879, '2021-03-15', '2021-03-16', 'PhonePe', 8512, 3, 'LH9876', 27373),
  (75145863, '2021-04-22', '2021-04-25', 'Paytm', 7512, 5, 'EY1234', 44592),
  (17892455, '2021-02-05', '2021-02-08', 'Paytm', 5123, 6, 'AA4367', 8777),
  (24517852, '2021-03-06', '2021-03-08', 'PhonePe', 2458, 8, 'CT7812', 9578),
  (32548525, '2021-01-20', '2021-01-25', 'Credit Card', 4521, 7, 'EY1234', 4459);

CREATE TABLE Travels_on (
  Route_ID INT,
  Flight_ID VARCHAR(15),
  PRIMARY KEY (Route_ID, Flight_ID),
  FOREIGN KEY (Route_ID) REFERENCES Route(Route_ID),
  FOREIGN KEY (Flight_ID) REFERENCES Flight(Flight_ID)
);

INSERT INTO Travels_on VALUES
  (168806, 'AI2014'),
  (157306, 'QR2305'),
  (178916, 'EY1234'),
  (324567, 'LH9876'),
  (452368, 'BA1689'),
  (894521, 'AA4367'),
  (578425, 'CT7812'),
  (421523, 'PF4521');


  CREATE TABLE Customers (
  Customer_ID INT PRIMARY KEY,
  Username VARCHAR(20),
  Password VARCHAR(20),
  C_Name VARCHAR(20),
  Email_ID VARCHAR(50),
  Contact VARCHAR(20)
);

INSERT INTO Customers VALUES
  (1001, 'customer_john', 'customer_password', 'John Smith', 'john@customer.com', '+1234567890'),
  (1002, 'customer_jane', 'customer_password123', 'Jane Doe', 'jane@customer.com', '+0987654321');