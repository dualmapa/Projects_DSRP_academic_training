-- Crear la base de datos
CREATE DATABASE hongos_biocontrol_nematodos_soja;
GO

-- Usar la base de datos recién creada
USE hongos_biocontrol_nematodos_soja;
GO

-- Tabla tipo_documento
CREATE TABLE tipo_documento (
    tipo_documento_id INT PRIMARY KEY,
    nombre_tipo_documento VARCHAR(100)
);

-- Tabla impacto
CREATE TABLE impacto (
    impacto_id INT PRIMARY KEY,
    indexacion VARCHAR(200),
    issn VARCHAR(100),
    doi_url VARCHAR(1000) UNIQUE,
    categoria_revista_col VARCHAR(10),
    cantidad_citaciones INT CHECK (cantidad_citaciones >= 0)
);

-- Tabla autores
CREATE TABLE autores (
    autor_id INT PRIMARY KEY,
    nombre_autor_principal VARCHAR(100),
    afiliacion_autor_principal VARCHAR(200),
    pais_afiliacion_autor_principal VARCHAR(100)
);

-- Tabla documento
CREATE TABLE documento (
    documento_id INT PRIMARY KEY,
    tipo_documento_id INT FOREIGN KEY REFERENCES tipo_documento(tipo_documento_id),
    impacto_id INT FOREIGN KEY REFERENCES impacto(impacto_id),
    autor_id INT FOREIGN KEY REFERENCES autores(autor_id),
    titulo VARCHAR(1000),
    idioma VARCHAR(10),
    ano_publicacion VARCHAR(4) CHECK (ano_publicacion > '1900')
);

-- Tabla metodologias
CREATE TABLE metodologias (
    metodologias_id INT PRIMARY KEY,
    tiempo_evaluacion INT,
    in_vitro VARCHAR(2),
    in_vivo VARCHAR(2),
    planta_evaluada VARCHAR(200)
);

-- Tabla coautores
CREATE TABLE coautores (
    coautor_id INT PRIMARY KEY,
    nombre_coautor VARCHAR(1000)
);

-- Tabla palabras_claves
CREATE TABLE palabras_claves (
    palabras_claves_id INT PRIMARY KEY,
    palabra_clave VARCHAR(1000)
);

-- Tabla microorganismos
CREATE TABLE microorganismos (
    microorganismo_id INT PRIMARY KEY,
    nombre_microorganismo VARCHAR(1000)
);

-- Tabla nematodos
CREATE TABLE nematodos (
    nematodos_id INT PRIMARY KEY,
    nombre_nematodo VARCHAR(1000)
);

-- Tabla metodologias_de_evaluacion
CREATE TABLE metodologias_de_evaluacion (
    metodologia_evaluacion_id INT PRIMARY KEY,
    metodologia_evaluacion VARCHAR(500)
);

-- Tabla porcentaje_mortalidad
CREATE TABLE porcentaje_mortalidad (
    porcentaje_mortalidad_id INT PRIMARY KEY,
    rango_mortalidad VARCHAR(1000)
);

-- Tabla Resultados
CREATE TABLE resultados (
    resultados_id INT PRIMARY KEY,
    documento_id INT FOREIGN KEY REFERENCES documento(documento_id),
    microorganismo_id INT FOREIGN KEY REFERENCES microorganismos(microorganismo_id),
    nematodos_id INT FOREIGN KEY REFERENCES nematodos(nematodos_id),
    metodologias_id INT FOREIGN KEY REFERENCES metodologias(metodologias_id),
	metodologia_evaluacion_id INT FOREIGN KEY REFERENCES metodologias_de_evaluacion(metodologia_evaluacion_id),
	palabras_claves_id INT FOREIGN KEY REFERENCES palabras_claves(palabras_claves_id),
	coautor_id INT FOREIGN KEY REFERENCES coautores(coautor_id),
    porcentaje_mortalidad_id INT FOREIGN KEY REFERENCES porcentaje_mortalidad(porcentaje_mortalidad_id),
    mortalidad VARCHAR(10),
    correccion_mortalidad VARCHAR(10),
    biocontrol_juveniles VARCHAR(10),
    biocontrol_huevos VARCHAR(10),
    prueba_de_confirmacion VARCHAR(10),
    metodologia_viabilidad VARCHAR(100)
);




-- Insertar datos en la tabla tipo_documento
INSERT INTO tipo_documento VALUES(1,'Artículo');
INSERT INTO tipo_documento VALUES(2,'Artículo');
INSERT INTO tipo_documento VALUES(3,'Artículo');
INSERT INTO tipo_documento VALUES(4,'Tesis');
INSERT INTO tipo_documento VALUES(5,'Artículo');
INSERT INTO tipo_documento VALUES(6,'Artículo');
INSERT INTO tipo_documento VALUES(7,'Artículo');
INSERT INTO tipo_documento VALUES(8,'Artículo');
INSERT INTO tipo_documento VALUES(9,'Artículo');
INSERT INTO tipo_documento VALUES(10,'Artículo');
INSERT INTO tipo_documento VALUES(11,'Artículo');
INSERT INTO tipo_documento VALUES(12,'Artículo');
INSERT INTO tipo_documento VALUES(13,'Artículo');
INSERT INTO tipo_documento VALUES(14,'Artículo');
INSERT INTO tipo_documento VALUES(15,'Artículo');
INSERT INTO tipo_documento VALUES(16,'Artículo');
INSERT INTO tipo_documento VALUES(17,'Artículo');
INSERT INTO tipo_documento VALUES(18,'Artículo');
INSERT INTO tipo_documento VALUES(19,'Artículo');
INSERT INTO tipo_documento VALUES(20,'Artículo');
INSERT INTO tipo_documento VALUES(21,'Artículo');
INSERT INTO tipo_documento VALUES(22,'Artículo');
INSERT INTO tipo_documento VALUES(23,'Artículo');
INSERT INTO tipo_documento VALUES(24,'Artículo');
INSERT INTO tipo_documento VALUES(25,'Artículo');
INSERT INTO tipo_documento VALUES(26,'Artículo');
INSERT INTO tipo_documento VALUES(27,'Artículo');
INSERT INTO tipo_documento VALUES(28,'Artículo');
INSERT INTO tipo_documento VALUES(29,'Artículo');
INSERT INTO tipo_documento VALUES(30,'Artículo');
INSERT INTO tipo_documento VALUES(31,'Artículo');
INSERT INTO tipo_documento VALUES(32,'Artículo');
INSERT INTO tipo_documento VALUES(33,'Artículo');
INSERT INTO tipo_documento VALUES(34,'Artículo');
INSERT INTO tipo_documento VALUES(35,'Tesis');
INSERT INTO tipo_documento VALUES(36,'Resumen');
INSERT INTO tipo_documento VALUES(37,'Artículo');
INSERT INTO tipo_documento VALUES(38,'Artículo');
INSERT INTO tipo_documento VALUES(39,'Artículo');
INSERT INTO tipo_documento VALUES(40,'Artículo');
INSERT INTO tipo_documento VALUES(41,'Artículo');
INSERT INTO tipo_documento VALUES(42,'Artículo');
INSERT INTO tipo_documento VALUES(43,'Artículo');
INSERT INTO tipo_documento VALUES(44,'Artículo');
INSERT INTO tipo_documento VALUES(45,'Artículo');
INSERT INTO tipo_documento VALUES(46,'Artículo');
INSERT INTO tipo_documento VALUES(47,'Artículo');
INSERT INTO tipo_documento VALUES(48,'Artículo');
INSERT INTO tipo_documento VALUES(49,'Artículo');
INSERT INTO tipo_documento VALUES(50,'Artículo');




-- Insertar datos en la tabla impacto
INSERT INTO impacto VALUES(1,'Agronomía Costarricense','0377-9424','https://www.researchgate.net/publication/269997305_AISLAMIENTO_IDENTIFICACION_Y_PRUEBAS_in_vitro_DE_HONGOS_NEMATOFAGOS_PARA_EL_COMBATE_DEL_NEMATODO_AGALLADOR_Meloidogyne_sp_Goeldi_1892_DE_ZONAS_ARROCERAS_DE_COSTA_RICA','No',18);
INSERT INTO impacto VALUES(2,'Revista Colombiana de Biotecnología','0123-3475','10.15446/rev.colomb.biote.v24n1.99038 ','B',0);
INSERT INTO impacto VALUES(3,'Biological Control','1090-2112','10.1016/j.biocontrol.2020.104425','A1',28);
INSERT INTO impacto VALUES(4,'','','https://repositorio.xoc.uam.mx/jspui/handle/123456789/2064','',0);
INSERT INTO impacto VALUES(5,'Chinese Journal of Biological Control','1005-9261','10.16409/j.cnki.2095-039x.2016.04.012','C',6);
INSERT INTO impacto VALUES(6,'The American Phytopathological Society','0031-949X','10.1094/PHYTO-07-19-0243-R','A1',14);
INSERT INTO impacto VALUES(7,'Biological Control','1049-9644','10.1016/j.biocontrol.2023.105438','A1',0);
INSERT INTO impacto VALUES(8,'ACTA AGRICULTURAE SCANDINAVICA, SECTION B—SOIL & PLANT SCIENCE','0906-4710','10.1080/09064710.2017.1343377','A2',16);
INSERT INTO impacto VALUES(9,'Biological Control','1049-9644','10.1016/j.biocontrol.2022.105054','A1',3);
INSERT INTO impacto VALUES(10,'Rhizosphere','2452-2198','10.1016/j.rhisph.2023.100717','A1',1);
INSERT INTO impacto VALUES(11,'Biological Control','1049-9644','10.1016/j.biocontrol.2019.104024','A1',22);
INSERT INTO impacto VALUES(12,'Plos One','1932-6203','10.1371/journal.pone.0232770','A1',16);
INSERT INTO impacto VALUES(13,'Journal of Invertebrate Pathology','0022-2011','10.1016/j.jip.2007.11.005','A1',73);
INSERT INTO impacto VALUES(14,' Applied Entomology and Phytopathology','1026-5007','10.5555/20113096791','B',4);
INSERT INTO impacto VALUES(15,'International Journal of Agriculture, Environment and food sciences','2618-5946','10.31015/jaefs.2022.1.10','B',2);
INSERT INTO impacto VALUES(16,'Indian Phytopathology','0367-973X','10.1007/s42360-022-00526-4','C',3);
INSERT INTO impacto VALUES(17,'Biotechnology Bulletin','1002-5464','10.13560/j.cnki.biotech.bull.1985.2022-0691','',0);
INSERT INTO impacto VALUES(18,'Soil biology & biochemistry','0038-0717','10.1016/j.soilbio.2008.03.011','A1',381);
INSERT INTO impacto VALUES(19,'Biological Control','1049-9644','10.1016/j.biocontrol.2014.01.009','A1',105);
INSERT INTO impacto VALUES(20,'Journal of Taibah University for Science','1658-3655','10.1080/16583655.2023.2288723','A2',1);
INSERT INTO impacto VALUES(21,'Microbiological Research','0944-5013','10.1016/j.micres.2022.127242','A1',1);
INSERT INTO impacto VALUES(22,'Frontiers in Plant Science','1664-462X','10.3389/fpls.2023.1179605','A1',0);
INSERT INTO impacto VALUES(23,'Biocontrol Science and Technology','0958-3157','10.1080/09583150701824079','A2',0);
INSERT INTO impacto VALUES(24,'Egyptian Journal of Biological Pest Control','1110-1768','10.1186/s41938-024-00769-5','A2',0);
INSERT INTO impacto VALUES(25,'Mycological Research','1469-8102','10.1017/S095375620300889X','',66);
INSERT INTO impacto VALUES(26,'Biocontrol Science and Technology','0958-3157','10.1080/09583150701668658','A2',67);
INSERT INTO impacto VALUES(27,'Journal of entomology and Zoology Studies','2320-7078','https://www.entomoljournal.com/archives/2018/vol6issue6/PartD/6-5-178-205.pdf','',1);
INSERT INTO impacto VALUES(28,'Biocontrol Science and Technology','0958-3157','10.1080/09583157.2024.2306550','A2',0);
INSERT INTO impacto VALUES(29,'Research, Society and Development','2525-3409','10.33448/rsd-v11i15.36768','',0);
INSERT INTO impacto VALUES(30,'Biological Control','1049-9644','10.1016/j.biocontrol.2020.104429','A1',0);
INSERT INTO impacto VALUES(31,'Frontiers in microbiology','1664-302X','10.3389/fmicb.2020.574601','A1',22);
INSERT INTO impacto VALUES(32,'Revista Caatinga','0100-316X','10.1590/1983-21252019v32n105rc ','A2',20);
INSERT INTO impacto VALUES(33,'journal of Phytopathology','0931-1785','10.1111/jph.12619','A2',23);
INSERT INTO impacto VALUES(34,'Rhizosphere','2452-2198','10.1016/j.rhisph.2020.100222','A1',9);
INSERT INTO impacto VALUES(35,'','','10.11606/D.11.2020.tde-09102020-135813','',0);
INSERT INTO impacto VALUES(36,'Embrapa Soja','','https://www.alice.cnptia.embrapa.br/alice/bitstream/doc/1155211/1/p-65-DOCUMENTOS-453-Jorn-Acad-2023-11.pdf','',4);
INSERT INTO impacto VALUES(37,'journal of Phytopathology','0931-1785','10.1111/jph.12755','A2',21);
INSERT INTO impacto VALUES(38,'Delos Desarrollo Local Sostenible','1988-5245','10.55905/rdelosv16.n45-009','',0);
INSERT INTO impacto VALUES(39,'','','http://65.108.49.104/handle/123456789/805','',0);
INSERT INTO impacto VALUES(40,'Revista Sociedade e Ambiente','2675-3464','https://revistasociedadeeambiente.com/index.php/dt/article/view/103','',2);
INSERT INTO impacto VALUES(41,'PAB - Pesquisa Agropecuárica Brasileira','1678-3921','10.1590/S1678-3921.pab2022.v57.02526','',10);
INSERT INTO impacto VALUES(42,'Waste and Biomass Valorization','1877-2641','10.1007/s12649-022-01930-7','A2',1);
INSERT INTO impacto VALUES(43,'Biocontrol Science and Technology','0958-3157','10.1080/09583150902960979','A2',10);
INSERT INTO impacto VALUES(44,'Life','2075-1729','10.3390/life11111143','',9);
INSERT INTO impacto VALUES(45,'Biological Control','1049-9644','10.1016/j.biocontrol.2004.09.013','A1',85);
INSERT INTO impacto VALUES(46,'Malaysian Journal of Sustainable Agriculture','2521-294X','10.26480/mjsa.02.2020.44.48','',10);
INSERT INTO impacto VALUES(47,'BMC microbiology','1471-2180','10.1186/s12866-020-01984-4','A2',56);
INSERT INTO impacto VALUES(48,'Biological Control','1090-2112','10.1016/j.biocontrol.2017.03.009','A1',55);
INSERT INTO impacto VALUES(49,'Journal of Nematology','0022-300X','10.21307/jofnem-2020-083','A2',7);
INSERT INTO impacto VALUES(50,'Chilean Journal of Agricultural Research','0718-5820','10.4067/S0718-58392024000200281','A2',0);




-- Insertar datos en la tabla autores
INSERT INTO autores VALUES(1,'Peraza Padilla Walter','Universidad Nacional','Costa Rica');
INSERT INTO autores VALUES(2,'Marín Pavas Duber Alexander','Universidad de Antioquia','Colombia');
INSERT INTO autores VALUES(3,'Martins de Oliveira Camilla','Federal University of Goiás','Brasil');
INSERT INTO autores VALUES(4,'López Sánchez Mónica Yazmín','Universidad Autónoma Metropolitana Unidad Xochimilco','México');
INSERT INTO autores VALUES(5,'Yang Chuanxu','Shenyang Agricultural University','Brasil');
INSERT INTO autores VALUES(6,'Strom Noah','University of Minnesota','Estados Unidos');
INSERT INTO autores VALUES(7,'de Paula Letícia','Federal University of Lavras','Brasil');
INSERT INTO autores VALUES(8,'Song Jie','Chinese Academy of Sciences','China');
INSERT INTO autores VALUES(9,'Oliveira Almeida Nayane','Universidade Federal de Goiás','Brasil');
INSERT INTO autores VALUES(10,'Camatti Gabriel','Federal University of Santa Maria','Brasil');
INSERT INTO autores VALUES(11,'Henrique Hahn Marlon','Universidade Federal do Paraná','Brasil');
INSERT INTO autores VALUES(12,'Zhang Jie','Henan Academy of Agricultural Sciences','China');
INSERT INTO autores VALUES(13,'Shinya Ryoji','Obihiro University of Agriculture and Veterinary Medicine','Japón');
INSERT INTO autores VALUES(14,'Ayatollahy E','University of Tehran','Irán');
INSERT INTO autores VALUES(15,'Goze Ozdemir Fatma Gul','Isparta University of Applied Sciences','Turquía');
INSERT INTO autores VALUES(16,'Pathania Ashvika','Lovely Professional University','India');
INSERT INTO autores VALUES(17,'Wu Yu-huan','Agricultural University of Hebei','China');
INSERT INTO autores VALUES(18,'Sahebani N','University of Tehran','Irán');
INSERT INTO autores VALUES(19,'Zhang Shuwu','Gansu Agricultural University','China');
INSERT INTO autores VALUES(20,'Nagaraj Gowrisri','Tamil Nadu Agricultural University','India');
INSERT INTO autores VALUES(21,'de Souza Gouveia Angélica','Universidade Federal de Vicosa','Brasil');
INSERT INTO autores VALUES(22,'Zhao Di','Shenyang Agricultural University','China');
INSERT INTO autores VALUES(23,'Ayatollahy Ebrahim','University of Tehran','Irán');
INSERT INTO autores VALUES(24,'Rajendran Jagadeeswaran','ICAR - Indian Institute of Pulses Research','India');
INSERT INTO autores VALUES(25,'Mauchline Tim','The University of Reading','Reino Unido');
INSERT INTO autores VALUES(26,'Van nguyen Nam','Chonnam National University','Korea del Sur');
INSERT INTO autores VALUES(27,'Hammas Noura Chihani','Sousse University','Túnez');
INSERT INTO autores VALUES(28,'Ibrahim Ibrahim','Kohat University of Science & Technology ','Pakistán');
INSERT INTO autores VALUES(29,'Leite Silva Karen Cristina','Universidade Federal do Tocantins','Brasil');
INSERT INTO autores VALUES(30,'Naz Ishrat','The University of Agricultue','Pakistán');
INSERT INTO autores VALUES(31,'Zhang Shuwu','Gansu Agricultural University','China');
INSERT INTO autores VALUES(32,'Laurindo de Oliveira Kethelin Cristine','Universidade Estadual de Mato Grosso','Brasil');
INSERT INTO autores VALUES(33,'Kath Juliana','State University of Maringa','Brasil');
INSERT INTO autores VALUES(34,'Rigueiro Messa Vinícius','Universidade Estadual do Oeste do Paraná','Brasil');
INSERT INTO autores VALUES(35,'Milanez Silva Daniela','Escuela Superior de Agricultura Luiz de Queiroz','Brasil');
INSERT INTO autores VALUES(36,'Camargo J. F. M.','Embrapa','Brasil');
INSERT INTO autores VALUES(37,'Dias Arieira Cláudia','State University of Maringa','Brasil');
INSERT INTO autores VALUES(38,'Beserra Santos Ananda Rosa','Universidade Federal Rural de Pernambuco','Brasil');
INSERT INTO autores VALUES(39,'Pereira de Jesus Gabriella Rodrigues','Faculdade de Inhumas - FacMais','Brasil');
INSERT INTO autores VALUES(40,'dos Santos Genildo Ribeiro','Centro Universitário Arnaldo Horácio Ferreira','Brasil');
INSERT INTO autores VALUES(41,'Gardiano Link Cristiane Goncalves','Fundacao Agraria de Pesquisa Agropecuaria','Brasil');
INSERT INTO autores VALUES(42,'Gao Feng','Jilin Agriculture University','China');
INSERT INTO autores VALUES(43,'Liu S. F.','University of Minnesota','Estados Unidos');
INSERT INTO autores VALUES(44,'Yan Jichen','Shenyang Agricultural University','China');
INSERT INTO autores VALUES(45,'Chen Senyu','University of Minnesota','Estados Unidos');
INSERT INTO autores VALUES(46,'Sharif Sarker Mohammad','Bancladesh Agricultural University','Bangladesh');
INSERT INTO autores VALUES(47,'Fan Haiyan','Shenyang Agricultural University','China');
INSERT INTO autores VALUES(48,'Chinheya Cleopas C.','University of KwaZulu-Natal','Sur Africa');
INSERT INTO autores VALUES(49,'Hawk Tracy','University of Arkansas','Estados Unidos');
INSERT INTO autores VALUES(50,'Fontanela Maira Laíza','Universidade Estadual de Maringá','Brasil');




-- Insertar datos en la tabla documento
INSERT INTO documento VALUES(1,1,1,1,'AISLAMIENTO, IDENTIFICACIÓN Y PRUEBAS in vitro DE HONGOS NEMATÓFAGOS PARA EL COMBATE DEL NEMATODO AGALLADOR Meloidogyne sp. (Goeldi 1892) DE ZONAS ARROCERAS DE COSTA RICA','Español','2014');
INSERT INTO documento VALUES(2,2,2,2,'Potencial nematicida de hongos aislados de cultivos de plátano dominico hartón (Musa AAB Simmonds) del suroeste antioqueño','Español','2022');
INSERT INTO documento VALUES(3,3,3,3,'Biological control of Pratylenchus brachyurus with isolates of Trichoderma spp. on soybean','Inglés','2021');
INSERT INTO documento VALUES(4,4,4,4,'Actividad nematostática de extractos liofilizados de cultivo de Metarhizium anisopliae sobre Nacobbus aberrans','Español','2017');
INSERT INTO documento VALUES(5,5,5,5,'Ferment Optimization of Biocontrol Fungus Snef5 against Meloidogyne incognita by Response Surface Methodology','Chino','2016');
INSERT INTO documento VALUES(6,6,6,6,'Corn and soybean host root endophytic fungi with toxicity toward the soybean cyst nematode','Inglés','2020');
INSERT INTO documento VALUES(7,7,7,7,'The combination of Bacillus amyloliquefaciens and Purpureocillium lilacinum in the control of Meloidogyne enterolobii','Inglés','2024');
INSERT INTO documento VALUES(8,8,8,8,'Assessment of parasitic fungi for reducing soybean cyst nematodewith suppressive soil in soybean fields of northeast China','Inglés','2017');
INSERT INTO documento VALUES(9,9,9,9,'Trichoderma harzianum and Trichoderma asperellum are potential biocontrol agents of Meloidogyne javanica in banana cv. Grande Naine','Inglés','2022');
INSERT INTO documento VALUES(10,10,10,10,'Bacillus- and Trichoderma- based products control the spiral nematode Helicotylenchus dihystera in soybean','Inglés','2023');
INSERT INTO documento VALUES(11,11,11,11,'Nematophagous mushrooms can be an alternative to control Meloidogyne javanica','Inglés','2019');
INSERT INTO documento VALUES(12,12,12,12,'Colonization of Beauveria bassiana 08F04 in root-zone soil and its biocontrol of cereal cyst nematode (Heterodera filipjevi)','Inglés','2020');
INSERT INTO documento VALUES(13,13,13,13,'Effects of fungal cultura filtrates of Verticillium lecanii (Lecanicillium spp.) hybrid strains of Heterodera glycines eggs and juveniles','Inglés','2008');
INSERT INTO documento VALUES(14,14,14,14,'In vitro assessment of pathogenicity and culture filtrates of fungi against Heterodera schachtii','Inglés','2010');
INSERT INTO documento VALUES(15,15,15,15,'Assessment of nematicidal activity of Beauveria bassiana (Bals.-Criv.) vuill on Pratylenchus thornei (Sher et Allen)(Tylenchida: Pratylenchidae)','Inglés','2022');
INSERT INTO documento VALUES(16,16,16,16,'In-vitro efficacy of Verticillium lecanii (Zimm.) Viegas against Estonian cyst nematode, Cactodera estonica','Inglés','2022');
INSERT INTO documento VALUES(17,17,17,17,'Nematicidal activities determination of five biocontrol fungi against cyst nematodes','Chino','2022');
INSERT INTO documento VALUES(18,18,18,18,'Biological control of the root-knot nematode Meloidogyne javanica by Trichoderma harzianum','Inglés','2008');
INSERT INTO documento VALUES(19,19,19,19,'The parasitic and lethal effects of Trichoderma longibrachiatum against Heterodera avenae','Inglés','2014');
INSERT INTO documento VALUES(20,20,20,20,'Nematicidal action of Clonostachys rosea against Meloidogyne incognita: in-vitro and in-silico analyses','Inglés','2023');
INSERT INTO documento VALUES(21,21,21,21,'Inoculation of Pochonia chlamydosporia triggers a defense response in tomato roots, affecting parasitism by Meloidogyne javanica','Inglés','2023');
INSERT INTO documento VALUES(22,22,22,22,'Virulent and attenuated strains of Trichoderma citrinoviride mediated resistance and biological control mechanism in tomato','Inglés','2023');
INSERT INTO documento VALUES(23,23,23,23,'Potential for biological control of Heterodera schachtii by Pochonia chlamydosporia var. Chlamydosporia on sugar beet','Inglés','2008');
INSERT INTO documento VALUES(24,24,24,24,'Nematode egg parasitic fungus, Purpureocillium lilacinum: efficacy of indigenous strains for the management of Meloidogyne incognita in chickpea','Inglés','2024');
INSERT INTO documento VALUES(25,25,25,25,'The biocontrol fungus Pochonia chlamydosporia shows nematode host preference at the infraspecific level','Inglés','2004');
INSERT INTO documento VALUES(26,26,26,26,'The role of chitinase from Lecanicillium antillanum B-3 in parasitism to root-knot nematode Meloidogyne incognita eggs','Inglés','2007');
INSERT INTO documento VALUES(27,27,27,27,'Antagonistic potential of Verticillium leptobactrum against Pratylenchus vulnus associated with apple rootstock','Inglés','2018');
INSERT INTO documento VALUES(28,28,28,28,'Biological control of root-knot nematodes in common beans using putative nematocidal species of Trichoderma indigenous to Pakistan','Inglés','2024');
INSERT INTO documento VALUES(29,29,29,29,'Biocontrol of plant-parasitic nematodes by soil in soybean cultivation','Inglés','2022');
INSERT INTO documento VALUES(30,30,30,30,'Biological control of root knot nematode, Meloidogyne incognita, in vitro, greenhouse and field in cucumber','Inglés','2021');
INSERT INTO documento VALUES(31,31,31,31,'Optimization of the fermientation media and parameters for the Bio-control potential of Trichoderma longibrachiatum T6 against nematodes','Inglés','2020');
INSERT INTO documento VALUES(32,32,32,32,'Biological management of Pratylenchus brachyurus in soybean crops','Inglés','2019');
INSERT INTO documento VALUES(33,33,33,33,'Control of Pratylenchus brachyurus in soybean with Trichoderma spp. and resistance inducers','Inglés','2017');
INSERT INTO documento VALUES(34,34,34,34,'Nematophagous and endomycorrhizal fungi in the control Meloidogyne incognita in soybean','Inglés','2020');
INSERT INTO documento VALUES(35,35,35,35,'Production of Purpureocillium lilacinum and Pochonia chlamdosporia by submerged fermentation, and their effects on Tetranychus urticae and Heterodera glycines through seed inoculation of common beans plants','Inglés','2020');
INSERT INTO documento VALUES(36,36,36,36,'Uso de agentes antagonistas no controle biológico de Aphelenchoides besseyi em soja','Portugués','2023');
INSERT INTO documento VALUES(37,37,37,37,'Biological control of Pratylenchus brachyurus in soya bean crops','Inglés','2018');
INSERT INTO documento VALUES(38,38,38,38,'Agentes de biocontole no manejo de Meloidogyne incognita na cultura da soja','Portugués','2023');
INSERT INTO documento VALUES(39,39,39,39,'Efeito in vitro de filtrados de Trichoderma sobre Pratylenchus brachyurus','Portugués','2023');
INSERT INTO documento VALUES(40,40,40,40,'Controle biológico de Pratylenchus spp. na soja, em solo naturalmente infestado, no oeste da bahia','Portugués','2023');
INSERT INTO documento VALUES(41,41,41,41,'Management systems for nematode control in soybean fields in south-central Paraná, Brazil','Portugués','2022');
INSERT INTO documento VALUES(42,42,42,42,'Optimization of Purpureocillium lilacinum Derived from Spent Mushroom Substrate and Its Potential to Control Soybean Cyst Nematode.','Inglés','2022');
INSERT INTO documento VALUES(43,43,43,43,'Effectiveness of Hirsutella minnesotensis and H. rhossiliensis in control of the soybean cyst nematode in four soils with various pH, texture, and organic matter','Inglés','2009');
INSERT INTO documento VALUES(44,44,44,44,'Evaluation of Scopoletin from Penicillium janthinellum Snef1650 for the Control of Heterodera glycines in Soybean','Inglés','2021');
INSERT INTO documento VALUES(45,45,45,45,'Control of the soybean cyst nematode by the fungi Hirsutella rhossiliensis and Hirsutella minnesotensis in greenhouse studies','Inglés','2005');
INSERT INTO documento VALUES(46,46,46,46,'EFFECT OF BIO-NEMATICIDE AND BAU-BIOFUNGICIDE AGAINST ROOT-KNOT (MELOIDOGYNE SPP.) OF SOYBEAN','Inglés','2020');
INSERT INTO documento VALUES(47,47,47,47,'isolation and effect of Trichoderma citrinoviride Snef 1910 for the biological control of root-knot nematode, Meloidogyne incognita','Inglés','2020');
INSERT INTO documento VALUES(48,48,48,48,'Biological control of the rootknot nematode, Meloidogyne javanica (Chitwood) using Bacillus isolates, on soybean','Inglés','2017');
INSERT INTO documento VALUES(49,49,49,49,'Effect of seed-applied fluopyram on Meloidogyne incognita infection and maturity in cotton and soybean','Inglés','2020');
INSERT INTO documento VALUES(50,50,50,50,'Chemical control associated with genetic management of Meloidogyne javanica in soybean','Inglés','2024');


-- Insertar datos en la tabla metodologias
INSERT INTO metodologias VALUES(1,96,'Si','No','NA');
INSERT INTO metodologias VALUES(2,72,'Si','No','NA');
INSERT INTO metodologias VALUES(3,24,'Si','Si','Soybean o soja o soya');
INSERT INTO metodologias VALUES(4,72,'Si','No','NA');
INSERT INTO metodologias VALUES(5,24,'Si','No','NA');
INSERT INTO metodologias VALUES(6,72,'Si','No','NA');
INSERT INTO metodologias VALUES(7,48,'Si','No','NA');
INSERT INTO metodologias VALUES(8,1440,'No','Si','Soybean o soja o soya');
INSERT INTO metodologias VALUES(9,24,'Si','Si','Banana, ');
INSERT INTO metodologias VALUES(10,'','','','');
INSERT INTO metodologias VALUES(11,48,'Si','No','NA');
INSERT INTO metodologias VALUES(12,'','No','Si','Wheat, trigo');
INSERT INTO metodologias VALUES(13,168,'Si','No','NA');
INSERT INTO metodologias VALUES(14,48,'Si','No','NA');
INSERT INTO metodologias VALUES(15,72,'Si','No','NA');
INSERT INTO metodologias VALUES(16,72,'Si','No','NA');
INSERT INTO metodologias VALUES(17,48,'Si','Si','Soybean o soja o soya');
INSERT INTO metodologias VALUES(18,480,'Si','Si','Tomate, Tomato, Lycopersicon');
INSERT INTO metodologias VALUES(19,960,'No','Si','Wheat, trigo');
INSERT INTO metodologias VALUES(20,96,'Si','No','NA');
INSERT INTO metodologias VALUES(21,1056,'No','Si','Tomate, Tomato, Solanum');
INSERT INTO metodologias VALUES(22,24,'Si','Si','Tomate, Tomato, Solanum');
INSERT INTO metodologias VALUES(23,48,'Si','Si','Cebada, Barley');
INSERT INTO metodologias VALUES(24,48,'Si','No','NA');
INSERT INTO metodologias VALUES(25,1848,'No','Si','Potato, papa, Solanum, Tomato, Tomate, ');
INSERT INTO metodologias VALUES(26,120,'Si','No','NA');
INSERT INTO metodologias VALUES(27,72,'Si','Si','Manzana, Apple');
INSERT INTO metodologias VALUES(28,'','Si','No','NA');
INSERT INTO metodologias VALUES(29,2160,'No','Si','Soybean o soja o soya');
INSERT INTO metodologias VALUES(30,72,'Si','No','NA');
INSERT INTO metodologias VALUES(31,72,'Si','No','NA');
INSERT INTO metodologias VALUES(32,2880,'No','Si','Soybean o soja o soya');
INSERT INTO metodologias VALUES(33,720,'Si','Si','Soybean o soja o soya');
INSERT INTO metodologias VALUES(34,1560,'No','Si','Soybean o soja o soya');
INSERT INTO metodologias VALUES(35,1080,'No','Si','Soybean o soja o soya');
INSERT INTO metodologias VALUES(36,2016,'No','Si','Soybean o soja o soya');
INSERT INTO metodologias VALUES(37,1440,'No','Si','Soybean o soja o soya');
INSERT INTO metodologias VALUES(38,1440,'No','Si','Soybean o soja o soya');
INSERT INTO metodologias VALUES(39,24,'Si','No','NA');
INSERT INTO metodologias VALUES(40,2160,'No','Si','Soybean o soja o soya');
INSERT INTO metodologias VALUES(41,2160,'No','Si','Soybean o soja o soya');
INSERT INTO metodologias VALUES(42,'','No','Si','Soybean o soja o soya');
INSERT INTO metodologias VALUES(43,1440,'No','Si','Soybean o soja o soya');
INSERT INTO metodologias VALUES(44,'','No','Si','Soybean o soja o soya');
INSERT INTO metodologias VALUES(45,1440,'No','Si','Soybean o soja o soya');
INSERT INTO metodologias VALUES(46,2280,'No','Si','Soybean o soja o soya');
INSERT INTO metodologias VALUES(47,720,'Si','Si','Tomate, Tomato, Solanum');
INSERT INTO metodologias VALUES(48,1008,'Si','Si','Soybean o soja o soya');
INSERT INTO metodologias VALUES(49,840,'No','Si','Algodón, cotton, Gossypium, Soja, Soya, Soybean, Glycine');
INSERT INTO metodologias VALUES(50,1560,'No','Si','Soybean o soja o soya');




-- Insertar datos en la tabla coautores
INSERT INTO coautores VALUES(1,'Orozco Aceves Martha, Esquivel Hernández Alejandro');
INSERT INTO coautores VALUES(2,'Alzate Tamayo Juan Pablo, Calle Restrepo Alejandro, Salazar Moncada Diego alberto, Ocampo Jiménez Omar, Calle Osorio Jaime de Jesús');
INSERT INTO coautores VALUES(3,'Oliveira Almeida Nayane, Viícius de C. Barros Cortes Márcio, Lobo Júnior Murillo, Rúbia da Rocha Mara, José Ulhoa cirano');
INSERT INTO coautores VALUES(4,'');
INSERT INTO coautores VALUES(5,'Zhao Di, Tan Zhuo, Zhu Xiaofeng, Liu Xiaoyu, Duan Yuxi, Wang Yuanyuan, Chen Lijie');
INSERT INTO coautores VALUES(6,'Hu Weiming, Haarith Deepak, Chen Senyu, Bushley Kathryn');
INSERT INTO coautores VALUES(7,'Campos Vicente, Terra William, de Brum Daniele, Jacobs Dustin, Xuan Bui Hung, Desaeger Johan');
INSERT INTO coautores VALUES(8,'Li Shuxian, Wei Wei, Xu Yanli, Yao Qin');
INSERT INTO coautores VALUES(9,'Martins de Oliveira Camilla, José Ulhoa Cirano, de Carvalho Barros Cortes Márcio Vinícius, Lobo Júnior Murillo, da Rocha Mara Rúbia');
INSERT INTO coautores VALUES(10,'Mulinari dos Santos Fabio, dos Santos Rodrigues Júnior Gerson Luis, Pereira Camargo Darcila, Stefanello Manfio  Gabrieli, Pereira Santos Jansen Rodrigo, Pereira da Silva Julio Carlos');
INSERT INTO coautores VALUES(11,'May de Mio Louise Larissa, José Kuhn Odair, da Silva Silveira Duarte Henrique');
INSERT INTO coautores VALUES(12,'Fu Bo, Lin Qitong, Riley Ian, Ding Shengli, Chen Linlin, Cui Jiangkuan, Yang Lirong, Li Honglian');
INSERT INTO coautores VALUES(13,'Aiuchi Daigo, Kushida Atsuhiko, Tani Masayuki, Kuramochi Katsuhisa, Koike Masanori');
INSERT INTO coautores VALUES(14,'Fatemy S');
INSERT INTO coautores VALUES(15,'Uzun Yigit Asiye, Demirozer Ozan');
INSERT INTO coautores VALUES(16,'Dutta Joydeep, Hanuman Mhatre Priyank');
INSERT INTO coautores VALUES(17,'Peng Huan, GE Feng-yong, Peng De-liang, Liu Da-qun, Li Ya-ning');
INSERT INTO coautores VALUES(18,'Hadavi N');
INSERT INTO coautores VALUES(19,'Gan Yantai, Xu Bingliang, Xue Yingyu');
INSERT INTO coautores VALUES(20,'Kannan Rengasamy, Raguchander Thiruvengadam, Narayanan Swarnakumari, Saravanakumar Duraisamy');
INSERT INTO coautores VALUES(21,'Avelar Monteiro Thalita Suelen, Marcio Balbino Huarlen, Corbelli de Magalhaes Fernanda, Soares Ramos Maria Eduarda, Silva Moura Vitor Augusto, Dionizio Luiz Paulo Henrique, de Almeida Oliveira Maria Goreti, Grassi de Freitas Leandro, de Oliveira Ramos Humberto Josué');
INSERT INTO coautores VALUES(22,'Shen Dan, Fan Haiyan, Zhu Xiaofeng, Wang Yuanyuan, Duan Yuxi, Chen Lijie');
INSERT INTO coautores VALUES(23,'Fatemy Seddighe, Etebarian Hassan');
INSERT INTO coautores VALUES(24,'Dubey Jyotirmay, Kumar Vaibhav, Sujayanand G. K.');
INSERT INTO coautores VALUES(25,'Kerry Brian, Hirsch Penny');
INSERT INTO coautores VALUES(26,'Kim Young-Ju, Oh Kyung-Taek, Jung Woo-Jin, Park Ro-Dong');
INSERT INTO coautores VALUES(27,'Hajer Regaieg, Asma Larayedh, Hdfi Lobna Hajji, Najet Horrigue-Raouani');
INSERT INTO coautores VALUES(28,'Ali Mohsin, Rehman Abdul, Khattak Baharullah, Nawaz Shuja Malik, Anees Muhammad');
INSERT INTO coautores VALUES(29,'Xaubet Burin Lucas, Angelo Seraglio Natan, Chagas Junior Aloisio Freitas, Silva Machado Igor Eloi, Faria Falcao Daniel, Ribeiro Fidelis Rodrigo');
INSERT INTO coautores VALUES(30,'Ali Khan Raja Asad, Masood Tariq, Baig Ayesha, Siddique Ifra, Haq Shamsul');
INSERT INTO coautores VALUES(31,'Gan Yantai, Liu Jia, Zhou Jingjiang, Xu Bingliang');
INSERT INTO coautores VALUES(32,'Vieira de Araújo Dejania, Carmos de Meneses Angélica, Moreira e Silva Jéssica, Cardoso Tavares Rodolfo Luis');
INSERT INTO coautores VALUES(33,'Dias Arieira Cláudia, Antunes Ferreira Júlio César, Aparecida Homiak Juliana, Rocco da Silva Camila, Rezende Cardoso Carine');
INSERT INTO coautores VALUES(34,'Torres da Costa Antonio Carlos, José Kuhn Odair, Torres Stroze Camila');
INSERT INTO coautores VALUES(35,'');
INSERT INTO coautores VALUES(36,'Loreto R. B., Favoreto L., Meyer M. C.');
INSERT INTO coautores VALUES(37,'Godinho de Araújo Fernando, Kaneko Lécio, Cristina Santiago Débora');
INSERT INTO coautores VALUES(38,'de Almeida Fernandes Antonio, Lima Fonseca Weverson, Martins Carvalho Rezanio, Alves da Silva Luana Maria, Simeao Marcelo, Silva dos Santos Tarciana, Lopes Fonseca Kathia Raquel');
INSERT INTO coautores VALUES(39,'de Almeida anunciacao Sandriel, Lucas Ferreira Izabely Vitoria, Oliveira Almeida');
INSERT INTO coautores VALUES(40,'Paiva Santana Ceilla Mirian, Henrique Fanslau Pedro');
INSERT INTO coautores VALUES(41,'Santana Gomes Simone de Melo, Ricardo Kluge Elizandro, da Rosa Kluge Fabiéli Teixeira, Dias Arieira Claudia Regina');
INSERT INTO coautores VALUES(42,'Yuan Yafeng, Yu Xiaobin, Jiang Qiushi, Zhang Zhongkai, Hu Xueqing,  Zhao Chunli, Cheng Zhiqiang');
INSERT INTO coautores VALUES(43,'Chen S. Y.');
INSERT INTO coautores VALUES(44,'Xing Zhifu, Lei Piao, Sikandar Aatika, Yang Ruowei, Wang Yuanyuan, Zhu Xiaofeng, Liu Xiaoyu, Fan Haiyan, Xuan Yuanhu, Chen Lijie, Duan Yuxi');
INSERT INTO coautores VALUES(45,'Liu Xingzhong');
INSERT INTO coautores VALUES(46,'Mohiuddin K. M., Laith Khalil Tawfeeq Al Ani, Nazmul Hassan Mohamad, Rojina Akter, Md. Sakhawat Hossain, Md. Niuz Morshed Khan');
INSERT INTO coautores VALUES(47,'Meiling Yao, Haiming Wang, Di Zhao, Xiaofeng Zhu, Yuanyuan Wang, Xiaoyu Liu, Yuxi Duan, Lijie Chen');
INSERT INTO coautores VALUES(48,'Kwasi S. Yobo, Mark D. Laing');
INSERT INTO coautores VALUES(49,'Faske Travis');
INSERT INTO coautores VALUES(50,'Angélica Miamoto, Durvalino Augusto Rodrigues Neto, Angélica Calandrelli, Monique Thiara R e Silva, Cláudia Regina Dias Arieira');



-- Insertar datos en la tabla palabras_claves
INSERT INTO palabras_claves VALUES(1,'Pruebas in vitro, hongos nematófagos, capacidad depredadora, Meloidogyne sp.');
INSERT INTO palabras_claves VALUES(2,'Antagonismo, control biológico, Meloidogyne, Radopholus, Paecilomyces, Pochonia');
INSERT INTO palabras_claves VALUES(3,'Biological control, Trichoderma spp., Glycine max, Root-lesion nematode, Host response');
INSERT INTO palabras_claves VALUES(4,'');
INSERT INTO palabras_claves VALUES(5,'biocontrol fungus Simplicillium chinense Snef5, response surface methodology, Meloidogyne incognita, fermentation optimization');
INSERT INTO palabras_claves VALUES(6,'crop rotation, endophytes, fungal communities, monoculture, soybean cyst nematode');
INSERT INTO palabras_claves VALUES(7,'bionematicides, synergism, plant-parasitic nematodes (PPNs), Meloidogyne enterolobii, chemotaxis');
INSERT INTO palabras_claves VALUES(8,'monoculture, suppressive soil, nematode natural decline, inhibitor, Heterodera glycines, Pochonia chlamydosporia');
INSERT INTO palabras_claves VALUES(9,'Cell-wall degrading enzymes, induced systemic resistance, antibiosis, Musa sp., Root-knot nematode');
INSERT INTO palabras_claves VALUES(10,'');
INSERT INTO palabras_claves VALUES(11,'biological control, Lentinula edodes, Macrocybe titans, Pleurotus eryngii, Root-knot nematode');
INSERT INTO palabras_claves VALUES(12,'');
INSERT INTO palabras_claves VALUES(13,'egg hatch, embryonated egg, fungal culture filtrate, Heterodera glycines, Hybrid strain, Protoplast fusion, Verticillium lecanii, second-stage juvenile, j2');
INSERT INTO palabras_claves VALUES(14,'Chaetomium murorum, Cylindrocarpon destructans var. Crassum, Paecilomyces lilacinus, fungal filtrate, juvenile mobility, sugar beet cyst nematode');
INSERT INTO palabras_claves VALUES(15,'culture filtrate, nematicidal effect, nematicidal compounds, entomopathogenic fungi, biological control');
INSERT INTO palabras_claves VALUES(16,'Estonian cyst nematodes, Cactodera estonica, Verticillium lecanii, Biological control, Biodiversity conservation');
INSERT INTO palabras_claves VALUES(17,'Gliocladium roseum, Purpureocillium lilacinum, Trichoderma harzianum, Beauveria bassiana, cyst nematodes, nematicidal activity');
INSERT INTO palabras_claves VALUES(18,'biological control, Meloidogyne javanica, Trichoderma harzianum, chitinase, peroxidase, polyphenol oxidase, phenylalanine ammonia lyase');
INSERT INTO palabras_claves VALUES(19,'Trichoderma longibrachiatum, Heterodera avenae, parasitic and lethal effects, biological control');
INSERT INTO palabras_claves VALUES(20,'Clonostachys rosea, nematicide, Meloidogyne incognita, molecular modeling, dihydro-4-hydroxy-2(3H)-furanone, 2,3-dihydroxy propanal');
INSERT INTO palabras_claves VALUES(21,'biocontrol, metabolomics profile, phytohormones, flavonoids, root-knot nematodes');
INSERT INTO palabras_claves VALUES(22,'Trichoderma citrinoviride, virulent strain, attenuated strain, mediated resistance, biocontrol mechanism');
INSERT INTO palabras_claves VALUES(23,'sugar beet cyst nematode, Heterodera schachtii, Pochonia chlamydosporia var chlamydosporia, juvenile mobility, fungal filtrates, sugar beet');
INSERT INTO palabras_claves VALUES(24,'Purpureocillium lilacinum, ITS 1-5,8S-ITS2, Meloidogyne incognita, Management, Chickpea');
INSERT INTO palabras_claves VALUES(25,'');
INSERT INTO palabras_claves VALUES(26,'chitinase, chitinolytic fungi, Lecanicillium antillanum B-3, Meloidogyne incognita');
INSERT INTO palabras_claves VALUES(27,'biocontrol, Pratylenchus vulnus, Verticillium leptobactrum, apple rootstock');
INSERT INTO palabras_claves VALUES(28,'nematodes suppression, pest control, seed treatment, biological control, plant growth promotion');
INSERT INTO palabras_claves VALUES(29,'nematophagous fungi, bioagents, promoting');
INSERT INTO palabras_claves VALUES(30,'Meloidogyne incognita, culture filtrates, Aspergillus flavus, Penicillium chrysogenum, Pochonia clamydosporia, cucumber');
INSERT INTO palabras_claves VALUES(31,'Trichoderma species, Heterodera avenae, nematicidal activity, fermentation media and conditions, Plackett–Burman design, Box–Behnken design, response surface methodology');
INSERT INTO palabras_claves VALUES(32,'biological fertilization, Bacillus subtilis, root lesion nematodes, Purpureocillium lilacinum, Trichoderma asperellum');
INSERT INTO palabras_claves VALUES(33,'biological control, Glycine max, nematophagous fungi, resistance induction, root lesion nematode');
INSERT INTO palabras_claves VALUES(34,'root-knot nematode, interaction of microorganisms, growth promoters');
INSERT INTO palabras_claves VALUES(35,'Fungi, liquid fermentation, plant nematode, resistant structure, two-potted spider mite');
INSERT INTO palabras_claves VALUES(36,'');
INSERT INTO palabras_claves VALUES(37,'alternative control, management, Purpureocillium lilacinum, root-lesion nematode, Trihcoderma harzianum');
INSERT INTO palabras_claves VALUES(38,'Glycine Max, root-knot nematode, biological control, Abamectin');
INSERT INTO palabras_claves VALUES(39,'Control, Trichoderma sp., Pratylenchus brachyurus, Mortality, Metabolites');
INSERT INTO palabras_claves VALUES(40,'Biocontrol, Nematode, Microorganisms');
INSERT INTO palabras_claves VALUES(41,'Helicotylenchus dihystera, Pratylenchus brachyurus, biological nematicide, chemical nematicide, winter crop');
INSERT INTO palabras_claves VALUES(42,'');
INSERT INTO palabras_claves VALUES(43,'biological control, Heterodera glycines, Hirsutella minnesotensis, Hirsutella rhossiliensis, nematophagous fungi, organic matter, parasitism, soil pH, soil texture, soybean cyst nematode');
INSERT INTO palabras_claves VALUES(44,'soybean, Penicillium janthinellum, scopoletin, seed coating, Heterodera glycines, biological agent');
INSERT INTO palabras_claves VALUES(45,'Biological control, Heterodera glycines, Hirsutella minnesotensis, Hirsutella rhossiliensis, Nematophagous fungi, Parasitism, Soybean cyst nematode');
INSERT INTO palabras_claves VALUES(46,'soybean, Bio-nematicide, biocontrol, Trichoderma, Meloidogyne.');
INSERT INTO palabras_claves VALUES(47,'Fungal bioagent, Nematode disease management, Plant growth promotion, Tomato');
INSERT INTO palabras_claves VALUES(48,'soybean; Bacillus spp.; nematodes');
INSERT INTO palabras_claves VALUES(49,'Abamectin, Behavior, Management, Seed treatment.');
INSERT INTO palabras_claves VALUES(50,'Cultivars, Glycine max, integrated management, nematicides, root-knot nematodes');


-- Insertar datos en la tabla microorganismos
INSERT INTO microorganismos VALUES(1,'Trichoderma sp., Monacrosporium sp., Paecilomyces sp., Fusarium sp., Fusarium oxysporum');
INSERT INTO microorganismos VALUES(2,'Pochonia, Lecanicillium, Arthrobotrys, Metarhizium, Paecilomyces');
INSERT INTO microorganismos VALUES(3,'Trichoderma asperellum, Trichoderma harzianum');
INSERT INTO microorganismos VALUES(4,'Metarhizium anisopilae');
INSERT INTO microorganismos VALUES(5,'Simplicillium chinense');
INSERT INTO microorganismos VALUES(6,'Hirsutella rhossiliensis, trichoderma gamsii');
INSERT INTO microorganismos VALUES(7,'Purpureocillium lilacinum');
INSERT INTO microorganismos VALUES(8,'Fusarium equiseti, Pochonia chlamydosporia, Purpureocillium lilacinum');
INSERT INTO microorganismos VALUES(9,'Trichoderma harzianum, Trichoderma asperellum');
INSERT INTO microorganismos VALUES(10,'Bacillus, Trichoderma');
INSERT INTO microorganismos VALUES(11,'Agaricus sp., Coprinus sp., Ganoderma sp., Lentinula sp., Lentinus sp., Macrocybe sp., Oudemansiella sp., Pleurotus sp., Pycnoporus sp., Polyporus sp.');
INSERT INTO microorganismos VALUES(12,'Beauveria bassiana');
INSERT INTO microorganismos VALUES(13,'Verticillium lecanii, Lecanicillium lecanii');
INSERT INTO microorganismos VALUES(14,'Paecilomyces lilacinus');
INSERT INTO microorganismos VALUES(15,'Beauveria bassiana');
INSERT INTO microorganismos VALUES(16,'Verticillium lecanii');
INSERT INTO microorganismos VALUES(17,'Gliocladium roseum, Purpureocillium lilacinum, Trichoderma harzianum, Beauveria bassiana');
INSERT INTO microorganismos VALUES(18,'Trichoderma harzianum');
INSERT INTO microorganismos VALUES(19,'Trichoderma longibrachiatum');
INSERT INTO microorganismos VALUES(20,'Clonostachys rosea');
INSERT INTO microorganismos VALUES(21,'Pochonia chlamydosporia');
INSERT INTO microorganismos VALUES(22,'Trichoderma citrinoviride');
INSERT INTO microorganismos VALUES(23,'Pochonia chlamydosporia');
INSERT INTO microorganismos VALUES(24,'Purpureocillium lilacinum');
INSERT INTO microorganismos VALUES(25,'Pochonia chlamydosporia');
INSERT INTO microorganismos VALUES(26,'Lecanicillium antillanum');
INSERT INTO microorganismos VALUES(27,'Verticillium leptobactrum');
INSERT INTO microorganismos VALUES(28,'Trichoderma bevicrassum, Trichoderma viride');
INSERT INTO microorganismos VALUES(29,'Paecilomyces spp., Trichoderma asperellum, Pochonia sp.');
INSERT INTO microorganismos VALUES(30,'Pochonia chlamydosporia');
INSERT INTO microorganismos VALUES(31,'Trichoderma longibrachiatum');
INSERT INTO microorganismos VALUES(32,'Trichoderma asperellum, Paecilomyces lilacinum');
INSERT INTO microorganismos VALUES(33,'Trichoderma spp.');
INSERT INTO microorganismos VALUES(34,'Purpureocillium lilacinum');
INSERT INTO microorganismos VALUES(35,'Purpureocillium lilacinum, Pochonia chlamydosporia');
INSERT INTO microorganismos VALUES(36,'Paecilomyces lilacinus, Purpureocillium lilacinum, Pochonia chlamydosporia, Trichoderma harzianum');
INSERT INTO microorganismos VALUES(37,'Purpureocillium lilacinum, Trichoderma harzianum');
INSERT INTO microorganismos VALUES(38,'Metarhizium anisopliae, Trichoderma harzianum, Beauveria bassiana, Paecilomces lilacinus');
INSERT INTO microorganismos VALUES(39,'Trichoderma spp.');
INSERT INTO microorganismos VALUES(40,'Pochonia chlamydosporia, Paecilomyces lilacinus, Trichoderma asperellum');
INSERT INTO microorganismos VALUES(41,'Purpureocillium lilacinum');
INSERT INTO microorganismos VALUES(42,'Purpureocillium lilacinus');
INSERT INTO microorganismos VALUES(43,'Hirsutella rhossiliensis, Hirsutella minnesotensis');
INSERT INTO microorganismos VALUES(44,'Penicillium janthinellum');
INSERT INTO microorganismos VALUES(45,'Hirsutella rhossiliensis, Hirsutella minnesotensis');
INSERT INTO microorganismos VALUES(46,'Trichoderma harzianum');
INSERT INTO microorganismos VALUES(47,'Trichoderma citrinoviride');
INSERT INTO microorganismos VALUES(48,'Bacillus spp.');
INSERT INTO microorganismos VALUES(49,'');
INSERT INTO microorganismos VALUES(50,'');



-- Insertar datos en la tabla nematodos
INSERT INTO nematodos VALUES(1,'Meloidogyne javanica');
INSERT INTO nematodos VALUES(2,'Meloidogyne sp., Radopholus sp.');
INSERT INTO nematodos VALUES(3,'Pratylenchus brachyurus');
INSERT INTO nematodos VALUES(4,'Nacobbus aberrans');
INSERT INTO nematodos VALUES(5,'Meloidogyne incognita');
INSERT INTO nematodos VALUES(6,'Heterodera glycines');
INSERT INTO nematodos VALUES(7,'Meloidogyne enterolobii');
INSERT INTO nematodos VALUES(8,'Heterodera glycines');
INSERT INTO nematodos VALUES(9,'Meloidogyne javanica');
INSERT INTO nematodos VALUES(10,'Helicotylenchus dihystera');
INSERT INTO nematodos VALUES(11,'Meloidogyne javanica');
INSERT INTO nematodos VALUES(12,'Heterodera filipjevi');
INSERT INTO nematodos VALUES(13,'Heterodera glycines');
INSERT INTO nematodos VALUES(14,'Heterodera schachtii');
INSERT INTO nematodos VALUES(15,'Pratylenchus thornei');
INSERT INTO nematodos VALUES(16,'Cactodera estonica');
INSERT INTO nematodos VALUES(17,'Heterodera glycines, Heterodera schachtii, Heterodera avenae');
INSERT INTO nematodos VALUES(18,'Meloidogyne javanica');
INSERT INTO nematodos VALUES(19,'Heterodera avenae');
INSERT INTO nematodos VALUES(20,'Meloidogyne incognita');
INSERT INTO nematodos VALUES(21,'Meloidogyne javanica');
INSERT INTO nematodos VALUES(22,'Meloidogyne incognita');
INSERT INTO nematodos VALUES(23,'Heterodera schachtii');
INSERT INTO nematodos VALUES(24,'Meloidogyne incognita');
INSERT INTO nematodos VALUES(25,'Globodera rostochiensis, Meloidogyne javanica');
INSERT INTO nematodos VALUES(26,'Meloidogyne incognita');
INSERT INTO nematodos VALUES(27,'Pratylenchus vulnus');
INSERT INTO nematodos VALUES(28,'Meloidogyne incognita');
INSERT INTO nematodos VALUES(29,'Pratylenchus brachyurus, Heterodera glycines, Meloidogyne javanica, Meloidogyne incognita');
INSERT INTO nematodos VALUES(30,'Meloidogyne incognita');
INSERT INTO nematodos VALUES(31,'Heterodera avenae');
INSERT INTO nematodos VALUES(32,'Pratylenchus brachyurus');
INSERT INTO nematodos VALUES(33,'Pratylenchus brachyurus');
INSERT INTO nematodos VALUES(34,'Meloidogyne incognita');
INSERT INTO nematodos VALUES(35,'Heterodera glycines');
INSERT INTO nematodos VALUES(36,'Aphelenchus besseyi');
INSERT INTO nematodos VALUES(37,'Pratylenchus brachyurus');
INSERT INTO nematodos VALUES(38,'Meloidogyne incognita');
INSERT INTO nematodos VALUES(39,'Pratylenchus brachyurus');
INSERT INTO nematodos VALUES(40,'Pratylenchus spp.');
INSERT INTO nematodos VALUES(41,'Pratylenchus brachyurus, Helicotylenchus dihystera');
INSERT INTO nematodos VALUES(42,'Heterodera glycines');
INSERT INTO nematodos VALUES(43,'Heterodera glycines');
INSERT INTO nematodos VALUES(44,'Heterodera glycines');
INSERT INTO nematodos VALUES(45,'Heterodera glycines');
INSERT INTO nematodos VALUES(46,'Meloidogyne incognita');
INSERT INTO nematodos VALUES(47,'Meloidogyne incognita');
INSERT INTO nematodos VALUES(48,'Meloidogyne javanica');
INSERT INTO nematodos VALUES(49,'Meloidogyne incognita');
INSERT INTO nematodos VALUES(50,'Meloidogyne javanica');



-- Insertar datos en la tabla metodologias_de_evaluacion
INSERT INTO  metodologias_de_evaluacion VALUES(1,'Agar agua 2%');
INSERT INTO  metodologias_de_evaluacion VALUES(2,'Agua destilada estéril o medio estéril');
INSERT INTO  metodologias_de_evaluacion VALUES(3,'Agua destilada estéril');
INSERT INTO  metodologias_de_evaluacion VALUES(4,'Agua destilada estéril');
INSERT INTO  metodologias_de_evaluacion VALUES(5,'Agua destilada estéril o medio estéril');
INSERT INTO  metodologias_de_evaluacion VALUES(6,'Medio estéril');
INSERT INTO  metodologias_de_evaluacion VALUES(7,'Agua destilada estéril o medio estéril');
INSERT INTO  metodologias_de_evaluacion VALUES(8,'Greenhouse');
INSERT INTO  metodologias_de_evaluacion VALUES(9,'Agua destilada estéril o medio estéril');
INSERT INTO  metodologias_de_evaluacion VALUES(10,'Agua destilada estéril o medio estéril');
INSERT INTO  metodologias_de_evaluacion VALUES(11,'Medio estéril');
INSERT INTO  metodologias_de_evaluacion VALUES(12,'Greenhouse');
INSERT INTO  metodologias_de_evaluacion VALUES(13,'Medio estéril');
INSERT INTO  metodologias_de_evaluacion VALUES(14,'Medio estéril');
INSERT INTO  metodologias_de_evaluacion VALUES(15,'Agua destilada estéril o medio estéril');
INSERT INTO  metodologias_de_evaluacion VALUES(16,'Agua destilada estéril');
INSERT INTO  metodologias_de_evaluacion VALUES(17,'Medio estéril');
INSERT INTO  metodologias_de_evaluacion VALUES(18,'Greenhouse');
INSERT INTO  metodologias_de_evaluacion VALUES(19,'Greenhouse');
INSERT INTO  metodologias_de_evaluacion VALUES(20,'Medio estéril');
INSERT INTO  metodologias_de_evaluacion VALUES(21,'Greenhouse');
INSERT INTO  metodologias_de_evaluacion VALUES(22,'Medio estéril');
INSERT INTO  metodologias_de_evaluacion VALUES(23,'Medio estéril');
INSERT INTO  metodologias_de_evaluacion VALUES(24,'Medio estéril');
INSERT INTO  metodologias_de_evaluacion VALUES(25,'Greenhouse');
INSERT INTO  metodologias_de_evaluacion VALUES(26,'Agar agua 1,5%');
INSERT INTO  metodologias_de_evaluacion VALUES(27,'Agar agua 2%, Agua destilada estéril y medio estéril');
INSERT INTO  metodologias_de_evaluacion VALUES(28,'');
INSERT INTO  metodologias_de_evaluacion VALUES(29,'Greenhouse');
INSERT INTO  metodologias_de_evaluacion VALUES(30,'Medio estéril');
INSERT INTO  metodologias_de_evaluacion VALUES(31,'Medio estéril');
INSERT INTO  metodologias_de_evaluacion VALUES(32,'Greenhouse');
INSERT INTO  metodologias_de_evaluacion VALUES(33,'Medio estéril');
INSERT INTO  metodologias_de_evaluacion VALUES(34,'Field');
INSERT INTO  metodologias_de_evaluacion VALUES(35,'Greenhouse');
INSERT INTO  metodologias_de_evaluacion VALUES(36,'Greenhouse');
INSERT INTO  metodologias_de_evaluacion VALUES(37,'Greenhouse and field');
INSERT INTO  metodologias_de_evaluacion VALUES(38,'Field');
INSERT INTO  metodologias_de_evaluacion VALUES(39,'Medio estéril');
INSERT INTO  metodologias_de_evaluacion VALUES(40,'Greenhouse');
INSERT INTO  metodologias_de_evaluacion VALUES(41,'Field');
INSERT INTO  metodologias_de_evaluacion VALUES(42,'Greenhouse');
INSERT INTO  metodologias_de_evaluacion VALUES(43,'Greenhouse');
INSERT INTO  metodologias_de_evaluacion VALUES(44,'Greenhouse and field');
INSERT INTO  metodologias_de_evaluacion VALUES(45,'Greenhouse');
INSERT INTO  metodologias_de_evaluacion VALUES(46,'Greenhouse');
INSERT INTO  metodologias_de_evaluacion VALUES(47,'Medio estéril, Greenhouse and field');
INSERT INTO  metodologias_de_evaluacion VALUES(48,'Greenhouse');
INSERT INTO  metodologias_de_evaluacion VALUES(49,'Greenhouse');
INSERT INTO  metodologias_de_evaluacion VALUES(50,'Greenhouse');



-- Insertar datos en la tabla porcentaje_mortalidad
INSERT INTO porcentaje_mortalidad VALUES(1,'70-96 Trichoderma, 34-59 Paecilomyces');
INSERT INTO porcentaje_mortalidad VALUES(2,'70-98 ');
INSERT INTO porcentaje_mortalidad VALUES(3,'41-65');
INSERT INTO porcentaje_mortalidad VALUES(4,'18-30');
INSERT INTO porcentaje_mortalidad VALUES(5,'73-88');
INSERT INTO porcentaje_mortalidad VALUES(6,'21 Hirsutella, 100 Trichoderma');
INSERT INTO porcentaje_mortalidad VALUES(7,'76-90');
INSERT INTO porcentaje_mortalidad VALUES(8,'1-16');
INSERT INTO porcentaje_mortalidad VALUES(9,'55-67 Trichoderma harzianum, 0 Trichoderma asperellum');
INSERT INTO porcentaje_mortalidad VALUES(10,'85');
INSERT INTO porcentaje_mortalidad VALUES(11,'6-95');
INSERT INTO porcentaje_mortalidad VALUES(12,'64');
INSERT INTO porcentaje_mortalidad VALUES(13,'1-31');
INSERT INTO porcentaje_mortalidad VALUES(14,'61-100');
INSERT INTO porcentaje_mortalidad VALUES(15,'64-100');
INSERT INTO porcentaje_mortalidad VALUES(16,'37-82');
INSERT INTO porcentaje_mortalidad VALUES(17,'75-98 Gliocladium roseum, 53-97 Purpureocillium lilacinum, 60-96 Trichoderma harzianum, 34-94 Beauveria bassiana');
INSERT INTO porcentaje_mortalidad VALUES(18,'');
INSERT INTO porcentaje_mortalidad VALUES(19,'90');
INSERT INTO porcentaje_mortalidad VALUES(20,'44-69');
INSERT INTO porcentaje_mortalidad VALUES(21,'29-47');
INSERT INTO porcentaje_mortalidad VALUES(22,'21-100');
INSERT INTO porcentaje_mortalidad VALUES(23,'4-12');
INSERT INTO porcentaje_mortalidad VALUES(24,'29-88');
INSERT INTO porcentaje_mortalidad VALUES(25,'');
INSERT INTO porcentaje_mortalidad VALUES(26,'80-90');
INSERT INTO porcentaje_mortalidad VALUES(27,'');
INSERT INTO porcentaje_mortalidad VALUES(28,'19-71');
INSERT INTO porcentaje_mortalidad VALUES(29,'');
INSERT INTO porcentaje_mortalidad VALUES(30,'70');
INSERT INTO porcentaje_mortalidad VALUES(31,'62-91');
INSERT INTO porcentaje_mortalidad VALUES(32,'56-86 Trichoderma asperellum, 86-92 Purpureocillium lilacinum');
INSERT INTO porcentaje_mortalidad VALUES(33,'6-99');
INSERT INTO porcentaje_mortalidad VALUES(34,'74-89');
INSERT INTO porcentaje_mortalidad VALUES(35,'');
INSERT INTO porcentaje_mortalidad VALUES(36,'66-90');
INSERT INTO porcentaje_mortalidad VALUES(37,'55-73');
INSERT INTO porcentaje_mortalidad VALUES(38,'55 Metarhizium, 62 Trichoderma, 66 Beauveria, 69 Paecilomyces');
INSERT INTO porcentaje_mortalidad VALUES(39,'24-82');
INSERT INTO porcentaje_mortalidad VALUES(40,'56');
INSERT INTO porcentaje_mortalidad VALUES(41,'55');
INSERT INTO porcentaje_mortalidad VALUES(42,'80');
INSERT INTO porcentaje_mortalidad VALUES(43,'');
INSERT INTO porcentaje_mortalidad VALUES(44,'45-65');
INSERT INTO porcentaje_mortalidad VALUES(45,'95-99');
INSERT INTO porcentaje_mortalidad VALUES(46,'');
INSERT INTO porcentaje_mortalidad VALUES(47,'50-100');
INSERT INTO porcentaje_mortalidad VALUES(48,'0-100');
INSERT INTO porcentaje_mortalidad VALUES(49,'');
INSERT INTO porcentaje_mortalidad VALUES(50,'60-99');




-- Insertar datos en la tabla resultados
INSERT INTO resultados VALUES(1,1,1,1,1,1,1,1,1,'Si','No','Si','Si','No','NA');
INSERT INTO resultados VALUES(2,2,2,2,2,2,2,2,2,'Si','Si','Si','Si','Si','NaOH 1N');
INSERT INTO resultados VALUES(3,3,3,3,3,3,3,3,3,'Si','Si','Si','Si','Si','NaOH 1N');
INSERT INTO resultados VALUES(4,4,4,4,4,4,4,4,4,'Si','No','No','No','Si','Alfiler, aguja, needle, ');
INSERT INTO resultados VALUES(5,5,5,5,5,5,5,5,5,'Si','Si','Si','No','Si','NaOH 1N');
INSERT INTO resultados VALUES(6,6,6,6,6,6,6,6,6,'Si','No','Si','No','Si','NaOH 1N');
INSERT INTO resultados VALUES(7,7,7,7,7,7,7,7,7,'Si','No','Si','Si','Si','NaOH 1N');
INSERT INTO resultados VALUES(8,8,8,8,8,8,8,8,8,'Si','No','Si','Si','No','NA');
INSERT INTO resultados VALUES(9,9,9,9,9,9,9,9,9,'Si','No','Si','No','Si','NaOH 1N');
INSERT INTO resultados VALUES(10,10,10,10,10,10,10,10,10,'Si','','','','','');
INSERT INTO resultados VALUES(11,11,11,11,11,11,11,11,11,'Si','Si','Si','Si','Si','NaOH 1N');
INSERT INTO resultados VALUES(12,12,12,12,12,12,12,12,12,'Si','No','Si','Si','No','NA');
INSERT INTO resultados VALUES(13,13,13,13,13,13,13,13,13,'Si','No','Si','Si','Si','NaOH 1N');
INSERT INTO resultados VALUES(14,14,14,14,14,14,14,14,14,'Si','No','Si','Si','Si','NaOH 1N');
INSERT INTO resultados VALUES(15,15,15,15,15,15,15,15,15,'Si','No','Si','No','Si','Alfiler, aguja, needle, ');
INSERT INTO resultados VALUES(16,16,16,16,16,16,16,16,16,'Si','No','Si','Si','No','NA');
INSERT INTO resultados VALUES(17,17,17,17,17,17,17,17,17,'','Si','Si','Si','Si','NaOH 1N');
INSERT INTO resultados VALUES(18,18,18,18,18,18,18,18,18,'Si','No','No','Si','No','NA');
INSERT INTO resultados VALUES(19,19,19,19,19,19,19,19,19,'Si','Si','No','Si','No','NA');
INSERT INTO resultados VALUES(20,20,20,20,20,20,20,20,20,'Si','No','Si','Si','Si','NaOH 1N');
INSERT INTO resultados VALUES(21,21,21,21,21,21,21,21,21,'Si','No','No','Si','No','NA');
INSERT INTO resultados VALUES(22,22,22,22,22,22,22,22,22,'Si','Si','Si','No','Si','NaOH 1N');
INSERT INTO resultados VALUES(23,23,23,23,23,23,23,23,23,'','No','Si','No','Si','NaOH 1N');
INSERT INTO resultados VALUES(24,24,24,24,24,24,24,24,24,'Si','Si','Si','Si','No','NA');
INSERT INTO resultados VALUES(25,25,25,25,25,25,25,25,25,'Si','No','No','Si','No','NA');
INSERT INTO resultados VALUES(26,26,26,26,26,26,26,26,26,'Si','No','No','Si','No','NA');
INSERT INTO resultados VALUES(27,27,27,27,27,27,27,27,27,'Si','No','Si','No','Si','NaOH 1N');
INSERT INTO resultados VALUES(28,28,28,28,28,28,28,28,28,'Si','','Si','Si','','');
INSERT INTO resultados VALUES(29,29,29,29,29,29,29,29,29,'Si','No','','','','');
INSERT INTO resultados VALUES(30,30,30,30,30,30,30,30,30,'Si','No','Si','No','Si','Alfiler, aguja, needle, ');
INSERT INTO resultados VALUES(31,31,31,31,31,31,31,31,31,'Si','No','Si','No','Si','Alfiler, aguja, needle, ');
INSERT INTO resultados VALUES(32,32,32,32,32,32,32,32,32,'Si','No','Si','Si','No','NA');
INSERT INTO resultados VALUES(33,33,33,33,33,33,33,33,33,'Si','No','Si','No','Si','NaOH 1N');
INSERT INTO resultados VALUES(34,34,34,34,34,34,34,34,34,'Si','No','Si','Si','No','NA');
INSERT INTO resultados VALUES(35,35,35,35,35,35,35,35,35,'Si','No','Si','Si','No','NA');
INSERT INTO resultados VALUES(36,36,36,36,36,36,36,36,36,'Si','No','Si','No','No','NA');
INSERT INTO resultados VALUES(37,37,37,37,37,37,37,37,37,'Si','No','Si','No','No','NA');
INSERT INTO resultados VALUES(38,38,38,38,38,38,38,38,38,'Si','No','Si','Si','No','NA');
INSERT INTO resultados VALUES(39,39,39,39,39,39,39,39,39,'Si','No','Si','No','Si','NaOH 1N');
INSERT INTO resultados VALUES(40,40,40,40,40,40,40,40,40,'Si','No','No','Si','No','NA');
INSERT INTO resultados VALUES(41,41,41,41,41,41,41,41,41,'Si','No','Si','No','No','NA');
INSERT INTO resultados VALUES(42,42,42,42,42,42,42,42,42,'Si','','','','','');
INSERT INTO resultados VALUES(43,43,43,43,43,43,43,43,43,'Si','No','No','Si','No','NA');
INSERT INTO resultados VALUES(44,44,44,44,44,44,44,44,44,'Si','No','Si','No','No','NA');
INSERT INTO resultados VALUES(45,45,45,45,45,45,45,45,45,'','No','No','Si','No','NA');
INSERT INTO resultados VALUES(46,46,46,46,46,46,46,46,46,'Si','No','Si','Si','No','NA');
INSERT INTO resultados VALUES(47,47,47,47,47,47,47,47,47,'Si','Si','Si','Si','Si','Alfiler, aguja, needle, ');
INSERT INTO resultados VALUES(48,48,48,48,48,48,48,48,48,'Si','No','Si','Si','No','NA');
INSERT INTO resultados VALUES(49,49,49,49,49,49,49,49,49,'Si','No','Si','Si','No','NA');
INSERT INTO resultados VALUES(50,50,50,50,50,50,50,50,50,'Si','No','Si','Si','No','NA');













-- Consultas básicas
select*from documento
select * from resultados
SELECT * FROM palabras_claves
SELECT * FROM coautores
SELECT * FROM microorganismos
SELECT * FROM nematodos
SELECT * FROM metodologias_de_evaluacion
SELECT * FROM porcentaje_mortalidad



-- Ordenar por el año de publicación de forma descendente o ascendente
SELECT * FROM documento ORDER BY ano_publicacion DESC;

SELECT * FROM documento ORDER BY ano_publicacion ASC;


-- Filtrar algo específico de una columna
SELECT * FROM documento WHERE titulo LIKE '%biocontrol%';

SELECT * 
FROM documento 
WHERE titulo LIKE '%Control%';

SELECT * 
FROM documento 
WHERE titulo LIKE '%Trichoderma%';

SELECT * 
FROM documento 
WHERE titulo LIKE '%Purpureocillium%';


--Por alguna razón el siguiente no arroja valor, así que tocaría buscarlo de otra manera
SELECT * 
FROM documento 
WHERE titulo LIKE '%Paecilomyces%';

-- Si se hace consulta con JOIN
SELECT *
FROM documento d
INNER JOIN palabras_claves pc ON d.documento_id = pc.palabras_claves_id
WHERE pc.palabra_clave LIKE '%Paecilomyces%'

SELECT *
FROM documento d
INNER JOIN palabras_claves pc ON d.documento_id = pc.palabras_claves_id
INNER JOIN porcentaje_mortalidad pm ON d.documento_id = pm.porcentaje_mortalidad_id
INNER JOIN microorganismos m ON d.documento_id = m.microorganismo_id
WHERE pc.palabra_clave LIKE '%Paecilomyces%'
OR pm.rango_mortalidad LIKE '%Paecilomyces%'
OR m.nombre_microorganismo LIKE '%Paecilomyces%'

SELECT*FROM documento



SELECT d.titulo, a.nombre_autor_principal, c.nombre_coautor
FROM documento d
INNER JOIN autores a ON d.autor_id = a.autor_id
INNER JOIN coautores c ON d.autor_id = c.coautor_id;




-- Cantidad de regristos en la base de datos
SELECT COUNT (*) AS total_documentos FROM documento;


--Seleccionar titulos de documento en base al nombre del autor principal
SELECT a.nombre_autor_principal, d.titulo
FROM autores a
INNER JOIN documento d ON a.autor_id = d.autor_id;


-- Seleccionar los archivos en impacto donde la cantidad de citaciones sean mayores a 100 a la marzo 2024
SELECT * FROM documento WHERE impacto_id IN (SELECT impacto_id FROM impacto WHERE cantidad_citaciones > 100);


SELECT d.titulo, a.nombre_autor_principal
FROM documento d
INNER JOIN autores a ON d.autor_id = a.autor_id;



--Filtrar por idiomas y cantidades o tipo de documento
SELECT DISTINCT pais_afiliacion_autor_principal
FROM autores;

SELECT idioma, COUNT(*) AS cantidad_documentos
FROM documento
GROUP BY idioma;

SELECT COUNT(*) AS total_documentos
FROM documento
WHERE idioma = 'Inglés';

SELECT nombre_tipo_documento, COUNT(*) AS cantidad_documentos
FROM tipo_documento
GROUP BY nombre_tipo_documento;



SELECT DISTINCT categoria_revista_col
FROM impacto;

SELECT categoria_revista_col, COUNT(*) AS cantidad_documentos
FROM impacto
GROUP BY categoria_revista_col;

SELECT COUNT(*) AS total_documentos
FROM impacto
WHERE categoria_revista_col = '';



SELECT d.titulo, t.nombre_tipo_documento, a.afiliacion_autor_principal, i.indexacion, i.doi_url
FROM documento d
INNER JOIN impacto i ON d.documento_id = i.impacto_id
INNER JOIN tipo_documento t ON d.documento_id = t.tipo_documento_id
INNER JOIN autores a ON d.documento_id = a.autor_id
WHERE categoria_revista_col = ''





--Subconsulta correlacionada:
SELECT *
FROM documento d
WHERE d.impacto_id IN (
    SELECT impacto_id
    FROM impacto
    WHERE cantidad_citaciones > (
        SELECT AVG(cantidad_citaciones) FROM impacto
    )
);



--Join múltiple:
SELECT a.nombre_autor_principal, d.titulo, m.nombre_microorganismo
FROM autores a
INNER JOIN documento d ON a.autor_id = d.autor_id
INNER JOIN microorganismos m ON d.documento_id = m.microorganismo_id;



--Agregar una nueva columna en la tabla resultados en base a lo que ya se tiene
select*from resultados

-- Agregar la columna 'Fiabilidad_Mortalidad'
ALTER TABLE resultados
ADD Fiabilidad_Mortalidad VARCHAR(10);

-- Actualizar los valores en la nueva columna
UPDATE resultados
SET Fiabilidad_Mortalidad = CASE
                                WHEN prueba_de_confirmacion = 'No' THEN 'No'
                                WHEN prueba_de_confirmacion = 'Si' THEN 'Si'
                                ELSE NULL -- Otra opción en caso de que no sea 'No' ni 'Si'
                             END;




-- Seleccionar una categoria de revista en colombia
SELECT doc.*
FROM documento doc
WHERE doc.impacto_id IN (
    SELECT imp.impacto_id
    FROM impacto imp
    WHERE imp.cantidad_citaciones > (
        SELECT AVG(imp2.cantidad_citaciones)
        FROM impacto imp2
        WHERE imp2.categoria_revista_col = 'A1'
    )
);




--Join con múltiples condiciones:
SELECT doc.*
FROM documento doc
INNER JOIN impacto imp ON doc.impacto_id = imp.impacto_id
WHERE imp.cantidad_citaciones > (
    SELECT AVG(imp2.cantidad_citaciones)
    FROM impacto imp2
    WHERE imp2.categoria_revista_col = imp.categoria_revista_col
)
AND CONVERT(INT, doc.ano_publicacion) > 2020;




SELECT ano_publicacion, COUNT(*) AS cantidad_documentos
FROM documento
GROUP BY ano_publicacion
HAVING COUNT(*) > 3
ORDER BY cantidad_documentos DESC;


