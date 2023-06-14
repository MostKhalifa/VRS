
create database VRS

use VRS


create table Vehicle(
id int identity,
owned bit,
status varchar(20),
rate int,
class varchar(20),
brand varchar(20),
model varchar(20),
current_milage int,
gps_loc varchar(200),

primary key(id)
)



create table Motorcycle(
id int,
motor decimal (10,2),

primary key(id),
foreign key(id) references Vehicle on delete cascade on update cascade
)




create table Scooter(
id int ,
battery decimal(10,2),
check (battery between 0 and 100),

primary key(id),
foreign key(id) references Vehicle on delete cascade on update cascade
)



create table Location(
pin_number int,
gps_loc varchar(200),

primary key(pin_number)
)



alter table Vehicle
add location int,foreign key(location) references Location on delete cascade on update cascade


create table Customer(
ssn varchar(14),
email varchar(50),
name varchar(100),
address varchar(100),
password varchar(20),

primary key(ssn)
)



create table CustomerPhone(
ssn varchar(14),
phone varchar(20),

primary key(ssn,phone),
foreign key(ssn) references Customer on delete cascade on update cascade
)




create table VehicleRating(
vehicle int,
customer varchar(14),
rating int,
check (rating between 0 and 10),

primary key(vehicle,customer),
foreign key(vehicle) references Vehicle on delete cascade on update cascade,
foreign key(customer) references customer on delete cascade on update cascade
)



create table Payment_type(
customer varchar(14),
number varchar(16),

primary key(customer, number),
foreign key(customer) references Customer on delete cascade on update cascade
)



create table Credit(
customer varchar(14),
number varchar(16),
cvv varchar(3),
expire datetime,

primary key(customer, number),
foreign key(customer) references Customer(ssn) on delete cascade on update cascade,
foreign key(customer,number) references Payment_type
)



create table Payment_info(
p_id int,
value int,
exp_date date,
customer varchar(14),

foreign key(customer) references Customer on delete cascade on update cascade
)



--***
create table Insurance(
number varchar(15) ,
rate int,

primary key(number)
)




create table Basic(
number varchar(15),

primary key(number),
foreign key(number) references Insurance on delete cascade on update cascade
)



create table Advanced(
number varchar(15),
liability_amount decimal(10,3),

primary key(number),
foreign key(number) references Insurance on delete cascade on update cascade
)



create table Premium(
number varchar(15),

primary key(number),
foreign key(number) references Insurance on delete cascade on update cascade
)



create table Employee(
ssn varchar (14),
address varchar(100),
hours_per_week int,
email varchar(50),
name varchar(100),
password varchar(20)

primary key(ssn)
)




create table Accident(
id int identity,
description varchar(200),

primary key(id)
)


create table Extra(
id int identity,
type varchar(20),
rate decimal(10,2),
rented_by varchar(14),

primary key(id),
foreign key(rented_by) references Customer on delete cascade on update cascade
)





create table Rents_for_time(
vehicle int,
insurance varchar(15),
customer varchar(14),
time datetime,
destination varchar(40),

--primary key(vehicle, insurance, customer),
foreign key(vehicle) references Vehicle on delete cascade on update cascade,
foreign key(insurance) references Insurance(number) on delete cascade on update cascade,
foreign key(customer) references Customer on delete cascade on update cascade
)


create table Accident_info(
accident_id int,
customer varchar(14),
vehicle int,

primary key(accident_id),
foreign key(accident_id) references Accident on delete cascade on update cascade,
foreign key(customer) references Customer on delete cascade on update cascade,
foreign key(vehicle) references Vehicle on delete cascade on update cascade
)


create table Responsible_Insurance(
insurance varchar(15),
accident int,
bill decimal(10,2),
number_of_installments int,

primary key(insurance,accident),
foreign key(insurance) references Insurance on delete cascade on update cascade,
foreign key(accident) references Accident on delete cascade on update cascade
)



create table Gift_Card( 
customer varchar(14),
employee varchar(14),
amount int,

primary key(customer),
foreign key(customer) references Customer on delete cascade on update cascade,
foreign key(employee) references Employee on delete cascade on update cascade
)






insert into Location (pin_number,gps_loc) values (1,'heliopolis')
insert into Location (pin_number,gps_loc) values (2,'tagamoa')
insert into Location (pin_number,gps_loc) values (3,'sherouk')
insert into Location (pin_number,gps_loc) values (4,'obour')
insert into Location (pin_number,gps_loc) values (5,'madinaty')








insert into Vehicle (owned,status, rate,class,brand,model, current_milage,gps_loc,location)
		values (1,'rented',2,'reg','Honda','NC750X',5000,'helipolis',1)
insert into Vehicle (owned,status, rate,class,brand,model, current_milage,gps_loc,location)
		values (0,'maintenance',3,'reg','BMW','M 1000 RR',2000,'tagamoa',2)
insert into Vehicle (owned,status, rate,class,brand,model, current_milage,gps_loc,location)
		values (1,'available',2,'reg','Honda','CB500X',3000,'heliopolis',3)
insert into Vehicle (owned,status, rate,class,brand,model, current_milage,gps_loc,location)
		values (0,'rented',5,'tri','Harley','IRON 883',4000,'madinaty',4)
insert into Vehicle (owned,status, rate,class,brand,model, current_milage,gps_loc,location)
		values (1,'maintenance',4,'reg','Ducati','Panigale V4',5500,'sherouk',1)
insert into Vehicle (owned,status, rate,class,brand,model, current_milage,gps_loc,location)
		values (0,'maintenance',2,'tri','Honda','CB1000R',7000,'obour',2)
insert into Vehicle (owned,status, rate,class,brand,model, current_milage,gps_loc,location)
		values (1,'rented',3,'tri','BMW','S 1000 RR',3000,'tagamoa',3)
insert into Vehicle (owned,status, rate,class,brand,model, current_milage,gps_loc,location)
		values (0,'maintenance',4,'reg','Ducati','Monster BS6',4000,'nasr city',4)
insert into Vehicle (owned,status, rate,class,brand,model, current_milage,gps_loc,location)
		values (1,'available',5,'tri','Harley','STREET BOB® 114',8000,'nasr city',1)
insert into Vehicle (owned,status, rate,class,brand,model, current_milage,gps_loc,location)
		values (0,'available',3,'tri','BMW','K 1600 B',1000,'heliopolis',2)

insert into Vehicle (owned,status, rate,class,brand,model, current_milage,gps_loc,location)
		values (1,'available',1,'reg','Tier','M1',220,'heliopolis',3)
insert into Vehicle (owned,status, rate,class,brand,model, current_milage,gps_loc,location)
		values (0,'rented',2,'reg','Lime','M1',200,'sherouk',4)
insert into Vehicle (owned,status, rate,class,brand,model, current_milage,gps_loc,location)
		values (1,'maintenance',3,'reg','Voi','M2',300,'nasr city',1)
insert into Vehicle (owned,status, rate,class,brand,model, current_milage,gps_loc,location)
		values (0,'available',2,'reg','Lime','M2',500,'obour',2)
insert into Vehicle (owned,status, rate,class,brand,model, current_milage,gps_loc,location)
		values (1,'rented',1,'reg','Tier','M2',700,'heliopolis',3)
insert into Vehicle (owned,status, rate,class,brand,model, current_milage,gps_loc,location)
		values (0,'maintenance',3,'reg','Voi','M3',1000,'tagamoa',4)
insert into Vehicle (owned,status, rate,class,brand,model, current_milage,gps_loc,location)
		values (1,'available',2,'reg','Lime','M3',100,'tagamoa',1)
insert into Vehicle (owned,status, rate,class,brand,model, current_milage,gps_loc,location)
		values (0,'rented',1,'reg','Tier','M1',300,'sherouk',2)
insert into Vehicle (owned,status, rate,class,brand,model, current_milage,gps_loc,location)
		values (1,'maintenance',2,'reg','Lime','M4',200,'nasr city',3)
insert into Vehicle (owned,status, rate,class,brand,model, current_milage,gps_loc,location)
		values (0,'available',3,'reg','Voi','M1',500,'madinaty',4)


insert into Motorcycle(id, motor) values (1,245)
insert into Motorcycle(id, motor) values (2,654)
insert into Motorcycle(id, motor) values (3,34)
insert into Motorcycle(id, motor) values (4,70)
insert into Motorcycle(id, motor) values (5,35)
insert into Motorcycle(id, motor) values (6,50)
insert into Motorcycle(id, motor) values (7,20)
insert into Motorcycle(id, motor) values (8,200)
insert into Motorcycle(id, motor) values (9,50.2)
insert into Motorcycle(id, motor) values (10,100)





insert into Scooter(id, battery) values (11,75)
insert into Scooter(id, battery) values (12,25)
insert into Scooter(id, battery) values (13,40)
insert into Scooter(id, battery) values (14,30)
insert into Scooter(id, battery) values (15,20)
insert into Scooter(id, battery) values (16,50)
insert into Scooter(id, battery) values (17,80)
insert into Scooter(id, battery) values (18,99)
insert into Scooter(id, battery) values (19,15)
insert into Scooter(id, battery) values (20,30)






insert into Customer (ssn, email, name, address, password) values ('1000','j.nab20@yahoo.com','John Nabil','Heliopolis','john1000')
insert into Customer (ssn, email, name, address, password) values ('1001','y.atef10@yahoo.com','Youssef Atef','Nasr City','youssef1000')
insert into Customer (ssn, email, name, address, password) values ('1002','m.dwe21@yahoo.com','Mark Emad','Almaza','mark1000')
insert into Customer (ssn, email, name, address, password) values ('1003','m.khalifa@yahoo.com','Mostafa Khalifa','Tagamoa','tifa1000')
insert into Customer (ssn, email, name, address, password) values ('1004','y_messi@gmail.com','Youssef Nader','Sherouk','youssef1000')
insert into Customer (ssn, email, name, address, password) values ('1005','seif@gmail.com','Seif Yasser','Madinaty','seif1000')
insert into Customer (ssn, email, name, address, password) values ('1006','raf_nl@gmail.com','Rafael Nadal','Obour','rafi1000')
insert into Customer (ssn, email, name, address, password) values ('1007','katamaged123@gmail.com','Mina Maged','Madinaty','kata1000')
insert into Customer (ssn, email, name, address, password) values ('1008','mina@hotmail.com','Mina Mamdouh','Heliopolis','mina1000')
insert into Customer (ssn, email, name, address, password) values ('1009','fady_ib@hotmail.com','Fady Nader','Almaza','fady1000')
 



insert into CustomerPhone (ssn, phone) values ('1000','+201034059284')
insert into CustomerPhone (ssn, phone) values ('1001','+201034059281')
insert into CustomerPhone (ssn, phone) values ('1002','+201034059283')
insert into CustomerPhone (ssn, phone) values ('1003','+201034059282')
insert into CustomerPhone (ssn, phone) values ('1004','+201034059285')
insert into CustomerPhone (ssn, phone) values ('1005','+201034059287')
insert into CustomerPhone (ssn, phone) values ('1006','+201034059286')
insert into CustomerPhone (ssn, phone) values ('1007','+201034059289')
insert into CustomerPhone (ssn, phone) values ('1008','+201034059288')
insert into CustomerPhone (ssn, phone) values ('1009','+201034059271')



insert into VehicleRating (vehicle, customer, rating) values (1,'1000',5)
insert into VehicleRating (vehicle, customer, rating) values (2,'1001',9)
insert into VehicleRating (vehicle, customer, rating) values (3,'1002',3)
insert into VehicleRating (vehicle, customer, rating) values (11,'1003',8)
insert into VehicleRating (vehicle, customer, rating) values (15,'1004',9)
insert into VehicleRating (vehicle, customer, rating) values (17,'1005',10)



insert into Payment_type (customer,number) values ( '1005', '4569854123654789')




insert into Credit values ('1000', '4569854123654789', '852', '2025-09-11')



insert Payment_info (p_id, value, exp_date, customer) values (1,200,'2025-12-20','1000')
insert Payment_info (p_id, value, exp_date, customer) values (2,100,'2021-12-22','1000')
insert Payment_info (p_id, value, exp_date, customer) values (3,150,'2021-12-23','1001')
insert Payment_info (p_id, value, exp_date, customer) values (4,300,'2010-12-25','1000')




insert into Insurance (number, rate) values ('100',20)
insert into Insurance (number, rate) values ('101',30)
insert into Insurance (number, rate) values ('102',50)
insert into Insurance (number, rate) values ('103',100)
insert into Insurance (number, rate) values ('104',30)

insert into Basic values ('100')
insert into Basic values ('101')
insert into Advanced values ('102',100)
insert into Premium values ('102')
insert into Premium values ('103')




insert into Employee (ssn,address,hours_per_week,email,name,password) values ('2000','Heliopolis',20,'y.nabil@yahoo.com','Yasser Nabil','yasser1000')
insert into Employee (ssn,address,hours_per_week,email,name,password) values ('2001','Almaza',30,'m.maged@gmail.com','Mina Maged','mina1000')
insert into Employee (ssn,address,hours_per_week,email,name,password) values ('2002','Nasr City',25,'s.emad@hotmail.com','Samer Emad','samer1000')
insert into Employee (ssn,address,hours_per_week,email,name,password) values ('2003','Tagamoa',18,'o.ashraf@yahoo.com','Omar Ashraf','omar1000')
insert into Employee (ssn,address,hours_per_week,email,name,password) values ('2004','Heliopolis',28,'n.nagy@gmail.com','Nader Nagy','nader1000')


insert into Accident (description) values ('crash')
insert into Accident (description) values ('crash')
insert into Accident (description) values ('crash')
insert into Accident (description) values ('crash')
insert into Accident (description) values ('crash')



insert into Extra (type, rate, rented_by) values ('helmet',2,null)
insert into Extra (type, rate, rented_by) values ('helmet',2.68,null)
insert into Extra (type, rate, rented_by) values ('gps',5,null)
insert into Extra (type, rate, rented_by) values ('gps',5,null)
insert into Extra (type, rate, rented_by) values ('side bag',10,null)




insert into Rents_for_time (vehicle,insurance,customer,time,destination) values (1, '100', '1000', '00:20:00', 'Heliopolis')
insert into Rents_for_time (vehicle,insurance,customer,time,destination) values (2, '100', '1000', '00:20:00', 'Heliopolis')
insert into Rents_for_time (vehicle,insurance,customer,time,destination) values (3, '100', '1000', '00:20:00', 'Heliopolis')
insert into Rents_for_time (vehicle,insurance,customer,time,destination) values (4, '100', '1000', '00:20:00', 'Heliopolis')
insert into Rents_for_time (vehicle,insurance,customer,time,destination) values (5, '100', '1000', '00:20:00', 'Heliopolis')
insert into Rents_for_time (vehicle,insurance,customer,time,destination) values (6, '100', '1000', '00:20:00', 'Heliopolis')
insert into Rents_for_time (vehicle,insurance,customer,time,destination) values (7, '100', '1000', '00:20:00', 'Heliopolis')
insert into Rents_for_time (vehicle,insurance,customer,time,destination) values (8, '100', '1000', '00:20:00', 'Heliopolis')
insert into Rents_for_time (vehicle,insurance,customer,time,destination) values (9, '100', '1000', '00:20:00', 'Heliopolis')
insert into Rents_for_time (vehicle,insurance,customer,time,destination) values (10, '100', '1000', '00:20:00', 'Heliopolis')
insert into Rents_for_time (vehicle,insurance,customer,time,destination) values (11, '100', '1000', '00:20:00', 'Heliopolis')
insert into Rents_for_time (vehicle,insurance,customer,time,destination) values (12,'100', '1000', '00:20:00', 'Heliopolis')
insert into Rents_for_time (vehicle,insurance,customer,time,destination) values (13,'100', '1000', '00:20:00', 'Heliopolis')
insert into Rents_for_time (vehicle,insurance,customer,time,destination) values (14,'100', '1000', '00:20:00', 'Heliopolis')
insert into Rents_for_time (vehicle,insurance,customer,time,destination) values (15,'100', '1000', '00:20:00', 'Heliopolis')
insert into Rents_for_time (vehicle,insurance,customer,time,destination) values (16,'100', '1000', '00:20:00', 'Heliopolis')
insert into Rents_for_time (vehicle,insurance,customer,time,destination) values (17,'100', '1000', '00:20:00', 'Heliopolis')
insert into Rents_for_time (vehicle,insurance,customer,time,destination) values (18,'100', '1000', '00:20:00', 'Heliopolis')
insert into Rents_for_time (vehicle,insurance,customer,time,destination) values (19,'100', '1000', '00:20:00', 'Heliopolis')
insert into Rents_for_time (vehicle,insurance,customer,time,destination) values (20,'100', '1000', '00:20:00', 'Heliopolis')
insert into Rents_for_time (vehicle,insurance,customer,time,destination) values (2, '101', '1001', '00:20:00', 'Almaza')
insert into Rents_for_time (vehicle,insurance,customer,time,destination) values (3, '102', '1002', '00:20:00', 'Nozha')
insert into Rents_for_time (vehicle,insurance,customer,time,destination) values (4, '103', '1003', '00:20:00', 'Heliopolis')
insert into Rents_for_time (vehicle,insurance,customer,time,destination) values (17, '104', '1004', '00:20:00', 'Tagamoa')


insert into Accident_info (accident_id, customer, vehicle) values ( 1, '1000','4' )
insert into Accident_info (accident_id, customer, vehicle) values ( 2, '1001','1' )
insert into Accident_info (accident_id, customer, vehicle) values ( 3, '1003','2' )
insert into Accident_info (accident_id, customer, vehicle) values ( 4, '1005','2' )
insert into Accident_info (accident_id, customer, vehicle) values ( 5, '1000','3' )


insert into Responsible_Insurance (insurance,accident,bill,number_of_installments) values ('100',1,200,3)
insert into Responsible_Insurance (insurance,accident,bill,number_of_installments) values ('101',2,150,4)
insert into Responsible_Insurance (insurance,accident,bill,number_of_installments) values ('102',3,200,2)
insert into Responsible_Insurance (insurance,accident,bill,number_of_installments) values ('103',4,300,3)


insert into Gift_Card (customer, employee,amount) values ('1000','2000', 10)
insert into Gift_Card (customer, employee,amount) values ('1001','2001',20)
insert into Gift_Card (customer, employee,amount) values ('1002','2002',15)
