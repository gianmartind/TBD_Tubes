USE [master]
GO

INSERT INTO [dbo].[TB_Faskes]
           ([namaFaskes]
           ,[kapasitas]
           ,[fk_idAlamatFaskes]
           ,[tipe])
     VALUES
           ('a','100',1,'Rumah Sakit'),
		   ('b','10',2,'Rumah Sakit'),
		   ('c','20',3,'Rumah Sakit'),
		   ('d','30',4,'Rumah Sakit'),
		   ('e','40',5,'Rumah Sakit'),
		   ('f','50',6,'Rumah Sakit'),
		   ('g','60',7,'Rumah Sakit'),
		   ('h','70',8,'Rumah Sakit'),
		   ('i','80',9,'Rumah Sakit'),
		   ('j','90',10,'Rumah Sakit'),

		   ('aa','10',11,'Puskesmas'),
		   ('ab','10',12,'Puskesmas'),
		   ('ac','10',13,'Puskesmas'),
		   ('ad','10',14,'Puskesmas'),
		   ('ae','10',15,'Puskesmas'),
		   ('af','10',16,'Puskesmas'),
		   ('ag','10',17,'Puskesmas'),
		   ('ah','10',18,'Puskesmas'),
		   ('ai','10',19,'Puskesmas'),
		   ('aj','10',20,'Puskesmas'),

		   ('ba','100',21,'Rumah Sakit'),
		   ('bb','20',22,'Rumah Sakit'),
		   ('bc','30',23,'Rumah Sakit'),
		   ('bd','40',24,'Rumah Sakit'),
		   ('be','50',25,'Rumah Sakit'),
		   ('bf','60',26,'Rumah Sakit'),
		   ('bg','70',27,'Rumah Sakit'),
		   ('bh','80',28,'Rumah Sakit'),
		   ('bi','90',29,'Rumah Sakit'),
		   ('bj','10',30,'Rumah Sakit'),

		   ('ca','10',31,'Puskesmas'),
		   ('cb','10',32,'Puskesmas'),
		   ('cc','10',33,'Puskesmas'),
		   ('cd','10',34,'Puskesmas'),
		   ('ce','10',35,'Puskesmas'),
		   ('cf','10',36,'Puskesmas'),
		   ('cg','10',37,'Puskesmas'),
		   ('ch','10',38,'Puskesmas'),
		   ('ci','10',39,'Puskesmas'),
		   ('cj','10',40,'Puskesmas'),

		   ('da','100',41,'Rumah Sakit'),
		   ('db','20',42,'Rumah Sakit'),
		   ('dc','30',43,'Rumah Sakit'),
		   ('dd','40',44,'Rumah Sakit'),
		   ('de','50',45,'Rumah Sakit'),
		   ('df','60',46,'Rumah Sakit'),
		   ('dg','70',47,'Rumah Sakit'),
		   ('dh','80',48,'Rumah Sakit'),
		   ('di','90',49,'Rumah Sakit'),
		   ('dj','10',50,'Rumah Sakit'),

		   ('ea','10',51,'Puskesmas'),
		   ('eb','10',52,'Puskesmas'),
		   ('ec','10',53,'Puskesmas'),
		   ('ed','10',54,'Puskesmas'),
		   ('ee','10',55,'Puskesmas'),
		   ('ef','10',56,'Puskesmas'),
		   ('eg','10',57,'Puskesmas'),
		   ('eh','10',58,'Puskesmas'),
		   ('ei','10',59,'Puskesmas'),
		   ('ej','10',60,'Puskesmas'),

		   ('fa','100',61,'Rumah Sakit'),
		   ('fb','20',62,'Rumah Sakit'),
		   ('fc','30',63,'Rumah Sakit'),
		   ('fd','40',64,'Rumah Sakit'),
		   ('fe','50',65,'Rumah Sakit'),
		   ('ff','60',66,'Rumah Sakit'),
		   ('fg','70',67,'Rumah Sakit'),
		   ('fh','80',68,'Rumah Sakit'),
		   ('fi','90',69,'Rumah Sakit'),
		   ('fj','10',70,'Rumah Sakit'),

		   ('ga','10',71,'Puskesmas'),
		   ('gb','10',72,'Puskesmas'),
		   ('gc','10',73,'Puskesmas'),
		   ('gd','10',74,'Puskesmas'),
		   ('ge','10',75,'Puskesmas'),
		   ('gf','10',76,'Puskesmas'),
		   ('gg','10',77,'Puskesmas'),
		   ('gh','10',78,'Puskesmas'),
		   ('gi','10',79,'Puskesmas'),
		   ('gj','10',80,'Puskesmas'),

		   ('ha','100',81,'Rumah Sakit'),
		   ('hb','20',82,'Rumah Sakit'),
		   ('hc','30',83,'Rumah Sakit'),
		   ('hd','40',84,'Rumah Sakit'),
		   ('he','50',85,'Rumah Sakit'),
		   ('hf','60',86,'Rumah Sakit'),
		   ('hg','70',87,'Rumah Sakit'),
		   ('hh','80',88,'Rumah Sakit'),
		   ('hi','90',89,'Rumah Sakit'),
		   ('hj','10',90,'Rumah Sakit'),



		   ('ax','100',1,'Puskesmas'),
		   ('bx','10',2,'Puskesmas'),
		   ('cx','20',3,'Puskesmas'),
		   ('dx','30',4,'Puskesmas'),
		   ('ex','40',5,'Puskesmas'),
		   ('fx','50',6,'Puskesmas'),
		   ('gx','60',7,'Puskesmas'),
		   ('hx','70',8,'Puskesmas'),
		   ('ix','80',9,'Puskesmas'),
		   ('jx','90',10,'Puskesmas'),

		   ('aax','10',11,'Rumah Sakit'),
		   ('abx','10',12,'Rumah Sakit'),
		   ('acx','10',13,'Rumah Sakit'),
		   ('adx','10',14,'Rumah Sakit'),
		   ('aex','10',15,'Rumah Sakit'),
		   ('afx','10',16,'Rumah Sakit'),
		   ('agx','10',17,'Rumah Sakit'),
		   ('ahx','10',18,'Rumah Sakit'),
		   ('aix','10',19,'Rumah Sakit'),
		   ('ajx','10',20,'Rumah Sakit'),

		   ('bax','100',21,'Puskesmas'),
		   ('bbx','20',22,'Puskesmas'),
		   ('bcx','30',23,'Puskesmas'),
		   ('bdx','40',24,'Puskesmas'),
		   ('bex','50',25,'Puskesmas'),
		   ('bfx','60',26,'Puskesmas'),
		   ('bgx','70',27,'Puskesmas'),
		   ('bhx','80',28,'Puskesmas'),
		   ('bix','90',29,'Puskesmas'),
		   ('bjx','10',30,'Puskesmas'),

		   ('cax','10',31,'Rumah Sakit'),
		   ('cbx','10',32,'Rumah Sakit'),
		   ('ccx','10',33,'Rumah Sakit'),
		   ('cdx','10',34,'Rumah Sakit'),
		   ('cex','10',35,'Rumah Sakit'),
		   ('cfx','10',36,'Rumah Sakit'),
		   ('cgx','10',37,'Rumah Sakit'),
		   ('chx','10',38,'Rumah Sakit'),
		   ('cix','10',39,'Rumah Sakit'),
		   ('cjx','10',40,'Rumah Sakit'),

		   ('dax','100',41,'Puskesmas'),
		   ('dbx','20',42,'Puskesmas'),
		   ('dcx','30',43,'Puskesmas'),
		   ('ddx','40',44,'Puskesmas'),
		   ('dex','50',45,'Puskesmas'),
		   ('dfx','60',46,'Puskesmas'),
		   ('dgx','70',47,'Puskesmas'),
		   ('dhx','80',48,'Puskesmas'),
		   ('dix','90',49,'Puskesmas'),
		   ('djx','10',50,'Puskesmas'),

		   ('eax','10',51,'Rumah Sakit'),
		   ('ebx','10',52,'Rumah Sakit'),
		   ('ecx','10',53,'Rumah Sakit'),
		   ('edx','10',54,'Rumah Sakit'),
		   ('eex','10',55,'Rumah Sakit'),
		   ('efx','10',56,'Rumah Sakit'),
		   ('egx','10',57,'Rumah Sakit'),
		   ('ehx','10',58,'Rumah Sakit'),
		   ('eix','10',59,'Rumah Sakit'),
		   ('ejx','10',60,'Rumah Sakit'),

		   ('fax','100',61,'Puskesmas'),
		   ('fbx','20',62,'Puskesmas'),
		   ('fcx','30',63,'Puskesmas'),
		   ('fdx','40',64,'Puskesmas'),
		   ('fex','50',65,'Puskesmas'),
		   ('ffx','60',66,'Puskesmas'),
		   ('fgx','70',67,'Puskesmas'),
		   ('fhx','80',68,'Puskesmas'),
		   ('fix','90',69,'Puskesmas'),
		   ('fjx','10',70,'Puskesmas'),

		   ('gax','10',71,'Rumah Sakit'),
		   ('gbx','10',72,'Rumah Sakit'),
		   ('gcx','10',73,'Rumah Sakit'),
		   ('gdx','10',74,'Rumah Sakit'),
		   ('gex','10',75,'Rumah Sakit'),
		   ('gfx','10',76,'Rumah Sakit'),
		   ('ggx','10',77,'Rumah Sakit'),
		   ('ghx','10',78,'Rumah Sakit'),
		   ('gix','10',79,'Rumah Sakit'),
		   ('gjx','10',80,'Rumah Sakit'),

		   ('hax','100',81,'Puskesmas'),
		   ('hbx','20',82,'Puskesmas'),
		   ('hcx','30',83,'Puskesmas'),
		   ('hdx','40',84,'Puskesmas'),
		   ('hex','50',85,'Puskesmas'),
		   ('hfx','60',86,'Puskesmas'),
		   ('hgx','70',87,'Puskesmas'),
		   ('hhx','80',88,'Puskesmas'),
		   ('hix','90',89,'Puskesmas'),
		   ('hjx','10',90,'Puskesmas'),

GO
