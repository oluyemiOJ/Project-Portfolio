

CREATE TABLE customer(
customer_id	varchar PRIMARY KEY,
customer_name	varchar,
segment	varchar,
age	int,
country	varchar,
city	varchar,
state	varchar,
postal_code	int,
region	varchar
)

CREATE TABLE product(
product_id	text PRIMARY KEY,
category	varchar,
sub_category	varchar,
product_name	text
)

select *
from customer

select * 
from product

CREATE TABLE Sales 



/* CREATE TABLE table_name_2 
(    some_column1 datatype  PRIMARY KEY,
some_column2 datatype constraints,
some_column3 datatype constraints,
	...     
FOREIGN KEY (some_column3 REFERENCES table_name(column1)); */

CREATE TABLE sales (
order_line	int PRIMARY KEY,
order_id	text ,
order_date	date,
ship_date	date,
ship_mode	text,
customer_id	varchar,
product_id	text,
sales	float,
quantity	int,
discount	float,
profit	float,

FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
FOREIGN KEY (product_id) REFERENCES product(product_id)
)

select * from sales

/* SELECT column1, column2, ...
    FROM table_name
     WHERE condition = 'kentucky';
	 
*/

SELECT customer_id, customer_name, state 
FROM  customer
WHERE state = 'Kentucky'; 

SELECT * 
FROM customer
where state = 'Kentucky'

select * from customer

select * from sales 

-- quantity greater 10.

select *
From sales
where profit < 100

-- discount 

select *
From sales
where discount = 0.2

-- not equals to [ != ]

select *
From sales
where profit  != 100

-- AND , OR , NOT. 

-- and [ 2 conditions ]

select *
from customer
where state = 'Florida'

-- people living in FLorida and city = miami AND  segment =  consumer. 

select *
from customer
where state = 'Florida' AND segment = 'Consumer' AND city = 'Miami'


-- or 

select *
from customer
where city = 'Seattle' OR city = 'Orem'
limit 10;


select *
from product

select * 
from product 
where NOT category = 'Furniture'  and Not category = 'Technology'

/* SELECT column_name(s)
FROM table_name
WHERE column_name IN (value1, value2, ...); */ 


select * 
from sales
where customer_id IN ('DV-13045', 'CG-12520')
limit 10;

/* SELECT column_name(s) 
FROM table_nameol
WHERE cumn_name BETWEEN value1 AND value2; */


select * from sales
where order_date  BETWEEN '2016-12-01' AND '2016-12-31'


/* SELECT column1, column2, ...
FROM table_name
WHERE columnN LIKE pattern; [%,_]

*/

-- [%]
select * from customer
where customer_name like 'Ke%'

select * from customer
where customer_name like 'P_te%'

-- Alias

select * from customer as our_customer


select * from customer
limit 2;

select * from sales 
order by profit desc
limit 10; 


select * from sales 
order by profit, sales desc
limit 10; 



-- sum, count, min/max, avg, 


select count(order_line), count(order_id)
FROM sales




select count(order_line) as count_of_order_line , count(order_id) as no_of_order_id
FROM sales


select count(*)
from sales

select count(customer_id) as number_of_customer from customer

-- min, max
select * from sales
select min(quantity) as minimum_orderer_quantity,  max(quantity) as Maximum_ordered_quantity

From sales


select min(col_name) as 


select avg(sales) from sales

select avg(age) from customer

-- sum 

select sum(age) from customer

select sum(sales) from sales


select * from customer

select count(distinct(customer_name))
from customer


/* SELECT column_name(s)
FROM table_name
WHERE condition
GROUP BY column_name(s); */

-- count, min, max, avg

select count(customer_name) as number_of_customer_in_region ,count(segment) as no_of_segment, region
from customer
group by region;  

select * from sales
where customer_id = 'CG-12520'


select customer_id, count(customer_id) as total_purchases, sum(Sales) as Total_money_spent
from sales
group by customer_id
order by  Total_money_spent,customer_id  DESC;



select * from customer
where state = 'California'





/* SELECT column_name(s)
FROM table_name
GROUP BY column_name(s)
HAVING <condition */

-- age of people per region that are  < 50. 

/*select min(age), region, count(customer_name) as number_of_customers
from customer
group by region
having min(age) < 50; */

select count(customer_name) as number_of_customers , region, avg(age) 
from customer
group by region
having avg(age) > 44.3



select * from customer

-- reclassify peoples age
-- 0 - 20 (young)
--21- 40 (adults)
--41- 60 (older)
-- 61 (aged)

/* Select *, 
CASE    
WHEN condition1 THEN result1
WHEN condition2 THEN result2
...
WHEN conditionN THEN resultN   

ELSE result
END as new_col_name
From Table_name;  */

x = [0, 1, 2, 3, 4, 5] 
 x> 2. 3,4,5 
ade, segun , Bola. 

select *, 

	CASE 
		 WHEN age <= 20 THEN 'Young'
 		 WHEN age <= 40  THEN 'Adult'
         WHEN age <= 60  THEN 'Older'
 ELSE 'Aged'
 
 END as Age_group
 FROM customer
 
 select * from sales
 
 -- check ( yes, no) average sales = 229.8
 
select avg(sales) from sales

select *, 
 case
  when sales > 229.8 THEN 'Yes'
  Else 'No'
  
  END as Above_or_not_Above
  
  from sales


 
 
select * 
from customer



create table west_region as 
(
select * 
from customer
	where region = 'West'
)

 
select *
from west_region



select count(customer_id) from west_region
 
  


 
 
 -- join customer with sales 
 -- customer-name, age 
 -- sales , quantity 
 
 select customer_name, age, sales, quantity
 from customer 
 left join
 sales
 ON customer.customer_id = sales.customer_id ;
 
 -- Right join
 
 -- [cutomer_name, age,]-- west_region  state -customer.  
 
 select WR.customer_name, WR.age, C.state
 from west_region as WR 
 Right join 
 customer as C
 On WR.customer_id = C.customer_id;
 
 
west region vs sales 
name, city, quantity, sales



select WR.customer_name, WR.city, S.Sales
 from west_region as WR
 inner join
 sales as S
 on WR.customer_id = S.customer_id
 
 
 select WR.customer_name, WR.city, S.Sales
 from west_region as WR
 full join
 sales as S
 on WR.customer_id = S.customer_id
 
 

 CREATE TABLE GET_FIT_NOW_MEMBER(
ID TEXT, PERSON_ID INTEGER, NAME VARCHAR, MEMBERSHIP_START_DATE DATE , MEMBERSHIP_STATUS VARCHAR
)
SELECT *
FROM GET_FIT_NOW_MEMBER

CREATE TABLE CRIME_SCENE_REPORT(
DATE DATE, TYPE VARCHAR, DESCRIPTION TEXT, CITY TEXT
)
	SELECT * 
	FROM CRIME_SCENE_REPORT
	
CREATE TABLE INCOME(
SSN INTEGER, ANNUAL_INCOME INTEGER)
SELECT * FROM INCOME

CREATE TABLE INTERVIEW(
PERSON_ID INTEGER, TRANSCRIPT TEXT)
SELECT * 
FROM INTERVIEW

CREATE TABLE DRIVERS_LICENSE(
ID INTEGER, AGE INT, HEIGHT INT, EYE_COLOR VARCHAR, HAIR_COLOR VARCHAR,
	GENDER VARCHAR, PLATE_NUMBER TEXT, CAR_MAKE VARCHAR, CAR_MODEL TEXT
)
SELECT *
FROM DRIVERS_LICENSE

CREATE TABLE GET_FIT_NOW_CHECK_IN(
MEMBESHIP_ID TEXT, CHECK_IN_DATE DATE, CHECK_IN_TIME INT, CHECK_OUT_TIME INT
)
SELECT * 
FROM GET_FIT_NOW_CHECK_IN

CREATE TABLE PERSON(
ID INT, NAME VARCHAR, LICENSE_ID INT, ADDRESS_NUMBER INT, ADDRESS_STREET_NAME VARCHAR, SSN INT
)
SELECT * 
FROM PERSON

CREATE TABLE FACEBOOK_EVENT_CHECKIN(
PERSON_ID INT, EVENT_ID INT, EVENT_NAME TEXT, DATE DATE
)
SELECT * 
FROM FACEBOOK_EVENT_CHECKIN




/* You vaguely remember that the crime was a murder
that occurred sometime on Jan.15, 2018
and that it took place in SQL City*/

select *
from crime_scene_report


select *
from crime_scene_report
where date = 20180115 and city = 'SQL City'

/* Security footage shows that there were 2 witnesses.
The first witness lives at the last house on "Northwestern Dr". 
The second witness, named Annabel, lives somewhere on "Franklin Ave".
*/


-- witness one.  

select * 
from person 


-- method 1.

select * 
from person
where address_street_name = 'Northwestern Dr'
order by address_number desc


-- 14887, Morty Schapiro, 118009, 111564949. 


-- method 2



select address_street_name, max(address_number) from person
group by address_street_name
having address_street_name = 'Northwestern Dr'

select *
from person
where address_number = 4919


-- witness 2

-- The second witness, named Annabel, lives somewhere on "Franklin Ave"

select * 
from person
where name like 'Annabel%'
and address_street_name = 'Franklin Ave';

-- 16371,Annabel Miller,  490173, 318771143. 

select * 
from interview


-- Extract transcipts of witness


select * 
from interview
where person_id in (14887,16371)


-- witness 1. 
/* I heard a gunshot and then saw a man run out.
He had a "Get Fit Now Gym" bag. 
The membership number on the bag started with "48Z".
Only gold members have those bags. 
The man got into a car with a plate that included "H42W".
*/

-- witness 2. 
/* I saw the murder happen, and I recognized the killer from my gym when I was working out 
last week on January the 9th.
*/ 

select * 
from get_fit_now_member



-- based on witness account 1. 



 


select * 
from get_fit_now_member
where id like '48Z%'
and membership_status = 'gold'


-- 48Z7A, 28819, Joe Germuska
-- 48Z55, 67318, Jeremy Bowers

-- check who came to gym on jan 9th. 

select * 
from get_fit_now_check_in


select *
from get_fit_now_check_in
where check_in_date = 20180109 and membership_id in ('48Z55','48Z7A')


-- query plate number.


select *
from drivers_license


-- The man got into a car with a plate that included "H42W".

-- method 2.  

--

-- left join. 

select * 
from person

-- person: name,ssn, address_street_name
-- drivers_license: age, height, hair_color, gender, plate_number, car_make, car_model. 


-- person as p, drivers_license as dl. 


select dl.age, dl.height, dl.hair_color, dl.gender, dl.plate_number, dl.car_make, dl.car_model,
       p.name, p.ssn, p.address_street_name, p.id
	   
FROM drivers_license as dl
LEFT JOIN person as p
on dl.id = p.license_id 

where plate_number like '%H42W%' or plate_number like 'H42W%' or plate_number like '%H42W'

-- Jeremy Bowers 67318


select *
from interview


select *
from interview
where person_id = 67318

/* I was hired by a woman with a lot of money. 
I don't know her name but I know she's around 5'5" (65") or 5'7" (67"). 
She has red hair and she drives a Tesla Model S. 
I know that she attended the SQL Symphony Concert 3 times in December 2017.
*/



select *
from drivers_license

-- query dl 

select * from drivers_license
where gender = 'female' and 
height  between 65 and 67
and 
hair_color = 'red'
and 
car_make = 'Tesla'
and car_model = 'Model S'


create table suspect as (
select *
from drivers_license
where gender = 'female' and 
height  between 65 and 67
and 
hair_color = 'red'
and 
car_make = 'Tesla'
and car_model = 'Model S'
)



select *
from suspect


-- query facebook_event_checkin

select * 
from facebook_event_checkin


select *
from facebook_event_checkin 
where event_name = 'SQL Symphony Concert' and date between 20171201 and 20171231


-- join person with suspect 

-- right table: suspect 


select s.id, s.age,s.height,
       p.id as person_id, p.name,p.address_street_name, p.ssn
	   from suspect as s
right join person as p
on s.id = p.license_id



select * 
from facebook_event_checkin 
where event_name = 'SQL Symphony Concert' and date between 20171201 and 20171231
 and person_id in (99716, 90700, 78881) 
 
 
 
-- 99716

select *
from suspect 

select * 
from person 
where id = 99716
 
 -- 987756388
 
select * 
from income
where ssn = 987756388


create table  money_flow as (
select * 
from person
where ssn in ( select ssn from income )
)




