USE [Sk1]
GO
/****** Object:  Table [dbo].[MTvidpovD]    Script Date: 13.03.2020 12:12:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MTvidpovD](
	[codep] [int] IDENTITY(1,1) NOT NULL,
	[coden] [int] NOT NULL,
	[typedov] [tinyint] NOT NULL,
	[codetvun] [int] NOT NULL,
	[nametv] [varchar](250) NOT NULL,
	[ov] [varchar](6) NOT NULL,
	[rah] [int] NOT NULL,
	[kol] [numeric](9, 3) NOT NULL,
	[cena_r] [numeric](9, 2) NOT NULL,
	[dolar] [tinyint] NOT NULL,
	[kurs] [numeric](5, 3) NOT NULL,
	[prompt] [varchar](250) NOT NULL,
	[typetov] [tinyint] NOT NULL,
	[tovcode] [int] NOT NULL,
 CONSTRAINT [PK_MTvidpovD_1] PRIMARY KEY CLUSTERED 
(
	[codep] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MTvidpovD_log]    Script Date: 13.03.2020 12:12:56 ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE TABLE [dbo].[MTvidpovD_log](
--	[codep] [int] NOT NULL,
--	[typediya] [tinyint] NOT NULL,
--	[coden] [int] NOT NULL,
--	[typedov] [tinyint] NOT NULL,
--	[codetvun] [int] NOT NULL,
--	[nametv] [varchar](250) NOT NULL,
--	[ov] [varchar](6) NOT NULL,
--	[rah] [int] NOT NULL,
--	[kol] [numeric](9, 3) NOT NULL,
--	[cena_r] [numeric](9, 2) NOT NULL,
--	[dolar] [tinyint] NOT NULL,
--	[kurs] [numeric](5, 3) NOT NULL,
--	[prompt] [varchar](250) NOT NULL,
--	[datenlog] [smalldatetime] NOT NULL,
--	[nameop] [varchar](25) NOT NULL,
--	[typetov] [tinyint] NOT NULL,
--	[tovcode] [int] NOT NULL
--) ON [PRIMARY]
--GO
/****** Object:  Table [dbo].[MTvidpovF]    Script Date: 13.03.2020 12:12:56 ******/

USE SK1
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE TABLE [dbo].[MTvidpovF](
--	[coden] [int] IDENTITY(1,1) NOT NULL,
--	[addzal] [bit] NOT NULL,
--	[nomn] [int] NOT NULL,
--	[daten] [smalldatetime] NOT NULL,
--	[codep] [int] NOT NULL,
--	[namep] [varchar](50) NOT NULL,
--	[prompt] [varchar](75) NOT NULL,
--	[sign1] [varchar](25) NOT NULL,
--	[sign2] [varchar](25) NOT NULL,
--	[isfordir] [bit] NOT NULL,
--	[nameopbuh] [varchar](25) NOT NULL,
-- CONSTRAINT [PK_MTvidpovF] PRIMARY KEY CLUSTERED 
--(
--	[coden] ASC
--)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
--) ON [PRIMARY]
--GO
/****** Object:  Table [dbo].[MTvidpovF_Info]    Script Date: 13.03.2020 12:12:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MTvidpovF_Info](
	[coden] [int] NOT NULL,
	[type] [tinyint] NOT NULL,
	[prompt] [varchar](100) NOT NULL,
	[datenlog] [smalldatetime] NOT NULL,
	[nameop] [varchar](25) NOT NULL,
	[hostname] [varchar](18) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MTvidpovF_log]    Script Date: 13.03.2020 12:12:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MTvidpovF_log](
	[coden] [int] NOT NULL,
	[typediya] [tinyint] NOT NULL,
	[addzal] [bit] NOT NULL,
	[nomn] [int] NOT NULL,
	[daten] [smalldatetime] NOT NULL,
	[codep] [int] NOT NULL,
	[namep] [varchar](50) NOT NULL,
	[prompt] [varchar](75) NOT NULL,
	[sign1] [varchar](25) NOT NULL,
	[sign2] [varchar](25) NOT NULL,
	[isfordir] [bit] NOT NULL,
	[nameopbuh] [varchar](25) NOT NULL,
	[datenlog] [smalldatetime] NOT NULL,
	[nameop] [varchar](25) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MTvidpovD] ADD  CONSTRAINT [DF_MTvidpovD_typedov]  DEFAULT ((0)) FOR [typedov]
GO
ALTER TABLE [dbo].[MTvidpovD] ADD  CONSTRAINT [DF_MTvidpovD_codetvun]  DEFAULT ((0)) FOR [codetvun]
GO
ALTER TABLE [dbo].[MTvidpovD] ADD  CONSTRAINT [DF_MTvidpovD_ov]  DEFAULT ('') FOR [ov]
GO
ALTER TABLE [dbo].[MTvidpovD] ADD  CONSTRAINT [DF_MTvidpovD_rah]  DEFAULT ((0)) FOR [rah]
GO
ALTER TABLE [dbo].[MTvidpovD] ADD  CONSTRAINT [DF_MTvidpovD_kol]  DEFAULT ((0)) FOR [kol]
GO
ALTER TABLE [dbo].[MTvidpovD] ADD  CONSTRAINT [DF_MTvidpovD_cena_r]  DEFAULT ((0)) FOR [cena_r]
GO
ALTER TABLE [dbo].[MTvidpovD] ADD  CONSTRAINT [DF_MTvidpovD_dolar]  DEFAULT ((0)) FOR [dolar]
GO
ALTER TABLE [dbo].[MTvidpovD] ADD  CONSTRAINT [DF_MTvidpovD_kurs]  DEFAULT ((1)) FOR [kurs]
GO
ALTER TABLE [dbo].[MTvidpovD] ADD  CONSTRAINT [DF_MTvidpovD_prompt]  DEFAULT ('') FOR [prompt]
GO
ALTER TABLE [dbo].[MTvidpovD] ADD  DEFAULT ((0)) FOR [typetov]
GO
ALTER TABLE [dbo].[MTvidpovD] ADD  DEFAULT ((0)) FOR [tovcode]
GO
ALTER TABLE [dbo].[MTvidpovD_log] ADD  CONSTRAINT [DF_MTvidpovD_log_typedov]  DEFAULT ((0)) FOR [typedov]
GO
ALTER TABLE [dbo].[MTvidpovD_log] ADD  CONSTRAINT [DF_MTvidpovD_log_codetvun]  DEFAULT ((0)) FOR [codetvun]
GO
ALTER TABLE [dbo].[MTvidpovD_log] ADD  CONSTRAINT [DF_MTvidpovD_log_ov]  DEFAULT ('') FOR [ov]
GO
ALTER TABLE [dbo].[MTvidpovD_log] ADD  CONSTRAINT [DF_MTvidpovD_log_rah]  DEFAULT ((0)) FOR [rah]
GO
ALTER TABLE [dbo].[MTvidpovD_log] ADD  CONSTRAINT [DF_MTvidpovD_log_kol]  DEFAULT ((0)) FOR [kol]
GO
ALTER TABLE [dbo].[MTvidpovD_log] ADD  CONSTRAINT [DF_MTvidpovD_log_cena_r]  DEFAULT ((0)) FOR [cena_r]
GO
ALTER TABLE [dbo].[MTvidpovD_log] ADD  CONSTRAINT [DF_MTvidpovD_log_datenlog]  DEFAULT (getdate()) FOR [datenlog]
GO
ALTER TABLE [dbo].[MTvidpovD_log] ADD  CONSTRAINT [DF_MTvidpovD_log_nameop]  DEFAULT (user_name()) FOR [nameop]
GO
ALTER TABLE [dbo].[MTvidpovD_log] ADD  DEFAULT ((0)) FOR [typetov]
GO
ALTER TABLE [dbo].[MTvidpovD_log] ADD  DEFAULT ((0)) FOR [tovcode]
GO
ALTER TABLE [dbo].[MTvidpovF] ADD  CONSTRAINT [DF_MTvidpovF_addzal]  DEFAULT ((0)) FOR [addzal]
GO
ALTER TABLE [dbo].[MTvidpovF] ADD  CONSTRAINT [DF_MTvidpovF_daten]  DEFAULT (getdate()) FOR [daten]
GO
ALTER TABLE [dbo].[MTvidpovF] ADD  CONSTRAINT [DF_MTvidpovF_codep]  DEFAULT ((0)) FOR [codep]
GO
ALTER TABLE [dbo].[MTvidpovF] ADD  CONSTRAINT [DF_MTvidpovF_namep]  DEFAULT ('') FOR [namep]
GO
ALTER TABLE [dbo].[MTvidpovF] ADD  CONSTRAINT [DF_MTvidpovF_prompt]  DEFAULT ('') FOR [prompt]
GO
ALTER TABLE [dbo].[MTvidpovF] ADD  CONSTRAINT [DF_MTvidpovF_sign1]  DEFAULT ('') FOR [sign1]
GO
ALTER TABLE [dbo].[MTvidpovF] ADD  CONSTRAINT [DF_MTvidpovF_sign2]  DEFAULT ('') FOR [sign2]
GO
ALTER TABLE [dbo].[MTvidpovF] ADD  CONSTRAINT [DF_MTvidpovF_isfordir]  DEFAULT ((0)) FOR [isfordir]
GO
ALTER TABLE [dbo].[MTvidpovF] ADD  CONSTRAINT [DF_MTvidpovF_nameopbuh]  DEFAULT ('') FOR [nameopbuh]
GO
ALTER TABLE [dbo].[MTvidpovF_Info] ADD  CONSTRAINT [DF_MTvidpovF_info_prompt]  DEFAULT ('') FOR [prompt]
GO
ALTER TABLE [dbo].[MTvidpovF_Info] ADD  CONSTRAINT [DF_MTvidpovF_info_datenlog]  DEFAULT (getdate()) FOR [datenlog]
GO
ALTER TABLE [dbo].[MTvidpovF_Info] ADD  CONSTRAINT [DF_MTvidpovF_info_userid]  DEFAULT (user_name()) FOR [nameop]
GO
ALTER TABLE [dbo].[MTvidpovF_Info] ADD  CONSTRAINT [DF_MTvidpovF_Info_hostname]  DEFAULT (host_name()) FOR [hostname]
GO
ALTER TABLE [dbo].[MTvidpovF_log] ADD  CONSTRAINT [DF_MTvidpovF_log_isfordir]  DEFAULT ((0)) FOR [isfordir]
GO
ALTER TABLE [dbo].[MTvidpovF_log] ADD  CONSTRAINT [DF_MTvidpovF_log_nameopbuh]  DEFAULT ('') FOR [nameopbuh]
GO
ALTER TABLE [dbo].[MTvidpovF_log] ADD  CONSTRAINT [MTvidpovF_log_datenlog]  DEFAULT (getdate()) FOR [datenlog]
GO
ALTER TABLE [dbo].[MTvidpovF_log] ADD  CONSTRAINT [MTvidpovF_log_nameop]  DEFAULT (user_name()) FOR [nameop]
GO
/****** Object:  StoredProcedure [dbo].[us_MTvidpovD_del]    Script Date: 13.03.2020 12:12:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[us_MTvidpovD_del] @codep int
AS
set nocount on
delete from MTvidpovD where codep=@codep
select codep from MTvidpovD where codep=@codep
GO
/****** Object:  StoredProcedure [dbo].[us_MTvidpovD_edit]    Script Date: 13.03.2020 12:12:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[us_MTvidpovD_edit] @Codep int,@Coden int,
	@typedov tinyint,@codetvun int,
	@nametv varchar(250),@ov varchar(6),@rah int,
	@kol numeric(9,3),@cena_r numeric(18,2),@kurs numeric(5,3),@dolar tinyint,
	@prompt varchar(250),
	@typetov tinyint = 0,
	@tovcode int = 0
AS
set nocount on
declare @kk int,@error int
select @error=0,@kk=@codep

/*чи існує шапка накладної*/
if exists(select * from MTvidpovF WITH (NOLOCK)  where coden=@Coden)
begin
	if @codep =0
	begin
		/*чи новий запис*/
		insert into MTvidpovD (coden,typedov,codetvun,nametv,ov,rah,kol,cena_r,kurs,dolar,prompt,typetov,tovcode) 
		values (@coden,@typedov,@codetvun,@nametv,@ov,@rah,@kol,@cena_r,@kurs,@dolar,@prompt,@typetov,@tovcode)
		select @kk=SCOPE_IDENTITY( )
	end
	else
	begin
		update MTvidpovD
		set codetvun=@codetvun,nametv=@nametv,ov=@ov,rah=@rah,
			kol=@kol,cena_r=@cena_r,kurs=@kurs,dolar=@dolar,prompt=@prompt,typetov = @typetov,tovcode = @tovcode
		where codep=@codep
	end
end
select D.*,
	isnull(V.namevaluta,'???') as namevaluta
from MTvidpovD D 
	left join Valuta V with (NOLOCK) on D.dolar=V.dolar 
where D.codep=@kk

GO
/****** Object:  StoredProcedure [dbo].[us_MTvidpovD_GetTovar]    Script Date: 13.03.2020 12:12:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[us_MTvidpovD_GetTovar] 
	@typetov tinyint,
	@tovcode int 
AS

set nocount on

/*ОЗ*/
if @typetov = 1
begin
	select T.*,isnull(SK.namesk,'') as namesk
		from OZTovar T 
		left join Kadr.dbo.SkladL SK WITH (NOLOCK) on T.codesk=SK.codesk
	where T.codep = -1 * @tovcode
end

/*Транспорт*/
if @typetov = 2
begin
	select * from VTovar where codetvun =  @tovcode
end

GO
--/****** Object:  StoredProcedure [dbo].[us_MTvidpovF_add]    Script Date: 13.03.2020 12:12:56 ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO

--CREATE PROCEDURE [dbo].[us_MTvidpovF_add]  
--AS
--set nocount on

--DECLARE @nomn smallint,@max int,@namep varchar(50),@codep int

--SELECT @nomn = isnull(MAX(nomn),0)+1 
--FROM MTvidpovF F
--where datepart(yy,F.daten)=datepart(yy,getdate())
--	 and datepart(mm,F.daten)=datepart(mm,getdate())

--select @namep=user_name()
--select @codep=coden 
--from Kadr..Kadr WITH(NOLOCK)
--where ltrim(rtrim(upper(REPLACE(namep+' '+substring(iname,1,1)+'. '+substring(fname,1,1)+'.',' ',''))))=ltrim(rtrim(upper(REPLACE(user_name(),' ',''))))
--		and isnull(datezv,1)=1

--insert into MTvidpovF (nomn,codep,namep)
--values (@nomn,@codep,@namep)
--select @max=SCOPE_IDENTITY( )

--exec us_MTvidpovF_nakl @max
--GO
/****** Object:  StoredProcedure [dbo].[us_MTvidpovF_del]    Script Date: 13.03.2020 12:12:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[us_MTvidpovF_del] @coden int
AS
set nocount on
if not exists(select * from LockTab with (nolock) where docid=@coden and tab='MTvidpovF')
	delete from MTvidpovF where coden=@coden

select coden from MTvidpovF where coden=@coden
GO
/****** Object:  StoredProcedure [dbo].[us_MTvidpovF_edit]    Script Date: 13.03.2020 12:12:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[us_MTvidpovF_edit]  @coden int,
	@addzal bit,@nomn smallint,
	@daten smalldatetime,@codep int,@namep varchar(50),
	@prompt varchar(75),@isfordir bit=0
AS
set nocount on
/*
if @coden=0
begin
	--DECLARE @nomn smallint
	SELECT @nomn = 1+isnull(MAX(nomn),0) 
	FROM MTvidpovF
	where datepart(yy,daten)=datepart(yy,@daten)
			--and datepart(mm,daten)=datepart(mm,@daten)

	insert into MTvidpovF (addzal,nomn,daten,codep,namep,prompt) 
	values (@addzal,@nomn,@daten,@codep,user_name(),@prompt)
	SELECT @coden = SCOPE_IDENTITY( )
end
else
begin
*/
	update MTvidpovF
	set addzal=@addzal,nomn=@nomn,daten=@daten,
		--codep=@codep,namep=@namep,
		prompt=@prompt,isfordir=@isfordir
	from MTvidpovF K
	where K.coden=@coden
--end

select *
into #tmpMTvidpovD
from MTvidpovD
where coden=@coden
	
	select F.*,	convert(numeric(18,2),isnull(d1.suma,0.00)) as sumall
	from MTvidpovF F left join 
		(select coden,sum(round(kol*cena_r*kurs,2)) as suma
			from #tmpMTvidpovD
		group by coden
		) as d1 on F.coden=d1.coden
	where F.coden=@coden


 drop table #tmpMTvidpovD
GO
/****** Object:  StoredProcedure [dbo].[us_MTvidpovF_info]    Script Date: 13.03.2020 12:12:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[us_MTvidpovF_info] @coden int
AS
set nocount on
--------------------------------------
create table #tmpNameT1 (ccaption varchar(25),cfileld varchar(12),nwidth int)

if @coden=0
	insert into #tmpNameT1 (ccaption,cfileld,nwidth) values ('Знищені','',-1) 
else
	insert into #tmpNameT1 (ccaption,cfileld,nwidth) values ('Інформація про зімни','',-1) 
--  -1 назва шапки
--end
insert into #tmpNameT1 (ccaption,cfileld,nwidth) values ('Тип зміни','typeop',60)
insert into #tmpNameT1 (ccaption,cfileld,nwidth) values ('+/-','addzal',25)
insert into #tmpNameT1 (ccaption,cfileld,nwidth) values ('Дата','daten',65)
insert into #tmpNameT1 (ccaption,cfileld,nwidth) values ('№','nomn',65)
insert into #tmpNameT1 (ccaption,cfileld,nwidth) values ('Підзвітна особа','namep',100)
insert into #tmpNameT1 (ccaption,cfileld,nwidth) values ('Примітка','prompt',300)
insert into #tmpNameT1 (ccaption,cfileld,nwidth) values ('Для власників','isfordir',80)
insert into #tmpNameT1 (ccaption,cfileld,nwidth) values ('Підпис1','sign1',90)
insert into #tmpNameT1 (ccaption,cfileld,nwidth) values ('Підпис2','sign2',90)
insert into #tmpNameT1 (ccaption,cfileld,nwidth) values ('Дата зміни','datenlog',155)
insert into #tmpNameT1 (ccaption,cfileld,nwidth) values ('Оператор','nameop',90)
insert into #tmpNameT1 (ccaption,cfileld,nwidth) values ('Рознесено','nameopbuh',90)
	
select * from #tmpNameT1
drop table #tmpNameT1

if @coden=0
begin
	select typeop=case
		when N.typediya=1 then  convert(varchar(10),'Знищили')
		when N.typediya=2 then  convert(varchar(10),'Добавили')
		when N.typediya=3 then  convert(varchar(10),'Змінили')		
		else  convert(varchar(10),'Невідомий')
		end,
		N.*
	from MTvidpovF_log N 
	where N.typediya=1 order by N.datenlog asc
end
else
begin
	select typeop=case
		when N.typediya=1 then  convert(varchar(10),'Знищили')
		when N.typediya=2 then  convert(varchar(10),'Добавили')
		when N.typediya=3 then  convert(varchar(10),'Змінили')		
		else  convert(varchar(10),'Невідомий')
		end,
		N.*
	from MTvidpovF_log N 
	where N.coden=@coden order by N.datenlog asc

	-----------------------------------
	create table #tmpNameT2 (ccaption varchar(25),cfileld varchar(12),nwidth int)

	insert into #tmpNameT2 (ccaption,cfileld,nwidth) values ('Зміни товарів','',-1) 
	--  -1 назва шапки
	insert into #tmpNameT2 (ccaption,cfileld,nwidth) values ('Тип зміни','typeop',77)
	insert into #tmpNameT2 (ccaption,cfileld,nwidth) values ('Довідник','typedov',30)
	insert into #tmpNameT2 (ccaption,cfileld,nwidth) values ('Назва товару','nametv',196)
	insert into #tmpNameT2 (ccaption,cfileld,nwidth) values ('О.в.','ov',20)
	insert into #tmpNameT2 (ccaption,cfileld,nwidth) values ('К-сть','kol',70)
	insert into #tmpNameT2 (ccaption,cfileld,nwidth) values ('Рахунок','rah',70)
	insert into #tmpNameT2 (ccaption,cfileld,nwidth) values ('Ціна','cena_r',70)
	insert into #tmpNameT2 (ccaption,cfileld,nwidth) values ('Курс','kurs',41)
	insert into #tmpNameT2 (ccaption,cfileld,nwidth) values ('Сума','sumall',80)
	insert into #tmpNameT2 (ccaption,cfileld,nwidth) values ('Валюта','namevaluta',41)
	insert into #tmpNameT2 (ccaption,cfileld,nwidth) values ('Примітка','prompt',300)
	insert into #tmpNameT2 (ccaption,cfileld,nwidth) values ('Дата зміни','datenlog',155)
	insert into #tmpNameT2 (ccaption,cfileld,nwidth) values ('Оператор','nameop',88)

	select * from #tmpNameT2
	drop table #tmpNameT2

	select  N.*,typeop=case
			when N.typediya=1 then  convert(varchar(10),'Знищили')
			when N.typediya=2 then  convert(varchar(10),'Добавили')
			when N.typediya=3 then  convert(varchar(10),'Змінили')
			when N.typediya=4 then  convert(varchar(10),'Знищ. накл')
			else  convert(varchar(10),'Невідомий')
			end,
		round(N.kol*N.kurs,N.cena_r,2) as sumall,	
		isnull(V.namevaluta,'???') as namevaluta
	from MTvidpovD_log N left join Valuta V on N.dolar=V.dolar
	where N.coden=@coden 
	order by N.codep

end


GO
/****** Object:  StoredProcedure [dbo].[us_MTvidpovF_load]    Script Date: 13.03.2020 12:12:56 ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE PROCEDURE [dbo].[us_MTvidpovF_load] @codesk tinyint,@datenfrom smalldatetime,@datento smalldatetime,@typelist tinyint=0
--AS
--set nocount on
--declare @servid tinyint
--select @servid=servid from master..Us_Server WITH (NOLOCK)

--if @servid=@codesk
--begin
--	declare @codep int
	
--	set @codep=0
--	select @codep=coden 
--	from Kadr..Kadr WITH(NOLOCK)
--	where ltrim(rtrim(upper(REPLACE(namep+' '+substring(iname,1,1)+'. '+substring(fname,1,1)+'.',' ',''))))=ltrim(rtrim(upper(REPLACE(user_name(),' ',''))))
--			and isnull(datezv,1)=1

--	--select @codep

--	create table #tmpMTvidpovF_coden (coden int)
	
--	if @typelist=0
--	begin
--		--1029	Мельник	Олег
--		--1028	Мельник	Лілія
--		--1017	Кельнер	Володимир
--		--1018	Кельнер	Ірина

--		select G.nkey,G.nParent,T.view_grup
--		into #tmpKadrG 
--		from Kadr.dbo.KadrG G WITH (NOLOCK)
--				left join Sk1.dbo.Kadr_Permissions T on G.nkey=T.nkey and T.codep=@codep and T.ttype=2
--			; with cte_Kadr_Permissions (nkey, view_grup) as
--			(
--				select cast(T.nKey as int) as nkey,T.view_grup
--				from Sk1.dbo.Kadr_Permissions T	 WITH (NOLOCK)
--				where T.codep=@codep and T.ttype=2
--				union all
--				select cast(G.nKey as int) as nkey,isnull(G.view_grup,T.view_grup) as view_grup
--				from #tmpKadrG G
--					inner join cte_Kadr_Permissions t on G.nparent = t.nkey
--			)
				
--			insert into #tmpMTvidpovF_coden (coden)
--			select M.coden
--			from MTvidpovF M WITh (NOLOCK)
--				left join Kadr.dbo.Kadr K WITH(NOLOCK) on M.codep = K.coden
--			where (M.daten>=@datenfrom or M.sign1='' or M.sign2='')
--				and M.daten<@datento 
--				and (K.nparent in (
--						select C.nkey
--							from cte_Kadr_Permissions C,Kadr.dbo.KadrG G
--								left join Kadr.dbo.KadrG G2 on G.nparent=G2.nkey
--								where C.nkey=G.nkey and C.view_grup=1)
						
--							or Kadr.dbo.fn_GetisRole('us_GetMoney_Sign')=1 
--							or Sk1.dbo.fn_GetisRole('us_director')=1 
--							or IS_SRVROLEMEMBER('sysadmin')=1
--							or ltrim(rtrim(user_name()))='dbo'						
--							--or USER_ID()=1
--							--or M.namep=user_name()
--							or M.codep=@codep
--							)
--			--and (M.codep not in (1017,1018,1028,1029) or Sk1.dbo.fn_GetisRole('us_director')=1)
--		drop table #tmpKadrG


--	end
		
--	--для витрат	
--	if @typelist=1
--	begin
--		insert into #tmpMTvidpovF_coden (coden)
--		select coden
--		from MTvidpovF M WITh (NOLOCK)
--		where M.daten>=@datenfrom and M.daten<@datento 
--			and sign1!='' and sign2!=''
--	end
	
--	select M.*,
--		isnull(L.useridedit,0) as useridedit
--	into #tmpMTvidpovF
--	from MTvidpovF M WITh (NOLOCK)
--		left join LockTab L	 WITH(NOLOCK) on M.coden=L.docid and L.tab='MTvidpovF'
--	where coden in (select coden from #tmpMTvidpovF_coden )
--	order by M.daten desc	

--	drop table #tmpMTvidpovF_coden
	
--	select *
--	into #tmpMTvidpovD
--	from MTvidpovD
--	where coden in (select coden from #tmpMTvidpovF)
	


--	select F.*,	convert(numeric(18,2),isnull(d1.suma,0.00)) as sumall
--	from #tmpMTvidpovF F left join 
--		(select coden,sum(round(kol*cena_r*kurs,2)) as suma
--			from #tmpMTvidpovD
--		group by coden
--		) as d1 on F.coden=d1.coden
--	order by F.daten desc	

--	drop table #tmpMTvidpovD
--	drop table #tmpMTvidpovF
		
--	return	
--END	


--if (IS_MEMBER ('us_director')=1 or IS_SRVROLEMEMBER('sysadmin')=1 
--	or ltrim(rtrim(user_name()))='Паньків Р. О.'
--	or ltrim(rtrim(user_name()))='Апольська К. О.'
--	or ltrim(rtrim(user_name()))='Мельник В. Б.'
--	or ltrim(rtrim(user_name()))='Мещишина О. І.'
--	) 
--	and exists(select * from kadr.dbo.skladl where codesk=@codesk and ltrim(rtrim(ipcode))!='')
--begin
--	declare @ipcode varchar(50),@str varchar(255)
--	select @ipcode=kadr.dbo.fn_GetIpSklad(@codesk)
--	select @str='exec ['+@ipcode+'].Sk1.dbo.us_MTvidpovF_load  '+ltrim(rtrim(str(@codesk)))+','''+REPLACE(convert(varchar(50),@datenfrom,121),'-','')+''','''+REPLACE(convert(varchar(50),@datento,121),'-','')+''''
--	exec (@str)
--end


--GO
/****** Object:  StoredProcedure [dbo].[us_MTvidpovF_nakl]    Script Date: 13.03.2020 12:12:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[us_MTvidpovF_nakl] @coden int,@codesk tinyint=0
AS
set nocount on

declare @servid tinyint
select @servid=servid from master..Us_Server WITH (NOLOCK)

if @codesk=@servid or @codesk=0
begin
	select * 
	into #tmpMTvidpovF
	from MTvidpovF
	where coden=@coden

	select *
	into #tmpMTvidpovD
	from MTvidpovD
	where coden=@coden

	select F.*,
		convert(numeric(18,2),isnull(d1.suma,0.00)) as sumall,
		nameedit=case
				when isnull(L.useridedit,0)>0 then convert(varchar(25),user_name(L.useridedit))
				else ''
			end, 
		isnull(L.useridedit,0) as useridedit
	from #tmpMTvidpovF F
		left join 
		(select coden,sum(round(kol*cena_r*kurs,2)) as suma
		from #tmpMTvidpovD
		group by coden
		) as d1 on F.coden=d1.coden 
		left join LockTab L	 WITH(NOLOCK) on F.coden=L.docid and L.tab='MTvidpovF'
		
	if @codesk=0	
		exec us_LockTab_lock 'MTvidpovF',@coden,1


	select D.*,'' as nametov,'' as  namesktov,0 as rahtov,
			isnull(V.namevaluta,'???') as namevaluta
	from #tmpMTvidpovD D 
		left join Valuta V with (NOLOCK) on D.dolar=V.dolar 
	where D.coden=@coden and D.typetov!=1 and D.typetov!=2
	union all
	select D.*,isnull(T.namep,'???') as nametov,isnull(SK.namesk,'') as namesktov,isnull(T.rah,0) as rahtov,
			isnull(V.namevaluta,'???') as namevaluta
	from #tmpMTvidpovD D 
		left join Valuta V with (NOLOCK) on D.dolar=V.dolar 
		left join OZTovar T with (NOLOCK) on D.tovcode=-T.codep 
		left join Kadr.dbo.SkladL SK WITH (NOLOCK) on T.codesk=SK.codesk
	where D.coden=@coden and D.typetov=1
	union all
	select D.*,isnull(T.nametv,'???') as nametov,isnull(SK.namesk,'') as namesktov,isnull(T.rah,0) as rahtov,
			isnull(V.namevaluta,'???') as namevaluta
	from #tmpMTvidpovD D 
		left join Valuta V with (NOLOCK) on D.dolar=V.dolar 
		left join VTovar T with (NOLOCK) on D.tovcode=T.codetvun
		left join Kadr.dbo.SkladL SK WITH (NOLOCK) on @servid=SK.codesk
	where D.coden=@coden and D.typetov=2


	drop table #tmpMTvidpovF
	drop table #tmpMTvidpovD
	return	
end

if  (IS_MEMBER ('us_Analitik')=1 or IS_MEMBER ('us_director')=1 or IS_SRVROLEMEMBER('sysadmin')=1) and exists(select * from skladl where codesk=@codesk and ltrim(rtrim(ipcode))!='')
--if exists(select * from skladl where codesk=@codesk and ltrim(rtrim(ipcode))!='')
begin
	declare @ipcode varchar(50),@str varchar(255)
	select @ipcode=ltrim(rtrim(ipcode)) from skladl where codesk=@codesk
	select @str='exec ['+@ipcode+'].Sk1.dbo.us_MTvidpovF_nakl '+ltrim(rtrim(str(@coden)))+','+ltrim(rtrim(str(@codesk)))
	exec (@str)
end
GO
/****** Object:  StoredProcedure [dbo].[us_MTvidpovF_Sign]    Script Date: 13.03.2020 12:12:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[us_MTvidpovF_Sign] @coden int,@typesign1 tinyint,@typesign2 tinyint
AS
SET NOCOUNT ON
/*
@typesign = 2 залишити підпис
@typesign1=1 поставити підпис
@typesign1=0 зняти підпис
*/

/*update MTvidpovF
set sign1=case
	when @typesign1=1 then user_name()
	else ''
	end,
	sign2=case
	when @typesign2=1 then user_name()
	else ''
	end	
where coden=@coden
*/

if @typesign1 < 2 
begin
	update MTvidpovF
	set sign1=case
		when @typesign1=1 then user_name()
		else ''
		end
	where coden=@coden
end

if @typesign2 < 2 
begin
	update MTvidpovF
	set sign2=case
		when @typesign2=1 then user_name()
		else ''
		end
		where coden=@coden
end
GO
/****** Object:  StoredProcedure [dbo].[us_MTvidpovF_SingBuhgalter]    Script Date: 13.03.2020 12:12:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[us_MTvidpovF_SingBuhgalter] @coden int,@type tinyint
AS
/*ставлення підписана бухгалтером рознесене
@type=1 підписати
@type=0 зняти підписати
*/
update MTvidpovF
set nameopbuh=case
	when @type=1 then user_name()
	else ''
	end
where coden=@coden

select *
into #tmpMTvidpovD
from MTvidpovD
where coden=@coden
	
	select F.*,	convert(numeric(18,2),isnull(d1.suma,0.00)) as sumall
	from MTvidpovF F left join 
		(select coden,sum(round(kol*cena_r*kurs,2)) as suma
			from #tmpMTvidpovD
		group by coden
		) as d1 on F.coden=d1.coden
	where F.coden=@coden


drop table #tmpMTvidpovD
GO
/****** Object:  StoredProcedure [dbo].[us_MTvidpovF_type]    Script Date: 13.03.2020 12:12:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[us_MTvidpovF_type]  @coden int,@typep int,@nameform varchar(25)='MTvidpov'
AS
set nocount on
declare @namep varchar(50),@nomn int,@daten smalldatetime
select @nomn=nomn,@daten=daten,@namep=namep
from MTvidpovF
where coden=@coden

select @nomn=isnull(@nomn,0),@daten=isnull(@daten,getdate()),@namep=isnull(@namep,'')

if @typep=1
begin
	/*розблокування*/
	exec us_MTvidpovF_unlock @coden
/*
	insert NReturnF_Info (coden,type,prompt)
	values (@coden,1,SUBSTRING('Розблокування.  Прихід. тип '+ltrim(rtrim(str(@type,12,0)))+' №'+ltrim(rtrim(str(@nomn,12,0)))+' від '+convert(varchar(10),@daten,105)+' '+ltrim(rtrim(@namep)),1,100))
*/
	declare @smsg varchar(100)
	select @smsg='L|'+ltrim(rtrim(user_name()))+'|'+ltrim(rtrim(@nameform))+'|'+ltrim(rtrim(str(@coden,10,0)))
	exec Sk1..spSSend @smsg

	return
end

if @typep=2
begin
	/*друк*/
	insert MTvidpovF_Info (coden,type,prompt)
	values (@coden,2,SUBSTRING('Друк.         Аванс.  №'+ltrim(rtrim(str(@nomn,12,0)))+' від '+convert(varchar(10),@daten,105)+' '+ltrim(rtrim(@namep)),1,100))
	return
end

if @typep=3
begin
	/*Excel*/
	insert MTvidpovF_Info (coden,type,prompt)
	values (@coden,3,SUBSTRING('Excel.         Аванс.  №'+ltrim(rtrim(str(@nomn,12,0)))+' від '+convert(varchar(10),@daten,105)+' '+ltrim(rtrim(@namep)),1,100))
	return
end


GO
/****** Object:  StoredProcedure [dbo].[us_MTvidpovF_unlock]    Script Date: 13.03.2020 12:12:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[us_MTvidpovF_unlock]  @coden int
AS
set nocount on
--delete from LockTab where docid=@coden and tab='GetMoney'
exec us_LockTab_lock 'MTvidpovF',@coden,2
GO
/****** Object:  Trigger [dbo].[Tri_Delete_MTvidpovD]    Script Date: 13.03.2020 12:12:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Tri_Delete_MTvidpovD] ON [dbo].[MTvidpovD]
FOR DELETE
AS
select * into #MTvidpovF from MTvidpovF where coden in (select coden from deleted)

if exists(select coden from #MTvidpovF F where addzal=1 and datediff(mm,F.daten,getdate())>1)  and convert(bit,isnull(IS_MEMBER ('us_Archive'),0))=0
begin 
	drop table #MTvidpovF
	RAISERROR('Помилка, при знищенні  запису! Архів змінювати заборонено', 12, 2) WITH SETERROR
	Rollback tran
	return
end

if exists(select coden from #MTvidpovF F where (sign1!='' or sign2!=''))
begin 
	drop table #MTvidpovF
	RAISERROR('Помилка, при знищенні  запису! Підписані Авансові звіти змінювати заборонено', 12, 2) WITH SETERROR
	Rollback tran
	return
end

/*заносимо в таблицю знищених проводок*/
insert into MTvidpovD_log (codep,typediya,coden,typedov,codetvun,nametv,ov,rah,kol,cena_r,dolar,kurs,prompt) 
select codep,1 as typediya,coden,typedov,codetvun,nametv,ov,rah,kol,cena_r,dolar,kurs,prompt
from deleted

drop table #MTvidpovF
GO
ALTER TABLE [dbo].[MTvidpovD] ENABLE TRIGGER [Tri_Delete_MTvidpovD]
GO
/****** Object:  Trigger [dbo].[Tri_Insert_MTvidpovD]    Script Date: 13.03.2020 12:12:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Tri_Insert_MTvidpovD] ON [dbo].[MTvidpovD]
FOR INSERT
AS
select * into #MTvidpovF from MTvidpovF where coden in (select coden from inserted)


/*
if exists(select coden from MTvidpovF F where addzal=1 and datediff(mm,F.daten,getdate())>1)  and convert(bit,isnull(IS_MEMBER ('us_Archive'),0))=0
begin 
	drop table #MTvidpovF
	RAISERROR('Помилка, при знищенні  запису! Архів змінювати заборонено', 12, 2) WITH SETERROR
	Rollback tran
	return
end
*/


if exists(select coden from #MTvidpovF F where (sign1!='' or sign2!=''))
begin 
	drop table #MTvidpovF
	RAISERROR('Помилка, при знищенні  запису! Підписані Авансові звіти змінювати заборонено', 12, 2) WITH SETERROR
	Rollback tran
	return
end

/*заносимо в таблицю знищених проводок*/
insert into MTvidpovD_log (codep,typediya,coden,typedov,codetvun,nametv,ov,rah,kol,cena_r,dolar,kurs,prompt) 
select codep,2 as typediya,coden,typedov,codetvun,nametv,ov,rah,kol,cena_r,dolar,kurs,prompt
from inserted

drop table #MTvidpovF
GO
ALTER TABLE [dbo].[MTvidpovD] ENABLE TRIGGER [Tri_Insert_MTvidpovD]
GO
/****** Object:  Trigger [dbo].[Tri_Update_MTvidpovD]    Script Date: 13.03.2020 12:12:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Tri_Update_MTvidpovD] ON [dbo].[MTvidpovD]
FOR UPDATE
AS
select * into #MTvidpovF from MTvidpovF where coden in (select coden from inserted)

if exists(select coden from #MTvidpovF F where addzal=1 and datediff(mm,F.daten,getdate())>1)  and convert(bit,isnull(IS_MEMBER ('us_Archive'),0))=0
begin 
	drop table #MTvidpovF
	RAISERROR('Помилка, при знищенні  запису! Архів змінювати заборонено', 12, 2) WITH SETERROR
	Rollback tran
	return
end

if exists(select coden from #MTvidpovF F where (sign1!='' or sign2!=''))
begin 
	drop table #MTvidpovF
	RAISERROR('Помилка, при знищенні  запису! Підписані Авансові звіти змінювати заборонено', 12, 2) WITH SETERROR
	Rollback tran
	return
end

/*заносимо в таблицю знищених проводок*/
insert into MTvidpovD_log (codep,typediya,coden,typedov,codetvun,nametv,ov,rah,kol,cena_r,dolar,kurs,prompt) 
select codep,3 as typediya,coden,typedov,codetvun,nametv,ov,rah,kol,cena_r,dolar,kurs,prompt
from inserted

drop table #MTvidpovF
GO
ALTER TABLE [dbo].[MTvidpovD] ENABLE TRIGGER [Tri_Update_MTvidpovD]
GO
/****** Object:  Trigger [dbo].[Tri_Delete_MTvidpovF]    Script Date: 13.03.2020 12:12:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Tri_Delete_MTvidpovF] ON [dbo].[MTvidpovF]
FOR DELETE 
AS

/*заборона витирати архівні*/
if exists(select coden from deleted F where datediff(mm,F.daten,getdate())>1) and convert(bit,isnull(IS_MEMBER ('us_Archive'),0))=0
begin 
	RAISERROR('Помилка, при знищенні запису! Архів змінювати заборонено', 12, 2) WITH SETERROR
	Rollback tran
	return
end

/*заборона витирати підписані*/
if exists(select coden from deleted F where F.sign1!='' or F.sign2!='')
begin 
	RAISERROR('Помилка, не можна знищити підписаний Авансовий звіт, зніміть підпис, а вже потім витирайте!', 12, 2) WITH SETERROR
	Rollback tran
	return
end

declare @error int
set @error=0

insert into MTvidpovF_Log (coden,typediya,addzal,nomn,daten,codep,namep,prompt,sign1,sign2,isfordir,nameopbuh)
select coden,1,addzal,nomn,daten,codep,namep,prompt,sign1,sign2,isfordir,nameopbuh
from deleted 

select @error=@error+@@error

insert into MTvidpovD_log (codep,typediya,coden,typedov,codetvun,nametv,ov,rah,kol,cena_r,dolar,kurs,prompt) 
select codep,4 as typediya,coden,typedov,codetvun,nametv,ov,rah,kol,cena_r,dolar,kurs,prompt
from MTvidpovD
where coden in (select coden from deleted)
select @error=@error+@@error

delete from MTvidpovD where coden in (select coden from deleted)
select @error=@error+@@error


if @error!=0
begin 
--	rollback tran A
	RAISERROR('Помилка, при знищенні  запису!', 12, 2) WITH SETERROR
	Rollback tran
	return

end
--else
--	commit tran A
GO
ALTER TABLE [dbo].[MTvidpovF] ENABLE TRIGGER [Tri_Delete_MTvidpovF]
GO
/****** Object:  Trigger [dbo].[Tri_Insert_MTvidpovF]    Script Date: 13.03.2020 12:12:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[Tri_Insert_MTvidpovF] ON [dbo].[MTvidpovF]
FOR INSERT
AS

insert into MTvidpovF_Log (coden,typediya,addzal,nomn,daten,codep,namep,prompt,sign1,sign2,isfordir,nameopbuh)
select coden,2,addzal,nomn,daten,codep,namep,prompt,sign1,sign2,isfordir,nameopbuh
from inserted 


GO
ALTER TABLE [dbo].[MTvidpovF] ENABLE TRIGGER [Tri_Insert_MTvidpovF]
GO
/****** Object:  Trigger [dbo].[Tri_Update_MTvidpovF]    Script Date: 13.03.2020 12:12:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Tri_Update_MTvidpovF] ON [dbo].[MTvidpovF]
FOR UPDATE
AS
/*
select @bb=dbo.fn_colupd('MTvidpovF','sign1',@idx)
if @bb=1
	return
select @bb=dbo.fn_colupd('MTvidpovF','sign2',@idx)
if @bb=1
	return
*/	
/*
	if exists(select coden from deleted F where datediff(mm,F.daten,getdate())>1)  and convert(bit,isnull(IS_MEMBER ('us_Archive'),0))=0
	begin 
		RAISERROR('Помилка, при зміні запису! Архів змінювати заборонено', 12, 2) WITH SETERROR
		Rollback tran
		return
	end
	if exists(select coden from inserted F where datediff(mm,F.daten,getdate())>1)  and convert(bit,isnull(IS_MEMBER ('us_Archive'),0))=0
	begin 
		RAISERROR('Помилка, при зміні запису! Архів змінювати заборонено', 12, 2) WITH SETERROR
		Rollback tran
		return
	end
	if exists(select coden from inserted F where datediff(mm,F.daten,getdate())<-1)
	begin 
		RAISERROR('Помилка, при зміні запису! Не можна заносити на два місяці в перед!', 12, 2) WITH SETERROR
		Rollback tran
		return
	end
*/
/*заборона витирати підписані
if exists(select coden from deleted F where F.sign1!='' or F.sign2!='')
begin 
	RAISERROR('Помилка, не можна змінювати підписаний Авансовий звіт, зніміть підпис!', 12, 2) WITH SETERROR
	Rollback tran
	return
end
*/
insert into MTvidpovF_Log (coden,typediya,addzal,nomn,daten,codep,namep,prompt,sign1,sign2,isfordir,nameopbuh)
select coden,3,addzal,nomn,daten,codep,namep,prompt,sign1,sign2,isfordir,nameopbuh
from Inserted  
GO
ALTER TABLE [dbo].[MTvidpovF] ENABLE TRIGGER [Tri_Update_MTvidpovF]
GO
