USE [Sk1]
GO
/****** Object:  StoredProcedure [dbo].[us_Kitchen_Rozh]    Script Date: 21.02.2022 13:30:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--  exec us_RozhF_Kitchen
 ALTER PROCEDURE [dbo].[us_Kitchen_Rozh]    @daten smalldatetime
AS
set nocount on
--------------------------------- додати накладну --------------------------

declare @nomnf int,@datenf smalldatetime,@codenf int
--select @nomnf=nomn,@datenf=daten from  NRozhF where coden=@codenf
--declare @daten smalldatetime='2020-09-25 09:28:00'  --convert(smalldatetime,getdate())
--set @daten=convert(smalldatetime,getdate())
declare @sumst1 numeric(9,1),@sumst2 numeric(9,1),@sumst3 numeric(9,1),@sumst4 numeric(9,1),@sumst5 numeric(9,1),@sumst6 numeric(9,1),@sumst7 numeric(9,1)
declare @st1 int,@st2 int,@st3 int,@st4 int,@st5 int,@st6 int,@st7 int	
--print @codenf
--print @nomnf

select @sumst1 =C.sum1, @sumst2 =C.sum2, @sumst3 =C.sum3, @sumst4 =C.sum4, @sumst5 =C.sum5, @sumst6 =C.sum6, @sumst7 =C.sum7,
@st1=C.st1,@st2=C.st2,@st3=C.st3,@st4=C.st4,@st5=C.st5,@st6=C.st6,@st7=C.st7
from
(SELECT M.st1,M.st2,M.st3,M.st4,M.st5,M.st6,M.st7,
Sum(C.st1) as sum1,
Sum(C.st2) as sum2,
Sum(C.st3) as sum3,
Sum(C.st4) as sum4,
Sum(C.st5) as sum5,
Sum(C.st6) as sum6,
Sum(C.st7) as sum7
FROM Kitchen_Clients C 
left join  Kitchen_Menu M on C.daten=M.daten		
WHERE C.addzal=1
 and datediff(dd,C.daten,@daten)=0              --daten
 group by C.daten,M.st1,M.st2,M.st3,M.st4,M.st5,M.st6,M.st7
 ) C
 

--print @sumst1
--print @st1
--SELECT * from Kitchen_Menu M where datediff(dd,M.daten,'2020-09-25 09:28:00')=0 

declare @namest1 varchar(50),@namest2 varchar(50),@namest3 varchar(50),@namest4 varchar(50),@namest5 varchar(50),@namest6 varchar(50),@namest7 varchar(50)
declare @sprice1 numeric(9,3),@sprice2 numeric(9,3),@sprice3 numeric(9,3),@sprice4 numeric(9,3),@sprice5 numeric(9,3),@sprice6 numeric(9,3),@sprice7 numeric(9,3)

declare @prompt varchar(100)=''
Select @st1=M.st1,@st2=M.st2,@st3=M.st3,@st4=M.st4,@st5=M.st5,@st6=M.st6,@st7=M.st7,
	@namest1=M.namest1,	@namest2=M.namest2,	@namest3=M.namest3,	@namest4=M.namest4,	@namest5=M.namest5,	@namest6=M.namest6,	@namest7=M.namest7,
	@sprice1=M.sprice1,@sprice2=M.sprice2,@sprice3=M.sprice3,@sprice4=M.sprice4,@sprice5=M.sprice5,@sprice6=M.sprice6,@sprice7=M.sprice7
	--into #tmpmenu
		from Kitchen_Menu M where datediff(dd,M.daten,@daten)=0    ---@daten
		--перевірка чи існує меню на день рознесення  і чи є взяті в роботу страви
		IF Exists(select M.coden from Kitchen_Menu M
		left join  Kitchen_Clients C on C.daten=M.daten
		where datediff(dd,M.daten,@daten)=0 and C.addzal=1)
			
		BEGIN
				DECLARE stravu_cursor CURSOR FOR
					select @st1,@sumst1,@namest1,@sprice1
					union select @st2,@sumst2,@namest2,@sprice2
					union select @st3,@sumst3,@namest3,@sprice3
					union select @st4,@sumst4,@namest4,@sprice4
					union select @st5,@sumst5,@namest5,@sprice5
					union select @st6,@sumst6,@namest6,@sprice6 
					union select @st7,@sumst7,@namest7,@sprice7
				declare @coden_ingr int ,@kol_ingr  numeric (9,3),@sum_st numeric (9,1),@name_st varchar(50),@price_st numeric(9,2),@coden_st int

			--перебираємо по одному
			OPEN stravu_cursor
			FETCH NEXT FROM stravu_cursor INTO @coden_st,@sum_st,@name_st,@price_st
			WHILE @@FETCH_STATUS = 0  
				BEGIN
				--print @name_st
				--створення накладної на цілу страву
				--якщо страва існує та замовлено більше 0 порцій
				IF @coden_st>0 and @sum_st>0
					begin
						exec us_RozhF_add 21,1,4,2
						select @codenf=coden,@nomnf=nomn,@datenf=daten from NRozhF where nameop = USER_NAME() and ttype=21 order by coden 
							declare @codetvun int,@kol numeric (9,3),@cena_r numeric (9,3)
							create table #tmp_ingred(ttt tinyint, nparent int,codetvun int, coden int,nametv varchar(50),ov varchar(5),rah smallint, cena_r numeric (9,3),dolar tinyint, namevaluta varchar(10) ,kurs numeric (9,3),kol numeric (9,3),saldo  numeric (9,3))
						
							insert into #tmp_ingred
							exec us_GGrups_Saldo 21,@coden_st       
					
				--	exec us_GGrups_Saldo 21,99   
						
										DECLARE ingred_cursor CURSOR FOR
										select  codetvun,kol--,cena_r 
										from #tmp_ingred
		
										OPEN ingred_cursor
					

											FETCH NEXT FROM ingred_cursor INTO  @coden_ingr,@kol_ingr--,@cena_r_ing
											WHILE @@FETCH_STATUS = 0  
											BEGIN
											--select @codetvun=codetvun,@kol=kol,@cena_r=cena_r from #tmp_ingred where codetvun= @coden_ingr
											declare @sum_kol numeric (9,3)
											IF @coden_st=99  --хліб
												begin
													select @sum_kol=saldo from #tmp_ingred where codetvun=@coden_ingr
													--set @sum_kol=@kol_ingr*@sum_st
													if @sum_kol<=0
													select 1
													--RAISERROR ('Сальдо по хлібу від''ємне!', 12, 2)
													else
													exec us_RozhD_editgr @codenf,@sum_kol,@coden_ingr,21    
												end
											else
												begin
									
													set @sum_kol=@kol_ingr*@sum_st
													exec us_RozhD_editgr @codenf,@sum_kol,@coden_ingr,21    
												end
											FETCH NEXT FROM ingred_cursor  INTO  @coden_ingr,@kol_ingr--,@cena_r_ing
											END   
										drop table #tmp_ingred
										CLOSE ingred_cursor 
										DEALLOCATE ingred_cursor
						set  @prompt=@name_st+'  '+convert(varchar,@sum_st)+ ' порцій по = '+ convert(varchar,@price_st)
					--	print 'us_RozhF_edit '+ convert(varchar,@codenf)+',4,'+convert(varchar,@nomnf)+','+convert(varchar,@datenf)+',5078,+''''Трибух Наталя Ілларіонівна,  Роздрібн'',1,0,7035,'+@prompt+',2,0,0,0'
						exec us_RozhF_edit @codenf,4,@nomnf,@datenf,5078,'Трибух Наталя Ілларіонівна','  Роздрібн',1,0,7035,@prompt,2,0,0,0  --рахунок ???
						
						exec us_RozhF_unlock @codenf
								--exec us_RozhF_prov @codenf,1
								--exec us_RozhF_perevir @codenf,1
	
					end --еnd of @coden_st>0
				FETCH NEXT FROM stravu_cursor INTO @coden_st,@sum_st,@name_st,@price_st
				END   

		CLOSE stravu_cursor  
		DEALLOCATE stravu_cursor
		END  --еnd of if exists
