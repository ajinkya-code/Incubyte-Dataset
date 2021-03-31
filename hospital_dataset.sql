create table user_info (customer_name varchar(255) auto_increment primary key, 
									customer_id varchar(18) not null,
                                    customer_open_date date not null,
                                    last_consulted_Date date,
                                    vaccination_type char(5),
                                    doctor_consulted char(255),
                                    state char(5),
                                    country char(5),
                                    post_code int,
                                    date_of_birth date,
                                    active_customer char(1)
								 ); #create table
						
insert into 
user_info (customer_name, customer_id, customer_open_date, last_consulted_Date, vaccination_type, doctor_consulted, state, country, date_of_birth, active_customer)
value 	('Alex', '123457', '20101012', '20121013', 'MVD', 'Paul', 'SA', 'USA', '06031987','A'),
		('John', '123458', '20101012', '20121013', 'MVD', 'Paul', 'TN', 'IND', '06031987','A'),
        ('Mathew', '123459', '20101012', '20121013', 'MVD', 'Paul', 'WAS', 'PHIL', '06031987','A'),
        ('Mat', '12345', '20101012', '20121013', 'MVD', 'Paul', 'BOS', 'NYC', '06031987','A'),
        ('Jacob', '1234', '20211012', '20121013', 'MVD', 'Paul', 'VIC', 'AU', '06031987','A'); #insert into the table
        
Select * into Table_India from user_info where country = 'IND';   #sperate the table by the country
Select * into Table_USA from user_info where country = 'USA';
Select * into Table_PHIL from user_info where country = 'PHIL';
Select * into Table_NYC from user_info where country = 'NYC';
Select * into Table_AU from user_info where country = 'AU';

Select * from Table_India where state = 'TN'; #customers info whose from Tamilnadu state in India

Select count(customer_id), country from user_info group by country; #country wise count of customers

Select * from user_info where customer_open_date between '20101012' and '20211012'; #customer open date in particula months

Select * from user_info where country = 'India' and name = 'John' order by last_consulted_Date desc; #last consulted date in india

with CTE as (select *, row number() over(partition by customer_id order by customer_id ) as rank from user_info ;
Select * from CTE ;
delete from CTE where rank> 1 ; #delete duplicate records from table

Select customer_name, customer_id, customer_open_date from user_info where customer_open_date = date_sub(now(),interval 3 month); #customer open date in last 3 months

Select customer_name, customer_id, datediff(now(),date_of_birth) as cust_age from user_info limit 10 ; #age of customers

Select * from Table_India where vaccination_type not in ('MVD'); #customer who is not vaccinated in India
