Create Database Gestion_Escolar;
use Gestion_Escolar;

 CREATE TABLE Area_Tecnica (
    id_Area_Tecnica INT IDENTITY(1,1) PRIMARY KEY,
    Nombre_Area VARCHAR(100) NOT NULL
);


select * from Area_Tecnica;

IF OBJECT_ID('sp_listar_areas_tecnicas','P') IS NOT NULL
    DROP PROCEDURE sp_listar_areas_tecnicas;
GO

CREATE PROCEDURE sp_listar_areas_tecnicas
AS
BEGIN
    SELECT id_area_tecnica, nombre_area
    FROM AreaTecnica;
END;
GO

--------------------------------

IF OBJECT_ID('sp_guardar_area_tecnica','P') IS NOT NULL
    DROP PROCEDURE sp_guardar_area_tecnica;
GO

CREATE PROCEDURE sp_guardar_area_tecnica
    @nombre_area VARCHAR(100)
AS
BEGIN
    INSERT INTO AreaTecnica(nombre_area)
    VALUES (@nombre_area);
END;
GO

--------------------------------

IF OBJECT_ID('sp_eliminar_area_tecnica','P') IS NOT NULL
    DROP PROCEDURE sp_eliminar_area_tecnica;
GO

CREATE PROCEDURE sp_eliminar_area_tecnica
    @id_area_tecnica INT
AS
BEGIN
    DELETE FROM AreaTecnica
    WHERE id_area_tecnica = @id_area_tecnica;
END;
GO

--------------------------------

IF OBJECT_ID('sp_buscar_area_tecnica','P') IS NOT NULL
    DROP PROCEDURE sp_buscar_area_tecnica;
GO

CREATE PROCEDURE sp_buscar_area_tecnica
    @texto VARCHAR(100)
AS
BEGIN
    SELECT id_area_tecnica, nombre_area
    FROM AreaTecnica
    WHERE nombre_area LIKE '%' + @texto + '%';
END;
GO

delete from Area_Tecnica;

SET IDENTITY_INSERT Area_Tecnica ON;

INSERT INTO Area_Tecnica (id_Area_Tecnica, Nombre_Area) VALUES
(1,'Cuidados básicos de salud'),
(2,'Cuidados de salud en servicios especializados'),
(3,'Informática'),
(4,'Desarrollo de Software'),                                                           
(5,'Redes y Telecomunicaciones'),
(6,'Contabilidad'),
(7,'Administración'),
(8,'Electricidad'),
(9,'Electrónica'),
(10,'Mecánica Automotriz'),
(11,'Gastronomía'),
(12,'Turismo'),
(13,'Diseño Gráfico'),
(14,'Marketing Digital'),
(15,'Soporte Técnico'),
(16,'Ciberseguridad'),
(17,'Base de Datos'),
(18,'Programación Web'),
(19,'Programación Móvil'),
(20,'Inteligencia Artificial'),
(21,'Robótica'),
(22,'Arquitectura de Software'),
(23,'Análisis de Sistemas'),
(24,'Logística'),
(25,'Recursos Humanos'),
(26,'Secretariado'),
(27,'Farmacia'),
(28,'Laboratorio Clínico'),
(29,'Imágenes Médicas'),
(30,'Educación Inicial'),
(31,'Educación Básica'),
(32,'Educación Física'),
(33,'Arte y Diseño'),
(34,'Música'),
(35,'Idiomas'),
(36,'Producción Audiovisual'),
(37,'Animación Digital'),
(38,'Fotografía'),
(39,'Publicidad'),
(40,'Ventas'),
(41,'Comercio Exterior'),
(42,'Banca y Finanzas'),
(43,'Seguros'),
(44,'Bienes Raíces'),
(45,'Construcción'),
(46,'Topografía'),
(47,'Ebanistería'),
(48,'Refrigeración'),
(49,'Energía Renovable'),
(50,'Soldadura'),
(51,'Plomería'),
(52,'Carpintería'),
(53,'Mantenimiento Industrial'),
(54,'Gestión Ambiental'),
(55,'Seguridad Industrial'),
(56,'Prevención de Riesgos'),
(57,'Panadería'),
(58,'Repostería'),
(59,'Belleza'),
(60,'Estética'),
(61,'Cosmetología'),
(62,'Masaje Terapéutico'),
(63,'Entrenamiento Deportivo'),
(64,'Nutrición'),
(65,'Psicología'),
(66,'Trabajo Social'),
(67,'Criminología'),
(68,'Derecho'),
(69,'Comunicación Social'),
(70,'Periodismo'),
(71,'Locución'),
(72,'Relaciones Públicas'),
(73,'Gestión Cultural'),
(74,'Hotelería'),
(75,'Guía Turístico'),
(76,'Aviación'),
(77,'Marítima'),
(78,'Transporte y Logística'),
(79,'Operaciones Portuarias'),
(80,'Minería'),
(81,'Agricultura'),
(82,'Agroindustria'),
(83,'Veterinaria'),
(84,'Zootecnia'),
(85,'Pesca'),
(86,'Forestal'),
(87,'Diseño de Modas'),
(88,'Textil'),
(89,'Joyería'),
(90,'Artesanía'),
(91,'Imprenta'),
(92,'Edición'),
(93,'Gestión de Proyectos'),
(94,'Emprendimiento'),
(95,'Innovación Empresarial'),
(96,'Comercio Electrónico'),
(97,'Big Data'),
(98,'Cloud Computing'),
(99,'Blockchain'),
(100,'Realidad Virtual');



CREATE TABLE Estudiante (
    id_Estudiante INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100) NOT NULL,
    Apellidos NVARCHAR(100) NOT NULL,
    Direccion NVARCHAR(150) NOT NULL,
    Telefono NVARCHAR(15) NOT NULL,
    Email NVARCHAR(100) NOT NULL,
    id_Area_Tecnica INT NOT NULL,
    Estado NVARCHAR(20) DEFAULT 'Activo',

    CONSTRAINT FK_Estudiante_AreaTecnica
    FOREIGN KEY (id_Area_Tecnica)
    REFERENCES Area_Tecnica(id_Area_Tecnica)
);

select * from Estudiante;   

set IDENTITY_INSERT Estudiante ON;

INSERT INTO Estudiante (Nombre, Apellidos, Direccion, Telefono, Email, id_Area_Tecnica, Estado) VALUES
('Estudiante163','Martínez Díaz','Calle 163, La Vega','809-555-0163','est163@gmail.com',63,'Activo'),
('Estudiante164','Hernández Ruiz','Calle 164, San Cristóbal','809-555-0164','est164@gmail.com',64,'Inactivo'),
('Estudiante165','Torres Santos','Calle 165, Higüey','809-555-0165','est165@gmail.com',65,'Graduado'),
('Estudiante166','Ramírez Castillo','Calle 166, Bonao','809-555-0166','est166@gmail.com',66,'Suspendido'),
('Estudiante167','Flores Méndez','Calle 167, Baní','809-555-0167','est167@gmail.com',67,'Activo'),
('Estudiante168','Rivera Ortiz','Calle 168, Azua','809-555-0168','est168@gmail.com',68,'Activo'),
('Estudiante169','Gómez Navarro','Calle 169, Moca','809-555-0169','est169@gmail.com',69,'Activo'),
('Estudiante170','Morales Jiménez','Calle 170, Cotuí','809-555-0170','est170@gmail.com',70,'Inactivo'),
('Estudiante171','García Pérez','Calle 171, Santo Domingo','809-555-0171','est171@gmail.com',71,'Activo'),
('Estudiante172','Rodríguez López','Calle 172, Santiago','809-555-0172','est172@gmail.com',72,'Activo'),
('Estudiante173','Martínez Díaz','Calle 173, La Vega','809-555-0173','est173@gmail.com',73,'Activo'),
('Estudiante174','Hernández Ruiz','Calle 174, San Cristóbal','809-555-0174','est174@gmail.com',74,'Inactivo'),
('Estudiante175','Torres Santos','Calle 175, Higüey','809-555-0175','est175@gmail.com',75,'Graduado'),
('Estudiante176','Ramírez Castillo','Calle 176, Bonao','809-555-0176','est176@gmail.com',76,'Suspendido'),
('Estudiante177','Flores Méndez','Calle 177, Baní','809-555-0177','est177@gmail.com',77,'Activo'),
('Estudiante178','Rivera Ortiz','Calle 178, Azua','809-555-0178','est178@gmail.com',78,'Activo'),
('Estudiante179','Gómez Navarro','Calle 179, Moca','809-555-0179','est179@gmail.com',79,'Activo'),
('Estudiante180','Morales Jiménez','Calle 180, Cotuí','809-555-0180','est180@gmail.com',80,'Inactivo'),
('Estudiante181','García Pérez','Calle 181, Santo Domingo','809-555-0181','est181@gmail.com',81,'Activo'),
('Estudiante182','Rodríguez López','Calle 182, Santiago','809-555-0182','est182@gmail.com',82,'Activo'),
('Estudiante183','Martínez Díaz','Calle 183, La Vega','809-555-0183','est183@gmail.com',83,'Activo'),
('Estudiante184','Hernández Ruiz','Calle 184, San Cristóbal','809-555-0184','est184@gmail.com',84,'Inactivo'),
('Estudiante185','Torres Santos','Calle 185, Higüey','809-555-0185','est185@gmail.com',85,'Graduado'),
('Estudiante186','Ramírez Castillo','Calle 186, Bonao','809-555-0186','est186@gmail.com',86,'Suspendido'),
('Estudiante187','Flores Méndez','Calle 187, Baní','809-555-0187','est187@gmail.com',87,'Activo'),
('Estudiante188','Rivera Ortiz','Calle 188, Azua','809-555-0188','est188@gmail.com',88,'Activo'),
('Estudiante189','Gómez Navarro','Calle 189, Moca','809-555-0189','est189@gmail.com',89,'Activo'),
('Estudiante190','Morales Jiménez','Calle 190, Cotuí','809-555-0190','est190@gmail.com',90,'Inactivo'),
('Estudiante191','García Pérez','Calle 191, Santo Domingo','809-555-0191','est191@gmail.com',91,'Activo'),
('Estudiante192','Rodríguez López','Calle 192, Santiago','809-555-0192','est192@gmail.com',92,'Activo'),
('Estudiante193','Martínez Díaz','Calle 193, La Vega','809-555-0193','est193@gmail.com',93,'Activo'),
('Estudiante194','Hernández Ruiz','Calle 194, San Cristóbal','809-555-0194','est194@gmail.com',94,'Inactivo'),
('Estudiante195','Torres Santos','Calle 195, Higüey','809-555-0195','est195@gmail.com',95,'Graduado'),
('Estudiante196','Ramírez Castillo','Calle 196, Bonao','809-555-0196','est196@gmail.com',96,'Suspendido'),
('Estudiante197','Flores Méndez','Calle 197, Baní','809-555-0197','est197@gmail.com',97,'Activo'),
('Estudiante198','Rivera Ortiz','Calle 198, Azua','809-555-0198','est198@gmail.com',98,'Activo'),
('Estudiante199','Gómez Navarro','Calle 199, Moca','809-555-0199','est199@gmail.com',99,'Activo'),
('Estudiante200','Morales Jiménez','Calle 200, Cotuí','809-555-0200','est200@gmail.com',100,'Inactivo');

INSERT INTO Estudiante (Nombre, Apellidos, Direccion, Telefono, Email, id_Area_Tecnica, Estado) VALUES
('Estudiante201','García Pérez','Calle 201, Santo Domingo','809-555-0201','est201@gmail.com',1,'Activo'),
('Estudiante202','Rodríguez López','Calle 202, Santiago','809-555-0202','est202@gmail.com',2,'Activo'),
('Estudiante203','Martínez Díaz','Calle 203, La Vega','809-555-0203','est203@gmail.com',3,'Activo'),
('Estudiante204','Hernández Ruiz','Calle 204, San Cristóbal','809-555-0204','est204@gmail.com',4,'Inactivo'),
('Estudiante205','Torres Santos','Calle 205, Higüey','809-555-0205','est205@gmail.com',5,'Graduado'),
('Estudiante206','Ramírez Castillo','Calle 206, Bonao','809-555-0206','est206@gmail.com',6,'Suspendido'),
('Estudiante207','Flores Méndez','Calle 207, Baní','809-555-0207','est207@gmail.com',7,'Activo'),
('Estudiante208','Rivera Ortiz','Calle 208, Azua','809-555-0208','est208@gmail.com',8,'Activo'),
('Estudiante209','Gómez Navarro','Calle 209, Moca','809-555-0209','est209@gmail.com',9,'Activo'),
('Estudiante210','Morales Jiménez','Calle 210, Cotuí','809-555-0210','est210@gmail.com',10,'Inactivo'),
('Estudiante211','García Pérez','Calle 211, Santo Domingo','809-555-0211','est211@gmail.com',11,'Activo'),
('Estudiante212','Rodríguez López','Calle 212, Santiago','809-555-0212','est212@gmail.com',12,'Activo'),
('Estudiante213','Martínez Díaz','Calle 213, La Vega','809-555-0213','est213@gmail.com',13,'Activo'),
('Estudiante214','Hernández Ruiz','Calle 214, San Cristóbal','809-555-0214','est214@gmail.com',14,'Inactivo'),
('Estudiante215','Torres Santos','Calle 215, Higüey','809-555-0215','est215@gmail.com',15,'Graduado'),
('Estudiante216','Ramírez Castillo','Calle 216, Bonao','809-555-0216','est216@gmail.com',16,'Suspendido'),
('Estudiante217','Flores Méndez','Calle 217, Baní','809-555-0217','est217@gmail.com',17,'Activo'),
('Estudiante218','Rivera Ortiz','Calle 218, Azua','809-555-0218','est218@gmail.com',18,'Activo'),
('Estudiante219','Gómez Navarro','Calle 219, Moca','809-555-0219','est219@gmail.com',19,'Activo'),
('Estudiante220','Morales Jiménez','Calle 220, Cotuí','809-555-0220','est220@gmail.com',20,'Inactivo'),
('Estudiante221','García Pérez','Calle 221, Santo Domingo','809-555-0221','est221@gmail.com',21,'Activo'),
('Estudiante222','Rodríguez López','Calle 222, Santiago','809-555-0222','est222@gmail.com',22,'Activo'),
('Estudiante223','Martínez Díaz','Calle 223, La Vega','809-555-0223','est223@gmail.com',23,'Activo'),
('Estudiante224','Hernández Ruiz','Calle 224, San Cristóbal','809-555-0224','est224@gmail.com',24,'Inactivo'),
('Estudiante225','Torres Santos','Calle 225, Higüey','809-555-0225','est225@gmail.com',25,'Graduado'),
('Estudiante226','Ramírez Castillo','Calle 226, Bonao','809-555-0226','est226@gmail.com',26,'Suspendido'),
('Estudiante227','Flores Méndez','Calle 227, Baní','809-555-0227','est227@gmail.com',27,'Activo'),
('Estudiante228','Rivera Ortiz','Calle 228, Azua','809-555-0228','est228@gmail.com',28,'Activo'),
('Estudiante229','Gómez Navarro','Calle 229, Moca','809-555-0229','est229@gmail.com',29,'Activo'),
('Estudiante230','Morales Jiménez','Calle 230, Cotuí','809-555-0230','est230@gmail.com',30,'Inactivo'),
('Estudiante231','García Pérez','Calle 231, Santo Domingo','809-555-0231','est231@gmail.com',31,'Activo'),
('Estudiante232','Rodríguez López','Calle 232, Santiago','809-555-0232','est232@gmail.com',32,'Activo'),
('Estudiante233','Martínez Díaz','Calle 233, La Vega','809-555-0233','est233@gmail.com',33,'Activo'),
('Estudiante234','Hernández Ruiz','Calle 234, San Cristóbal','809-555-0234','est234@gmail.com',34,'Inactivo'),
('Estudiante235','Torres Santos','Calle 235, Higüey','809-555-0235','est235@gmail.com',35,'Graduado'),
('Estudiante236','Ramírez Castillo','Calle 236, Bonao','809-555-0236','est236@gmail.com',36,'Suspendido'),
('Estudiante237','Flores Méndez','Calle 237, Baní','809-555-0237','est237@gmail.com',37,'Activo'),
('Estudiante238','Rivera Ortiz','Calle 238, Azua','809-555-0238','est238@gmail.com',38,'Activo'),
('Estudiante239','Gómez Navarro','Calle 239, Moca','809-555-0239','est239@gmail.com',39,'Activo'),
('Estudiante240','Morales Jiménez','Calle 240, Cotuí','809-555-0240','est240@gmail.com',40,'Inactivo'),
('Estudiante241','García Pérez','Calle 241, Santo Domingo','809-555-0241','est241@gmail.com',41,'Activo'),
('Estudiante242','Rodríguez López','Calle 242, Santiago','809-555-0242','est242@gmail.com',42,'Activo'),
('Estudiante243','Martínez Díaz','Calle 243, La Vega','809-555-0243','est243@gmail.com',43,'Activo'),
('Estudiante244','Hernández Ruiz','Calle 244, San Cristóbal','809-555-0244','est244@gmail.com',44,'Inactivo'),
('Estudiante245','Torres Santos','Calle 245, Higüey','809-555-0245','est245@gmail.com',45,'Graduado'),
('Estudiante246','Ramírez Castillo','Calle 246, Bonao','809-555-0246','est246@gmail.com',46,'Suspendido'),
('Estudiante247','Flores Méndez','Calle 247, Baní','809-555-0247','est247@gmail.com',47,'Activo'),
('Estudiante248','Rivera Ortiz','Calle 248, Azua','809-555-0248','est248@gmail.com',48,'Activo'),
('Estudiante249','Gómez Navarro','Calle 249, Moca','809-555-0249','est249@gmail.com',49,'Activo'),
('Estudiante250','Morales Jiménez','Calle 250, Cotuí','809-555-0250','est250@gmail.com',50,'Inactivo');

INSERT INTO Estudiante (Nombre, Apellidos, Direccion, Telefono, Email, id_Area_Tecnica, Estado) VALUES
('Estudiante251','García Pérez','Calle 251, Santo Domingo','809-555-0251','est251@gmail.com',51,'Activo'),
('Estudiante252','Rodríguez López','Calle 252, Santiago','809-555-0252','est252@gmail.com',52,'Activo'),
('Estudiante253','Martínez Díaz','Calle 253, La Vega','809-555-0253','est253@gmail.com',53,'Activo'),
('Estudiante254','Hernández Ruiz','Calle 254, San Cristóbal','809-555-0254','est254@gmail.com',54,'Inactivo'),
('Estudiante255','Torres Santos','Calle 255, Higüey','809-555-0255','est255@gmail.com',55,'Graduado'),
('Estudiante256','Ramírez Castillo','Calle 256, Bonao','809-555-0256','est256@gmail.com',56,'Suspendido'),
('Estudiante257','Flores Méndez','Calle 257, Baní','809-555-0257','est257@gmail.com',57,'Activo'),
('Estudiante258','Rivera Ortiz','Calle 258, Azua','809-555-0258','est258@gmail.com',58,'Activo'),
('Estudiante259','Gómez Navarro','Calle 259, Moca','809-555-0259','est259@gmail.com',59,'Activo'),
('Estudiante260','Morales Jiménez','Calle 260, Cotuí','809-555-0260','est260@gmail.com',60,'Inactivo'),
('Estudiante261','García Pérez','Calle 261, Santo Domingo','809-555-0261','est261@gmail.com',61,'Activo'),
('Estudiante262','Rodríguez López','Calle 262, Santiago','809-555-0262','est262@gmail.com',62,'Activo'),
('Estudiante263','Martínez Díaz','Calle 263, La Vega','809-555-0263','est263@gmail.com',63,'Activo'),
('Estudiante264','Hernández Ruiz','Calle 264, San Cristóbal','809-555-0264','est264@gmail.com',64,'Inactivo'),
('Estudiante265','Torres Santos','Calle 265, Higüey','809-555-0265','est265@gmail.com',65,'Graduado'),
('Estudiante266','Ramírez Castillo','Calle 266, Bonao','809-555-0266','est266@gmail.com',66,'Suspendido'),
('Estudiante267','Flores Méndez','Calle 267, Baní','809-555-0267','est267@gmail.com',67,'Activo'),
('Estudiante268','Rivera Ortiz','Calle 268, Azua','809-555-0268','est268@gmail.com',68,'Activo'),
('Estudiante269','Gómez Navarro','Calle 269, Moca','809-555-0269','est269@gmail.com',69,'Activo'),
('Estudiante270','Morales Jiménez','Calle 270, Cotuí','809-555-0270','est270@gmail.com',70,'Inactivo'),
('Estudiante271','García Pérez','Calle 271, Santo Domingo','809-555-0271','est271@gmail.com',71,'Activo'),
('Estudiante272','Rodríguez López','Calle 272, Santiago','809-555-0272','est272@gmail.com',72,'Activo'),
('Estudiante273','Martínez Díaz','Calle 273, La Vega','809-555-0273','est273@gmail.com',73,'Activo'),
('Estudiante274','Hernández Ruiz','Calle 274, San Cristóbal','809-555-0274','est274@gmail.com',74,'Inactivo'),
('Estudiante275','Torres Santos','Calle 275, Higüey','809-555-0275','est275@gmail.com',75,'Graduado'),
('Estudiante276','Ramírez Castillo','Calle 276, Bonao','809-555-0276','est276@gmail.com',76,'Suspendido'),
('Estudiante277','Flores Méndez','Calle 277, Baní','809-555-0277','est277@gmail.com',77,'Activo'),
('Estudiante278','Rivera Ortiz','Calle 278, Azua','809-555-0278','est278@gmail.com',78,'Activo'),
('Estudiante279','Gómez Navarro','Calle 279, Moca','809-555-0279','est279@gmail.com',79,'Activo'),
('Estudiante280','Morales Jiménez','Calle 280, Cotuí','809-555-0280','est280@gmail.com',80,'Inactivo'),
('Estudiante281','García Pérez','Calle 281, Santo Domingo','809-555-0281','est281@gmail.com',81,'Activo'),
('Estudiante282','Rodríguez López','Calle 282, Santiago','809-555-0282','est282@gmail.com',82,'Activo'),
('Estudiante283','Martínez Díaz','Calle 283, La Vega','809-555-0283','est283@gmail.com',83,'Activo'),
('Estudiante284','Hernández Ruiz','Calle 284, San Cristóbal','809-555-0284','est284@gmail.com',84,'Inactivo'),
('Estudiante285','Torres Santos','Calle 285, Higüey','809-555-0285','est285@gmail.com',85,'Graduado'),
('Estudiante286','Ramírez Castillo','Calle 286, Bonao','809-555-0286','est286@gmail.com',86,'Suspendido'),
('Estudiante287','Flores Méndez','Calle 287, Baní','809-555-0287','est287@gmail.com',87,'Activo'),
('Estudiante288','Rivera Ortiz','Calle 288, Azua','809-555-0288','est288@gmail.com',88,'Activo'),
('Estudiante289','Gómez Navarro','Calle 289, Moca','809-555-0289','est289@gmail.com',89,'Activo'),
('Estudiante290','Morales Jiménez','Calle 290, Cotuí','809-555-0290','est290@gmail.com',90,'Inactivo'),
('Estudiante291','García Pérez','Calle 291, Santo Domingo','809-555-0291','est291@gmail.com',91,'Activo'),
('Estudiante292','Rodríguez López','Calle 292, Santiago','809-555-0292','est292@gmail.com',92,'Activo'),
('Estudiante293','Martínez Díaz','Calle 293, La Vega','809-555-0293','est293@gmail.com',93,'Activo'),
('Estudiante294','Hernández Ruiz','Calle 294, San Cristóbal','809-555-0294','est294@gmail.com',94,'Inactivo'),
('Estudiante295','Torres Santos','Calle 295, Higüey','809-555-0295','est295@gmail.com',95,'Graduado'),
('Estudiante296','Ramírez Castillo','Calle 296, Bonao','809-555-0296','est296@gmail.com',96,'Suspendido'),
('Estudiante297','Flores Méndez','Calle 297, Baní','809-555-0297','est297@gmail.com',97,'Activo'),
('Estudiante298','Rivera Ortiz','Calle 298, Azua','809-555-0298','est298@gmail.com',98,'Activo'),
('Estudiante299','Gómez Navarro','Calle 299, Moca','809-555-0299','est299@gmail.com',99,'Activo'),
('Estudiante300','Morales Jiménez','Calle 300, Cotuí','809-555-0300','est300@gmail.com',100,'Inactivo');

INSERT INTO Estudiante (Nombre, Apellidos, Direccion, Telefono, Email, id_Area_Tecnica, Estado) VALUES
('Estudiante301','García Pérez','Calle 301, Santo Domingo','809-555-0301','est301@gmail.com',1,'Activo'),
('Estudiante302','Rodríguez López','Calle 302, Santiago','809-555-0302','est302@gmail.com',2,'Activo'),
('Estudiante303','Martínez Díaz','Calle 303, La Vega','809-555-0303','est303@gmail.com',3,'Activo'),
('Estudiante304','Hernández Ruiz','Calle 304, San Cristóbal','809-555-0304','est304@gmail.com',4,'Inactivo'),
('Estudiante305','Torres Santos','Calle 305, Higüey','809-555-0305','est305@gmail.com',5,'Graduado'),
('Estudiante306','Ramírez Castillo','Calle 306, Bonao','809-555-0306','est306@gmail.com',6,'Suspendido'),
('Estudiante307','Flores Méndez','Calle 307, Baní','809-555-0307','est307@gmail.com',7,'Activo'),
('Estudiante308','Rivera Ortiz','Calle 308, Azua','809-555-0308','est308@gmail.com',8,'Activo'),
('Estudiante309','Gómez Navarro','Calle 309, Moca','809-555-0309','est309@gmail.com',9,'Activo'),
('Estudiante310','Morales Jiménez','Calle 310, Cotuí','809-555-0310','est310@gmail.com',10,'Inactivo'),
('Estudiante311','García Pérez','Calle 311, Santo Domingo','809-555-0311','est311@gmail.com',11,'Activo'),
('Estudiante312','Rodríguez López','Calle 312, Santiago','809-555-0312','est312@gmail.com',12,'Activo'),
('Estudiante313','Martínez Díaz','Calle 313, La Vega','809-555-0313','est313@gmail.com',13,'Activo'),
('Estudiante314','Hernández Ruiz','Calle 314, San Cristóbal','809-555-0314','est314@gmail.com',14,'Inactivo'),
('Estudiante315','Torres Santos','Calle 315, Higüey','809-555-0315','est315@gmail.com',15,'Graduado'),
('Estudiante316','Ramírez Castillo','Calle 316, Bonao','809-555-0316','est316@gmail.com',16,'Suspendido'),
('Estudiante317','Flores Méndez','Calle 317, Baní','809-555-0317','est317@gmail.com',17,'Activo'),
('Estudiante318','Rivera Ortiz','Calle 318, Azua','809-555-0318','est318@gmail.com',18,'Activo'),
('Estudiante319','Gómez Navarro','Calle 319, Moca','809-555-0319','est319@gmail.com',19,'Activo'),
('Estudiante320','Morales Jiménez','Calle 320, Cotuí','809-555-0320','est320@gmail.com',20,'Inactivo'),
('Estudiante321','García Pérez','Calle 321, Santo Domingo','809-555-0321','est321@gmail.com',21,'Activo'),
('Estudiante322','Rodríguez López','Calle 322, Santiago','809-555-0322','est322@gmail.com',22,'Activo'),
('Estudiante323','Martínez Díaz','Calle 323, La Vega','809-555-0323','est323@gmail.com',23,'Activo'),
('Estudiante324','Hernández Ruiz','Calle 324, San Cristóbal','809-555-0324','est324@gmail.com',24,'Inactivo'),
('Estudiante325','Torres Santos','Calle 325, Higüey','809-555-0325','est325@gmail.com',25,'Graduado'),
('Estudiante326','Ramírez Castillo','Calle 326, Bonao','809-555-0326','est326@gmail.com',26,'Suspendido'),
('Estudiante327','Flores Méndez','Calle 327, Baní','809-555-0327','est327@gmail.com',27,'Activo'),
('Estudiante328','Rivera Ortiz','Calle 328, Azua','809-555-0328','est328@gmail.com',28,'Activo'),
('Estudiante329','Gómez Navarro','Calle 329, Moca','809-555-0329','est329@gmail.com',29,'Activo'),
('Estudiante330','Morales Jiménez','Calle 330, Cotuí','809-555-0330','est330@gmail.com',30,'Inactivo'),
('Estudiante331','García Pérez','Calle 331, Santo Domingo','809-555-0331','est331@gmail.com',31,'Activo'),
('Estudiante332','Rodríguez López','Calle 332, Santiago','809-555-0332','est332@gmail.com',32,'Activo'),
('Estudiante333','Martínez Díaz','Calle 333, La Vega','809-555-0333','est333@gmail.com',33,'Activo'),
('Estudiante334','Hernández Ruiz','Calle 334, San Cristóbal','809-555-0334','est334@gmail.com',34,'Inactivo'),
('Estudiante335','Torres Santos','Calle 335, Higüey','809-555-0335','est335@gmail.com',35,'Graduado'),
('Estudiante336','Ramírez Castillo','Calle 336, Bonao','809-555-0336','est336@gmail.com',36,'Suspendido'),
('Estudiante337','Flores Méndez','Calle 337, Baní','809-555-0337','est337@gmail.com',37,'Activo'),
('Estudiante338','Rivera Ortiz','Calle 338, Azua','809-555-0338','est338@gmail.com',38,'Activo'),
('Estudiante339','Gómez Navarro','Calle 339, Moca','809-555-0339','est339@gmail.com',39,'Activo'),
('Estudiante340','Morales Jiménez','Calle 340, Cotuí','809-555-0340','est340@gmail.com',40,'Inactivo'),
('Estudiante341','García Pérez','Calle 341, Santo Domingo','809-555-0341','est341@gmail.com',41,'Activo'),
('Estudiante342','Rodríguez López','Calle 342, Santiago','809-555-0342','est342@gmail.com',42,'Activo'),
('Estudiante343','Martínez Díaz','Calle 343, La Vega','809-555-0343','est343@gmail.com',43,'Activo'),
('Estudiante344','Hernández Ruiz','Calle 344, San Cristóbal','809-555-0344','est344@gmail.com',44,'Inactivo'),
('Estudiante345','Torres Santos','Calle 345, Higüey','809-555-0345','est345@gmail.com',45,'Graduado'),
('Estudiante346','Ramírez Castillo','Calle 346, Bonao','809-555-0346','est346@gmail.com',46,'Suspendido'),
('Estudiante347','Flores Méndez','Calle 347, Baní','809-555-0347','est347@gmail.com',47,'Activo'),
('Estudiante348','Rivera Ortiz','Calle 348, Azua','809-555-0348','est348@gmail.com',48,'Activo'),
('Estudiante349','Gómez Navarro','Calle 349, Moca','809-555-0349','est349@gmail.com',49,'Activo'),
('Estudiante350','Morales Jiménez','Calle 350, Cotuí','809-555-0350','est350@gmail.com',50,'Inactivo');

INSERT INTO Estudiante (Nombre, Apellidos, Direccion, Telefono, Email, id_Area_Tecnica, Estado) VALUES
('Estudiante351','García Pérez','Calle 351, Santo Domingo','809-555-0351','est351@gmail.com',51,'Activo'),
('Estudiante352','Rodríguez López','Calle 352, Santiago','809-555-0352','est352@gmail.com',52,'Activo'),
('Estudiante353','Martínez Díaz','Calle 353, La Vega','809-555-0353','est353@gmail.com',53,'Activo'),
('Estudiante354','Hernández Ruiz','Calle 354, San Cristóbal','809-555-0354','est354@gmail.com',54,'Inactivo'),
('Estudiante355','Torres Santos','Calle 355, Higüey','809-555-0355','est355@gmail.com',55,'Graduado'),
('Estudiante356','Ramírez Castillo','Calle 356, Bonao','809-555-0356','est356@gmail.com',56,'Suspendido'),
('Estudiante357','Flores Méndez','Calle 357, Baní','809-555-0357','est357@gmail.com',57,'Activo'),
('Estudiante358','Rivera Ortiz','Calle 358, Azua','809-555-0358','est358@gmail.com',58,'Activo'),
('Estudiante359','Gómez Navarro','Calle 359, Moca','809-555-0359','est359@gmail.com',59,'Activo'),
('Estudiante360','Morales Jiménez','Calle 360, Cotuí','809-555-0360','est360@gmail.com',60,'Inactivo'),
('Estudiante361','García Pérez','Calle 361, Santo Domingo','809-555-0361','est361@gmail.com',61,'Activo'),
('Estudiante362','Rodríguez López','Calle 362, Santiago','809-555-0362','est362@gmail.com',62,'Activo'),
('Estudiante363','Martínez Díaz','Calle 363, La Vega','809-555-0363','est363@gmail.com',63,'Activo'),
('Estudiante364','Hernández Ruiz','Calle 364, San Cristóbal','809-555-0364','est364@gmail.com',64,'Inactivo'),
('Estudiante365','Torres Santos','Calle 365, Higüey','809-555-0365','est365@gmail.com',65,'Graduado'),
('Estudiante366','Ramírez Castillo','Calle 366, Bonao','809-555-0366','est366@gmail.com',66,'Suspendido'),
('Estudiante367','Flores Méndez','Calle 367, Baní','809-555-0367','est367@gmail.com',67,'Activo'),
('Estudiante368','Rivera Ortiz','Calle 368, Azua','809-555-0368','est368@gmail.com',68,'Activo'),
('Estudiante369','Gómez Navarro','Calle 369, Moca','809-555-0369','est369@gmail.com',69,'Activo'),
('Estudiante370','Morales Jiménez','Calle 370, Cotuí','809-555-0370','est370@gmail.com',70,'Inactivo'),
('Estudiante371','García Pérez','Calle 371, Santo Domingo','809-555-0371','est371@gmail.com',71,'Activo'),
('Estudiante372','Rodríguez López','Calle 372, Santiago','809-555-0372','est372@gmail.com',72,'Activo'),
('Estudiante373','Martínez Díaz','Calle 373, La Vega','809-555-0373','est373@gmail.com',73,'Activo'),
('Estudiante374','Hernández Ruiz','Calle 374, San Cristóbal','809-555-0374','est374@gmail.com',74,'Inactivo'),
('Estudiante375','Torres Santos','Calle 375, Higüey','809-555-0375','est375@gmail.com',75,'Graduado'),
('Estudiante376','Ramírez Castillo','Calle 376, Bonao','809-555-0376','est376@gmail.com',76,'Suspendido'),
('Estudiante377','Flores Méndez','Calle 377, Baní','809-555-0377','est377@gmail.com',77,'Activo'),
('Estudiante378','Rivera Ortiz','Calle 378, Azua','809-555-0378','est378@gmail.com',78,'Activo'),
('Estudiante379','Gómez Navarro','Calle 379, Moca','809-555-0379','est379@gmail.com',79,'Activo'),
('Estudiante380','Morales Jiménez','Calle 380, Cotuí','809-555-0380','est380@gmail.com',80,'Inactivo'),
('Estudiante381','García Pérez','Calle 381, Santo Domingo','809-555-0381','est381@gmail.com',81,'Activo'),
('Estudiante382','Rodríguez López','Calle 382, Santiago','809-555-0382','est382@gmail.com',82,'Activo'),
('Estudiante383','Martínez Díaz','Calle 383, La Vega','809-555-0383','est383@gmail.com',83,'Activo'),
('Estudiante384','Hernández Ruiz','Calle 384, San Cristóbal','809-555-0384','est384@gmail.com',84,'Inactivo'),
('Estudiante385','Torres Santos','Calle 385, Higüey','809-555-0385','est385@gmail.com',85,'Graduado'),
('Estudiante386','Ramírez Castillo','Calle 386, Bonao','809-555-0386','est386@gmail.com',86,'Suspendido'),
('Estudiante387','Flores Méndez','Calle 387, Baní','809-555-0387','est387@gmail.com',87,'Activo'),
('Estudiante388','Rivera Ortiz','Calle 388, Azua','809-555-0388','est388@gmail.com',88,'Activo'),
('Estudiante389','Gómez Navarro','Calle 389, Moca','809-555-0389','est389@gmail.com',89,'Activo'),
('Estudiante390','Morales Jiménez','Calle 390, Cotuí','809-555-0390','est390@gmail.com',90,'Inactivo'),
('Estudiante391','García Pérez','Calle 391, Santo Domingo','809-555-0391','est391@gmail.com',91,'Activo'),
('Estudiante392','Rodríguez López','Calle 392, Santiago','809-555-0392','est392@gmail.com',92,'Activo'),
('Estudiante393','Martínez Díaz','Calle 393, La Vega','809-555-0393','est393@gmail.com',93,'Activo'),
('Estudiante394','Hernández Ruiz','Calle 394, San Cristóbal','809-555-0394','est394@gmail.com',94,'Inactivo'),
('Estudiante395','Torres Santos','Calle 395, Higüey','809-555-0395','est395@gmail.com',95,'Graduado'),
('Estudiante396','Ramírez Castillo','Calle 396, Bonao','809-555-0396','est396@gmail.com',96,'Suspendido'),
('Estudiante397','Flores Méndez','Calle 397, Baní','809-555-0397','est397@gmail.com',97,'Activo'),
('Estudiante398','Rivera Ortiz','Calle 398, Azua','809-555-0398','est398@gmail.com',98,'Activo'),
('Estudiante399','Gómez Navarro','Calle 399, Moca','809-555-0399','est399@gmail.com',99,'Activo'),
('Estudiante400','Morales Jiménez','Calle 400, Cotuí','809-555-0400','est400@gmail.com',100,'Inactivo');

INSERT INTO Estudiante (Nombre, Apellidos, Direccion, Telefono, Email, id_Area_Tecnica, Estado) VALUES
('Estudiante401','García Pérez','Calle 401, Santo Domingo','809-555-0401','est401@gmail.com',1,'Activo'),
('Estudiante402','Rodríguez López','Calle 402, Santiago','809-555-0402','est402@gmail.com',2,'Activo'),
('Estudiante403','Martínez Díaz','Calle 403, La Vega','809-555-0403','est403@gmail.com',3,'Activo'),
('Estudiante404','Hernández Ruiz','Calle 404, San Cristóbal','809-555-0404','est404@gmail.com',4,'Inactivo'),
('Estudiante405','Torres Santos','Calle 405, Higüey','809-555-0405','est405@gmail.com',5,'Graduado'),
('Estudiante406','Ramírez Castillo','Calle 406, Bonao','809-555-0406','est406@gmail.com',6,'Suspendido'),
('Estudiante407','Flores Méndez','Calle 407, Baní','809-555-0407','est407@gmail.com',7,'Activo'),
('Estudiante408','Rivera Ortiz','Calle 408, Azua','809-555-0408','est408@gmail.com',8,'Activo'),
('Estudiante409','Gómez Navarro','Calle 409, Moca','809-555-0409','est409@gmail.com',9,'Activo'),
('Estudiante410','Morales Jiménez','Calle 410, Cotuí','809-555-0410','est410@gmail.com',10,'Inactivo'),
('Estudiante411','García Pérez','Calle 411, Santo Domingo','809-555-0411','est411@gmail.com',11,'Activo'),
('Estudiante412','Rodríguez López','Calle 412, Santiago','809-555-0412','est412@gmail.com',12,'Activo'),
('Estudiante413','Martínez Díaz','Calle 413, La Vega','809-555-0413','est413@gmail.com',13,'Activo'),
('Estudiante414','Hernández Ruiz','Calle 414, San Cristóbal','809-555-0414','est414@gmail.com',14,'Inactivo'),
('Estudiante415','Torres Santos','Calle 415, Higüey','809-555-0415','est415@gmail.com',15,'Graduado'),
('Estudiante416','Ramírez Castillo','Calle 416, Bonao','809-555-0416','est416@gmail.com',16,'Suspendido'),
('Estudiante417','Flores Méndez','Calle 417, Baní','809-555-0417','est417@gmail.com',17,'Activo'),
('Estudiante418','Rivera Ortiz','Calle 418, Azua','809-555-0418','est418@gmail.com',18,'Activo'),
('Estudiante419','Gómez Navarro','Calle 419, Moca','809-555-0419','est419@gmail.com',19,'Activo'),
('Estudiante420','Morales Jiménez','Calle 420, Cotuí','809-555-0420','est420@gmail.com',20,'Inactivo'),
('Estudiante421','García Pérez','Calle 421, Santo Domingo','809-555-0421','est421@gmail.com',21,'Activo'),
('Estudiante422','Rodríguez López','Calle 422, Santiago','809-555-0422','est422@gmail.com',22,'Activo'),
('Estudiante423','Martínez Díaz','Calle 423, La Vega','809-555-0423','est423@gmail.com',23,'Activo'),
('Estudiante424','Hernández Ruiz','Calle 424, San Cristóbal','809-555-0424','est424@gmail.com',24,'Inactivo'),
('Estudiante425','Torres Santos','Calle 425, Higüey','809-555-0425','est425@gmail.com',25,'Graduado'),
('Estudiante426','Ramírez Castillo','Calle 426, Bonao','809-555-0426','est426@gmail.com',26,'Suspendido'),
('Estudiante427','Flores Méndez','Calle 427, Baní','809-555-0427','est427@gmail.com',27,'Activo'),
('Estudiante428','Rivera Ortiz','Calle 428, Azua','809-555-0428','est428@gmail.com',28,'Activo'),
('Estudiante429','Gómez Navarro','Calle 429, Moca','809-555-0429','est429@gmail.com',29,'Activo'),
('Estudiante430','Morales Jiménez','Calle 430, Cotuí','809-555-0430','est430@gmail.com',30,'Inactivo'),
('Estudiante431','García Pérez','Calle 431, Santo Domingo','809-555-0431','est431@gmail.com',31,'Activo'),
('Estudiante432','Rodríguez López','Calle 432, Santiago','809-555-0432','est432@gmail.com',32,'Activo'),
('Estudiante433','Martínez Díaz','Calle 433, La Vega','809-555-0433','est433@gmail.com',33,'Activo'),
('Estudiante434','Hernández Ruiz','Calle 434, San Cristóbal','809-555-0434','est434@gmail.com',34,'Inactivo'),
('Estudiante435','Torres Santos','Calle 435, Higüey','809-555-0435','est435@gmail.com',35,'Graduado'),
('Estudiante436','Ramírez Castillo','Calle 436, Bonao','809-555-0436','est436@gmail.com',36,'Suspendido'),
('Estudiante437','Flores Méndez','Calle 437, Baní','809-555-0437','est437@gmail.com',37,'Activo'),
('Estudiante438','Rivera Ortiz','Calle 438, Azua','809-555-0438','est438@gmail.com',38,'Activo'),
('Estudiante439','Gómez Navarro','Calle 439, Moca','809-555-0439','est439@gmail.com',39,'Activo'),
('Estudiante440','Morales Jiménez','Calle 440, Cotuí','809-555-0440','est440@gmail.com',40,'Inactivo'),
('Estudiante441','García Pérez','Calle 441, Santo Domingo','809-555-0441','est441@gmail.com',41,'Activo'),
('Estudiante442','Rodríguez López','Calle 442, Santiago','809-555-0442','est442@gmail.com',42,'Activo'),
('Estudiante443','Martínez Díaz','Calle 443, La Vega','809-555-0443','est443@gmail.com',43,'Activo'),
('Estudiante444','Hernández Ruiz','Calle 444, San Cristóbal','809-555-0444','est444@gmail.com',44,'Inactivo'),
('Estudiante445','Torres Santos','Calle 445, Higüey','809-555-0445','est445@gmail.com',45,'Graduado'),
('Estudiante446','Ramírez Castillo','Calle 446, Bonao','809-555-0446','est446@gmail.com',46,'Suspendido'),
('Estudiante447','Flores Méndez','Calle 447, Baní','809-555-0447','est447@gmail.com',47,'Activo'),
('Estudiante448','Rivera Ortiz','Calle 448, Azua','809-555-0448','est448@gmail.com',48,'Activo'),
('Estudiante449','Gómez Navarro','Calle 449, Moca','809-555-0449','est449@gmail.com',49,'Activo'),
('Estudiante450','Morales Jiménez','Calle 450, Cotuí','809-555-0450','est450@gmail.com',50,'Inactivo');

INSERT INTO Estudiante (Nombre, Apellidos, Direccion, Telefono, Email, id_Area_Tecnica, Estado) VALUES
('Estudiante451','García Pérez','Calle 451, Santo Domingo','809-555-0451','est451@gmail.com',51,'Activo'),
('Estudiante452','Rodríguez López','Calle 452, Santiago','809-555-0452','est452@gmail.com',52,'Activo'),
('Estudiante453','Martínez Díaz','Calle 453, La Vega','809-555-0453','est453@gmail.com',53,'Activo'),
('Estudiante454','Hernández Ruiz','Calle 454, San Cristóbal','809-555-0454','est454@gmail.com',54,'Inactivo'),
('Estudiante455','Torres Santos','Calle 455, Higüey','809-555-0455','est455@gmail.com',55,'Graduado'),
('Estudiante456','Ramírez Castillo','Calle 456, Bonao','809-555-0456','est456@gmail.com',56,'Suspendido'),
('Estudiante457','Flores Méndez','Calle 457, Baní','809-555-0457','est457@gmail.com',57,'Activo'),
('Estudiante458','Rivera Ortiz','Calle 458, Azua','809-555-0458','est458@gmail.com',58,'Activo'),
('Estudiante459','Gómez Navarro','Calle 459, Moca','809-555-0459','est459@gmail.com',59,'Activo'),
('Estudiante460','Morales Jiménez','Calle 460, Cotuí','809-555-0460','est460@gmail.com',60,'Inactivo'),
('Estudiante461','García Pérez','Calle 461, Santo Domingo','809-555-0461','est461@gmail.com',61,'Activo'),
('Estudiante462','Rodríguez López','Calle 462, Santiago','809-555-0462','est462@gmail.com',62,'Activo'),
('Estudiante463','Martínez Díaz','Calle 463, La Vega','809-555-0463','est463@gmail.com',63,'Activo'),
('Estudiante464','Hernández Ruiz','Calle 464, San Cristóbal','809-555-0464','est464@gmail.com',64,'Inactivo'),
('Estudiante465','Torres Santos','Calle 465, Higüey','809-555-0465','est465@gmail.com',65,'Graduado'),
('Estudiante466','Ramírez Castillo','Calle 466, Bonao','809-555-0466','est466@gmail.com',66,'Suspendido'),
('Estudiante467','Flores Méndez','Calle 467, Baní','809-555-0467','est467@gmail.com',67,'Activo'),
('Estudiante468','Rivera Ortiz','Calle 468, Azua','809-555-0468','est468@gmail.com',68,'Activo'),
('Estudiante469','Gómez Navarro','Calle 469, Moca','809-555-0469','est469@gmail.com',69,'Activo'),
('Estudiante470','Morales Jiménez','Calle 470, Cotuí','809-555-0470','est470@gmail.com',70,'Inactivo'),
('Estudiante471','García Pérez','Calle 471, Santo Domingo','809-555-0471','est471@gmail.com',71,'Activo'),
('Estudiante472','Rodríguez López','Calle 472, Santiago','809-555-0472','est472@gmail.com',72,'Activo'),
('Estudiante473','Martínez Díaz','Calle 473, La Vega','809-555-0473','est473@gmail.com',73,'Activo'),
('Estudiante474','Hernández Ruiz','Calle 474, San Cristóbal','809-555-0474','est474@gmail.com',74,'Inactivo'),
('Estudiante475','Torres Santos','Calle 475, Higüey','809-555-0475','est475@gmail.com',75,'Graduado'),
('Estudiante476','Ramírez Castillo','Calle 476, Bonao','809-555-0476','est476@gmail.com',76,'Suspendido'),
('Estudiante477','Flores Méndez','Calle 477, Baní','809-555-0477','est477@gmail.com',77,'Activo'),
('Estudiante478','Rivera Ortiz','Calle 478, Azua','809-555-0478','est478@gmail.com',78,'Activo'),
('Estudiante479','Gómez Navarro','Calle 479, Moca','809-555-0479','est479@gmail.com',79,'Activo'),
('Estudiante480','Morales Jiménez','Calle 480, Cotuí','809-555-0480','est480@gmail.com',80,'Inactivo'),
('Estudiante481','García Pérez','Calle 481, Santo Domingo','809-555-0481','est481@gmail.com',81,'Activo'),
('Estudiante482','Rodríguez López','Calle 482, Santiago','809-555-0482','est482@gmail.com',82,'Activo'),
('Estudiante483','Martínez Díaz','Calle 483, La Vega','809-555-0483','est483@gmail.com',83,'Activo'),
('Estudiante484','Hernández Ruiz','Calle 484, San Cristóbal','809-555-0484','est484@gmail.com',84,'Inactivo'),
('Estudiante485','Torres Santos','Calle 485, Higüey','809-555-0485','est485@gmail.com',85,'Graduado'),
('Estudiante486','Ramírez Castillo','Calle 486, Bonao','809-555-0486','est486@gmail.com',86,'Suspendido'),
('Estudiante487','Flores Méndez','Calle 487, Baní','809-555-0487','est487@gmail.com',87,'Activo'),
('Estudiante488','Rivera Ortiz','Calle 488, Azua','809-555-0488','est488@gmail.com',88,'Activo'),
('Estudiante489','Gómez Navarro','Calle 489, Moca','809-555-0489','est489@gmail.com',89,'Activo'),
('Estudiante490','Morales Jiménez','Calle 490, Cotuí','809-555-0490','est490@gmail.com',90,'Inactivo'),
('Estudiante491','García Pérez','Calle 491, Santo Domingo','809-555-0491','est491@gmail.com',91,'Activo'),
('Estudiante492','Rodríguez López','Calle 492, Santiago','809-555-0492','est492@gmail.com',92,'Activo'),
('Estudiante493','Martínez Díaz','Calle 493, La Vega','809-555-0493','est493@gmail.com',93,'Activo'),
('Estudiante494','Hernández Ruiz','Calle 494, San Cristóbal','809-555-0494','est494@gmail.com',94,'Inactivo'),
('Estudiante495','Torres Santos','Calle 495, Higüey','809-555-0495','est495@gmail.com',95,'Graduado'),
('Estudiante496','Ramírez Castillo','Calle 496, Bonao','809-555-0496','est496@gmail.com',96,'Suspendido'),
('Estudiante497','Flores Méndez','Calle 497, Baní','809-555-0497','est497@gmail.com',97,'Activo'),
('Estudiante498','Rivera Ortiz','Calle 498, Azua','809-555-0498','est498@gmail.com',98,'Activo'),
('Estudiante499','Gómez Navarro','Calle 499, Moca','809-555-0499','est499@gmail.com',99,'Activo'),
('Estudiante500','Morales Jiménez','Calle 500, Cotuí','809-555-0500','est500@gmail.com',100,'Inactivo');

select * from Estudiante;
go

-- Estudiantes
IF OBJECT_ID('sp_listar_estudiantes', 'P') IS NOT NULL
    DROP PROCEDURE sp_listar_estudiantes;
GO

IF OBJECT_ID('sp_insertar_estudiante', 'P') IS NOT NULL
    DROP PROCEDURE sp_insertar_estudiante;
GO

IF OBJECT_ID('sp_editar_estudiante', 'P') IS NOT NULL
    DROP PROCEDURE sp_editar_estudiante;
GO

IF OBJECT_ID('sp_eliminar_estudiante', 'P') IS NOT NULL
    DROP PROCEDURE sp_eliminar_estudiante;
GO

-- Áreas técnicas
IF OBJECT_ID('sp_listar_areas', 'P') IS NOT NULL
    DROP PROCEDURE sp_listar_areas;
GO

CREATE PROCEDURE sp_listar_estudiantes
AS
BEGIN
    SELECT 
        e.id_Estudiante,
        e.Nombre,
        e.Apellidos,
        e.Direccion,
        e.Telefono,
        e.Email,
        a.Nombre_Area
    FROM Estudiante e
    INNER JOIN Area_Tecnica a 
        ON e.id_Area_Tecnica = a.id_Area_Tecnica
    WHERE e.Estado = 'Activo'
END

CREATE PROCEDURE sp_listar_estudiantes
AS
BEGIN
    SELECT 
        e.id_Estudiante,
        e.Nombre,
        e.Apellidos,
        e.Direccion,
        e.Telefono,
        e.Email,
        a.Nombre_Area
    FROM Estudiante e
    INNER JOIN Area_Tecnica a 
        ON e.id_Area_Tecnica = a.id_Area_Tecnica
    WHERE e.Estado = 'Activo'
END

CREATE PROCEDURE sp_insertar_estudiante
(
    @Nombre NVARCHAR(100),
    @Apellidos NVARCHAR(100),
    @Direccion NVARCHAR(150),
    @Telefono NVARCHAR(20),
    @Email NVARCHAR(100),
    @id_Area_Tecnica INT
)
AS
BEGIN
    INSERT INTO Estudiante
    (Nombre, Apellidos, Direccion, Telefono, Email, id_Area_Tecnica, Estado)
    VALUES
    (@Nombre, @Apellidos, @Direccion, @Telefono, @Email, @id_Area_Tecnica, 'Activo')
END

CREATE PROCEDURE sp_editar_estudiante
(
    @id_Estudiante INT,
    @Nombre NVARCHAR(100),
    @Apellidos NVARCHAR(100),
    @Direccion NVARCHAR(150),
    @Telefono NVARCHAR(20),
    @Email NVARCHAR(100),
    @id_Area_Tecnica INT
)
AS
BEGIN
    UPDATE Estudiante
    SET 
        Nombre = @Nombre,
        Apellidos = @Apellidos,
        Direccion = @Direccion,
        Telefono = @Telefono,
        Email = @Email,
        id_Area_Tecnica = @id_Area_Tecnica
    WHERE id_Estudiante = @id_Estudiante
END
GO

CREATE PROCEDURE sp_eliminar_estudiante
(
    @id_Estudiante INT
)
AS
BEGIN
    UPDATE Estudiante
    SET Estado = 'Inactivo'
    WHERE id_Estudiante = @id_Estudiante;
END
GO
    
    CREATE PROCEDURE sp_listar_areas
AS
BEGIN
    SELECT 
        id_Area_Tecnica,
        Nombre_Area
    FROM Area_Tecnica;
END;

exec sp_listar_areas;

DROP PROCEDURE IF EXISTS sp_listar_areas;

DROP PROCEDURE IF EXISTS sp_buscar_estudiantes;

CREATE PROCEDURE sp_buscar_estudiantes
(
    @texto NVARCHAR(100)
)
AS
BEGIN
    SELECT 
        e.id_Estudiante,
        e.Nombre,
        e.Apellidos,
        e.Direccion,
        e.Telefono,
        e.Email,
        a.Nombre_Area
    FROM Estudiante e
    INNER JOIN Area_Tecnica a
        ON e.id_Area_Tecnica = a.id_Area_Tecnica
    WHERE e.Estado = 'Activo'
      AND (
            e.Nombre LIKE '%' + @texto + '%'
         OR e.Apellidos LIKE '%' + @texto + '%'
      );
END;

CREATE OR ALTER PROCEDURE sp_listar_estudiantes
AS
BEGIN
    SELECT 
        e.id_Estudiante      AS id_Estudiante,
        e.Nombre             AS Nombre,
        e.Apellidos          AS Apellidos,
        e.Direccion          AS Direccion,
        e.Telefono           AS Telefono,
        e.Email              AS Email,
        a.Nombre_Area        AS Nombre_Area
    FROM Estudiante e
    INNER JOIN Area_Tecnica a
        ON e.id_Area_Tecnica = a.id_Area_Tecnica
END
GO

CREATE PROCEDURE sp_reporte_estudiantes
AS
BEGIN
    SELECT 
        E.id_Estudiante,
        E.Nombre,
        E.Apellidos,
        E.Direccion,
        E.Telefono,
        E.Email,
        A.Nombre_Area
    FROM Estudiante E
    INNER JOIN Area_Tecnica A
        ON E.id_Area_Tecnica = A.id_Area_Tecnica
END
GO

DROP TABLE IF EXISTS Profesor_Materia;
DROP TABLE IF EXISTS Profesor;
DROP TABLE IF EXISTS Materia;
GO

/* ================================
   CREAR TABLAS
================================ */
CREATE TABLE Profesor (
    id_profesor INT IDENTITY PRIMARY KEY,
    nombre_profesor VARCHAR(100) NOT NULL
);

CREATE TABLE Materia (
    id_materia INT IDENTITY PRIMARY KEY,
    nombre_materia VARCHAR(100) NOT NULL
);

CREATE TABLE Profesor_Materia (
    id_profesor_materia INT IDENTITY PRIMARY KEY,
    id_profesor INT NOT NULL,
    id_materia INT NOT NULL,
    FOREIGN KEY (id_profesor) REFERENCES Profesor(id_profesor),
    FOREIGN KEY (id_materia) REFERENCES Materia(id_materia)
);
GO

INSERT INTO Profesor (nombre_profesor) VALUES
('Juan Pérez'),
('Ana Gómez');

INSERT INTO Profesor (nombre_profesor) VALUES
('Juan Pérez'),
('Ana Gómez'),
('Carlos Rodríguez'),
('María Fernández'),
('Luis Martínez'),
('Carmen López'),
('José Sánchez'),
('Laura Ramírez'),
('Pedro Torres'),
('Marta Flores'),
('Andrés Morales'),
('Paula Herrera'),
('Ricardo Jiménez'),
('Diana Ortiz'),
('Fernando Cruz'),
('Gabriela Reyes'),
('Miguel Navarro'),
('Rosa Mendoza'),
('Daniel Castro'),
('Silvia Vargas'),
('Jorge Peña'),
('Natalia Rivas'),
('Héctor Guzmán'),
('Verónica Molina'),
('Raúl Cabrera'),
('Patricia Medina'),
('Alberto Salazar'),
('Claudia Pacheco'),
('Oscar León'),
('Adriana Soto'),
('Francisco Vega'),
('Beatriz Acosta'),
('Sergio Domínguez'),
('Lorena Núñez'),
('Iván Valdez'),
('Mónica Arroyo'),
('Eduardo Campos'),
('Yolanda Fuentes'),
('Roberto Cordero'),
('Isabel Mejía'),
('Manuel Figueroa'),
('Sofía Quintero'),
('Julio Benítez'),
('Paola Zamora'),
('Enrique Paredes'),
('Karla Bautista'),
('Hugo Villanueva'),
('Andrea Lira'),
('Felipe Carrillo'),
('Daniela Palacios'),
('Marcos Téllez'),
('Vanessa Castañeda'),
('Alejandro Luna'),
('Rocío Rocha'),
('Emilio Peralta'),
('Teresa Barrera'),
('Samuel Ibarra'),
('Lucía Calderón'),
('Cristian Montoya'),
('Elena Tapia'),
('Guillermo Aguirre'),
('Noelia Solís'),
('Renato Galindo'),
('Jessica Rosales'),
('Mauricio Olvera'),
('Sandra Ocampo'),
('Víctor Salinas'),
('Irene Franco'),
('Arturo Beltrán'),
('Cecilia Rocha'),
('Esteban Rangel'),
('Ana Lucía Campos'),
('David Montalvo'),
('Rebeca Hurtado'),
('Pablo Cifuentes'),
('Laura Godínez'),
('Israel Maldonado'),
('Cynthia Valero'),
('Mario Zúñiga'),
('Ruth Barrios'),
('Alexis Palomo'),
('Karen Bolaños'),
('Tomás Quintana'),
('Maribel Esquivel'),
('Nicolás Farías'),
('Florencia Cuevas'),
('Jonathan Escobar'),
('Lidia Macías'),
('Bruno Lozano'),
('Carolina Becerra'),
('Ignacio Serrano'),
('Ximena Trejo'),
('Kevin Durán'),
('Alicia Robles'),
('Sebastián Correa'),
('Fabiola Lozoya'),
('Rodrigo Espinosa'),
('Miriam Valdés'),
('Ángel Ledesma'),
('Mayra Coronado'),
('Ulises Contreras'),
('Norma Zambrano'),
('Cristóbal Pino'),
('Elsa Nieto'),
('Federico Bustos'),
('Alejandra Falcón'),
('Ramón Silva'),
('Judith León'),
('Matías Palma'),
('Liliana Orozco'),
('Braulio Nájera'),
('Rafael Treviño'),
('Clara Salgado'),
('Gonzalo Parra'),
('Leticia Varela'),
('Emanuel Godoy'),
('Nadia Peñaloza'),
('Hernán Alvarado'),
('Olga Cárdenas'),
('Félix Escalante'),
('Carla Moya'),
('Julio César Bravo'),
('Pilar Hurtado'),
('Maximiliano Ríos'),
('Andrea Santillán'),
('Cristina Bañuelos'),
('Edgar Ponce'),
('Paulina Tapia'),
('Leonardo Saucedo'),
('Sonia Rentería'),
('Adolfo Marín'),
('Montserrat Aranda'),
('César Velasco'),
('Julia Castaño'),
('Humberto Reyes'),
('Renata Olmos'),
('Omar Delgado'),
('Abril Chacón'),
('Víctor Hugo Lara'),
('Ismael Padilla'),
('Denisse Roldán'),
('Emmanuel Torres'),
('Lourdes Mayorga'),
('Mauricio Rivas'),
('Verónica Lozano'),
('Alexandra Peña'),
('Julián Morales'),
('Ana Belén Cruz'),
('Brayan Escamilla'),
('María José Cuevas'),
('Álvaro Patiño'),
('Reyna Estrada'),
('Camilo Arce'),
('Betsy Montero');

INSERT INTO Materia (nombre_materia) VALUES
('Programación'),
('Base de Datos');

INSERT INTO Materia (nombre_materia) VALUES
('Matemática Básica'),
('Matemática Avanzada'),
('Lengua Española'),
('Literatura'),
('Historia Universal'),
('Historia Dominicana'),
('Geografía'),
('Educación Cívica'),
('Física I'),
('Física II'),
('Química General'),
('Química Orgánica'),
('Biología'),
('Ciencias Naturales'),
('Programación I'),
('Programación II'),
('Programación III'),
('Base de Datos I'),
('Base de Datos II'),
('Estructura de Datos'),
('Algoritmos'),
('Sistemas Operativos'),
('Redes de Computadoras'),
('Seguridad Informática'),
('Desarrollo Web'),
('Desarrollo Móvil'),
('Ingeniería de Software'),
('Análisis de Sistemas'),
('Diseño de Sistemas'),
('Contabilidad I'),
('Contabilidad II'),
('Administración'),
('Economía'),
('Marketing'),
('Gestión Empresarial'),
('Emprendimiento'),
('Ética Profesional'),
('Metodología de la Investigación'),
('Estadística'),
('Probabilidad'),
('Matemática Financiera'),
('Cálculo Diferencial'),
('Cálculo Integral'),
('Álgebra Lineal'),
('Trigonometría'),
('Geometría'),
('Educación Física'),
('Orientación'),
('Psicología'),
('Sociología'),
('Filosofía'),
('Arte'),
('Música'),
('Teatro'),
('Dibujo Técnico'),
('Diseño Gráfico'),
('Fotografía'),
('Comunicación Oral'),
('Redacción'),
('Ortografía'),
('Inglés Básico'),
('Inglés Intermedio'),
('Inglés Avanzado'),
('Francés'),
('Tecnología Educativa'),
('Informática Básica'),
('Ofimática'),
('Robótica'),
('Electrónica'),
('Electricidad'),
('Mecánica'),
('Neumática'),
('Hidráulica'),
('Arquitectura'),
('Construcción'),
('Topografía'),
('Diseño Industrial'),
('Logística'),
('Gestión de Proyectos'),
('Control de Calidad'),
('Auditoría'),
('Derecho Laboral'),
('Derecho Empresarial'),
('Legislación Educativa'),
('Pedagogía'),
('Didáctica'),
('Evaluación Educativa'),
('Planificación'),
('Educación Ambiental'),
('Salud Pública'),
('Nutrición'),
('Primeros Auxilios'),
('Cuidado del Medio Ambiente'),
('Gestión de Riesgos'),
('Prevención de Desastres'),
('Ciberseguridad'),
('Inteligencia Artificial'),
('Machine Learning'),
('Big Data'),
('Computación en la Nube'),
('Internet de las Cosas'),
('Blockchain'),
('Realidad Virtual'),
('Realidad Aumentada'),
('Animación Digital'),
('Producción Audiovisual'),
('Periodismo'),
('Publicidad'),
('Relaciones Públicas'),
('Comunicación Digital'),
('E-commerce'),
('Negocios Digitales'),
('Gestión del Talento Humano'),
('Recursos Humanos'),
('Liderazgo'),
('Coaching'),
('Inteligencia Emocional'),
('Resolución de Conflictos'),
('Trabajo en Equipo'),
('Creatividad'),
('Innovación'),
('Pensamiento Crítico'),
('Educación Financiera'),
('Banca'),
('Finanzas Corporativas'),
('Mercado de Valores'),
('Econometría'),
('Investigación de Operaciones'),
('Optimización'),
('Simulación'),
('Modelado Matemático'),
('Estadística Aplicada'),
('Análisis de Datos'),
('Visualización de Datos'),
('Power BI'),
('Excel Avanzado');


DROP PROCEDURE IF EXISTS sp_listar_profesores;
DROP PROCEDURE IF EXISTS sp_guardar_profesor;
DROP PROCEDURE IF EXISTS sp_listar_materias;
DROP PROCEDURE IF EXISTS sp_guardar_materia;
DROP PROCEDURE IF EXISTS sp_listar_profesor_materia;
DROP PROCEDURE IF EXISTS sp_guardar_profesor_materia;
DROP PROCEDURE IF EXISTS sp_eliminar_profesor_materia;
GO


CREATE PROCEDURE sp_listar_profesores
AS
BEGIN
    SELECT id_profesor, nombre_profesor
    FROM Profesor;
END;
GO

CREATE PROCEDURE sp_guardar_profesor
    @nombre_profesor VARCHAR(100)
AS
BEGIN
    INSERT INTO Profesor(nombre_profesor)
    VALUES (@nombre_profesor);
END;
GO


CREATE PROCEDURE sp_listar_materias
AS
BEGIN
    SELECT id_materia, nombre_materia
    FROM Materia;
END;
GO

CREATE PROCEDURE sp_guardar_materia
    @nombre_materia VARCHAR(100)
AS
BEGIN
    INSERT INTO Materia(nombre_materia)
    VALUES (@nombre_materia);
END;
GO


CREATE PROCEDURE sp_listar_profesor_materia
AS
BEGIN
    SELECT 
        pm.id_profesor_materia,
        p.nombre_profesor,
        m.nombre_materia
    FROM Profesor_Materia pm
    INNER JOIN Profesor p ON pm.id_profesor = p.id_profesor
    INNER JOIN Materia m ON pm.id_materia = m.id_materia;
END;
GO

CREATE PROCEDURE sp_guardar_profesor_materia
    @id_profesor INT,
    @id_materia INT
AS
BEGIN
    INSERT INTO Profesor_Materia(id_profesor, id_materia)
    VALUES (@id_profesor, @id_materia);
END;
GO

CREATE PROCEDURE sp_eliminar_profesor_materia
    @id_profesor_materia INT
AS
BEGIN
    DELETE FROM Profesor_Materia
    WHERE id_profesor_materia = @id_profesor_materia;
END;
GO

CREATE PROCEDURE sp_editar_profesor_materia
    @id_profesor_materia INT,
    @id_profesor INT,
    @id_materia INT
AS
BEGIN
    UPDATE Profesor_Materia
    SET id_profesor = @id_profesor,
        id_materia = @id_materia
    WHERE id_profesor_materia = @id_profesor_materia;
END;
GO

CREATE OR ALTER PROCEDURE sp_buscar_profesor_materia
    @texto VARCHAR(100)
AS
BEGIN
    SELECT 
        pm.id_profesor_materia,
        p.nombre_profesor,
        m.nombre_materia
    FROM Profesor_Materia pm
    INNER JOIN Profesor p ON pm.id_profesor = p.id_profesor
    INNER JOIN Materia m ON pm.id_materia = m.id_materia
    WHERE p.nombre_profesor LIKE '%' + @texto + '%'
       OR m.nombre_materia LIKE '%' + @texto + '%'
END

DROP TABLE IF EXISTS Estudiante_Materia;
GO

CREATE TABLE Estudiante_Materia (
    id_estudiante_materia INT IDENTITY PRIMARY KEY,
    id_estudiante INT NOT NULL,
    id_area_tecnica INT NOT NULL,
    id_profesor INT NOT NULL,
    id_materia INT NOT NULL
);
GO

CREATE PROCEDURE sp_listar_estudiante_materia
AS
BEGIN
    SELECT 
        em.id_estudiante_materia,
        e.Nombre + ' ' + e.Apellidos AS estudiante,
        a.Nombre_Area AS area_tecnica,
        p.nombre_profesor,
        m.nombre_materia
    FROM Estudiante_Materia em
    INNER JOIN Estudiante e ON em.id_estudiante = e.id_Estudiante
    INNER JOIN Area_Tecnica a ON em.id_area_tecnica = a.id_Area_Tecnica
    INNER JOIN Profesor p ON em.id_profesor = p.id_profesor
    INNER JOIN Materia m ON em.id_materia = m.id_materia;
END;
GO

CREATE PROCEDURE sp_guardar_estudiante_materia
    @id_estudiante INT,
    @id_area_tecnica INT,
    @id_profesor INT,
    @id_materia INT
AS
BEGIN
    INSERT INTO Estudiante_Materia
    VALUES (@id_estudiante, @id_area_tecnica, @id_profesor, @id_materia);
END;
GO

CREATE PROCEDURE sp_editar_estudiante_materia
    @id_estudiante_materia INT,
    @id_estudiante INT,
    @id_area_tecnica INT,
    @id_profesor INT,
    @id_materia INT
AS
BEGIN
    UPDATE Estudiante_Materia
    SET 
        id_estudiante = @id_estudiante,
        id_area_tecnica = @id_area_tecnica,
        id_profesor = @id_profesor,
        id_materia = @id_materia
    WHERE id_estudiante_materia = @id_estudiante_materia;
END;
GO

CREATE PROCEDURE sp_eliminar_estudiante_materia
    @id_estudiante_materia INT
AS
BEGIN
    DELETE FROM Estudiante_Materia
    WHERE id_estudiante_materia = @id_estudiante_materia;
END;
GO

CREATE PROCEDURE sp_buscar_estudiante_materia
    @texto VARCHAR(100)
AS
BEGIN
    SELECT 
        em.id_estudiante_materia,
        e.Nombre + ' ' + e.Apellidos AS estudiante,
        a.Nombre_Area AS area_tecnica,
        p.nombre_profesor,
        m.nombre_materia
    FROM Estudiante_Materia em
    INNER JOIN Estudiante e ON em.id_estudiante = e.id_Estudiante
    INNER JOIN Area_Tecnica a ON em.id_area_tecnica = a.id_Area_Tecnica
    INNER JOIN Profesor p ON em.id_profesor = p.id_profesor
    INNER JOIN Materia m ON em.id_materia = m.id_materia
    WHERE 
        e.Nombre LIKE '%' + @texto + '%' OR
        p.nombre_profesor LIKE '%' + @texto + '%' OR
        m.nombre_materia LIKE '%' + @texto + '%';
END;
GO

CREATE OR ALTER PROCEDURE sp_reporte_estudiantes
AS
BEGIN
    SELECT 
        e.id_Estudiante,
        e.Nombre,
        e.Apellidos,
        e.Direccion,
        e.Telefono,
        e.Email,
        a.Nombre_Area AS AreaTecnica
    FROM Estudiante e
    INNER JOIN Area_Tecnica a 
        ON e.id_Area_Tecnica = a.id_Area_Tecnica
END

IF OBJECT_ID('Estudiante_Materia') IS NOT NULL
    DROP TABLE Estudiante_Materia;

CREATE TABLE Estudiante_Materia (
    id_estudiante_materia INT IDENTITY PRIMARY KEY,
    id_estudiante INT NOT NULL,
    id_area_tecnica INT NOT NULL,
    id_profesor INT NOT NULL,
    id_materia INT NOT NULL
);

CREATE OR ALTER PROCEDURE sp_listar_estudiante_materia
AS
BEGIN
    SELECT 
        em.id_estudiante_materia,
        e.Nombre + ' ' + e.Apellidos AS Estudiante,
        at.Nombre_Area,
        p.nombre_profesor,
        m.nombre_materia
    FROM Estudiante_Materia em
    INNER JOIN Estudiante e ON em.id_estudiante = e.id_Estudiante
    INNER JOIN Area_Tecnica at ON em.id_area_tecnica = at.id_Area_Tecnica
    INNER JOIN Profesor p ON em.id_profesor = p.id_profesor
    INNER JOIN Materia m ON em.id_materia = m.id_materia;
END
GO

-- GUARDAR
CREATE OR ALTER PROCEDURE sp_guardar_estudiante_materia
    @id_estudiante INT,
    @id_area_tecnica INT,
    @id_profesor INT,
    @id_materia INT
AS
BEGIN
    INSERT INTO Estudiante_Materia
    VALUES (@id_estudiante, @id_area_tecnica, @id_profesor, @id_materia);
END
GO

-- ELIMINAR
CREATE OR ALTER PROCEDURE sp_eliminar_estudiante_materia
    @id INT
AS
BEGIN
    DELETE FROM Estudiante_Materia
    WHERE id_estudiante_materia = @id;
END
GO

-- BUSCAR
CREATE OR ALTER PROCEDURE sp_buscar_estudiante_materia
    @texto VARCHAR(100)
AS
BEGIN
    SELECT 
        em.id_estudiante_materia,
        e.Nombre + ' ' + e.Apellidos AS Estudiante,
        at.Nombre_Area,
        p.nombre_profesor,
        m.nombre_materia
    FROM Estudiante_Materia em
    INNER JOIN Estudiante e ON em.id_estudiante = e.id_Estudiante
    INNER JOIN Area_Tecnica at ON em.id_area_tecnica = at.id_Area_Tecnica
    INNER JOIN Profesor p ON em.id_profesor = p.id_profesor
    INNER JOIN Materia m ON em.id_materia = m.id_materia
    WHERE e.Nombre LIKE '%' + @texto + '%'
       OR p.nombre_profesor LIKE '%' + @texto + '%'
       OR m.nombre_materia LIKE '%' + @texto + '%';
END
GO