USE [Tovar]
GO
/****** Object:  StoredProcedure [dbo].[us_Zvit_Tovar72]    Script Date: 21.02.2022 13:28:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
exec  us_Zvit_Tovar72 0,'20210501'
*/
ALTER PROCEDURE [dbo].[us_Zvit_Tovar72] @codegr int,@ldatenfrom smalldatetime=null ,@ldatento smalldatetime=null 
AS 
set nocount on
--- Дати 
if @ldatenfrom is null 
		set @ldatenfrom =dateadd(day,1-day(GETDATE()),getdate())
if @ldatento is null 
		set @ldatento  =GETDATE()	
	
	create table #temp1(codetvun int, url1  varchar(255), price1 numeric(9,2), url2  varchar(255), price2  numeric(9,2),url3  varchar(255), 
		price3  numeric(9,2),url4  varchar(255), price4  numeric(9,2),url5  varchar(255), price5  numeric(9,2)) 

	insert  into #temp1(codetvun , url1 , price1 , url2 , price2,url3, 
	price3,url4, price4 ,url5, price5) select codetvun , max(url1),max(price1),max(url2),max(price2),max(url3),max(price3),max(url4),max(price4),max(url5),max(price5) from 

	(select codetvun,
	url1 =iif(rrr=1,url,''),price1 =iif(rrr=1,price,0),
	url2 =iif(rrr=2,url,''),price2 =iif(rrr=2,price,0),
	url3 =iif(rrr=3,url,''),price3 =iif(rrr=3,price,0),
	url4 =iif(rrr=4,url,''),price4 =iif(rrr=4,price,0),
	url5 =iif(rrr=5,url,''),price5 =iif(rrr=5,price,0)
	from (select *,ROW_NUMBER() over (partition by codetvun order by codetvun,url) as rrr from Sk1.dbo.Tovar_parsing_URL TP) X) Y
	group by codetvun

----------
 ------------------2-------------------- мінімальна ціна
	  create table #temp2(codetvun int, minprice  numeric(9,2))
	  insert  into #temp2(codetvun , minprice) select codetvun, min(price) as minprice from Sk1.dbo.Tovar_parsing_URL where price>0.01 group by codetvun 

----------------------

------------------3-------------------- процент націнки від прихідної
		create table #temp3(codetvun int, cena_p  numeric(9,2),pr_zn numeric(9,2))
		insert  into #temp3(codetvun, cena_p, pr_zn) 
		--select P.codetvun,P.cena_p,P.cena_p/T2.minprice*100 as pr_zn from
		
		select P.codetvun,P.cena_p, iif(P.cena_p=0, 100 ,((T2.minprice/P.cena_p)-1)*100) as pr_zn from
		(select R.codetvun,cena_p,coden from (select PD.codetvun,PD.cena_p,PF.coden,ROW_NUMBER() over (partition by codetvun order by PF.daten desc) as rown from sk1.dbo.NPrihF PF WITH (NOLOCK),sk1.dbo.NPrihD PD WITH (NOLOCK)  where PF.coden=PD.coden and  PD.codetvun in
				(select codetvun from #temp2)  and PF.type=1 ) R
		where R.rown=1)  P
		left join #temp2 T2 on T2.codetvun=P.codetvun

--------------------------------4----------------------------------
	 ;WITH #tree(namegr, nkey, level, levelsort, pathstr)
		 AS (
		 SELECT namegr, nkey, ROW_NUMBER() over (PARTITION BY nparent order by namegr ), levelsort, '/'+CAST(ROW_NUMBER() over (PARTITION BY nparent order by namegr)+100 AS varchar(max))+'/' 
		 FROM TGrups
		 WHERE nparent = @codegr
		 UNION ALL
		 SELECT TGrups.namegr, TGrups.nkey, #tree.level*100+1, TGrups.levelsort, #tree.pathstr+CAST(ROW_NUMBER() over (PARTITION BY TGrups.nparent order by TGrups.namegr)+100 AS varchar(max))+'/' 
		 --+RTRIM(LTRIM(TGrups.nkey))+','
		 FROM TGrups
			  INNER JOIN
			  #tree
			  ON #tree.nkey = TGrups.nparent)		 

--------------------------------3---------------------------------------
select distinct T1.codetvun,T.nametv,PR.cena_r as cena_r,'https://ars.ua/'+W.urlkey+'.html' as urlars, W.Price as pricears,
convert(varchar(250),T1.url1) as url1,T1.price1,convert(varchar(250),T1.url2) as url2,T1.price2,convert(varchar(250),T1.url3) as url3,T1.price3,
convert(varchar(250),T1.url4) as url4,T1.price4,convert(varchar(250),T1.url5) as url5,T1.price5,
T2.minprice as minprice,T3.pr_zn as pr_nac,T3.cena_p as cena_p,@codegr as codegr,T.nparent
    from Sk1.dbo.Tovar_parsing_URL TP
left join  Tovar T on T.codetvun=TP.codetvun
left join #temp1 T1 on T1.codetvun=TP.codetvun 
left join (select codetvun,cena_r from Price P where typezn=1) PR  on PR.codetvun=T1.codetvun
left join [WebShop].[dbo].[WebProduct] W on W.codetvun=T1.codetvun
left join #temp2 T2 on T2.codetvun=TP.codetvun
left join #temp3 T3 on T3.codetvun=TP.codetvun
where nParent in (select nkey from  #tree) and W.storageid=3 


--exec  us_Zvit_Tovar72 0,'20210501'
drop table #temp1
drop table #temp2
drop table #temp3




