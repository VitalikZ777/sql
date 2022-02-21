use sk1 
go
Create ASSEMBLY [System.Runtime.Serialization] FROM 'C:\Windows\Microsoft.NET\Framework64\v4.0.30319\System.Runtime.Serialization.dll'
WITH PERMISSION_SET = UNSAFE
GO

CREATE ASSEMBLY [Newtonsoft]
FROM 'D:\Vitalik_Z\profiles\Vitalik_Z\Documents\Visual Studio 2017\Projects\ParserURL_dll\ParserURL_dll\bin\Debug\Newtonsoft.Json.dll'
WITH PERMISSION_SET = UNSAFE
GO
CREATE ASSEMBLY [HtmlAgilityPack]
FROM 'D:\Vitalik_Z\profiles\Vitalik_Z\Documents\Visual Studio 2017\Projects\ParserURL_dll\ParserURL_dll\bin\Debug\HtmlAgilityPack.dll'
WITH PERMISSION_SET = UNSAFE
GO
--CREATE ASSEMBLY [System.Net.Http]
--FROM 'D:\Vitalik_Z\profiles\Vitalik_Z\Documents\Visual Studio 2017\Projects\ParserURL_dll\ParserURL_dll\bin\Debug\System.Net.Http.dll'
--WITH PERMISSION_SET = UNSAFE
--GO

CREATE ASSEMBLY [System.Net.Http]
from 'C:\Windows\Microsoft.NET\Framework64\v4.0.30319\System.Net.Http.dll'
WITH PERMISSION_SET = UNSAFE
GO


CREATE ASSEMBLY parsinggetprice from 'D:\Vitalik_Z\profiles\Vitalik_Z\Documents\Visual Studio 2017\Projects\ParserURL_dll\ParserURL_dll\bin\Debug\ParserURL_dll.dll' WITH PERMISSION_SET = UNSAFE  
go
CREATE PROCEDURE getpricefromxml_main (  
@xml nvarchar(4000),
@price nvarchar(20) OUTPUT,
@error nvarchar(500) OUTPUT )
AS    
--"ASSEMBLY_NAME.[NAMESPACE_OF_THE_CLASS.CLASS_NAME].METHOD".
EXTERNAL NAME parsinggetprice.[ParserURL_dll.Parser].getpricefromxml_main ;
go

DECLARE @xml nvarchar(500) ,@price nvarchar(20),@error nvarchar(2000)
set @xml ='<root><ProductsXML><coden>1</coden><codetvun>641164</codetvun><url>https://rozetka.com.ua/7394375/p7394375/</url></ProductsXML><ProductsXML><coden>2</coden><codetvun>641164</codetvun><url>https://epicentrk.ua/shop/plitka-intercerama-continental-bezh-157-021-43x43.html</url></ProductsXML></root>'
EXEC getpricefromxml_main @xml,@price out,@error out 
go
   
PRINT @price    



-- включити виконання процедур на сервері
ALTER DATABASE SK1 SET TRUSTWORTHY ON;
go
sp_configure 'show advanced options', 1;    
GO    
RECONFIGURE;    
GO    
sp_configure 'clr enabled', 1;    
GO    
RECONFIGURE;    
GO    


--remove procedure and assembly
use sk1 
go
IF EXISTS (SELECT name FROM sysobjects WHERE name = ' getpricefromxml_main')    
  drop procedure  getpricefromxml_main    
  
IF EXISTS (SELECT name FROM sys.assemblies WHERE name = 'parsinggetprice')    
   drop assembly parsinggetprice   