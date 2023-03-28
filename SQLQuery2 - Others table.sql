/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [Geo] as Country
      ,[Region] 
  FROM [Data_Analysis_porfolio_project].[dbo].[Region$]
  --------
  select distinct region from Region$