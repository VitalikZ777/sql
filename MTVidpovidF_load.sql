USE [Sk1]
GO
/****** Object:  StoredProcedure [dbo].[us_MTvidpovidF_load]    Script Date: 17.06.2020 17:03:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[us_MTvidpovidF_load]  @lyear smallint,@lmonth tinyint,@lttype tinyint,@ltype tinyint
AS
set nocount on
declare @year smallint,@month tinyint,@ttype tinyint,@type tinyint
set @year=@lyear
set @month=@lmonth
set @ttype=@lttype
set @type=@ltype
/*прихід від постачальника  type=1 
повернення клієнта  type=2 
лишки на складі  type=3
прихід від інших магазинів  type=4
внутрішній прихід  type=5
прихід на інший магазин  type=6
*/
select F.*
into #tmpNPrihF
from NPrihF F WITH (NOLOCK)
where ((datepart(yy,F.daten)=@year and datepart(mm,F.daten)=@month) or F.addzal=0)and ttype=@ttype and type=@type 
--where datepart(yy,F.daten)=@year and datepart(mm,F.daten)=@month and ttype=@ttype and type=@type 

select *
into #tmpNPrihD
from NPrihD WITH (NOLOCK)
where coden in (select coden from #tmpNPrihF)

create table #tmpNRozhF (coden int,daten smalldatetime)

if @ttype=2 and @type=2
	insert into #tmpNRozhF (coden,daten)
	select coden,daten
	from NRozhF WITH (NOLOCK)
	where coden in (select codenrozhf from #tmpNPrihF where codenrozhf!=0)

	-------------------------------
	create table #tmpNSignF (coden int,nomn int,sign1 varchar(18),sign2 varchar(18))

if @ttype=20 and @type=1

begin
	insert into #tmpNSignF (coden,nomn,sign1,sign2)
	select coden,nomn,sign1,sign2
	from MtVidpovF WITH (NOLOCK)

	select F.coden,F.addzal,F.nomn,F.daten,F.codep,
	namep=case
		when F.type=1 and (convert(bit,isnull(IS_MEMBER ('us_Zbut'),0))=1 or convert(bit,isnull(IS_MEMBER ('us_Sklad'),0))=1) then F.namep_p
		else F.namep
	end,
	F.namep_p,F.namesk,F.fiscal,
	F.rah,F.prompt,F.useridedit,F.nameop,F.typeopl,F.kasan,F.perevir,
	convert(numeric(18,2),isnull(d1.suma,0.00)) as sumall,F.codepdt,F.namepdt,F.proforma,
	F.codev,isnull(Vd.namev,'Невідомо    ') as namev,
	isnull(ltrim(rtrim(K.namep))+' '+ltrim(rtrim(K.iname))+' '+ltrim(rtrim(K.fname)),'') as nameworker,
	isnull(FS.codefisc,0) as codefisc,isnull(FS.sumallfisc,0.00) as sumallfisc,
	isnull(FS.nomnfisc,0) as nomnfisc,
	isnull(FR.daten,F.daten) as datenrozh,
	isnull(SI.Sign1,'') as Sign1,
	isnull(SI.Sign2,'') as Sign2
from #tmpNPrihF F
	left join 
		(select coden,sum(round(kol*cena_p*kurs,2)) as suma
		from #tmpNPrihD
		group by coden
		) as d1 on F.coden=d1.coden 
	left join Viddil Vd WITH (NOLOCK) on F.codev=Vd.codev 
	left join Kadr.dbo.Kadr K WITH (NOLOCK) on F.codeworker=K.coden
	left join NPrihF_fiscal as FS WITH (NOLOCK) on F.coden=FS.coden 
	left join #tmpNRozhF FR on F.codenrozhf=FR.coden
	left join #tmpNSignF SI on F.coden=SI.nomn
order by F.daten

end


drop table #tmpNPrihF
drop table #tmpNPrihD
drop table #tmpNRozhF
drop table #tmpNSignF