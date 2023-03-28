/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [Sales person]
      ,[Team]
    -------  ,[Picture]
  FROM [Data_Analysis_porfolio_project].[dbo].[Sales_person$]
  

  -------- Removing Duplicates

  SELECT TOP (1000) [Sales person]
      ,[Team]
      ,count(*)
  FROM [Data_Analysis_porfolio_project].[dbo].[Sales_person$]
  group by [Sales person]
      ,[Team]
	  having count(*) >1


	  with Salesperson_cte as (
select *,ROW_NUMBER () over (partition by [Sales person],[Team] order by [Sales person] ) as row_num from Sales_person$ )
 delete from Salesperson_cte
 where row_num > 1
 

 ---------Replacing NULL

 select * from Sales_person$
 where [Sales person] is null
 or team is null


 update Sales_person$
 set team = 'Tasty'
 where team is null