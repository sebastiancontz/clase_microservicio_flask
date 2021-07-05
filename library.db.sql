BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "topicos" (
	"codigo"	TEXT UNIQUE,
	"tema"	TEXT,
	PRIMARY KEY("codigo")
);
CREATE TABLE IF NOT EXISTS "libros" (
	"isbn"	INTEGER,
	"titulo"	TEXT,
	"autor"	INTEGER,
	"temas"	TEXT,
	"editorial"	TEXT,
	"año"	INTEGER,
	"lugar_de_edicion"	TEXT,
	"numero_edicion"	INTEGER,
	"precio"	INTEGER,
	"cubierta"	TEXT,
	"paginas"	INTEGER,
	PRIMARY KEY("isbn" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "editoriales" (
	"codigo"	TEXT UNIQUE,
	"nombre"	TEXT,
	"telefono"	INTEGER,
	"personadecontacto"	TEXT,
	"dirección"	TEXT,
	"ciudad"	TEXT,
	PRIMARY KEY("codigo")
);
CREATE TABLE IF NOT EXISTS "autores" (
	"id"	INTEGER,
	"nombre"	TEXT,
	"país"	TEXT,
	"ciudad"	TEXT,
	"estudios"	TEXT,
	"año_nacimiento"	INTEGER,
	"año_fallecimiento"	INTEGER,
	PRIMARY KEY("id" AUTOINCREMENT)
);
INSERT INTO "topicos" ("codigo","tema") VALUES ('PSI','Psicología');
INSERT INTO "topicos" ("codigo","tema") VALUES ('CIE','Ciencia');
INSERT INTO "topicos" ("codigo","tema") VALUES ('SAL','Salud');
INSERT INTO "topicos" ("codigo","tema") VALUES ('FIC','Ficción');
INSERT INTO "topicos" ("codigo","tema") VALUES ('NOV','Novela');
INSERT INTO "topicos" ("codigo","tema") VALUES ('POE','Poesía');
INSERT INTO "topicos" ("codigo","tema") VALUES ('TEC','Técnica');
INSERT INTO "topicos" ("codigo","tema") VALUES ('HIS','Historia');
INSERT INTO "topicos" ("codigo","tema") VALUES ('FIL','Filosofía');
INSERT INTO "topicos" ("codigo","tema") VALUES ('ART','Arte');
INSERT INTO "libros" ("isbn","titulo","autor","temas","editorial","año","lugar_de_edicion","numero_edicion","precio","cubierta","paginas") VALUES (1,'El tránsito terreno',15,'FIL','LAR',1996,'Alicante',1,22162,'Blanda',152);
INSERT INTO "libros" ("isbn","titulo","autor","temas","editorial","año","lugar_de_edicion","numero_edicion","precio","cubierta","paginas") VALUES (2,'Sistemas operativos',8,'TEC','GGG',1994,'Nueva York',2,21268,'Dura',470);
INSERT INTO "libros" ("isbn","titulo","autor","temas","editorial","año","lugar_de_edicion","numero_edicion","precio","cubierta","paginas") VALUES (3,'Poemas intrínsecos',5,'POE','DEL',1997,'Barcelona',1,26135,'Blanda',173);
INSERT INTO "libros" ("isbn","titulo","autor","temas","editorial","año","lugar_de_edicion","numero_edicion","precio","cubierta","paginas") VALUES (4,'Avances en Arquitectura',12,'TEC','TEC',1991,'Londres',5,13720,'Dura',422);
INSERT INTO "libros" ("isbn","titulo","autor","temas","editorial","año","lugar_de_edicion","numero_edicion","precio","cubierta","paginas") VALUES (5,'Las balas del bien',6,'NOV','GGG',1995,'Londres',1,28666,'Dura',181);
INSERT INTO "libros" ("isbn","titulo","autor","temas","editorial","año","lugar_de_edicion","numero_edicion","precio","cubierta","paginas") VALUES (6,'La mente y el sentir',15,'FIL','LAR',1992,'Madrid',2,20811,'Blanda',196);
INSERT INTO "libros" ("isbn","titulo","autor","temas","editorial","año","lugar_de_edicion","numero_edicion","precio","cubierta","paginas") VALUES (7,'Ensayos póstumos',2,'PSI','DEL',1995,'Gerona',1,20537,'Dura',290);
INSERT INTO "libros" ("isbn","titulo","autor","temas","editorial","año","lugar_de_edicion","numero_edicion","precio","cubierta","paginas") VALUES (8,'La dualidad aparente',14,'FIL','LAR',1994,'Salamanca',2,23775,'Dura',157);
INSERT INTO "libros" ("isbn","titulo","autor","temas","editorial","año","lugar_de_edicion","numero_edicion","precio","cubierta","paginas") VALUES (9,'Arquitectura y arte',12,'HIS','GRI',1992,'Londres',6,27727,'Dura',512);
INSERT INTO "libros" ("isbn","titulo","autor","temas","editorial","año","lugar_de_edicion","numero_edicion","precio","cubierta","paginas") VALUES (10,'Historia de Occidente',1,'HIS','MCOY',1995,'París',2,24814,'Dura',250);
INSERT INTO "libros" ("isbn","titulo","autor","temas","editorial","año","lugar_de_edicion","numero_edicion","precio","cubierta","paginas") VALUES (11,'Sentimiento popular',5,'POE','LAR',1994,'Barcelona',2,20009,'Dura',199);
INSERT INTO "libros" ("isbn","titulo","autor","temas","editorial","año","lugar_de_edicion","numero_edicion","precio","cubierta","paginas") VALUES (12,'Amigos o enemigos',14,'PSI','GGG',1996,'Bilbao',1,23556,'Blanda',233);
INSERT INTO "libros" ("isbn","titulo","autor","temas","editorial","año","lugar_de_edicion","numero_edicion","precio","cubierta","paginas") VALUES (13,'La burguesía del XIX',1,'HIS','DEL',1996,'París',1,15142,'Dura',376);
INSERT INTO "libros" ("isbn","titulo","autor","temas","editorial","año","lugar_de_edicion","numero_edicion","precio","cubierta","paginas") VALUES (14,'Procesadores cuánticos',8,'TEC','GRI',1997,'Washington',1,14094,'Dura',452);
INSERT INTO "libros" ("isbn","titulo","autor","temas","editorial","año","lugar_de_edicion","numero_edicion","precio","cubierta","paginas") VALUES (15,'Canto de esperanza',9,'POE','MCOY',1995,'Denver',1,21778,'Blanda',198);
INSERT INTO "editoriales" ("codigo","nombre","telefono","personadecontacto","dirección","ciudad") VALUES ('GGG','GGG&G',7355654,'Romero , Pedro','León XIII, 12','Zaragoza');
INSERT INTO "editoriales" ("codigo","nombre","telefono","personadecontacto","dirección","ciudad") VALUES ('DEL','Deloria Editores',3245585,'Martínez, Susana','Gran Vía, 77','Madrid');
INSERT INTO "editoriales" ("codigo","nombre","telefono","personadecontacto","dirección","ciudad") VALUES ('LAR','Larrosa Mas,S.L.',9887763,'Ortiz, Jose','Espronceda, 11','Elche');
INSERT INTO "editoriales" ("codigo","nombre","telefono","personadecontacto","dirección","ciudad") VALUES ('MCOY','McCoy Hill',1219229,'Del Olmo, Rosa Mª','Sants Metges, 2','Barcelona');
INSERT INTO "editoriales" ("codigo","nombre","telefono","personadecontacto","dirección","ciudad") VALUES ('IBE','Ediciones Ibérica',8767856,'Guilló, Martín','Alfonso Paso, 3','Madrid');
INSERT INTO "editoriales" ("codigo","nombre","telefono","personadecontacto","dirección","ciudad") VALUES ('ABR','Publicaciones Abreu',4532318,'Huertas, Noelia','San Andrés, 21','Cartagena');
INSERT INTO "editoriales" ("codigo","nombre","telefono","personadecontacto","dirección","ciudad") VALUES ('GRI','Grisham Publishing',5751547,'Brown, Jean','Carlos III,43','Tarragona');
INSERT INTO "editoriales" ("codigo","nombre","telefono","personadecontacto","dirección","ciudad") VALUES ('TEC','TechiBooks',7777903,'Zapata, Gustavo','Fuensanta, 3','Alcobendas');
INSERT INTO "editoriales" ("codigo","nombre","telefono","personadecontacto","dirección","ciudad") VALUES ('CAS','Ediciones Castell, S.A.',4464814,'Gutiérrez , Ernesto','Plaza Luceros, 4','Alicante');
INSERT INTO "autores" ("id","nombre","país","ciudad","estudios","año_nacimiento","año_fallecimiento") VALUES (1,'Dulac, George','Francia','Nantes','La Sorbonne',1922,NULL);
INSERT INTO "autores" ("id","nombre","país","ciudad","estudios","año_nacimiento","año_fallecimiento") VALUES (2,'Bertomeu, Andrés','España','Barcelona','Univ. Valencia',1919,1995);
INSERT INTO "autores" ("id","nombre","país","ciudad","estudios","año_nacimiento","año_fallecimiento") VALUES (3,'Uosiken, Fred','Finlandia','Helsinki','Univ. Uppsala',1958,NULL);
INSERT INTO "autores" ("id","nombre","país","ciudad","estudios","año_nacimiento","año_fallecimiento") VALUES (4,'Müller, Klaus','Alemania','Düsseldorf','Univ. Viena',1720,1792);
INSERT INTO "autores" ("id","nombre","país","ciudad","estudios","año_nacimiento","año_fallecimiento") VALUES (5,'Llorens, Antonia','España','Gerona','Univ. Granada',1959,NULL);
INSERT INTO "autores" ("id","nombre","país","ciudad","estudios","año_nacimiento","año_fallecimiento") VALUES (6,'Leverling, Janet','EEUU','Seattle','Univ. Harvard',1969,NULL);
INSERT INTO "autores" ("id","nombre","país","ciudad","estudios","año_nacimiento","año_fallecimiento") VALUES (7,'Kröpotkin,Albert','Alemania','Berlín','Univ. París',1842,1897);
INSERT INTO "autores" ("id","nombre","país","ciudad","estudios","año_nacimiento","año_fallecimiento") VALUES (8,'Bazilian, Eric','EEUU','Atlanta','Univ. Stanfield',1969,NULL);
INSERT INTO "autores" ("id","nombre","país","ciudad","estudios","año_nacimiento","año_fallecimiento") VALUES (9,'Davolio, Nancy','Australia','Canberra','Univ. Sidney',1970,NULL);
INSERT INTO "autores" ("id","nombre","país","ciudad","estudios","año_nacimiento","año_fallecimiento") VALUES (10,'Becket, Samuel','Polonia','Varsovia','Univ. Berlín',1902,NULL);
INSERT INTO "autores" ("id","nombre","país","ciudad","estudios","año_nacimiento","año_fallecimiento") VALUES (11,'Dion, Paul','Gran Bretaña','Birmingham','Univ. Harvard',1854,1931);
INSERT INTO "autores" ("id","nombre","país","ciudad","estudios","año_nacimiento","año_fallecimiento") VALUES (12,'Richter, Helmut','Alemania','Dresde','Univ. Berlín',1911,1994);
INSERT INTO "autores" ("id","nombre","país","ciudad","estudios","año_nacimiento","año_fallecimiento") VALUES (13,'Chabrier, Louis','Francia','Toulouse','Univ. París',1892,1950);
INSERT INTO "autores" ("id","nombre","país","ciudad","estudios","año_nacimiento","año_fallecimiento") VALUES (14,'Sanabria, Carmelo','España','Salamanca','Univ. Salamanca',1963,NULL);
INSERT INTO "autores" ("id","nombre","país","ciudad","estudios","año_nacimiento","año_fallecimiento") VALUES (15,'Plasencia, Juan Luis','España','Toledo','Univ. Sevilla',1960,NULL);
INSERT INTO "autores" ("id","nombre","país","ciudad","estudios","año_nacimiento","año_fallecimiento") VALUES (16,'Santos, Miguel','Colombia','Medellín','Univ. Salamanca',1865,1928);
INSERT INTO "autores" ("id","nombre","país","ciudad","estudios","año_nacimiento","año_fallecimiento") VALUES (17,'Montenegro, Miguel','Chile','Curicó','Univ. París',1740,1810);
COMMIT;
