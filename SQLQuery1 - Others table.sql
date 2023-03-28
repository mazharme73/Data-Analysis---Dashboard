/****** Script for SelectTopNRows command from SSMS  ******/

use Data_Analysis_porfolio_project
SELECT  [Product]
      ,[Category]
      ,SUBSTRING(upper(size),1,1) + SUBSTRING(lower(size),2,LEN(size)) as size
  FROM [Data_Analysis_porfolio_project].[dbo].[Product_table$]

  --------replacing product names in product column
  update Product_table$
  SET product = case product when '50% Dark Bites' then 'Dark Bites'
           when '99% Dark & Pure' then 'Dark & Pure'
		    when '85% Dark Bars' then 'Dark Bars'
		    when '70% Dark Bites' then 'Dark Bites'
		   else product end
		  
  ------removing nulls
  select * from Product_table$
  where Product is null
  or Category is null
  or size is null

  delete from Product_table$
  where Product is null
  or Category is null
  or size is null

  
  -----Updating Error
 update Product_table$
 set size = 'Large'
 where size = 'Small'
 AND 
 Product = 'Dark Bites'
