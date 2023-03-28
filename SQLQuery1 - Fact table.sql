/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [Sales Person]
      ,trim ([Geography]) as Country
      ,[Product]
      ,[Date]
      ,[Amount]
      ,[Customers]
      ,[Boxes]
  --    ,[Region]
  FROM [Data_Analysis_porfolio_project].[dbo].[Fact_table]

  select * from Fact_table

  
  ------ replacing PAkistan from Pakistan in geograpy column

  select distinct(Geography) from Fact_table

  update Fact_table
  set Geography = case when Geography = 'PAkistan   ' then 'Pakistan'
                        else Geography end

 ------replace 50% Dark Bites,70% Dark Bites from Dark Bites and 85% Dark Bars from Dark Bars and 99% Dark & Pure from Dark & Pure

 select distinct product from Fact_table

 select * from Fact_table
  where product like '%choco'
		
update Fact_table
set product = case product when '50% Dark Bites' then 'Dark Bites'
                       when '70% Dark Bites' then 'Dark Bites'
					   when '85% Dark Bars' then 'Dark Bars'
					   when '99% Dark & Pure' then 'Dark & Pure'
					   else product 
					   end
-----for null values

select * from Fact_table
where [Sales Person] is null
or Geography is null
or Product is null
or date is null
or amount is null 
or Customers is null
or boxes is null


delete from Fact_table
where amount is null

------for creating calendar table from exixting table
with Calendar as (select date,datepart(year,date) as Year,
datepart(month,date) as Month,
datepart(day,date) as Day,
datepart(weekday,date) as Weekday
from Fact_table) 

select * from Calendar
