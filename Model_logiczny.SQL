IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Recepty]') AND type in (N'U'))
    DROP TABLE [dbo].[Recepty]
GO
CREATE TABLE [dbo].[Recepty] (
[id_recepty] int  NOT NULL  
, [nazwa_lekarstwa] varchar(50)  NOT NULL  
, [data_waznosci] date  NOT NULL  
, [id_wizyty] int  NOT NULL  
)
GO

ALTER TABLE [dbo].[Recepty] ADD CONSTRAINT [Recepty_PK] PRIMARY KEY CLUSTERED (
[id_recepty]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Klienci]') AND type in (N'U'))
    DROP TABLE [dbo].[Klienci]
GO
CREATE TABLE [dbo].[Klienci] (
[PESEL] varchar(11)  NOT NULL  
, [imie] varchar(30)  NOT NULL  
, [nazwisko] varchar(30)  NOT NULL  
, [numer_telefonu] varchar(20)  NOT NULL  
)
GO

ALTER TABLE [dbo].[Klienci] ADD CONSTRAINT [Klienci_PK] PRIMARY KEY CLUSTERED (
[PESEL]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Zwierzeta]') AND type in (N'U'))
    DROP TABLE [dbo].[Zwierzeta]
GO
CREATE TABLE [dbo].[Zwierzeta] (
[id_zwierzaka] int  NOT NULL  
, [imie] varchar(30)  NULL  
, [gatunek] varchar(30)  NOT NULL  
, [rasa] varchar(30)  NOT NULL  
, [plec] varchar(30)  NOT NULL  
, [data_urodzenia] date  NOT NULL  
, [PESEL] varchar(11)  NOT NULL  
)
GO

ALTER TABLE [dbo].[Zwierzeta] ADD CONSTRAINT [Zwierzeta_PK] PRIMARY KEY CLUSTERED (
[id_zwierzaka]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Asystenci]') AND type in (N'U'))
    DROP TABLE [dbo].[Asystenci]
GO
CREATE TABLE [dbo].[Asystenci] (
[id_asystenta] int  NOT NULL  
, [imie] varchar(30)  NOT NULL  
, [nazwisko] varchar(30)  NOT NULL  
)
GO

ALTER TABLE [dbo].[Asystenci] ADD CONSTRAINT [Asystenci_PK] PRIMARY KEY CLUSTERED (
[id_asystenta]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Weterynarze]') AND type in (N'U'))
    DROP TABLE [dbo].[Weterynarze]
GO
CREATE TABLE [dbo].[Weterynarze] (
[id_weterynarza] int  NOT NULL  
, [imie] varchar(30)  NOT NULL  
, [nazwisko] varchar(30)  NOT NULL  
, [numer_telefonu] varchar(20)  NOT NULL  
, [email] varchar(50)  NOT NULL  
, [specjalizacja] varchar(50)  NOT NULL  
)
GO

ALTER TABLE [dbo].[Weterynarze] ADD CONSTRAINT [Weterynarze_PK] PRIMARY KEY CLUSTERED (
[id_weterynarza]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Wizyty]') AND type in (N'U'))
    DROP TABLE [dbo].[Wizyty]
GO
CREATE TABLE [dbo].[Wizyty] (
[id_wizyty] int  NOT NULL  
, [nazwa_choroby] varchar(30)  NOT NULL  
, [termin] datetime  NOT NULL  
, [numer_gabinetu] int  NOT NULL  
, [id_zwierzaka] int  NOT NULL  
, [id_rachunku] int  NOT NULL  
, [id_asystenta] int  NULL  
, [id_weterynarza] int  NOT NULL  
)
GO

ALTER TABLE [dbo].[Wizyty] ADD CONSTRAINT [Wizyty_PK] PRIMARY KEY CLUSTERED (
[id_wizyty]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Uslugi]') AND type in (N'U'))
    DROP TABLE [dbo].[Uslugi]
GO
CREATE TABLE [dbo].[Uslugi] (
[id_uslugi] int  NOT NULL  
, [koszt] money  NOT NULL  
, [nazwa] varchar(30)  NOT NULL  
)
GO

ALTER TABLE [dbo].[Uslugi] ADD CONSTRAINT [Uslugi_PK] PRIMARY KEY CLUSTERED (
[id_uslugi]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Uslugi_w_wizycie]') AND type in (N'U'))
    DROP TABLE [dbo].[Uslugi_w_wizycie]
GO
CREATE TABLE [dbo].[Uslugi_w_wizycie] (
[id_wizyty] int  NOT NULL  
, [id_uslugi] int  NOT NULL  
)
GO

ALTER TABLE [dbo].[Uslugi_w_wizycie] ADD CONSTRAINT [Uslugi_w_wizycie_PK] PRIMARY KEY CLUSTERED (
[id_wizyty]
, [id_uslugi]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Rachunki]') AND type in (N'U'))
    DROP TABLE [dbo].[Rachunki]
GO
CREATE TABLE [dbo].[Rachunki] (
[id_rachunku] int  NOT NULL  
, [termin_zapłaty] date  NOT NULL  
, [kwota] money  NOT NULL  
)
GO

ALTER TABLE [dbo].[Rachunki] ADD CONSTRAINT [Rachunki_PK] PRIMARY KEY CLUSTERED (
[id_rachunku]
)
GO
GO

ALTER TABLE [dbo].[Recepty] WITH CHECK ADD CONSTRAINT [Wizyty_Recepty_FK1] FOREIGN KEY (
[id_wizyty]
)
REFERENCES [dbo].[Wizyty] (
[id_wizyty]
)
GO

GO

ALTER TABLE [dbo].[Zwierzeta] WITH CHECK ADD CONSTRAINT [Klienci_Zwierzeta_FK1] FOREIGN KEY (
[PESEL]
)
REFERENCES [dbo].[Klienci] (
[PESEL]
)
GO

GO

GO

ALTER TABLE [dbo].[Wizyty] WITH CHECK ADD CONSTRAINT [Asystenci_Wizyty_FK1] FOREIGN KEY (
[id_asystenta]
)
REFERENCES [dbo].[Asystenci] (
[id_asystenta]
)
ALTER TABLE [dbo].[Wizyty] WITH CHECK ADD CONSTRAINT [Weterynarze_Wizyty_FK1] FOREIGN KEY (
[id_weterynarza]
)
REFERENCES [dbo].[Weterynarze] (
[id_weterynarza]
)
ALTER TABLE [dbo].[Wizyty] WITH CHECK ADD CONSTRAINT [Zwierzeta_Wizyty_FK1] FOREIGN KEY (
[id_zwierzaka]
)
REFERENCES [dbo].[Zwierzeta] (
[id_zwierzaka]
)
ALTER TABLE [dbo].[Wizyty] WITH CHECK ADD CONSTRAINT [Rachunki_Wizyty_FK1] FOREIGN KEY (
[id_rachunku]
)
REFERENCES [dbo].[Rachunki] (
[id_rachunku]
)
GO

GO

ALTER TABLE [dbo].[Uslugi_w_wizycie] WITH CHECK ADD CONSTRAINT [Wizyty_Uslugi_w_wizycie_FK1] FOREIGN KEY (
[id_wizyty]
)
REFERENCES [dbo].[Wizyty] (
[id_wizyty]
)
ALTER TABLE [dbo].[Uslugi_w_wizycie] WITH CHECK ADD CONSTRAINT [Uslugi_Uslugi_w_wizycie_FK1] FOREIGN KEY (
[id_uslugi]
)
REFERENCES [dbo].[Uslugi] (
[id_uslugi]
)
GO

GO

