DECLARE @date_start smalldatetime
DECLARE @date_end smalldatetime

set @date_start=CONVERT(smalldatetime, getdate())




SELECT 
ROW_NUMBER() OVER(PARTITION BY npd.codetvun ORDER BY daten) AS date1,
t.*,npf.daten as daten FROM [Tovar].[dbo].[Tovar] t
join  [Sk1].[dbo].[NPrihD] npd on npd.codetvun=t.codetvun
join [Sk1].[dbo].[NPrihF] npf On npf.coden=npd.coden
where  daten BETWEEN (SELECT datenlog FROM [Tovar].[dbo].[Tovar_log] tl where tl.codetvun=t.codetvun) and  @date_start and t.nstatus=2


--SELECT datenlog FROM [Tovar].[dbo].[Tovar_log] where codetvun=46001
--where npd.codetvun=46001 --and daten BETWEEN DATEADD(month, -12,@date_start) and  @date_start
--where t.nstatus=2
--order by daten
order by codetvun
