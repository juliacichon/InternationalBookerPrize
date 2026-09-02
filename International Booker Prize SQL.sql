-- 1. Stworzenie bazy danych:

drop database international_booker_prize;
create database international_booker_prize;

-- 2. Stworzenie tabeli z listą wszystkich nominowanych książek:
use international_booker_prize;

drop table if exists nominations;

create table nominations
(
	id INTEGER auto_increment primary key,
	award_year YEAR,
	rank_position VARCHAR(10),
	author VARCHAR(36) not null,
	title VARCHAR(60) not null,
	title_original VARCHAR(60),
	country VARCHAR(36),
	language VARCHAR(36),
	translator VARCHAR(36),
	publisher VARCHAR(36)
);

-- 3. Wprowadzenie ogranicznika dotyczącego roku konkursu:
alter table nominations
	add constraint award_year_ch 
	check (award_year >= 2016);

-- 4. Przekształcenie danych i import z pliku CSV:
/* prawy przycisk myszy na tabelę nominations w liście z lewej strony -> Import Data */

-- 4.2. Druga opcja, bez importowania zewntrznego pliku:
-- (aby zadziałało, trzeba dodać brakującą kolumnę przed wprowadzeniem zawartości)
alter table nominations
	add column translator2 VARCHAR(36);

insert into nominations
(award_year,rank_position,author,title,title_original,country,language,translator,translator2,publisher)
values
('2016','Winner','Han Kang','The Vegetarian','채식주의자','South Korea','Korean','Deborah Smith','','Portobello Books'),
('2016','Shortlist','José Eduardo Agualusa','A General Theory of Oblivion','Teoria Geral do Esquecimento','Angola','Portuguese','Daniel Hahn','','Harvill Secker'),
('2016','Shortlist','Elena Ferrante','The Story of the Lost Child','Storia della bambina perduta','Italy','Italian','Ann Goldstein','','Europa Editions'),
('2016','Shortlist','Orhan Pamuk','A Strangeness in My Mind','Kafamda Bir Tuhaflık','Turkey','Turkish','Ekin Oklap','','Faber & Faber'),
('2016','Shortlist','Robert Seethaler','A Whole Life','Ein ganzes Leben','Austria','German','Charlotte Collins','','Picador'),
('2016','Shortlist','Yan Lianke','The Four Books','四書','China','Mandarin','Carlos Rojas','','Chatto & Windus'),
('2016','Longlist','Maylis de Kerangal','Mend the Living','Réparer les vivants','France','French','Jessica Moore','','MacLehose Press'),
('2016','Longlist','Eka Kurniawan','Man Tiger','Lelaki Harimau','Indonesia','Indonesian','Labodalih Sembiring','','Verso Books'),
('2016','Longlist','Fiston Mwanza Mujila','Tram 83','Tram 83','DR Congo','French','Roland Glasser','','Jacaranda Books'),
('2016','Longlist','Raduan Nassar','A Cup of Rage','Um Copo de Cólera','Brazil','Portuguese','Stefan Tobler','','Penguin Modern Classics'),
('2016','Longlist','Marie NDiaye','Ladivine','Ladivine','France','French','Jordan Stump','','MacLehose Press'),
('2016','Longlist','Kenzaburō Ōe','Death by Water','水死','Japan','Japanese','Deborah Boliver Boehm','','Atlantic Books'),
('2016','Longlist','Aki Ollikainen','White Hunger','Nälkävuosi','Finland','Finnish','Emily Jeremiah','Fleur Jeremiah','Peirene Press'),
('2017','Winner','David Grossman','A Horse Walks into a Bar','סוסאחדנכנסלבר','Israel','Hebrew','Jessica Cohen','','Jonathan Cape'),
('2017','Shortlist','Mathias Énard','Compass','Boussole','France','French','Charlotte Mandell','','Fitzcarraldo Editions'),
('2017','Shortlist','Roy Jacobsen','The Unseen','De usynlige','Norway','Norwegian','Don Bartlett','Don Shaw','MacLehose Press'),
('2017','Shortlist','Dorthe Nors','Mirror, Shoulder, Signal','Spejl, skulder, blink','Denmark','Danish','Misha Hoekstra','','Pushkin Press'),
('2017','Shortlist','Amos Oz','Judas','הבשורהעלפייהודה','Israel','Hebrew','Nicholas de Lange','','Chatto & Windus'),
('2017','Shortlist','Samanta Schweblin','Fever Dream','Distancia de rescate','Argentina','Spanish','Megan McDowell','','Oneworld'),
('2017','Longlist','Wioletta Greg','Swallowing Mercury','Guguły','Poland','Polish','Eliza Marciniak','','Portobello Books'),
('2017','Longlist','Stefan Hertmans','War and Turpentine','Oorlog en terpentijn','Belgium','Dutch','David McKay','','Harvill Secker'),
('2017','Longlist','Ismail Kadare','The Traitor''s Niche','Kamarja e turpit','Albania','Albanian','John Hodgson','','Harvill Secker'),
('2017','Longlist','Alain Mabanckou','Black Moses','Petit Piment','France','French','Helen Stevenson','','Serpent''s Tail'),
('2017','Longlist','Clemens Meyer','Bricks and Mortar','Im Stein','Germany','German','Katy Derbyshire','','Fitzcarraldo Editions'),
('2017','Longlist','Jón Kalman Stefánsson','Fish Have No Feet','Fiskarnir hafa enga fætur','Iceland','Icelandic','Phil Roughton','','MacLehose Press'),
('2017','Longlist','Yan Lianke','The Explosion Chronicles','炸裂志','China','Mandarin','Carlos Rojas','','Chatto & Windus'),
('2018','Winner','Olga Tokarczuk','Flights','Bieguni','Poland','Polish','Jennifer Croft','','Fitzcarraldo Editions'),
('2018','Shortlist','Virginie Despentes','Vernon Subutex 1','Vernon Subutex 1','France','French','Frank Wynne','','MacLehose Press'),
('2018','Shortlist','Han Kang','The White Book','흰','South Korea','Korean','Deborah Smith','','Portobello Books'),
('2018','Shortlist','László Krasznahorkai','The World Goes On','Megy a világ','Hungary','Hungarian','John Batki, Ottilie Mulzet','George Szirtes','Tuskar Rock Press'),
('2018','Shortlist','Antonio Muñoz Molina','Like a Fading Shadow','Como la sombra que se va','Spain','Spanish','Camilo A. Ramirez','','Tuskar Rock Press'),
('2018','Shortlist','Ahmed Saadawi','Frankenstein in Baghdad','فرانكشتاينفيبغداد','Iraq','Arabic','Jonathan Wright','','Oneworld'),
('2018','Longlist','Laurent Binet','The 7th Function of Language','La Septième Fonction du langage','France','French','Sam Taylor','','Harvill Secker'),
('2018','Longlist','Javier Cercas','The Impostor','El impostor','Spain','Spanish','Frank Wynne','','MacLehose Press'),
('2018','Longlist','Jenny Erpenbeck','Go, Went, Gone','Gehen, ging, gegangen','Germany','German','Susan Bernofsky','','Portobello Books'),
('2018','Longlist','Ariana Harwicz','Die, My Love','Matate, amor','Argentina','Spanish','Sarah Moses','Carolina Orloff','Charco Press'),
('2018','Longlist','Christoph Ransmayr','The Flying Mountain','Der fliegende Berg','Austria','German','Simon Pare','','Seagull Books'),
('2018','Longlist','Wu Ming-Yi','The Stolen Bicycle','單車失竊記','Taiwan','Mandarin','Darryl Sterk','','Text Publishing'),
('2018','Longlist','Gabriela Ybarra','The Dinner Guest','El comensal','Spain','Spanish','Natasha Wimmer','','Harvill Secker'),
('2019','Winner','Jokha Alharthi','Celestial Bodies ','سيداتالقمر','Oman','Arabic','Marilyn Booth','','Sandstone Press'),
('2019','Shortlist','Annie Ernaux','The Years','Les années','France','French','Alison L. Strayer','','Fitzcarraldo Editions'),
('2019','Shortlist','Marion Poschmann','The Pine Islands','Die Kieferninseln','Germany','German','Jen Calleja','','Serpent''s Tail'),
('2019','Shortlist','Olga Tokarczuk','Drive Your Plow Over the Bones of the Dead','Prowadź swój pług przez kości umarłych','Poland','Polish','Antonia Lloyd-Jones','','Fitzcarraldo Editions'),
('2019','Shortlist','Juan Gabriel Vásquez','The Shape of the Ruins','La forma de las ruinas','Colombia','Spanish','Anne McLean','','MacLehose Press'),
('2019','Shortlist','Alia Trabucco Zerán','The Remainder','La resta','Chile','Spanish','Sophie Hughes','','And Other Stories'),
('2019','Longlist','Can Xue','Love in the New Millennium','新世纪爱情故事','China','Mandarin','Annelise Finegan Wasmoen','','Yale University Press'),
('2019','Longlist','Hwang Sok-yong','At Dusk','해질무렵','South Korea','Korean','Sora Kim-Russell','','Scribe'),
('2019','Longlist','Mazen Maarouf','Jokes for the Gunmen ','نكاتللمسلحين','Palestine Iceland','Arabic','Jonathan Wright','','Granta'),
('2019','Longlist','Hubert Mingarelli','Four Soldiers','Quatre soldats','France','French','Sam Taylor','','Portobello Books'),
('2019','Longlist','Samanta Schweblin','Mouthful of Birds','Pájaros en la boca','Argentina','Spanish','Megan McDowell','','Oneworld'),
('2019','Longlist','Sara Stridsberg','The Faculty of Dreams','Drömfakulteten','Sweden','Swedish','Deborah Bragan-Turner','','MacLehose Press'),
('2019','Longlist','Tommy Wieringa','The Death of Murat Idrissi','De dood van Murat Idrissi','Netherlands','Dutch','Sam Garrett','','Scribe'),
('2020','Winner','Marieke Lucas Rijneveld','The Discomfort of Evening','De avond is ongemak','Netherlands','Dutch','Michele Hutchison','','Faber & Faber'),
('2020','Shortlist','Shokoofeh Azar','The Enlightenment of the Greengage Tree   ','اشراقدرختگوجهسبز','Iran','Persian','Anonymous','','Europa Editions'),
('2020','Shortlist','Gabriela Cabezón Cámara','The Adventures of China Iron','Las aventuras de la China Iron','Argentina','Spanish','Iona Macintyre','Fiona Mackintosh','Charco Press'),
('2020','Shortlist','Daniel Kehlmann','Tyll','Tyll','Germany','German','Ross Benjamin','','Riverrun, Quercus'),
('2020','Shortlist','Fernanda Melchor','Hurricane Season','Temporada de huracanes','Mexico','Spanish','Sophie Hughes','','Fitzcarraldo Editions'),
('2020','Shortlist','Yōko Ogawa','The Memory Police','密やかな結晶','Japan','Japanese','Stephen Snyder','','Harvill Secker'),
('2020','Longlist','Willem Anker','Red Dog','Buys: ''n grensroman','South Africa','Afrikaans','Michiel Heyns','','Pushkin Press'),
('2020','Longlist','Jon Fosse','The Other Name: Septology I – II','Det andre namnet – Septologien I – II','Norway','Norwegian','Damion Searls','','Fitzcarraldo Editions'),
('2020','Longlist','Nino Haratischvili','The Eighth Life','Das achte Leben (Für Brilka)','Georgia Germany','German','Charlotte Collins','Ruth Martin','Scribe'),
('2020','Longlist','Michel Houellebecq','Serotonin','Sérotonine','France','French','Shaun Whiteside','','William Heinemann'),
('2020','Longlist','Emmanuelle Pagano','Faces on the Tip of My Tongue','Un renard à mains nues','France','French','Sophie Lewis','Jennifer Higgins','Peirene Press'),
('2020','Longlist','Samanta Schweblin','Little Eyes','Kentukis','Argentina','Spanish','Megan McDowell','','Oneworld'),
('2020','Longlist','Enrique Vila-Matas','Mac and His Problem','Mac y su contratiempo','Spain','Spanish','Margaret Jull Costa','Sophie Hughes','Harvill Secker'),
('2021','Winner','David Diop','At Night All Blood Is Black','Frère d''âme','France','French','Anna Moschovakis','','Pushkin Press'),
('2021','Shortlist','Mariana Enríquez','The Dangers of Smoking in Bed','Los peligros de fumar en la cama','Argentina','Spanish','Megan McDowell','','Granta'),
('2021','Shortlist','Benjamín Labatut','When We Cease to Understand the World','Un verdor terrible','Chile','Spanish','Adrian Nathan West','','Pushkin Press'),
('2021','Shortlist','Olga Ravn','The Employees','De ansatte','Denmark','Danish','Martin Aitken','','Lolli Editions'),
('2021','Shortlist','Maria Stepanova','In Memory of Memory ','Памятипамяти','Russia','Russian','Sasha Dugdale','','Fitzcarraldo Editions'),
('2021','Shortlist','Éric Vuillard','The War of the Poor','La Guerre des pauvres','France','French','Mark Polizzotti','','Picador'),
('2021','Longlist','Can Xue','I Live in the Slums','I Live in the Slums','China','Mandarin','Karen Gernant','Chen Zeping','Yale University Press'),
('2021','Longlist','Nana Ekvtimishvili','The Pear Field ','მსხლებისმინდორი','Georgia','Georgian','Elizabeth Heighway','','Peirene Press'),
('2021','Longlist','Ngũgĩ wa Thiong''o','The Perfect Nine The Epic of Gky and Mmbi','Kenda Mũiyũru: Rũgano rwa Gĩkũyũ na Mũmbi:ĩũũũ','Kenya','Kikuyu','Ngũgĩ wa Thiong''o','','Harvill Secker'),
('2021','Longlist','Jaap Robben','Summer Brother','Zomervacht','Netherlands','Dutch','David Doherty','','World Editions'),
('2021','Longlist','Judith Schalansky','An Inventory of Losses','Verzeichnis einiger Verluste','Germany','German','Jackie Smith','','MacLehose Press'),
('2021','Longlist','Adania Shibli','Minor Detail ','تفصيلثانوي','Palestine','Arabic','Elisabeth Jaquette','','Fitzcarraldo Editions'),
('2021','Longlist','Andrzej Tichý','Wretchedness','Eländet','Sweden','Swedish','Nichola Smalley','','And Other Stories'),
('2022','Winner','Geetanjali Shree','Tomb of Sand ','रेतसमाधि','India','Hindi','Daisy Rockwell','','Tilted Axis Press'),
('2022','Shortlist','Bora Chung','Cursed Bunny','저주토끼','South Korea','Korean','Anton Hur','','Honford Star'),
('2022','Shortlist','Jon Fosse','A New Name: Septology VI-VII','Eit nytt namn – Septologien VI – VII','Norway','Norwegian','Damion Searls','','Fitzcarraldo Editions'),
('2022','Shortlist','Mieko Kawakami','Heaven','ヘヴン','Japan','Japanese','Sam Bett','David Boyd','Picador'),
('2022','Shortlist','Claudia Piñeiro','Elena Knows','Elena sabe','Argentina','Spanish','Frances Riddle','','Charco Press'),
('2022','Shortlist','Olga Tokarczuk','The Books of Jacob','Księgi Jakubowe','Poland','Polish','Jennifer Croft','','Fitzcarraldo Editions'),
('2022','Longlist','Jonas Eika','After the Sun','Efter solen','Denmark','Danish','Sherilyn Hellberg','','Lolli Editions'),
('2022','Longlist','David Grossman','More Than I Love My Life   ','אתיהחייםמשחקהרבה','Israel','Hebrew','Jessica Cohen','','Jonathan Cape'),
('2022','Longlist','Violaine Huisman','The Book of Mother','Fugitive parce que reine','France','French','Leslie Camhi','','Scribner'),
('2022','Longlist','Fernanda Melchor','Paradais','Páradais','Mexico','Spanish','Sophie Hughes','','Fitzcarraldo Editions'),
('2022','Longlist','Sang Young Park','Love in the Big City ','대도시의사랑법','South Korea','Korean','Anton Hur','','Tilted Axis Press'),
('2022','Longlist','Norman Erikson Pasaribu','Happy Stories, Mostly','Cerita-cerita Bahagia, Hampir Seluruhnya','Indonesia','Indonesian','Tiffany Tsao','','Tilted Axis Press'),
('2022','Longlist','Paulo Scott','Phenotypes','Marrom e Amarelo','Brazil','Portuguese','Daniel Hahn','','And Other Stories'),
('2023','Winner','Georgi Gospodinov','Time Shelter','Времеубежище','Bulgaria','Bulgarian','Angela Rodel','','Weidenfeld & Nicolson'),
('2023','Shortlist','Eva Baltasar','Boulder','Boulder','Spain','Catalan','Julia Sanches','','And Other Stories'),
('2023','Shortlist','Cheon Myeong-kwan','Whale','고래','South Korea','Korean','Chi-Young Kim','','Europa Editions'),
('2023','Shortlist','Maryse Condé','The Gospel According to the New World','L''Évangile du nouveau monde','France','French','Richard Philcox','','World Editions'),
('2023','Shortlist','GauZ''','Standing Heavy','Debout-payé','Ivory Coast','French','Frank Wynne','','MacLehose Press'),
('2023','Shortlist','Guadalupe Nettel','Still Born','La hija única','Mexico','Spanish','Rosalind Harvey','','Fitzcarraldo Editions'),
('2023','Longlist','Vigdis Hjorth','Is Mother Dead','Er mor død','Norway','Norwegian','Charlotte Barslund','','Verso Fiction'),
('2023','Longlist','Andrey Kurkov','Jimi Hendrix Live in Lviv   ','ЛьвовскаягастрольДжимиХендрикса','Ukraine','Russian','Reuben Woolley','','MacLehose Press'),
('2023','Longlist','Laurent Mauvignier','The Birthday Party','Histoires de la nuit','France','French','Daniel Levin Becker','','Fitzcarraldo Editions'),
('2023','Longlist','Clemens Meyer','While We Were Dreaming','Als wir träumten','Germany','German','Katy Derbyshire','','Fitzcarraldo Editions'),
('2023','Longlist','Perumal Murugan','Pyre','பூக்குழி','India','Tamil','Aniruddhan Vasudevan','','Pushkin Press'),
('2023','Longlist','Amanda Svensson','A System So Magnificent It Is Blinding','Ett system så magnifikt att det bländar','Sweden','Swedish','Nichola Smalley','','Scribe'),
('2023','Longlist','Zou Jingzhi','Ninth Building','九栋','China','Mandarin','Jeremy Tiang','','Honford Star'),
('2024','Winner','Jenny Erpenbeck','Kairos','Kairos','Germany','German','Michael Hofmann','','Granta'),
('2024','Shortlist','Selva Almada','Not a River','No es un ro','Argentina','Spanish','Annie McDermott','','Charco Press'),
('2024','Shortlist','Ia Genberg','The Details','Detaljerna','Sweden','Swedish','Kira Josefsson','','Granta'),
('2024','Shortlist','Hwang Sok-yong','Mater 2-10 ','철도원삼대','South Korea','Korean','Sora Kim-Russell','Youngjae Josephine Bae','Scribe'),
('2024','Shortlist','Jente Posthuma','What Id Rather Not Think About','Waar ik liever niet aan denk’','Netherlands','Dutch','Sarah Timmer Harvey','','Scribe'),
('2024','Shortlist','Itamar Vieira Junior','Crooked Plow','Torto Arado','Brazil','Portuguese','Johnny Lorenz','','Verso Books'),
('2024','Longlist','Rodrigo Blanco Calderón','Simpatía','Simpatía','Venezuela','Spanish','Noel Hernández González','Daniel Hahn','Seven Stories Press'),
('2024','Longlist','Urszula Honek','White Nights','Białe noce','Poland','Polish','Kate Webster','','MTO Press'),
('2024','Longlist','Ismail Kadare','A Dictator Calls','Kur sunduesit grinden','Albania','Albanian','John Hodgson','','Harvill Secker'),
('2024','Longlist','Andrey Kurkov','The Silver Bone  ','СамсониНадежда','Ukraine','Russian','Boris Dralyuk','','MacLehose Press'),
('2024','Longlist','Veronica Raimo','Lost on Me','Niente di vero','Italy','Italian','Leah Janeczko','','Virago Press'),
('2024','Longlist','Domenico Starnone','The House on Via Gemito','Via Gemito','Italy','Italian','Oonagh Stransky','','Europa Editions'),
('2024','Longlist','Gabriela Wiener','Undiscovered','Huaco retrato','Peru','Spanish','Julia Sanches','','Pushkin Press'),
('2025','Winner','Banu Mushtaq','Heart Lamp Selected Stories ',':ಎದೆಯಹಣತೆ','India','Kannada','Deepa Bhasthi','','And Other Stories'),
('2025','Shortlist','Anne Serre','A Leopard-Skin Hat','Un chapeau léopard','France','French','Mark Hutchinson','','Lolli Editions'),
('2025','Shortlist','Vincenzo Latronico','Perfection','Le perfezioni','Italy','Italian','Sophie Hughes','','Fitzcarraldo Editions'),
('2025','Shortlist','Hiromi Kawakami','Under the Eye of the Big Bird','大きな鳥にさらわれないよう','Japan','Japanese','Asa Yoneda','','Granta'),
('2025','Shortlist','Vincent Delecroix','Small Boat','Naufrage','France','French','Helen Stevenson','','Small Axes'),
('2025','Shortlist','Solvej Balle','On the Calculation of Volume I','Om udregning af rumfang','Denmark','Danish','Barbara J Haveland','','Faber & Faber'),
('2025','Longlist','Ibtisam Azem','The Book of Disappearance ','سفرالإختفاء','Palestine','Arabic','Sinan Antoon','','And Other Stories'),
('2025','Longlist','Gaëlle Bélem','There''s a Monster Behind the Door','Un monstre est là, derrière la porte','France','French','Karen Fleetwood','Laëtitia Saint-Loubert','Bullaun Press'),
('2025','Longlist','Mircea Cărtărescu','Solenoid','Solenoid','Romania','Romanian','Sean Cotter','','Pushkin Press'),
('2025','Longlist','Dahlia de la Cerda','Reservoir Bitches','Perras de reserva','Mexico','Spanish','Heather Cleary','Julia Sanches','Scribe'),
('2025','Longlist','Saou Ichikawa','Hunchback','ハンチバック','Japan','Japanese','Polly Barton','','Viking Press'),
('2025','Longlist','Christian Kracht','Eurotrash','Eurotrash','Switzerland','German','Daniel Bowles','','Serpent''s Tail'),
('2025','Longlist','Astrid Roemer','On a Woman''s Madness','Over de gekte van een vrouw','Suriname   Netherlands','Dutch','Lucy Scott','','Tilted Axis Press')
;

-- 5. Zmiana nazwy kolumny "translator" oraz przesunięcie i uzupełnienie pustych wartości kolumny "translator2":
alter table nominations
	rename column translator
	to translator1;

alter table nominations
	modify column translator2 VARCHAR(36) null
	after translator1;

update nominations
	set translator2 = null 
	where translator2 = '';

-- 6. Uzupełnienie danych o wyniki najnowszej edycji konkursu:
insert into nominations
(award_year,rank_position,author,title,title_original,country,language,translator1,translator2,publisher)
values
(2026,'Winner','Yáng Shuāng-zǐ','Taiwan Travelogue','臺灣漫遊錄','Taiwan','Traditional Mandarin','Lin King',null,'And Other Stories'),
(2026,'Shortlist','Marie NDiaye','The Witch','La Sorcière','France','French','Jordan Stump',null,'MacLehose Press'),
(2026,'Shortlist','Ana Paula Maia','On Earth As It Is Beneath','Assim na Terra como embaixo da Terra','Brazil','Portuguese','Padma Viswanathan',null,'Charco Press'),
(2026,'Shortlist','Daniel Kehlmann','The Director','Lichtspiel','Germany','German','Ross Benjamin',null,'riverrun'),
(2026,'Shortlist','Rene Karabash','She Who Remains','Остайница','Bulgaria','Bulgarian','Izidora Angel',null,'Peirene Press'),
(2026,'Shortlist','Shida Bazyar','The Nights Are Quiet in Tehran','Nachts ist es leise in Teheran','Germany','German','Ruth Martin',null,'Scribe UK'),
(2026,'Longlist','Olga Ravn','The Wax Child','Voksbarnet','Denmark','Danish','Martin Aitken',null,'Viking'),
(2026,'Longlist','Shahrnush Parsipur','Women Without Men','زنان بدون مردان','Iran','Farsi','Faridoun Farrokh',null,'Penguin International Writers'),
(2026,'Longlist','Matteo Melchiorre','The Duke','Il Duca','Italy','Italian','Antonella Lettieri',null,'Foundry Editions'),
(2026,'Longlist','Ia Genberg','Small Comfort','Klen tröst','Sweden','Swedish','Kira Josefsson',null,'Wildfire Books'),
(2026,'Longlist','Mathias Énard','The Deserters','Déserter','France','French','Charlotte Mandell',null,'Fitzcarraldo Editions'),
(2026,'Longlist','Anjet Daanje','The Remembered Soldier','De herinnerde soldaat','Netherlands','Dutch','David McKay',null,'Scribe UK'),
(2026,'Longlist','Gabriela Cabezón Cámara','We Are Green and Trembling','Las niñas del naranjel','Argentina','Spanish','Robin Myers',null,'Harvill'),
(2026,'Longlist','Gabriela Cabezón Cámara','We Are Green and Trembling','Las niñas del naranjel','Argentina','Spanish','Robin Myers',null,'Harvill')
;

-- 7. Dodawanie drugiego kraju autora:
alter table nominations
	add column country2 VARCHAR(36) null
	after country;

update nominations
	set 
		country2 = 
			case
				when author = 'Daniel Kehlmann' then 'Austria'
				when author = 'Astrid Roemer' then 'Netherlands'
				when author = 'Nino Haratischvili' then 'Germany'
				when author = 'Mazen Maarouf' then 'Palestine'
			end,
		country = 
			case
				when author = 'Daniel Kehlmann' then 'Germany'
				when author = 'Astrid Roemer' then 'Suriname'
				when author = 'Nino Haratischvili' then 'Georgia'
				when author = 'Mazen Maarouf' then 'Iceland'
			end
	where author in ('Daniel Kehlmann','Astrid Roemer','Nino Haratischvili','Mazen Maarouf');

-- 8. Usuwanie zduplikowanego rekordu:
delete from nominations
where id = 144;

-- 9. Przekształcenie kolumny z poziomem zdobytego wyróżnienia na osobne kolumny typu prawda/fałsz:
alter table nominations
	add column shortlist BOOL default 0 after award_year,
	add column winner BOOL default 0 after shortlist;

update nominations
	set shortlist = 1
	where rank_position = 'Shortlist' or rank_position = 'Winner';

update nominations
	set winner = 1
	where rank_position = 'Winner';

alter table nominations
	drop column rank_position;

-- 10. Stworzenie nowej tabeli zawierającej informacje o oryginalnych wydaniach książęk:
create  table original_editions as
	select 
		id,
		title_original,
		author,
		country,
		country2,
		language
	from nominations;

-- 11. Utworzenie klucza obcego na tabeli:
alter table original_editions
add constraint id_foreign_key
	foreign key (id)
	references nominations(id)
	on delete cascade;

-- 12. Stworzenie nowej kolumny dla daty oryginalnej publikacji książki oraz uzupełnienie wartości:		
alter table original_editions 
	add column original_publishing_date DATE;

update original_editions
set original_publishing_date = 
	case
when author = 'Han Kang' and title_original = '채식주의자' then '2007-10-30'
when author = 'José Eduardo Agualusa' and title_original = 'Teoria Geral do Esquecimento' then '2012-01-01'
when author = 'Elena Ferrante' and title_original = 'Storia della bambina perduta' then '2014-10-29'
when author = 'Orhan Pamuk' and title_original = 'Kafamda Bir Tuhaflık' then '2014-12-12'
when author = 'Robert Seethaler' and title_original = 'Ein ganzes Leben' then '2014-07-28'
when author = 'Yan Lianke' and title_original = '四書' then '2011-01-01'
when author = 'Maylis de Kerangal' and title_original = 'Réparer les vivants' then '2014-01-01'
when author = 'Eka Kurniawan' and title_original = 'Lelaki Harimau' then '2004-01-01'
when author = 'Fiston Mwanza Mujila' and title_original = 'Tram 83' then '2014-08-21'
when author = 'Raduan Nassar' and title_original = 'Um Copo de Cólera' then '1978-01-01'
when author = 'Marie NDiaye' and title_original = 'Ladivine' then '2014-10-09'
when author = 'Kenzaburō Ōe' and title_original = '水死' then '2009-12-15'
when author = 'Aki Ollikainen' and title_original = 'Nälkävuosi' then '2012-03-01'
when author = 'David Grossman' and title_original = 'סוסאחדנכנסלבר' then '2014-08-01'
when author = 'Mathias Énard' and title_original = 'Boussole' then '2015-08-19'
when author = 'Roy Jacobsen' and title_original = 'De usynlige' then '2013-08-15'
when author = 'Dorthe Nors' and title_original = 'Spejl, skulder, blink' then '2016-02-02'
when author = 'Amos Oz' and title_original = 'הבשורהעלפייהודה' then '2014-10-15'
when author = 'Samanta Schweblin' and title_original = 'Distancia de rescate' then '2014-10-02'
when author = 'Wioletta Greg' and title_original = 'Guguły' then '2014-02-11'
when author = 'Stefan Hertmans' and title_original = 'Oorlog en terpentijn' then '2013-09-02'
when author = 'Ismail Kadare' and title_original = 'Kamarja e turpit' then '1978-01-01'
when author = 'Alain Mabanckou' and title_original = 'Petit Piment' then '2015-08-20'
when author = 'Clemens Meyer' and title_original = 'Im Stein' then '2013-08-22'
when author = 'Jón Kalman Stefánsson' and title_original = 'Fiskarnir hafa enga fætur' then '2013-10-05'
when author = 'Yan Lianke' and title_original = '炸裂志' then '2013-05-01'
when author = 'Olga Tokarczuk' and title_original = 'Bieguni' then '2007-09-27'
when author = 'Virginie Despentes' and title_original = 'Vernon Subutex 1' then '2015-01-07'
when author = 'Han Kang' and title_original = '흰' then '2016-05-25'
when author = 'László Krasznahorkai' and title_original = 'Megy a világ' then '2013-03-01'
when author = 'Antonio Muñoz Molina' and title_original = 'Como la sombra que se va' then '2014-11-25'
when author = 'Ahmed Saadawi' and title_original = 'فرانكشتاينفيبغداد' then '2013-03-01'
when author = 'Laurent Binet' and title_original = 'La Septième Fonction du langage' then '2015-08-19'
when author = 'Javier Cercas' and title_original = 'El impostor' then '2014-11-13'
when author = 'Jenny Erpenbeck' and title_original = 'Gehen, ging, gegangen' then '2015-08-31'
when author = 'Ariana Harwicz' and title_original = 'Matate, amor' then '2012-11-08'
when author = 'Christoph Ransmayr' and title_original = 'Der fliegende Berg' then '2006-09-22'
when author = 'Wu Ming-Yi' and title_original = '單車失竊記' then '2015-06-30'
when author = 'Gabriela Ybarra' and title_original = 'El comensal' then '2015-09-03'
when author = 'Jokha Alharthi' and title_original = 'سيداتالقمر' then '2010-01-01'
when author = 'Annie Ernaux' and title_original = 'Les années' then '2008-02-07'
when author = 'Marion Poschmann' and title_original = 'Die Kieferninseln' then '2017-09-13'
when author = 'Olga Tokarczuk' and title_original = 'Prowadź swój pług przez kości umarłych' then '2009-11-25'
when author = 'Juan Gabriel Vásquez' and title_original = 'La forma de las ruinas' then '2015-11-11'
when author = 'Alia Trabucco Zerán' and title_original = 'La resta' then '2015-01-01'
when author = 'Can Xue' and title_original = '新世纪爱情故事' then '2013-06-01'
when author = 'Hwang Sok-yong' and title_original = '해질무렵' then '2015-11-04'
when author = 'Mazen Maarouf' and title_original = 'نكاتللمسلحين' then '2015-04-21'
when author = 'Hubert Mingarelli' and title_original = 'Quatre soldats' then '2003-01-03'
when author = 'Samanta Schweblin' and title_original = 'Pájaros en la boca' then '2009-01-01'
when author = 'Sara Stridsberg' and title_original = 'Drömfakulteten' then '2006-01-20'
when author = 'Tommy Wieringa' and title_original = 'De dood van Murat Idrissi' then '2017-03-03'
when author = 'Marieke Lucas Rijneveld' and title_original = 'De avond is ongemak' then '2018-01-31'
when author = 'Shokoofeh Azar' and title_original = 'اشراقدرختگوجهسبز' then '2019-05-08'
when author = 'Gabriela Cabezón Cámara' and title_original = 'Las aventuras de la China Iron' then '2017-10-01'
when author = 'Daniel Kehlmann' and title_original = 'Tyll' then '2017-10-11'
when author = 'Fernanda Melchor' and title_original = 'Temporada de huracanes' then '2017-05-12'
when author = 'Yōko Ogawa' and title_original = '密やかな結晶' then '2994-01-26'
when author = 'Willem Anker' and title_original = 'Buys: ''n grensroman' then '2014-12-10'
when author = 'Jon Fosse' and title_original = 'Det andre namnet – Septologien I – II' then '2019-09-01'
when author = 'Nino Haratischvili' and title_original = 'Das achte Leben (Für Brilka)' then '2014-09-01'
when author = 'Michel Houellebecq' and title_original = 'Sérotonine' then '2019-01-04'
when author = 'Emmanuelle Pagano' and title_original = 'Un renard à mains nues' then '2012-04-05'
when author = 'Samanta Schweblin' and title_original = 'Kentukis' then '2018-10-01'
when author = 'Enrique Vila-Matas' and title_original = 'Mac y su contratiempo' then '2017-02-14'
when author = 'David Diop' and title_original = 'Frère d''âme' then '2018-08-16'
when author = 'Mariana Enríquez' and title_original = 'Los peligros de fumar en la cama' then '2009-01-01'
when author = 'Benjamín Labatut' and title_original = 'Un verdor terrible' then '2020-08-30'
when author = 'Olga Ravn' and title_original = 'De ansatte' then '2018-05-24'
when author = 'Maria Stepanova' and title_original = 'Памятипамяти' then '2017-11-01'
when author = 'Éric Vuillard' and title_original = 'La Guerre des pauvres' then '2019-01-10'
when author = 'Can Xue' and title_original = 'I Live in the Slums' then '2020-05-01'
when author = 'Nana Ekvtimishvili' and title_original = 'მსხლებისმინდორი' then '2015-05-11'
when author = 'Ngũgĩ wa Thiong''o' and title_original = 'Kenda Mũiyũru: Rũgano rwa Gĩkũyũ na Mũmbi:ĩũũũ' then '2018-12-28'
when author = 'Jaap Robben' and title_original = 'Zomervacht' then '2018-09-04'
when author = 'Judith Schalansky' and title_original = 'Verzeichnis einiger Verluste' then '2018-01-01'
when author = 'Adania Shibli' and title_original = 'تفصيلثانوي' then '2017-06-19'
when author = 'Andrzej Tichý' and title_original = 'Eländet' then '2026-08-05'
when author = 'Geetanjali Shree' and title_original = 'रेतसमाधि' then '2018-01-01'
when author = 'Bora Chung' and title_original = '저주토끼' then '2017-03-15'
when author = 'Jon Fosse' and title_original = 'Eit nytt namn – Septologien VI – VII' then '2021-09-06'
when author = 'Mieko Kawakami' and title_original = 'ヘヴン' then '2009-09-02'
when author = 'Claudia Piñeiro' and title_original = 'Elena sabe' then '2007-10-30'
when author = 'Olga Tokarczuk' and title_original = 'Księgi Jakubowe' then '2014-10-23'
when author = 'Jonas Eika' and title_original = 'Efter solen' then '2018-04-18'
when author = 'David Grossman' and title_original = 'אתיהחייםמשחקהרבה' then '2019-03-01'
when author = 'Violaine Huisman' and title_original = 'Fugitive parce que reine' then '2018-01-11'
when author = 'Fernanda Melchor' and title_original = 'Páradais' then '2021-02-02'
when author = 'Sang Young Park' and title_original = '대도시의사랑법' then '2019-06-28'
when author = 'Norman Erikson Pasaribu' and title_original = 'Cerita-cerita Bahagia, Hampir Seluruhnya' then '2020-10-01'
when author = 'Paulo Scott' and title_original = 'Marrom e Amarelo' then '2019-08-01'
when author = 'Georgi Gospodinov' and title_original = 'Времеубежище' then '2020-04-29'
when author = 'Eva Baltasar' and title_original = 'Boulder' then '2020-03-12'
when author = 'Cheon Myeong-kwan' and title_original = '고래' then '2004-12-24'
when author = 'Maryse Condé' and title_original = 'L''Évangile du nouveau monde' then '2021-09-02'
when author = 'GauZ''' and title_original = 'Debout-payé' then '2014-08-28'
when author = 'Guadalupe Nettel' and title_original = 'La hija única' then '2020-09-16'
when author = 'Vigdis Hjorth' and title_original = 'Er mor død' then '2020-08-21'
when author = 'Andrey Kurkov' and title_original = 'ЛьвовскаягастрольДжимиХендрикса' then '2012-01-01'
when author = 'Laurent Mauvignier' and title_original = 'Histoires de la nuit' then '2020-09-03'
when author = 'Clemens Meyer' and title_original = 'Als wir träumten' then '2006-02-28'
when author = 'Perumal Murugan' and title_original = 'பூக்குழி' then '2013-07-28'
when author = 'Amanda Svensson' and title_original = 'Ett system så magnifikt att det bländar' then '2019-03-14'
when author = 'Zou Jingzhi' and title_original = '九栋' then '2010-10-01'
when author = 'Jenny Erpenbeck' and title_original = 'Kairos' then '2021-08-30'
when author = 'Selva Almada' and title_original = 'No es un ro' then '2020-01-01'
when author = 'Ia Genberg' and title_original = 'Detaljerna' then '2022-01-06'
when author = 'Hwang Sok-yong' and title_original = '철도원삼대' then '2020-06-01'
when author = 'Jente Posthuma' and title_original = 'Waar ik liever niet aan denk’' then '2020-05-26'
when author = 'Itamar Vieira Junior' and title_original = 'Torto Arado' then '2019-02-01'
when author = 'Rodrigo Blanco Calderón' and title_original = 'Simpatía' then '2021-05-20'
when author = 'Urszula Honek' and title_original = 'Białe noce' then '2022-01-26'
when author = 'Ismail Kadare' and title_original = 'Kur sunduesit grinden' then '2023-08-31'
when author = 'Andrey Kurkov' and title_original = 'СамсониНадежда' then '2020-10-01'
when author = 'Veronica Raimo' and title_original = 'Niente di vero' then '2022-02-01'
when author = 'Domenico Starnone' and title_original = 'Via Gemito' then '2000-09-01'
when author = 'Gabriela Wiener' and title_original = 'Huaco retrato' then '2021-10-07'
when author = 'Banu Mushtaq' and title_original = ':ಎದೆಯಹಣತೆ' then '2024-09-10'
when author = 'Anne Serre' and title_original = 'Un chapeau léopard' then '2008-05-15'
when author = 'Vincenzo Latronico' and title_original = 'Le perfezioni' then '2022-03-16'
when author = 'Hiromi Kawakami' and title_original = '大きな鳥にさらわれないよう' then '2016-04-22'
when author = 'Vincent Delecroix' and title_original = 'Naufrage' then '2023-08-17'
when author = 'Solvej Balle' and title_original = 'On the Calculation of Volume IOm udregning af rumfang' then '2020-02-02'
when author = 'Ibtisam Azem' and title_original = 'سفرالإختفاء' then '2014-01-01'
when author = 'Gaëlle Bélem' and title_original = 'Un monstre est là, derrière la porte' then '2020-03-05'
when author = 'Mircea Cărtărescu' and title_original = 'Solenoid' then '2015-11-18'
when author = 'Dahlia de la Cerda' and title_original = 'Perras de reserva' then '2019-01-01'
when author = 'Saou Ichikawa' and title_original = 'ハンチバック' then '2023-06-22'
when author = 'Christian Kracht' and title_original = 'Eurotrash' then '2021-03-04'
when author = 'Astrid Roemer' and title_original = 'Over de gekte van een vrouw' then '1982-01-01'
when author = 'Yáng Shuāng-zǐ' and title_original = '臺灣漫遊錄' then '2020-03-31'
when author = 'Marie Ndiaye' and title_original = 'La Sorcière' then '1996-08-01'
when author = 'Ana Paula Maia' and title_original = 'Assim na Terra como embaixo da Terra' then '2017-08-04'
when author = 'Daniel Kehlmann' and title_original = 'Lichtspiel' then '2023-10-10'
when author = 'Rene Karabash' and title_original = 'Остайница' then '2028-03-26'
when author = 'Shida Bazyar' and title_original = 'Nachts ist es leise in Teheran' then '2016-02-18'
when author = 'Olga Ravn' and title_original = 'Voksbarnet' then '2023-09-10'
when author = 'Shahrnush Parsipur' and title_original = 'زنان بدون مردان' then '1989-01-01'
when author = 'Matteo Melchiorre' and title_original = 'Il Duca' then '2022-06-07'
when author = 'Ia Genberg' and title_original = 'Klen tröst' then '2018-03-12'
when author = 'Mathias Énard' and title_original = 'Déserter' then '2023-08-23'
when author = 'Anjet Daanje' and title_original = 'De herinnerde soldaat' then '2019-11-22'
when author = 'Gabriela Cabezón Cámara' and title_original = 'Las niñas del naranjel' then '2023-10-01'
else null
	end
where id between 1 and 143;

-- 13. Stworzenie nowej tabeli zawierającej informacje o anglojęzycznych edycjach książęk:
create  table english_editions
(
	id INT,
	author VARCHAR(36),
	english_title VARCHAR(60),
	translator1 VARCHAR(36),
	translator2 VARCHAR(36),
	publisher VARCHAR(50),
	publishing_date DATE,
	foreign key (id) 
		references nominations(id) 
		on delete cascade
);

-- 14. Uzupełnienie wartości w tabeli wydań anglojęzycznych danymi istniejącymi już w bazie:
insert into english_editions
	(id,author,english_title,translator1,translator2,publisher)
select 
	id,
	author,
	title,
	translator1,
	translator2,
	publisher
from nominations;

-- 15. Wprowadzenie dat opublikowania anglojęzycznego tłumaczenia książki:
update english_editions
set publishing_date = 
	case
when author = 'Han Kang' and english_title  = 'The Vegetarian' then '2015-01-01'
when author = 'José Eduardo Agualusa' and english_title  = 'A General Theory of Oblivion' then '2015-06-25'
when author = 'Elena Ferrante' and english_title  = 'The Story of the Lost Child' then '2015-09-01'
when author = 'Orhan Pamuk' and english_title  = 'A Strangeness in My Mind' then '2016-07-07'
when author = 'Robert Seethaler' and english_title  = 'A Whole Life' then '2015-09-08'
when author = 'Yan Lianke' and english_title  = 'The Four Books' then '2016-03-03'
when author = 'Maylis de Kerangal' and english_title  = 'Mend the Living' then '2016-06-23'
when author = 'Eka Kurniawan' and english_title  = 'Man Tiger' then '2015-09-15'
when author = 'Fiston Mwanza Mujila' and english_title  = 'Tram 83' then '2015-09-30'
when author = 'Raduan Nassar' and english_title  = 'A Cup of Rage' then '2016-01-07'
when author = 'Marie NDiaye' and english_title  = 'Ladivine' then '2016-03-17'
when author = 'Kenzaburō Ōe' and english_title  = 'Death by Water' then '2016-07-07'
when author = 'Aki Ollikainen' and english_title  = 'White Hunger' then '2015-03-01'
when author = 'David Grossman' and english_title  = 'A Horse Walks into a Bar' then '2017-06-16'
when author = 'Mathias Énard' and english_title  = 'Compass' then '2017-03-27'
when author = 'Roy Jacobsen' and english_title  = 'The Unseen' then '2017-05-15'
when author = 'Dorthe Nors' and english_title  = 'Mirror, Shoulder, Signal' then '2016-02-23'
when author = 'Amos Oz' and english_title  = 'Judas' then '2017-05-04'
when author = 'Samanta Schweblin' and english_title  = 'Fever Dream' then '2017-10-05'
when author = 'Wioletta Greg' and english_title  = 'Swallowing Mercury' then '2017-11-02'
when author = 'Stefan Hertmans' and english_title  = 'War and Turpentine' then '2017-05-04'
when author = 'Ismail Kadare' and english_title  = 'The Traitor''s Niche' then '2017-01-19'
when author = 'Alain Mabanckou' and english_title  = 'Black Moses' then '2017-09-07'
when author = 'Clemens Meyer' and english_title  = 'Bricks and Mortar' then '2016-10-18'
when author = 'Jón Kalman Stefánsson' and english_title  = 'Fish Have No Feet' then '2016-08-25'
when author = 'Yan Lianke' and english_title  = 'The Explosion Chronicles' then '2016-08-25'
when author = 'Olga Tokarczuk' and english_title  = 'Flights' then '2017-05-17'
when author = 'Virginie Despentes' and english_title  = 'Vernon Subutex 1' then '2018-03-22'
when author = 'Han Kang' and english_title  = 'The White Book' then '2018-05-05'
when author = 'László Krasznahorkai' and english_title  = 'The World Goes On' then '2018-05-31'
when author = 'Antonio Muñoz Molina' and english_title  = 'Like a Fading Shadow' then '2018-05-31'
when author = 'Ahmed Saadawi' and english_title  = 'Frankenstein in Baghdad' then '2018-09-06'
when author = 'Laurent Binet' and english_title  = 'The 7th Function of Language' then '2018-01-04'
when author = 'Javier Cercas' and english_title  = 'The Impostor' then '2018-08-09'
when author = 'Jenny Erpenbeck' and english_title  = 'Go, Went, Gone' then '2018-08-02'
when author = 'Ariana Harwicz' and english_title  = 'Die, My Love' then '2017-09-14'
when author = 'Christoph Ransmayr' and english_title  = 'The Flying Mountain' then '2018-03-31'
when author = 'Wu Ming-Yi' and english_title  = 'The Stolen Bicycle' then '2017-10-26'
when author = 'Gabriela Ybarra' and english_title  = 'The Dinner Guest' then '2018-03-01'
when author = 'Jokha Alharthi' and english_title  = 'Celestial Bodies ' then '2018-06-21'
when author = 'Annie Ernaux' and english_title  = 'The Years' then '2018-06-20'
when author = 'Marion Poschmann' and english_title  = 'The Pine Islands' then '2019-03-21'
when author = 'Olga Tokarczuk' and english_title  = 'Drive Your Plow Over the Bones of the Dead' then '2018-09-12'
when author = 'Juan Gabriel Vásquez' and english_title  = 'The Shape of the Ruins' then '2018-05-03'
when author = 'Alia Trabucco Zerán' and english_title  = 'The Remainder' then '2018-10-04'
when author = 'Can Xue' and english_title  = 'Love in the New Millennium' then '2019-01-22'
when author = 'Hwang Sok-yong' and english_title  = 'At Dusk' then '2018-11-29'
when author = 'Mazen Maarouf' and english_title  = 'Jokes for the Gunmen ' then '2019-01-03'
when author = 'Hubert Mingarelli' and english_title  = 'Four Soldiers' then '2019-06-06'
when author = 'Samanta Schweblin' and english_title  = 'Mouthful of Birds' then '2019-02-07'
when author = 'Sara Stridsberg' and english_title  = 'The Faculty of Dreams' then '2019-03-21'
when author = 'Tommy Wieringa' and english_title  = 'The Death of Murat Idrissi' then '2019-08-08'
when author = 'Marieke Lucas Rijneveld' and english_title  = 'The Discomfort of Evening' then '2020-03-05'
when author = 'Shokoofeh Azar' and english_title  = 'The Enlightenment of the Greengage Tree   ' then '2020-09-01'
when author = 'Gabriela Cabezón Cámara' and english_title  = 'The Adventures of China Iron' then '2019-11-19'
when author = 'Daniel Kehlmann' and english_title  = 'Tyll' then '2020-02-11'
when author = 'Fernanda Melchor' and english_title  = 'Hurricane Season' then '2020-02-19'
when author = 'Yōko Ogawa' and english_title  = 'The Memory Police' then '2020-08-06'
when author = 'Willem Anker' and english_title  = 'Red Dog' then '2020-06-25'
when author = 'Jon Fosse' and english_title  = 'The Other Name: Septology I – II' then '2019-10-10'
when author = 'Nino Haratischvili' and english_title  = 'The Eighth Life' then '2019-11-14'
when author = 'Michel Houellebecq' and english_title  = 'Serotonin' then '2020-09-17'
when author = 'Emmanuelle Pagano' and english_title  = 'Faces on the Tip of My Tongue' then '2019-09-26'
when author = 'Samanta Schweblin' and english_title  = 'Little Eyes' then '2020-04-16'
when author = 'Enrique Vila-Matas' and english_title  = 'Mac and His Problem' then '2019-06-06'
when author = 'David Diop' and english_title  = 'At Night All Blood Is Black' then '2020-11-05'
when author = 'Mariana Enríquez' and english_title  = 'The Dangers of Smoking in Bed' then '2021-05-01'
when author = 'Benjamín Labatut' and english_title  = 'When We Cease to Understand the World' then '2021-05-06'
when author = 'Olga Ravn' and english_title  = 'The Employees' then '2020-10-01'
when author = 'Maria Stepanova' and english_title  = 'In Memory of Memory ' then '2021-02-17'
when author = 'Éric Vuillard' and english_title  = 'The War of the Poor' then '2021-01-07'
when author = 'Can Xue' and english_title  = 'I Live in the Slums' then '2020-07-14'
when author = 'Nana Ekvtimishvili' and english_title  = 'The Pear Field ' then '2020-10-30'
when author = 'Ngũgĩ wa Thiong''o' and english_title  = 'The Perfect Nine The Epic of Gky and Mmbi' then '2020-10-08'
when author = 'Jaap Robben' and english_title  = 'Summer Brother' then '2021-05-06'
when author = 'Judith Schalansky' and english_title  = 'An Inventory of Losses' then '2020-08-20'
when author = 'Adania Shibli' and english_title  = 'Minor Detail ' then '2020-05-06'
when author = 'Andrzej Tichý' and english_title  = 'Wretchedness' then '2020-06-02'
when author = 'Geetanjali Shree' and english_title  = 'Tomb of Sand ' then '2021-08-26'
when author = 'Bora Chung' and english_title  = 'Cursed Bunny' then '2021-07-15'
when author = 'Jon Fosse' and english_title  = 'A New Name: Septology VI-VII' then '2021-09-08'
when author = 'Mieko Kawakami' and english_title  = 'Heaven' then '2021-06-10'
when author = 'Claudia Piñeiro' and english_title  = 'Elena Knows' then '2021-07-13'
when author = 'Olga Tokarczuk' and english_title  = 'The Books of Jacob' then '2021-11-15'
when author = 'Jonas Eika' and english_title  = 'After the Sun' then '2021-08-21'
when author = 'David Grossman' and english_title  = 'More Than I Love My Life   ' then '2021-08-26'
when author = 'Violaine Huisman' and english_title  = 'The Book of Mother' then '2021-10-07'
when author = 'Fernanda Melchor' and english_title  = 'Paradais' then '2022-03-23'
when author = 'Sang Young Park' and english_title  = 'Love in the Big City ' then '2021-10-28'
when author = 'Norman Erikson Pasaribu' and english_title  = 'Happy Stories, Mostly' then '2021-12-02'
when author = 'Paulo Scott' and english_title  = 'Phenotypes' then '2022-01-04'
when author = 'Georgi Gospodinov' and english_title  = 'Time Shelter' then '2023-04-21'
when author = 'Eva Baltasar' and english_title  = 'Boulder' then '2022-08-02'
when author = 'Cheon Myeong-kwan' and english_title  = 'Whale' then '2023-01-19'
when author = 'Maryse Condé' and english_title  = 'The Gospel According to the New World' then '2023-03-07'
when author = 'GauZ''' and english_title  = 'Standing Heavy' then '2022-05-26'
when author = 'Guadalupe Nettel' and english_title  = 'Still Born' then '2023-07-22'
when author = 'Vigdis Hjorth' and english_title  = 'Is Mother Dead' then '2022-10-22'
when author = 'Andrey Kurkov' and english_title  = 'Jimi Hendrix Live in Lviv   ' then '2022-10-12'
when author = 'Laurent Mauvignier' and english_title  = 'The Birthday Party' then '2023-01-18'
when author = 'Clemens Meyer' and english_title  = 'While We Were Dreaming' then '2023-03-30'
when author = 'Perumal Murugan' and english_title  = 'Pyre' then '2022-08-04'
when author = 'Amanda Svensson' and english_title  = 'A System So Magnificent It Is Blinding' then '2022-07-14'
when author = 'Zou Jingzhi' and english_title  = 'Ninth Building' then '2022-05-16'
when author = 'Jenny Erpenbeck' and english_title  = 'Kairos' then '2023-06-01'
when author = 'Selva Almada' and english_title  = 'Not a River' then '2024-01-23'
when author = 'Ia Genberg' and english_title  = 'The Details' then '2023-08-08'
when author = 'Hwang Sok-yong' and english_title  = 'Mater 2-10 ' then '2023-05-11'
when author = 'Jente Posthuma' and english_title  = 'What Id Rather Not Think About' then '2023-05-08'
when author = 'Itamar Vieira Junior' and english_title  = 'Crooked Plow' then '2023-10-03'
when author = 'Rodrigo Blanco Calderón' and english_title  = 'Simpatía' then '2024-03-07'
when author = 'Urszula Honek' and english_title  = 'White Nights' then '2023-11-09'
when author = 'Ismail Kadare' and english_title  = 'A Dictator Calls' then '2023-09-19'
when author = 'Andrey Kurkov' and english_title  = 'The Silver Bone  ' then '2024-03-05'
when author = 'Veronica Raimo' and english_title  = 'Lost on Me' then '2023-08-03'
when author = 'Domenico Starnone' and english_title  = 'The House on Via Gemito' then '2023-05-30'
when author = 'Gabriela Wiener' and english_title  = 'Undiscovered' then '2023-11-02'
when author = 'Banu Mushtaq' and english_title  = 'Heart Lamp Selected Stories ' then '2025-04-08'
when author = 'Anne Serre' and english_title  = 'A Leopard-Skin Hat' then '2024-06-20'
when author = 'Vincenzo Latronico' and english_title  = 'Perfection' then '2025-02-13'
when author = 'Hiromi Kawakami' and english_title  = 'Under the Eye of the Big Bird' then '2025-01-16'
when author = 'Vincent Delecroix' and english_title  = 'Small Boat' then '2025-03-24'
when author = 'Solvej Balle' and english_title  = 'On the Calculation of Volume I' then '2025-04-10'
when author = 'Ibtisam Azem' and english_title  = 'The Book of Disappearance ' then '2024-08-01'
when author = 'Gaëlle Bélem' and english_title  = 'There''s a Monster Behind the Door' then '2024-10-10'
when author = 'Mircea Cărtărescu' and english_title  = 'Solenoid' then '2024-06-06'
when author = 'Dahlia de la Cerda' and english_title  = 'Reservoir Bitches' then '2024-09-26'
when author = 'Saou Ichikawa' and english_title  = 'Hunchback' then '2025-03-06'
when author = 'Christian Kracht' and english_title  = 'Eurotrash' then '2024-11-07'
when author = 'Astrid Roemer' and english_title  = 'On a Woman''s Madness' then '2024-10-15'
when author = 'Yáng Shuāng-zǐ' and english_title  = 'Taiwan Travelogue' then '2026-03-05'
when author = 'Marie Ndiaye' and english_title  = 'The Witch' then '2026-04-14'
when author = 'Ana Paula Maia' and english_title  = 'On Earth As It Is Beneath' then '2025-08-12'
when author = 'Daniel Kehlmann' and english_title  = 'The Director' then '2025-05-22'
when author = 'Rene Karabash' and english_title  = 'She Who Remains' then '2026-02-10'
when author = 'Shida Bazyar' and english_title  = 'The Nights Are Quiet in Tehran' then '2025-06-19'
when author = 'Olga Ravn' and english_title  = 'The Wax Child' then '2025-11-06'
when author = 'Shahrnush Parsipur' and english_title  = 'Women Without Men' then '2026-03-12'
when author = 'Matteo Melchiorre' and english_title  = 'The Duke' then '2025-11-04'
when author = 'Ia Genberg' and english_title  = 'Small Comfort' then '2026-03-12'
when author = 'Mathias Énard' and english_title  = 'The Deserters' then '2025-05-08'
when author = 'Anjet Daanje' and english_title  = 'The Remembered Soldier' then '2025-06-19'
when author = 'Gabriela Cabezón Cámara' and english_title  = 'We Are Green and Trembling' then '2025-06-12'
else null		
	end
where id between 1 and 143;

-- 16. Usunięcie redundantnej kolumny z imieniem i nazwiskiem autora:
-- (potrzebnej uprzednio tylko po to, by bez pomyłek zidentyfikować właściwy rekord)
alter table english_editions
drop column author;

-- 17. Usunięcie kolumn przeniesionych z pierwszej tabeli, przyjętej jako tabela faktów, do nowostworzonych tabel wymiarów:
alter table nominations
	drop column author,
	drop column title,
	drop column title_original,
	drop column country,
	drop column country2,
	drop column language,
	drop column translator1,
	drop column translator2,
	drop column publisher
;

-- 18.Stworzenie tabeli zawierającej informacje o kolejnych edycjach konkursu:
create table awards
(
	year_edition YEAR,
	longlist_announcement_date DATE,
	shortlist_announcement_date DATE, 
	winner_announcement_date DATE, 
	winning_book INTEGER,
	judge1 VARCHAR(36),
	judge2 VARCHAR(36),
	judge3 VARCHAR(36),
	judge4 VARCHAR(36),
	judge5 VARCHAR(36),
	primary key (year_edition),
	foreign key (winning_book)
		references nominations(id)
		on delete set null,
	constraint shortlist_announ_check
		check (shortlist_announcement_date >= longlist_announcement_date),
	constraint winner_announ_check
		check (winner_announcement_date >= shortlist_announcement_date)
);

-- 19. Uzupełnienie danych w tabeli dotyczącej edycji konkursu:
-- Danymi istniejącymi już w bazie:
insert into awards (year_edition)
select 
	distinct award_year
from nominations;

update awards as a
join nominations as n
	on a.year_edition = n.award_year
set a.winning_book = n.id
where n.winner = 1;

-- Danymi zewnętrznymi:
update awards
	set longlist_announcement_date = '2016-04-14', shortlist_announcement_date = '2016-04-14', winner_announcement_date = '2016-05-16', judge1 ='Boyd Tonkin', judge2 ='Tahmima Anam', judge3 ='David Bellos', judge4 ='Daniel Medin', judge5 ='Ruth Padel'
	where year_edition = 2016;
update awards
	set longlist_announcement_date = '2017-03-14', shortlist_announcement_date = '2017-04-20', winner_announcement_date = '2017-06-14', judge1 ='Nick Barley', judge2 ='Daniel Hahn', judge3 ='Helen Mort', judge4 ='Elif Shafak', judge5 ='Chika Unigwe'
	where year_edition = 2017;
update awards
	set longlist_announcement_date = '2018-03-12', shortlist_announcement_date = '2018-04-12', winner_announcement_date = '2018-05-22', judge1 ='Lisa Appignanesi', judge2 ='Michael Hofmann', judge3 ='Hari Kunzru', judge4 ='Tim Martin', judge5 ='Helen Oyeyemi'
	where year_edition = 2018;
update awards
	set longlist_announcement_date = '2019-03-13', shortlist_announcement_date = '2019-04-09', winner_announcement_date = '2019-05-21', judge1 ='Bettany Hughes', judge2 ='Maureen Freely', judge3 ='Angie Hobbs', judge4 ='Pankaj Mishra', judge5 ='Elnathan John'
	where year_edition = 2019;
update awards
	set longlist_announcement_date = '2020-02-27', shortlist_announcement_date = '2020-04-02', winner_announcement_date = '2020-08-26', judge1 ='Ted Hodgkinson', judge2 ='Jennifer Croft ', judge3 ='Valeria Luiselli', judge4 ='Jeet Thayil', judge5 ='Lucie Campos'
	where year_edition = 2020;
update awards
	set longlist_announcement_date = '2021-03-30', shortlist_announcement_date = '2021-04-22', winner_announcement_date = '2021-06-02', judge1 ='Lucy Hughes-Hallett', judge2 ='Aida Edemariam', judge3 ='Neel Mukherjee', judge4 ='Olivette Otele', judge5 ='George Szirtes'
	where year_edition = 2021;
update awards
	set longlist_announcement_date = '2022-03-10', shortlist_announcement_date = '2022-04-07', winner_announcement_date = '2022-05-26', judge1 ='Frank Wynne', judge2 ='Merve Emre', judge3 ='Petina Gappah', judge4 ='Viv Groskop', judge5 ='Jeremy Tiang'
	where year_edition = 2022;
update awards
	set longlist_announcement_date = '2023-03-14', shortlist_announcement_date = '2023-04-18', winner_announcement_date = '2023-05-23', judge1 ='Leïla Slimani', judge2 ='Uilleam Blacker', judge3 ='Tan Twan Eng', judge4 ='Parul Sehgal', judge5 ='Frederick Studemann'
	where year_edition = 2023;
update awards
	set longlist_announcement_date = '2024-03-11', shortlist_announcement_date = '2024-04-09', winner_announcement_date = '2024-05-21', judge1 ='Eleanor Wachtel', judge2 ='Natalie Diaz', judge3 ='Romesh Gunesekera', judge4 ='William Kentridge', judge5 ='Aaron Robertson'
	where year_edition = 2024;
update awards
	set longlist_announcement_date = '2025-02-25', shortlist_announcement_date = '2025-04-08', winner_announcement_date = '2025-05-20', judge1 ='Max Porter', judge2 ='Caleb Femi', judge3 ='Sana Goyal', judge4 ='Anton Hur', judge5 ='Beth Orton'
	where year_edition = 2025;
update awards
	set longlist_announcement_date = '2026-02-24', shortlist_announcement_date = '2026-03-31', winner_announcement_date = '2026-05-19', judge1 ='Natasha Brown', judge2 ='Marcus du Sautoy', judge3 ='Sophie Hughes', judge4 ='Troy Onyango', judge5 ='Nilanjana S. Roy'
	where year_edition = 2026;

-- 20. Wprowadzenie utworzonego klucza obcego roku edycji konkursu na tabeli nominations:
alter table nominations
-- drop constraint award_year_foreign_key
add constraint award_year_foreign_key
	foreign key (award_year)
	references awards(year_edition)
	on delete restrict;

-- 21. Stworzenie nowej tabeli zawierającej personalia autorów książek, tłuamczy i jury:
create table authors_translators_judges
(
	name VARCHAR(30) unique,
	nationality VARCHAR(30),
	date_of_birth DATE,
	date_of_death DATE default (null),
	career_start_year YEAR,
	primary key (name)
);

-- 22. Zmiany nazwy tabeli (której długość okazała się jednak niepraktyczna...)
rename table authors_translators_judges to participants;

-- 23. Uzupełnienie tabeli danymi istniejącymi w bazie:
insert into participants (name)
	select distinct author from original_editions;

insert into participants (name)
	select translator1 from english_editions
	union all
	select translator2 from english_editions where translator2 is not null
on duplicate key update name = name;

insert ignore into participants (name)
	select judge1 from awards 
		where judge1 is not null
	union
	select judge2 from awards 
		where judge2 is not null
	union
	select judge3 from awards 
		where judge3 is not null
	union
	select judge4 from awards 
		where judge4 is not null
	union
	select judge5 from awards 
		where judge5 is not null;

-- 24. Załadowanie do tabeli nowych danych:

/** Ponieważ plik z nowymi danymi zawiera różne formaty daty urodzenia 
(w tym adnotacje 'unknown', gdy informacja ta nie jest publicznie znana),
przed załadowaniem danych należało zmienić typ danych atrybutu. **/

alter table participants
	modify column date_of_birth VARCHAR(10);

update participants set nationality = 'South Korean', date_of_birth = '1970-11-27', date_of_death = null, career_start_year = '1995' where name = 'Han Kang';
update participants set nationality = 'Angolan', date_of_birth = '1960-12-13', date_of_death = null, career_start_year = '1989' where name = 'José Eduardo Agualusa';
update participants set nationality = 'Italian', date_of_birth = 'unknown', date_of_death = null, career_start_year = '1992' where name = 'Elena Ferrante';
update participants set nationality = 'Turkish', date_of_birth = '1952-06-07', date_of_death = null, career_start_year = '1979' where name = 'Orhan Pamuk';
update participants set nationality = 'Austrian', date_of_birth = '1966-08-07', date_of_death = null, career_start_year = '2006' where name = 'Robert Seethaler';
update participants set nationality = 'Chinese', date_of_birth = '1958-08-24', date_of_death = null, career_start_year = '1979' where name = 'Yan Lianke';
update participants set nationality = 'French', date_of_birth = '1967-06-16', date_of_death = null, career_start_year = '2000' where name = 'Maylis de Kerangal';
update participants set nationality = 'Indonesian', date_of_birth = '1975-11-28', date_of_death = null, career_start_year = '1999' where name = 'Eka Kurniawan';
update participants set nationality = 'Congolese', date_of_birth = '1981-02-11', date_of_death = null, career_start_year = '2009' where name = 'Fiston Mwanza Mujila';
update participants set nationality = 'Brazilian', date_of_birth = '1935-11-27', date_of_death = null, career_start_year = '1975' where name = 'Raduan Nassar';
update participants set nationality = 'French', date_of_birth = '1967-06-01', date_of_death = null, career_start_year = '1984' where name = 'Marie NDiaye';
update participants set nationality = 'Japanese', date_of_birth = '1935-01-31', date_of_death = '2023-03-03', career_start_year = '1957' where name = 'Kenzaburō Ōe';
update participants set nationality = 'Finnish', date_of_birth = '1973', date_of_death = null, career_start_year = '2012' where name = 'Aki Ollikainen';
update participants set nationality = 'Israeli', date_of_birth = '1954-01-25', date_of_death = null, career_start_year = '2008' where name = 'David Grossman';
update participants set nationality = 'French', date_of_birth = '1972-01-11', date_of_death = null, career_start_year = '2003' where name = 'Mathias Énard';
update participants set nationality = 'Norwegian', date_of_birth = '1954-12-26', date_of_death = '2025-10-18', career_start_year = '1982' where name = 'Roy Jacobsen';
update participants set nationality = 'Danish', date_of_birth = '1970-05-20', date_of_death = null, career_start_year = '2001' where name = 'Dorthe Nors';
update participants set nationality = 'Israeli', date_of_birth = '1939-03-04', date_of_death = '2018-12-28', career_start_year = '1965' where name = 'Amos Oz';
update participants set nationality = 'Argentine', date_of_birth = '1978-03-08', date_of_death = null, career_start_year = '2002' where name = 'Samanta Schweblin';
update participants set nationality = 'Polish', date_of_birth = '1974-02-09', date_of_death = null, career_start_year = '1997' where name = 'Wioletta Greg';
update participants set nationality = 'Belgian', date_of_birth = '1951-03-31', date_of_death = null, career_start_year = '1986' where name = 'Stefan Hertmans';
update participants set nationality = 'Albanian', date_of_birth = '1936-01-28', date_of_death = '2024-07-01', career_start_year = '1954' where name = 'Ismail Kadare';
update participants set nationality = 'French', date_of_birth = '1966-02-24', date_of_death = null, career_start_year = '1998' where name = 'Alain Mabanckou';
update participants set nationality = 'German', date_of_birth = '1977-08-20', date_of_death = null, career_start_year = '2006' where name = 'Clemens Meyer';
update participants set nationality = 'Icelandic', date_of_birth = '1963-12-17', date_of_death = null, career_start_year = '1996' where name = 'Jón Kalman Stefánsson';
update participants set nationality = 'Polish', date_of_birth = '1962-01-29', date_of_death = null, career_start_year = '1989' where name = 'Olga Tokarczuk';
update participants set nationality = 'French', date_of_birth = '1969-06-13', date_of_death = null, career_start_year = '1993' where name = 'Virginie Despentes';
update participants set nationality = 'Hungarian', date_of_birth = '1954-01-05', date_of_death = null, career_start_year = '1985' where name = 'László Krasznahorkai';
update participants set nationality = 'Spanish', date_of_birth = '1956-01-10', date_of_death = null, career_start_year = '1984' where name = 'Antonio Muñoz Molina';
update participants set nationality = 'Iraqi', date_of_birth = '1973-05-01', date_of_death = null, career_start_year = '2000' where name = 'Ahmed Saadawi';
update participants set nationality = 'French', date_of_birth = '1972-07-19', date_of_death = null, career_start_year = '2010' where name = 'Laurent Binet';
update participants set nationality = 'Spanish', date_of_birth = '1962-04-06', date_of_death = null, career_start_year = '1987' where name = 'Javier Cercas';
update participants set nationality = 'German', date_of_birth = '1967-03-12', date_of_death = null, career_start_year = '1999' where name = 'Jenny Erpenbeck';
update participants set nationality = 'Argentine', date_of_birth = '1977-12-13', date_of_death = null, career_start_year = '2012' where name = 'Ariana Harwicz';
update participants set nationality = 'Austrian', date_of_birth = '1954-03-20', date_of_death = null, career_start_year = '1982' where name = 'Christoph Ransmayr';
update participants set nationality = 'Taiwanese', date_of_birth = '1971-06-20', date_of_death = null, career_start_year = '1997' where name = 'Wu Ming-Yi';
update participants set nationality = 'Spanish', date_of_birth = '1983', date_of_death = null, career_start_year = '2015' where name = 'Gabriela Ybarra';
update participants set nationality = 'Omani', date_of_birth = '1978-07-01', date_of_death = null, career_start_year = '2004' where name = 'Jokha Alharthi';
update participants set nationality = 'French', date_of_birth = '1940-09-01', date_of_death = null, career_start_year = '1974' where name = 'Annie Ernaux';
update participants set nationality = 'German', date_of_birth = '1969-12-15', date_of_death = null, career_start_year = '2002' where name = 'Marion Poschmann';
update participants set nationality = 'Colombian', date_of_birth = '1973-01-01', date_of_death = null, career_start_year = '1997' where name = 'Juan Gabriel Vásquez';
update participants set nationality = 'Chilean', date_of_birth = '1983-08-26', date_of_death = null, career_start_year = '2014' where name = 'Alia Trabucco Zerán';
update participants set nationality = 'Chinese', date_of_birth = '1953-05-30', date_of_death = null, career_start_year = '1986' where name = 'Can Xue';
update participants set nationality = 'South Korean', date_of_birth = '1943-01-04', date_of_death = null, career_start_year = '1971' where name = 'Hwang Sok-yong';
update participants set nationality = 'Palestinian', date_of_birth = '1978-01-01', date_of_death = null, career_start_year = '2001' where name = 'Mazen Maarouf';
update participants set nationality = 'French', date_of_birth = '1956-01-14', date_of_death = '2020-01-26', career_start_year = '1990' where name = 'Hubert Mingarelli';
update participants set nationality = 'Swedish', date_of_birth = '1972-08-29', date_of_death = null, career_start_year = '1999' where name = 'Sara Stridsberg';
update participants set nationality = 'Dutch', date_of_birth = '1967-05-20', date_of_death = null, career_start_year = '1995' where name = 'Tommy Wieringa';
update participants set nationality = 'Dutch', date_of_birth = '1991-04-20', date_of_death = null, career_start_year = '2015' where name = 'Marieke Lucas Rijneveld';
update participants set nationality = 'Iranian-Australian', date_of_birth = '1972', date_of_death = null, career_start_year = '2005' where name = 'Shokoofeh Azar';
update participants set nationality = 'Argentine', date_of_birth = '1968-11-04', date_of_death = null, career_start_year = '2006' where name = 'Gabriela Cabezón Cámara';
update participants set nationality = 'Austrian-German', date_of_birth = '1975-01-13', date_of_death = null, career_start_year = '1997' where name = 'Daniel Kehlmann';
update participants set nationality = 'Mexican', date_of_birth = '1982-06-03', date_of_death = null, career_start_year = '2013' where name = 'Fernanda Melchor';
update participants set nationality = 'Japanese', date_of_birth = '1962-03-30', date_of_death = null, career_start_year = '1980' where name = 'Yōko Ogawa';
update participants set nationality = 'South African', date_of_birth = '1979-02-03', date_of_death = null, career_start_year = '2007' where name = 'Willem Anker';
update participants set nationality = 'Norwegian', date_of_birth = '1959-09-29', date_of_death = null, career_start_year = '1983' where name = 'Jon Fosse';
update participants set nationality = 'Georgian', date_of_birth = '1983-06-08', date_of_death = null, career_start_year = '2006' where name = 'Nino Haratischvili';
update participants set nationality = 'French', date_of_birth = '1956-02-26', date_of_death = null, career_start_year = '1985' where name = 'Michel Houellebecq';
update participants set nationality = 'French', date_of_birth = '1969-09-15', date_of_death = null, career_start_year = '2002' where name = 'Emmanuelle Pagano';
update participants set nationality = 'Spanish', date_of_birth = '1948-03-31', date_of_death = null, career_start_year = '1973' where name = 'Enrique Vila-Matas';
update participants set nationality = 'French', date_of_birth = '1966-02-24', date_of_death = null, career_start_year = '2012' where name = 'David Diop';
update participants set nationality = 'Argentine', date_of_birth = '1973-12-06', date_of_death = null, career_start_year = '1995' where name = 'Mariana Enríquez';
update participants set nationality = 'Chilean', date_of_birth = '1980', date_of_death = null, career_start_year = '2009' where name = 'Benjamín Labatut';
update participants set nationality = 'Danish', date_of_birth = '1986-09-27', date_of_death = null, career_start_year = '2008' where name = 'Olga Ravn';
update participants set nationality = 'Russian', date_of_birth = '1972-06-09', date_of_death = null, career_start_year = '1996' where name = 'Maria Stepanova';
update participants set nationality = 'French', date_of_birth = '1968-05-04', date_of_death = null, career_start_year = '1999' where name = 'Éric Vuillard';
update participants set nationality = 'Georgian', date_of_birth = '1978-07-09', date_of_death = null, career_start_year = '2011' where name = 'Nana Ekvtimishvili';
update participants set nationality = 'Kenyan', date_of_birth = '1938-01-05', date_of_death = '2025-05-28', career_start_year = '1963' where name = 'Ngũgĩ wa Thiong''o';
update participants set nationality = 'Dutch', date_of_birth = '1984-06-22', date_of_death = null, career_start_year = '2004' where name = 'Jaap Robben';
update participants set nationality = 'German', date_of_birth = '1980-09-20', date_of_death = null, career_start_year = '2006' where name = 'Judith Schalansky';
update participants set nationality = 'Palestinian', date_of_birth = '1974', date_of_death = null, career_start_year = '1996' where name = 'Adania Shibli';
update participants set nationality = 'Swedish-Czech-Polish', date_of_birth = '1978-12-19', date_of_death = null, career_start_year = '2005' where name = 'Andrzej Tichý';
update participants set nationality = 'Indian', date_of_birth = '1957-06-12', date_of_death = null, career_start_year = '1987' where name = 'Geetanjali Shree';
update participants set nationality = 'South Korean', date_of_birth = '1976', date_of_death = null, career_start_year = '2010' where name = 'Bora Chung';
update participants set nationality = 'Japanese', date_of_birth = '1976-08-29', date_of_death = null, career_start_year = '2006' where name = 'Mieko Kawakami';
update participants set nationality = 'Argentine', date_of_birth = '1960-04-10', date_of_death = null, career_start_year = '2003' where name = 'Claudia Piñeiro';
update participants set nationality = 'Danish', date_of_birth = '1991', date_of_death = null, career_start_year = '2015' where name = 'Jonas Eika';
update participants set nationality = 'French', date_of_birth = '1979', date_of_death = null, career_start_year = '2018' where name = 'Violaine Huisman';
update participants set nationality = 'South Korean', date_of_birth = '1988', date_of_death = null, career_start_year = '2018' where name = 'Sang Young Park';
update participants set nationality = 'Indonesian', date_of_birth = '1990', date_of_death = null, career_start_year = '2014' where name = 'Norman Erikson Pasaribu';
update participants set nationality = 'Brazilian', date_of_birth = '1966-12-08', date_of_death = null, career_start_year = '2001' where name = 'Paulo Scott';
update participants set nationality = 'Bulgarian', date_of_birth = '1968-01-07', date_of_death = null, career_start_year = '1992' where name = 'Georgi Gospodinov';
update participants set nationality = 'Catalan', date_of_birth = '1978-08-26', date_of_death = null, career_start_year = '2008' where name = 'Eva Baltasar';
update participants set nationality = 'South Korean', date_of_birth = '1964', date_of_death = null, career_start_year = '2004' where name = 'Cheon Myeong-kwan';
update participants set nationality = 'French', date_of_birth = '1934-02-11', date_of_death = '2024-04-02', career_start_year = '1976' where name = 'Maryse Condé';
update participants set nationality = 'Ivorian ', date_of_birth = '1971-03-22', date_of_death = null, career_start_year = '2014' where name = 'GauZ''';
update participants set nationality = 'Mexican', date_of_birth = '1973-05-27', date_of_death = null, career_start_year = '2002' where name = 'Guadalupe Nettel';
update participants set nationality = 'Norwegian', date_of_birth = '1959-07-19', date_of_death = null, career_start_year = '1986' where name = 'Vigdis Hjorth';
update participants set nationality = 'Ukrainian', date_of_birth = '1961-04-23', date_of_death = null, career_start_year = '1991' where name = 'Andrey Kurkov';
update participants set nationality = 'French', date_of_birth = '1967-07-06', date_of_death = null, career_start_year = '1999' where name = 'Laurent Mauvignier';
update participants set nationality = 'Indian', date_of_birth = '1966-10-15', date_of_death = null, career_start_year = '1988' where name = 'Perumal Murugan';
update participants set nationality = 'Swedish', date_of_birth = '1987-06-05', date_of_death = null, career_start_year = '2008' where name = 'Amanda Svensson';
update participants set nationality = 'Chinese', date_of_birth = '1952', date_of_death = null, career_start_year = '2005' where name = 'Zou Jingzhi';
update participants set nationality = 'Argentine', date_of_birth = '1973-04-05', date_of_death = null, career_start_year = '1997' where name = 'Selva Almada';
update participants set nationality = 'Swedish', date_of_birth = '1967-11-05', date_of_death = null, career_start_year = '2012' where name = 'Ia Genberg';
update participants set nationality = 'Dutch', date_of_birth = '1974-08-16', date_of_death = null, career_start_year = '2016' where name = 'Jente Posthuma';
update participants set nationality = 'Brazilian', date_of_birth = '1979-08-06', date_of_death = null, career_start_year = '2012' where name = 'Itamar Vieira Junior';
update participants set nationality = 'Venezuelan', date_of_birth = '1981', date_of_death = null, career_start_year = '2005' where name = 'Rodrigo Blanco Calderón';
update participants set nationality = 'Polish ', date_of_birth = '1987', date_of_death = null, career_start_year = '2016' where name = 'Urszula Honek';
update participants set nationality = 'Italian', date_of_birth = '1978-06-01', date_of_death = null, career_start_year = '2007' where name = 'Veronica Raimo';
update participants set nationality = 'Italian', date_of_birth = '1943-02-15', date_of_death = null, career_start_year = '1970' where name = 'Domenico Starnone';
update participants set nationality = 'Peruvian', date_of_birth = '1975-11-24', date_of_death = null, career_start_year = '2007' where name = 'Gabriela Wiener';
update participants set nationality = 'Indian', date_of_birth = '1948-04-03', date_of_death = null, career_start_year = '1990' where name = 'Banu Mushtaq';
update participants set nationality = 'French', date_of_birth = '1960-09-07', date_of_death = null, career_start_year = '1992' where name = 'Anne Serre';
update participants set nationality = 'Italian', date_of_birth = '1984', date_of_death = null, career_start_year = '2008' where name = 'Vincenzo Latronico';
update participants set nationality = 'Japanese', date_of_birth = '1958-04-01', date_of_death = null, career_start_year = '1994' where name = 'Hiromi Kawakami';
update participants set nationality = 'French', date_of_birth = '1969-11-26', date_of_death = null, career_start_year = '2003' where name = 'Vincent Delecroix';
update participants set nationality = 'Danish', date_of_birth = '1962-08-16', date_of_death = null, career_start_year = '1984' where name = 'Solvej Balle';
update participants set nationality = 'Palestinian', date_of_birth = '1974', date_of_death = null, career_start_year = '2011' where name = 'Ibtisam Azem';
update participants set nationality = 'French', date_of_birth = '1984-11-14', date_of_death = null, career_start_year = '2020' where name = 'Gaëlle Bélem';
update participants set nationality = 'Romanian', date_of_birth = '1956-06-01', date_of_death = null, career_start_year = '1978' where name = 'Mircea Cărtărescu';
update participants set nationality = 'Mexican', date_of_birth = '1985-03-09', date_of_death = null, career_start_year = '2015' where name = 'Dahlia de la Cerda';
update participants set nationality = 'Japanese', date_of_birth = '1979-09-27', date_of_death = null, career_start_year = '2018' where name = 'Saou Ichikawa';
update participants set nationality = 'Swiss', date_of_birth = '1966-12-29', date_of_death = null, career_start_year = '1993' where name = 'Christian Kracht';
update participants set nationality = 'Surinamese-Dutch', date_of_birth = '1947-04-27', date_of_death = '2026-01-08', career_start_year = '1970' where name = 'Astrid Roemer';
update participants set nationality = 'Taiwanese', date_of_birth = '1984-07-10', date_of_death = null, career_start_year = '2003' where name = 'Yáng Shuāng-zǐ';
update participants set nationality = 'Brazilian', date_of_birth = '1977-12-01', date_of_death = null, career_start_year = '2003' where name = 'Ana Paula Maia';
update participants set nationality = 'Bulgarian', date_of_birth = '1989-07-08', date_of_death = null, career_start_year = '2018' where name = 'Rene Karabash';
update participants set nationality = 'German', date_of_birth = '1988', date_of_death = null, career_start_year = '2016' where name = 'Shida Bazyar';
update participants set nationality = 'Iranian', date_of_birth = '1946-02-17', date_of_death = null, career_start_year = '1969' where name = 'Shahrnush Parsipur';
update participants set nationality = 'Italian', date_of_birth = '1981-02-02', date_of_death = null, career_start_year = '2022' where name = 'Matteo Melchiorre';
update participants set nationality = 'Dutch', date_of_birth = '1965', date_of_death = null, career_start_year = '1993' where name = 'Anjet Daanje';
update participants set nationality = 'British', date_of_birth = '1987-12-15', date_of_death = null, career_start_year = '2015' where name = 'Deborah Smith';
update participants set nationality = 'British', date_of_birth = '1973-11-26', date_of_death = null, career_start_year = '2004' where name = 'Daniel Hahn';
update participants set nationality = 'American', date_of_birth = '1949-06-01', date_of_death = null, career_start_year = '1992' where name = 'Ann Goldstein';
update participants set nationality = 'Turkish', date_of_birth = 'unknown', date_of_death = null, career_start_year = '2009' where name = 'Ekin Oklap';
update participants set nationality = 'British', date_of_birth = 'unknown', date_of_death = null, career_start_year = '2007' where name = 'Charlotte Collins';
update participants set nationality = 'American', date_of_birth = '1970', date_of_death = null, career_start_year = '2007' where name = 'Carlos Rojas';
update participants set nationality = 'American', date_of_birth = '1978', date_of_death = null, career_start_year = '2010' where name = 'Jessica Moore';
update participants set nationality = 'Indonesian', date_of_birth = '1983-05-04', date_of_death = null, career_start_year = '2004' where name = 'Labodalih Sembiring';
update participants set nationality = 'British', date_of_birth = '1973', date_of_death = null, career_start_year = '1994' where name = 'Roland Glasser';
update participants set nationality = 'British-Swiss-Brazilian', date_of_birth = 'unknown', date_of_death = null, career_start_year = '2012' where name = 'Stefan Tobler';
update participants set nationality = 'American', date_of_birth = '1959', date_of_death = null, career_start_year = '1991' where name = 'Jordan Stump';
update participants set nationality = 'American', date_of_birth = 'unknown', date_of_death = null, career_start_year = '1988' where name = 'Deborah Boliver Boehm';
update participants set nationality = 'British', date_of_birth = '1975', date_of_death = null, career_start_year = '2003' where name = 'Emily Jeremiah';
update participants set nationality = 'British-Israeli-American', date_of_birth = '1973', date_of_death = null, career_start_year = '2010' where name = 'Jessica Cohen';
update participants set nationality = 'American', date_of_birth = '1968', date_of_death = null, career_start_year = '1995' where name = 'Charlotte Mandell';
update participants set nationality = 'British', date_of_birth = '1948', date_of_death = null, career_start_year = '2002' where name = 'Don Bartlett';
update participants set nationality = 'American', date_of_birth = '1963', date_of_death = null, career_start_year = '2012' where name = 'Misha Hoekstra';
update participants set nationality = 'British', date_of_birth = '1944-08-07', date_of_death = null, career_start_year = '1976' where name = 'Nicholas de Lange';
update participants set nationality = 'American', date_of_birth = '1978', date_of_death = null, career_start_year = '2010' where name = 'Megan McDowell';
update participants set nationality = 'Polish ', date_of_birth = 'unknown', date_of_death = null, career_start_year = '2017' where name = 'Eliza Marciniak';
update participants set nationality = 'American', date_of_birth = '1973', date_of_death = null, career_start_year = '2019' where name = 'David McKay';
update participants set nationality = 'British', date_of_birth = '1951', date_of_death = null, career_start_year = '1978' where name = 'John Hodgson';
update participants set nationality = 'British', date_of_birth = 'unknown', date_of_death = null, career_start_year = '1998' where name = 'Helen Stevenson';
update participants set nationality = 'British', date_of_birth = '1973', date_of_death = null, career_start_year = '2005' where name = 'Katy Derbyshire';
update participants set nationality = 'American', date_of_birth = '1965', date_of_death = null, career_start_year = '1995' where name = 'Phil Roughton';
update participants set nationality = 'American', date_of_birth = '1981', date_of_death = null, career_start_year = '2017' where name = 'Jennifer Croft';
update participants set nationality = 'Irish', date_of_birth = '1962', date_of_death = null, career_start_year = '1998' where name = 'Frank Wynne';
update participants set nationality = 'American', date_of_birth = '1942', date_of_death = null, career_start_year = '1970' where name = 'John Batki';
update participants set nationality = 'American', date_of_birth = '1960', date_of_death = null, career_start_year = '1985' where name = 'Ottilie Mulzet';
update participants set nationality = 'Columbian', date_of_birth = '1985', date_of_death = null, career_start_year = '2014' where name = 'Camilo A. Ramirez';
update participants set nationality = 'British', date_of_birth = '1953', date_of_death = null, career_start_year = '2008' where name = 'Jonathan Wright';
update participants set nationality = 'British', date_of_birth = '1970', date_of_death = null, career_start_year = '2010' where name = 'Sam Taylor';
update participants set nationality = 'American', date_of_birth = '1966', date_of_death = null, career_start_year = '1981' where name = 'Susan Bernofsky';
update participants set nationality = 'Canadian', date_of_birth = '1980', date_of_death = null, career_start_year = '2020' where name = 'Sarah Moses';
update participants set nationality = 'British', date_of_birth = '1972-07-01', date_of_death = null, career_start_year = '2002' where name = 'Simon Pare';
update participants set nationality = 'Canadian', date_of_birth = '1973-03-01', date_of_death = null, career_start_year = '2007' where name = 'Darryl Sterk';
update participants set nationality = 'American', date_of_birth = '1973', date_of_death = null, career_start_year = '2000' where name = 'Natasha Wimmer';
update participants set nationality = 'American', date_of_birth = '1955-02-24', date_of_death = null, career_start_year = '2002' where name = 'Marilyn Booth';
update participants set nationality = 'Canadian', date_of_birth = '1958-07-01', date_of_death = null, career_start_year = '2001' where name = 'Alison L. Strayer';
update participants set nationality = 'British', date_of_birth = '1986-12-01', date_of_death = null, career_start_year = '2015' where name = 'Jen Calleja';
update participants set nationality = 'British', date_of_birth = '1962', date_of_death = null, career_start_year = '1991' where name = 'Antonia Lloyd-Jones';
update participants set nationality = 'Canadian', date_of_birth = '1962', date_of_death = null, career_start_year = '1983' where name = 'Anne McLean';
update participants set nationality = 'British', date_of_birth = '1986', date_of_death = null, career_start_year = '2015' where name = 'Sophie Hughes';
update participants set nationality = 'American', date_of_birth = '1981-09-01', date_of_death = null, career_start_year = '2005' where name = 'Annelise Finegan Wasmoen';
update participants set nationality = 'American-South Korean', date_of_birth = '1976', date_of_death = null, career_start_year = '1995' where name = 'Sora Kim-Russell';
update participants set nationality = 'British', date_of_birth = '1953-02-01', date_of_death = null, career_start_year = '2006' where name = 'Deborah Bragan-Turner';
update participants set nationality = 'American', date_of_birth = '1956', date_of_death = null, career_start_year = '1993' where name = 'Sam Garrett';
update participants set nationality = 'British', date_of_birth = '1972', date_of_death = null, career_start_year = '2009' where name = 'Michele Hutchison';
update participants set nationality = 'unknown', date_of_birth = 'unknown', date_of_death = null, career_start_year = 'unknown' where name = 'Anonymous';
update participants set nationality = 'American', date_of_birth = '1977', date_of_death = null, career_start_year = '2010' where name = 'Iona Macintyre';
update participants set nationality = 'American', date_of_birth = 'unknown', date_of_death = null, career_start_year = '2005' where name = 'Ross Benjamin';
update participants set nationality = 'American', date_of_birth = '1957', date_of_death = null, career_start_year = '1980' where name = 'Stephen Snyder';
update participants set nationality = 'South African', date_of_birth = '1943-12-02', date_of_death = null, career_start_year = '2002' where name = 'Michiel Heyns';
update participants set nationality = 'American', date_of_birth = '1970-05-26', date_of_death = null, career_start_year = '2003' where name = 'Damion Searls';
update participants set nationality = 'Irish', date_of_birth = '1959', date_of_death = null, career_start_year = '1990' where name = 'Shaun Whiteside';
update participants set nationality = 'British', date_of_birth = 'unknown', date_of_death = null, career_start_year = '2019' where name = 'Sophie Lewis';
update participants set nationality = 'British', date_of_birth = '1949-05-02', date_of_death = null, career_start_year = '1999' where name = 'Margaret Jull Costa';
update participants set nationality = 'Greek-American', date_of_birth = 'unknown', date_of_death = null, career_start_year = '2001' where name = 'Anna Moschovakis';
update participants set nationality = 'American', date_of_birth = 'unknown', date_of_death = null, career_start_year = '2013' where name = 'Adrian Nathan West';
update participants set nationality = 'British', date_of_birth = '1961', date_of_death = null, career_start_year = '2013' where name = 'Martin Aitken';
update participants set nationality = 'British', date_of_birth = '1974', date_of_death = null, career_start_year = '2002' where name = 'Sasha Dugdale';
update participants set nationality = 'American', date_of_birth = '1957-07-22', date_of_death = null, career_start_year = '1988' where name = 'Mark Polizzotti';
update participants set nationality = 'American', date_of_birth = '1953', date_of_death = null, career_start_year = '1988' where name = 'Karen Gernant';
update participants set nationality = 'British', date_of_birth = '1985', date_of_death = null, career_start_year = '2003' where name = 'Elizabeth Heighway';
update participants set nationality = 'British', date_of_birth = 'unknown', date_of_death = null, career_start_year = '1996' where name = 'David Doherty';
update participants set nationality = 'British', date_of_birth = 'unknown', date_of_death = null, career_start_year = '2019' where name = 'Jackie Smith';
update participants set nationality = 'American', date_of_birth = 'unknown', date_of_death = null, career_start_year = '2016' where name = 'Elisabeth Jaquette';
update participants set nationality = 'British', date_of_birth = 'unknown', date_of_death = null, career_start_year = '2016' where name = 'Nichola Smalley';
update participants set nationality = 'American', date_of_birth = '1969', date_of_death = null, career_start_year = '2013' where name = 'Daisy Rockwell';
update participants set nationality = 'Korean', date_of_birth = '1981-04-07', date_of_death = null, career_start_year = '2016' where name = 'Anton Hur';
update participants set nationality = 'American', date_of_birth = '1986', date_of_death = null, career_start_year = '2008' where name = 'Sam Bett';
update participants set nationality = 'American', date_of_birth = 'unknown', date_of_death = null, career_start_year = '2007' where name = 'Frances Riddle';
update participants set nationality = 'American', date_of_birth = '1991', date_of_death = null, career_start_year = '2017' where name = 'Sherilyn Hellberg';
update participants set nationality = 'American', date_of_birth = 'unknown', date_of_death = null, career_start_year = '2022' where name = 'Leslie Camhi';
update participants set nationality = 'American', date_of_birth = '1983', date_of_death = null, career_start_year = '2016' where name = 'Tiffany Tsao';
update participants set nationality = 'American-Bulgarian', date_of_birth = 'unknown', date_of_death = null, career_start_year = '2011' where name = 'Angela Rodel';
update participants set nationality = 'Brazilian', date_of_birth = '1987-12-29', date_of_death = null, career_start_year = '2012' where name = 'Julia Sanches';
update participants set nationality = 'American', date_of_birth = 'unknown', date_of_death = null, career_start_year = '2006' where name = 'Chi-Young Kim';
update participants set nationality = 'British', date_of_birth = '1945', date_of_death = null, career_start_year = '1981' where name = 'Richard Philcox';
update participants set nationality = 'British', date_of_birth = '1982', date_of_death = null, career_start_year = '2006' where name = 'Rosalind Harvey';
update participants set nationality = 'Danish', date_of_birth = 'unknown', date_of_death = null, career_start_year = '2000' where name = 'Charlotte Barslund';
update participants set nationality = 'British', date_of_birth = '1999', date_of_death = null, career_start_year = '2023' where name = 'Reuben Woolley';
update participants set nationality = 'American', date_of_birth = '1984', date_of_death = null, career_start_year = '2012' where name = 'Daniel Levin Becker';
update participants set nationality = 'Indian', date_of_birth = 'unknown', date_of_death = null, career_start_year = '2010' where name = 'Aniruddhan Vasudevan';
update participants set nationality = 'Singaporean', date_of_birth = '1977-01-17', date_of_death = null, career_start_year = '2009' where name = 'Jeremy Tiang';
update participants set nationality = 'German', date_of_birth = '1957-08-25', date_of_death = null, career_start_year = '1984' where name = 'Michael Hofmann';
update participants set nationality = 'British', date_of_birth = '1982', date_of_death = null, career_start_year = '2000' where name = 'Annie McDermott';
update participants set nationality = 'Swedish', date_of_birth = 'unknown', date_of_death = null, career_start_year = '2010' where name = 'Kira Josefsson';
update participants set nationality = 'Australian-American', date_of_birth = 'unknown', date_of_death = null, career_start_year = '1990' where name = 'Sarah Timmer Harvey';
update participants set nationality = 'Brazilian-American', date_of_birth = '1972', date_of_death = null, career_start_year = '2012' where name = 'Johnny Lorenz';
update participants set nationality = 'Spanish', date_of_birth = 'unknown', date_of_death = null, career_start_year = '2020' where name = 'Noel Hernández González';
update participants set nationality = 'British', date_of_birth = 'unknown', date_of_death = null, career_start_year = '2016' where name = 'Kate Webster';
update participants set nationality = 'Ukrainian-American', date_of_birth = '1982', date_of_death = null, career_start_year = '2011' where name = 'Boris Dralyuk';
update participants set nationality = 'American', date_of_birth = 'unknown', date_of_death = null, career_start_year = '2003' where name = 'Leah Janeczko';
update participants set nationality = 'American', date_of_birth = '1967', date_of_death = null, career_start_year = '1991' where name = 'Oonagh Stransky';
update participants set nationality = 'Indian', date_of_birth = '1983', date_of_death = null, career_start_year = '2019' where name = 'Deepa Bhasthi';
update participants set nationality = 'British', date_of_birth = '1957', date_of_death = null, career_start_year = '2014' where name = 'Mark Hutchinson';
update participants set nationality = 'Japanese', date_of_birth = '1982', date_of_death = null, career_start_year = '2018' where name = 'Asa Yoneda';
update participants set nationality = 'Scottish', date_of_birth = '1951', date_of_death = null, career_start_year = '1996' where name = 'Barbara J Haveland';
update participants set nationality = 'Iraqi', date_of_birth = '1967', date_of_death = null, career_start_year = '2002' where name = 'Sinan Antoon';
update participants set nationality = 'British', date_of_birth = 'unknown', date_of_death = null, career_start_year = '2020' where name = 'Karen Fleetwood';
update participants set nationality = 'American', date_of_birth = 'unknown', date_of_death = null, career_start_year = '1995' where name = 'Sean Cotter';
update participants set nationality = 'American', date_of_birth = '1982', date_of_death = null, career_start_year = '2010' where name = 'Heather Cleary';
update participants set nationality = 'British', date_of_birth = '1984', date_of_death = null, career_start_year = '2014' where name = 'Polly Barton';
update participants set nationality = 'American', date_of_birth = 'unknown', date_of_death = null, career_start_year = '1998' where name = 'Daniel Bowles';
update participants set nationality = 'British', date_of_birth = '1971-01-19', date_of_death = null, career_start_year = '2022' where name = 'Lucy Scott';
update participants set nationality = 'Finnish', date_of_birth = 'unknown', date_of_death = null, career_start_year = '2003' where name = 'Fleur Jeremiah';
update participants set nationality = 'British', date_of_birth = 'unknown', date_of_death = null, career_start_year = '2008' where name = 'Don Shaw';
update participants set nationality = 'British-Hungarian ', date_of_birth = '1948-11-29', date_of_death = null, career_start_year = '1973' where name = 'George Szirtes';
update participants set nationality = 'Argentine', date_of_birth = '1977', date_of_death = null, career_start_year = '2016' where name = 'Carolina Orloff';
update participants set nationality = 'British', date_of_birth = '1960', date_of_death = null, career_start_year = '2001' where name = 'Fiona Mackintosh';
update participants set nationality = 'British', date_of_birth = 'unknown', date_of_death = null, career_start_year = '2018' where name = 'Ruth Martin';
update participants set nationality = 'British', date_of_birth = 'unknown', date_of_death = null, career_start_year = '2006' where name = 'Jennifer Higgins';
update participants set nationality = 'Chinese', date_of_birth = '1953', date_of_death = null, career_start_year = '2008' where name = 'Chen Zeping';
update participants set nationality = 'American', date_of_birth = '1981', date_of_death = null, career_start_year = '2003' where name = 'David Boyd';
update participants set nationality = 'South Korean', date_of_birth = 'unknown', date_of_death = null, career_start_year = '2020' where name = 'Youngjae Josephine Bae';
update participants set nationality = 'French', date_of_birth = 'unknown', date_of_death = null, career_start_year = '2020' where name = 'Laëtitia Saint-Loubert';
update participants set nationality = 'Taiwanese-American', date_of_birth = '1993-12-06', date_of_death = null, career_start_year = '2023' where name = 'Lin King';
update participants set nationality = 'American', date_of_birth = '1959', date_of_death = null, career_start_year = '1994' where name = 'Jordan Stump';
update participants set nationality = 'Tamil-Canadian', date_of_birth = '1968', date_of_death = null, career_start_year = '2008' where name = 'Padma Viswanathan';
update participants set nationality = 'American', date_of_birth = '1981', date_of_death = null, career_start_year = '2005' where name = 'Ross Benjamin';
update participants set nationality = 'Bulgarian', date_of_birth = 'unknown', date_of_death = null, career_start_year = '2014' where name = 'Izidora Angel';
update participants set nationality = 'British', date_of_birth = 'unknown', date_of_death = null, career_start_year = '2005' where name = 'Ruth Martin';
update participants set nationality = 'British', date_of_birth = '1961', date_of_death = null, career_start_year = '2013' where name = 'Martin Aitken';
update participants set nationality = 'Iranian', date_of_birth = 'unknown', date_of_death = null, career_start_year = '2003' where name = 'Faridoun Farrokh';
update participants set nationality = 'Italian', date_of_birth = 'unknown', date_of_death = null, career_start_year = '2022' where name = 'Antonella Lettieri';
update participants set nationality = 'Swedish', date_of_birth = 'unknown', date_of_death = null, career_start_year = '2010' where name = 'Kira Josefsson';
update participants set nationality = 'American', date_of_birth = '1968', date_of_death = null, career_start_year = '2005' where name = 'Charlotte Mandell';
update participants set nationality = 'American', date_of_birth = 'unknown', date_of_death = null, career_start_year = '2019' where name = '"David McKay"';
update participants set nationality = 'American', date_of_birth = '1987', date_of_death = null, career_start_year = '2018' where name = 'Robin Myers';
update participants set nationality = 'British', date_of_birth = '1959', date_of_death = null, career_start_year = '1980' where name = 'Boyd Tonkin';
update participants set nationality = 'British', date_of_birth = '1963', date_of_death = null, career_start_year = '1995' where name = 'Nick Barley';
update participants set nationality = 'British-Canadian', date_of_birth = '1946-01-04', date_of_death = null, career_start_year = '1973' where name = 'Lisa Appignanesi';
update participants set nationality = 'British', date_of_birth = '1967-05-14', date_of_death = null, career_start_year = '1996' where name = 'Bettany Hughes';
update participants set nationality = 'British', date_of_birth = '1985', date_of_death = null, career_start_year = '2005' where name = 'Ted Hodgkinson';
update participants set nationality = 'British', date_of_birth = '1951', date_of_death = null, career_start_year = '1987' where name = 'Lucy Hughes-Hallett';
update participants set nationality = 'French-Moroccan', date_of_birth = '1981-10-03', date_of_death = null, career_start_year = '2014' where name = 'Leïla Slimani';
update participants set nationality = 'Canadian', date_of_birth = '1957', date_of_death = null, career_start_year = '1982' where name = 'Eleanor Wachtel';
update participants set nationality = 'British', date_of_birth = '1981', date_of_death = null, career_start_year = '2015' where name = 'Max Porter';
update participants set nationality = 'British', date_of_birth = '1989', date_of_death = null, career_start_year = '2021' where name = 'Natasha Brown';
update participants set nationality = 'British', date_of_birth = '1975-10-08', date_of_death = null, career_start_year = '2007' where name = 'Tahmima Anam';
update participants set nationality = 'American-British', date_of_birth = '1952-07-01', date_of_death = null, career_start_year = '1979' where name = 'Maureen Freely';
update participants set nationality = 'Ethiopian-British', date_of_birth = '1975', date_of_death = null, career_start_year = '2004' where name = 'Aida Edemariam';
update participants set nationality = 'American', date_of_birth = '1984', date_of_death = null, career_start_year = '2017' where name = 'Merve Emre';
update participants set nationality = 'British', date_of_birth = 'unknown', date_of_death = null, career_start_year = '2011' where name = 'Uilleam Blacker';
update participants set nationality = 'American', date_of_birth = '1978-09-04', date_of_death = null, career_start_year = '2012' where name = 'Natalie Diaz';
update participants set nationality = 'British-Nigerian', date_of_birth = '1990', date_of_death = null, career_start_year = '2020' where name = 'Caleb Femi';
update participants set nationality = 'British', date_of_birth = '1965-08-26', date_of_death = null, career_start_year = '1990' where name = 'Marcus du Sautoy';
update participants set nationality = 'British', date_of_birth = '1945-06-25', date_of_death = '2025-10-26', career_start_year = '1976' where name = 'David Bellos ';
update participants set nationality = 'British', date_of_birth = '1985-09-28', date_of_death = null, career_start_year = '2007' where name = 'Helen Mort';
update participants set nationality = 'British', date_of_birth = '1969', date_of_death = null, career_start_year = '1995' where name = 'Hari Kunzru';
update participants set nationality = 'British', date_of_birth = '1961-06-12', date_of_death = null, career_start_year = '1991' where name = 'Angie Hobbs';
update participants set nationality = 'Mexican-American', date_of_birth = '1983-08-16', date_of_death = null, career_start_year = '2010' where name = 'Valeria Luiselli';
update participants set nationality = 'Indian-British', date_of_birth = '1970', date_of_death = null, career_start_year = '2008' where name = 'Neel Mukherjee';
update participants set nationality = 'Zimbabwean', date_of_birth = '1971', date_of_death = null, career_start_year = '2009' where name = 'Petina Gappah';
update participants set nationality = 'Malaysian', date_of_birth = '1972', date_of_death = null, career_start_year = '2007' where name = 'Tan Twan Eng';
update participants set nationality = 'Sri Lankan-British', date_of_birth = '1954', date_of_death = null, career_start_year = '1991' where name = 'Romesh Gunesekera';
update participants set nationality = 'British', date_of_birth = 'unknown', date_of_death = null, career_start_year = '2010' where name = 'Sana Goyal';
update participants set nationality = 'American-French', date_of_birth = '1975', date_of_death = null, career_start_year = '2005' where name = 'Daniel Medin';
update participants set nationality = 'Turkish-British', date_of_birth = '1971-10-25', date_of_death = null, career_start_year = '1998' where name = 'Elif Shafak';
update participants set nationality = 'British', date_of_birth = 'unknown', date_of_death = null, career_start_year = '2000' where name = 'Tim Martin';
update participants set nationality = 'Indian', date_of_birth = '1969-02-09', date_of_death = null, career_start_year = '1995' where name = 'Pankaj Mishra';
update participants set nationality = 'Indian', date_of_birth = '1959-10-13', date_of_death = null, career_start_year = '1984' where name = 'Jeet Thayil ';
update participants set nationality = 'British', date_of_birth = '1970', date_of_death = null, career_start_year = '2005' where name = 'Olivette Otele';
update participants set nationality = 'British', date_of_birth = '1973-07-08', date_of_death = null, career_start_year = '1995' where name = 'Viv Groskop';
update participants set nationality = 'American', date_of_birth = '1981', date_of_death = null, career_start_year = '2007' where name = 'Parul Sehgal';
update participants set nationality = 'South African', date_of_birth = '1955-04-28', date_of_death = null, career_start_year = '1980' where name = 'William Kentridge';
update participants set nationality = 'Kenyan', date_of_birth = '1993', date_of_death = null, career_start_year = '2016' where name = 'Troy Onyango';
update participants set nationality = 'British ', date_of_birth = '1946-05-08', date_of_death = null, career_start_year = '1984' where name = 'Ruth Padel';
update participants set nationality = 'Nigerian-Belgian', date_of_birth = '1974-06-12', date_of_death = null, career_start_year = '2003' where name = 'Chika Unigwe';
update participants set nationality = 'British-Nigerian', date_of_birth = '1984-12-10', date_of_death = null, career_start_year = '2004' where name = 'Helen Oyeyemi';
update participants set nationality = 'Nigerian', date_of_birth = '1982', date_of_death = null, career_start_year = '2013' where name = 'Elnathan John';
update participants set nationality = 'French-Irish', date_of_birth = 'unknown', date_of_death = null, career_start_year = '2007' where name = 'Lucie Campos';
update participants set nationality = 'British', date_of_birth = 'unknown', date_of_death = null, career_start_year = '1990' where name = 'Frederick Studemann';
update participants set nationality = 'American', date_of_birth = '1990', date_of_death = null, career_start_year = '2017' where name = 'Aaron Robertson';
update participants set nationality = 'British', date_of_birth = '1970-12-14', date_of_death = null, career_start_year = '1996' where name = 'Beth Orton';
update participants set nationality = 'Indian', date_of_birth = '1971', date_of_death = null, career_start_year = '2002' where name = 'Nilanjana S. Roy';
update participants set nationality = 'American', date_of_birth = '1942', date_of_death = null, career_start_year = '1970' where name = 'John Batki';
update participants set nationality = 'American', date_of_birth = '1960', date_of_death = null, career_start_year = '1985' where name = 'Ottilie Mulzet';
update participants set nationality = 'British', date_of_birth = '1945-06-25', date_of_death = '2025-10-26', career_start_year = '1976' where name = 'David Bellos';
update participants set nationality = 'Indian', date_of_birth = '1959-10-13', date_of_death = null, career_start_year = '1984' where name = 'Jeet Thayil';


-- 25. Utworzenie nowej kolumny z dokładną datą urodzenia:
alter table participants
	add column exact_date_of_birth DATE
	after date_of_birth;

-- 26. Przepisanie danych z dokładną datą urodzenia do nowej kolumny:
update participants
	set exact_date_of_birth = date_of_birth
	where date_of_birth regexp '^[0-9]{4}-[0-9]{2}-[0-9]{2}$';

-- 27. Znormalizowanie wartości ogólnej daty urodzenia:
-- (zamienienie wartości "unknown" na null lub pozostawienie samego roku)
update participants
set date_of_birth =
	case 
		when date_of_birth = 'unknown' then null
		else left(date_of_birth,4)
	end;

-- 28. Zmiana typu danych zawierających informację o roku urodzenia:
alter table participants
	modify column date_of_birth YEAR;

-- 29. Przetworzenie danych dotyczących podwójnego lub potrójnego obywatlestwa 
-- poprzez dodanie nowych kolumn i przeniesienie części informacji:
alter table participants
	add column nationality2 VARCHAR(15) null
		after nationality,
	add column nationality3 VARCHAR(15) null
		after nationality2;
	
update participants
set 
nationality2 =
	case
		when length(nationality)-length(replace(nationality,'-','')) = 1 then substring_index(nationality,'-',-1)
		when length(nationality)-length(replace(nationality,'-','')) = 2 then substring_index(substring_index(nationality,'-',-2),'-',1)
	end,
nationality3 = 
	case
		when length(nationality)-length(replace(nationality,'-','')) = 1 then null
		when length(nationality)-length(replace(nationality,'-','')) = 2 then substring_index(nationality,'-',-1)
	end,
nationality =
	substring_index(nationality,'-',1)
where nationality regexp '[-]';

-- 30. Utworzenie kluczy obcych na pozostałych tabelach względem 
-- klucza głównego (imienia i nazwiska osoby zaangażowanej) tabeli participants:
alter table original_editions
add constraint author_foreign_key
	foreign key (author)
	references participants(name)
	on delete restrict;

alter table english_editions
-- drop constraint translator1_foreign_key
-- drop constraint translator2_foreign_key
add constraint translator1_foreign_key
	foreign key (translator1)
	references participants(name)
	on delete restrict,
add constraint translator2_foreign_key
	foreign key (translator2)
	references participants(name)
	on delete restrict;

alter table awards
add constraint judge1_foreign_key 
	foreign key (judge1) 
	references participants(name)
	on delete set null,
add constraint judge2_foreign_key 
	foreign key (judge2) 
	references participants(name)
	on delete set null,
add constraint judge3_foreign_key 
	foreign key (judge3) 
	references participants(name)
	on delete set null,
add constraint judge4_foreign_key 
	foreign key (judge4) 
	references participants(name)
	on delete set null,
add constraint judge5_foreign_key 
	foreign key (judge5) 
	references participants(name)
	on delete set null;

/** Komendy pomocnicze: **/
-- Użyj/usuń bazę danych
use international_booker_prize

drop database international_booker_prize

-- Pokaż wyniki wyszukiwania/zawartość całej tabeli: 
select * from nominations 
select * from original_editions
select * from english_editions
select * from awards where year_edition between 2026 and 2027
select * from participants

alter table english_editions
drop constraint translator2_foreign_key

delete from participants where nationality is null

-- Usuń tabelę:
drop table nominations

-- Wyczyść zawartość tabeli:
truncate table awards

-- Usuń kolumnę (często zapisane jako komentarz w dopracowywanej komendzie):
alter table participants
-- 	drop column exact_date_of_birth;
	add column exact_date_of_birth DATE
	after date_of_birth;

-- Sprawdzanie duplikatów wartości:
select 
	count(author),	
	count(distinct author) 
from original_editions

-- Sprawdzanie maksymalnej dugości wartości atrybutu: 
select max(length(publisher)) 
	from english_editions

	
	
	
-- Procedura składowana:
-- 1. Ogłoszenie nowej edycji: 
	
use international_booker_prize;	

drop procedure if exists new_award_edition;

create procedure new_award_edition
(
	IN p_award_year YEAR,
	IN p_longlist_announcement_date DATE,
	IN p_judge1 VARCHAR(30),
	IN p_judge2 VARCHAR(30),
	IN p_judge3 VARCHAR(30),
	IN p_judge4 VARCHAR(30),
	IN p_judge5 VARCHAR(30)
)	
begin
	
	insert ignore into participants (name)
	values 
		(p_judge1),(p_judge2),(p_judge3),(p_judge4),(p_judge5);
	
	insert into awards (year_edition,longlist_announcement_date,judge1,judge2,judge3,judge4,judge5)
	values 
	(
		p_award_year,
		p_longlist_announcement_date,
		p_judge1,
		p_judge2,
		p_judge3,
		p_judge4,
		p_judge5
	)
	on duplicate key update year_edition = p_award_year;
	
end;

-- Wprowadzenie danych: 
call new_award_edition
(
	'', -- award_year
	'', -- longlist_announcement_date
	'', -- judge1
	'', -- judge2
	'', -- judge3
	'', -- judge4
	'' -- judge5
);
	
-- 2. Nowa nominacja:	
use international_booker_prize;	

drop procedure if exists new_nominated_book;

create procedure new_nominated_book
(
	IN p_award_year YEAR,
	IN p_author VARCHAR(36),
	IN p_country VARCHAR(100),
	IN p_language VARCHAR(30),
	IN p_original_title VARCHAR(60),
	IN p_english_title VARCHAR(60),
	IN p_translator VARCHAR(100),
	IN p_english_publisher VARCHAR(50),
	IN p_publishing_date_original DATE,
	IN p_publishing_date_english DATE
)
begin
	
-- zadeklarowanie klucza głównego:
	declare new_id INTEGER;
	
-- wprowadzenie danych do tabeli nominations:	
	insert into nominations (award_year)
	values (p_award_year);
	
	set new_id = last_insert_id();
	
-- wprowadzenie danych do tabeli participants:	
	insert ignore into participants (name)
	values 
		(p_author),
		(case 
			when p_translator regexp '[,;&/-]' then 
				trim(substring_index(regexp_replace(p_translator,'[,;&/-]', ','),',',1))
			else p_translator
		end),
		(case
			when p_translator regexp '[,;&/-]' then 
				trim(substring_index(regexp_replace(p_translator,'[,;&/-]', ','),',',-1))
			else null
		end);
	
-- wprowadzenie danych do tabeli original_editions:		
	insert into original_editions 
		(id,title_original,author,country,country2,language,original_publishing_date)
	values 
	(
		new_id,
		p_original_title,
		p_author,
		case 
			when p_country regexp '[,;/&-]' then 
				trim(substring_index(regexp_replace(p_country,'[,;&/-]', ','),',',1))
			else p_country
		end,
		case
			when p_country regexp '[,;/&-]' then 
				trim(substring_index(regexp_replace(p_country,'[,;&/-]', ','),',',-1))
			else null
		end,
		p_language,
		date_format(p_publishing_date_original,'%Y-%m-%d')
	);
	
-- wprowadzenie danych do tabeli english_editions:		
	insert into english_editions 
		(id,english_title,translator1,translator2,publisher,publishing_date)
	values
	(
		new_id,
		p_english_title,
		case 
			when p_translator regexp '[,;&/-]' then 
				trim(substring_index(regexp_replace(p_translator,'[,;&/-]', ','),',',1))
			else p_translator
		end,
		case
			when p_translator regexp '[,;&/-]' then 
				trim(substring_index(regexp_replace(p_translator,'[,;&/-]', ','),',',-1))
			else null
		end,
		p_english_publisher,
		date_format(p_publishing_date_english,'%Y-%m-%d')
	);

end;

-- Wprowadzenie danych: 
call new_nominated_book
(
	'', -- award_year
	'', -- author
	'', -- country
	'', -- language
	'', -- original_title
	'', -- english_title
	'', -- translator
	'', -- english_publisher
	'', -- publishing_date_original
	'' -- publishing_date_english
);

/** Wersja poprzedzona stworzeniem funkcji modyfikacji wartości translator oraz country: **/
-- zmiana wartości translator1:
drop function if exists data_translator1_modification;

create function data_translator1_modification (p_translator VARCHAR(100))
returns VARCHAR(30)
deterministic
begin
	declare translator1_modificated VARCHAR(30);
	set translator1_modificated = 
		case
			when p_translator regexp '[,;&/-]' then 
				trim(substring_index(regexp_replace(p_translator,'[,;&/-]', ','),',',1))
			else p_translator
		end;
	return translator1_modificated;
end;

-- zmiana wartości translator2:
drop function if exists data_translator2_modification;

create function data_translator2_modification (p_translator VARCHAR(100))
returns VARCHAR(30)
deterministic
begin
	declare translator2_modificated VARCHAR(30);
	set translator2_modificated = 
		case
			when p_translator regexp '[,;&/-]' then 
				trim(substring_index(regexp_replace(p_translator,'[,;&/-]', ','),',',-1))
			else null
		end;
	return translator2_modificated;
end;

-- zmiana wartości country1:
drop function if exists data_country1_modification;

create function data_country1_modification (p_country VARCHAR(100))
returns VARCHAR(30)
deterministic
begin
	declare country1_modificated VARCHAR(30);
	set country1_modificated = 
		case
			when p_country regexp '[,;/&-]' then 
				trim(substring_index(regexp_replace(p_country,'[,;&/-]', ','),',',1))
			else p_country
		end;
	return country1_modificated;
end;

-- zmiana wartości country2:
drop function if exists data_country2_modification;

create function data_country2_modification (p_country VARCHAR(100))
returns VARCHAR(30)
deterministic
begin
	declare country2_modificated VARCHAR(30);
	set country2_modificated = 
		case
			when p_country regexp '[,;/&-]' then 
				trim(substring_index(regexp_replace(p_country,'[,;&/-]', ','),',',-1))
			else null
		end;
	return country2_modificated;
end;

-- 2.2. Nowa nominacja:	
use international_booker_prize;	

drop procedure if exists new_nominated_book;

create procedure new_nominated_book
(
	IN p_award_year YEAR,
	IN p_author VARCHAR(36),
	IN p_country VARCHAR(100),
	IN p_language VARCHAR(30),
	IN p_original_title VARCHAR(60),
	IN p_english_title VARCHAR(60),
	IN p_translator VARCHAR(100),
	IN p_english_publisher VARCHAR(50),
	IN p_publishing_date_original DATE,
	IN p_publishing_date_english DATE
)
begin
	
-- zadeklarowanie klucza głównego:
	declare new_id INTEGER;
	
-- wprowadzenie danych do tabeli nominations:	
	insert into nominations (award_year)
	values (p_award_year);
	
	set new_id = last_insert_id();
	
-- wprowadzenie danych do tabeli participants:	
	insert ignore into participants (name)
	values 
		(p_author),
		(data_translator1_modification(p_translator)),
		(data_translator2_modification(p_translator));
	
-- wprowadzenie danych do tabeli original_editions:		
	insert into original_editions 
		(id,title_original,author,country,country2,language,original_publishing_date)
	values 
	(
		new_id,
		p_original_title,
		p_author,
		data_country1_modification(p_country),
		data_country2_modification(p_country),
		p_language,
		date_format(p_publishing_date_original,'%Y-%m-%d')
	);
	
-- wprowadzenie danych do tabeli english_editions:		
	insert into english_editions 
		(id,english_title,translator1,translator2,publisher,publishing_date)
	values
	(
		new_id,
		p_english_title,
		data_translator1_modification(p_translator),
		data_translator2_modification(p_translator),
		p_english_publisher,
		date_format(p_publishing_date_english,'%Y-%m-%d')
	);

end;


-- 3. Ogłoszenie krótkiej listy: 
use international_booker_prize;	

drop procedure if exists shortlist_announcement;

create procedure shortlist_announcement
(
	IN p_shortlist_announcement_date DATE,
	IN p_author1 VARCHAR(30),
	IN p_author2 VARCHAR(30),
	IN p_author3 VARCHAR(30),
	IN p_author4 VARCHAR(30),
	IN p_author5 VARCHAR(30),
	IN p_author6 VARCHAR(30)
)	
begin
	
update awards
	set shortlist_announcement_date = p_shortlist_announcement_date
	where year_edition = year(p_shortlist_announcement_date);

update nominations as n
join original_editions as oe
	on n.id = oe.id
	set shortlist = 1 
	where author in (p_author1,p_author2,p_author3,p_author4,p_author5,p_author6);

end;

-- Wprowadzenie danych: 
call shortlist_announcement
(
	'', -- shortlist_announcement_date
	'', -- shortlisted_author1 
	'', -- shortlisted_author2 
	'', -- shortlisted_author3 
	'', -- shortlisted_author4 
	'', -- shortlisted_author5
	'' -- shortlisted_author6 
);

-- 4. Ogłoszenie zwycięzcy: 
use international_booker_prize;	

drop procedure if exists winner_announcement;

create procedure winner_announcement
(
	IN p_winner_announcement_date DATE,
	IN p_winner_author1 VARCHAR(30),
	IN p_winner_author2 VARCHAR(30)
)	
begin
	
-- wprowadzenie danych do tabeli nominations:	
update nominations as n
join original_editions as oe
		on n.id = oe.id
	set n.winner = 1 
	where oe.author in (p_winner_author1,p_winner_author2)
		and n.award_year = year(p_winner_announcement_date);

-- wprowadzenie danych do tabeli awards:
update awards
	set winner_announcement_date = p_winner_announcement_date
	where year_edition = year(p_winner_announcement_date);

update awards as a
	set winning_book = 
		(
			select n.id 
			from nominations as n
			where n.winner = 1 
				and n.award_year = a.year_edition
			limit 1	
		)
	where year_edition = year(p_winner_announcement_date);

-- warunek opcjonalny, jeśli kiedyś ogłoszonych zostanie dwóch zwycięzców:
if p_winner_author2 is not null then

-- w przypadku, gdy podwójne zwycięstwo ogłoszone zostanie po raz pierwszy, utworzona zostanie nowa kolumna:
	if not exists (select 1 from information_schema.columns where table_name = 'awards' and column_name = 'winning_book2') then
		alter table awards
			add column winning_book2 INTEGER
			after winning_book;
		alter table awards
			add constraint winning_book2_foreign_key 
				foreign key (winning_book2)
				references nominations(id)
				on delete set null;	
	end if;
	
	update awards as a
		set winning_book2 = 
			(
				select n.id 
				from nominations as n
				where n.winner = 1 
					and n.award_year = a.year_edition
				limit 2 offset 1
			)		
		where a.year_edition = year(p_winner_announcement_date);
end if;

end;


/** Opcja szczegółowa: **/
if p_winner_author2 is null then
	update awards as a
	set winning_book = 
		(
			select n.id 
			from nominations as n
			where n.winner = 1 
				and n.award_year = a.year_edition
		)
	where year_edition = year(p_winner_announcement_date);
else
-- jeśli kolumna z drugim zwycięzcą już istnieje:
	if exists (select 1 from information_schema.columns where table_name = 'awards' and column_name = 'winning_book2') then
		update awards as a
		set winning_book = 
			(
				select n.id 
				from nominations as n
				where n.winner = 1 
					and n.award_year = a.year_edition
				limit 1
			),
		winning_book2 = 
			(
				select n.id 
				from nominations as n
				where n.winner = 1 
					and n.award_year = a.year_edition
				limit 2 offset 1
			)		
		where a.year_edition = year(p_winner_announcement_date);
-- jeśli kolumna z drugim zwycięzcą jeszcze nie istnieje:
	else
		alter table awards
			add column winning_book2 INTEGER
			after winning_book;
		alter table awards
			add constraint winning_book2_foreign_key 
				foreign key (winning_book2)
				references nominations(id)
				on delete set null;
		update awards
		set winning_book = 
			(
				select n.id 
				from nominations as n
				where n.winner = 1 
					and n.award_year = a.year_edition
				limit 1
			),
		winning_book2 = 
			(
				select n.id 
				from nominations as n
				where n.winner = 1 
					and n.award_year = a.year_edition
				limit 2 offset 1
			)			
		where a.year_edition = year(p_winner_announcement_date);
	end if;
end if;

end;

-- Wprowadzenie danych: 
call winner_announcement
(
	'', -- winner_announcement_date
	'', -- winner_author 
	'' -- optional_winner_author2
);


-- 1.
call new_award_edition
(
	'2027', 				-- p_award_year
	'2027-03-12', 			-- p_longlist_announcement_date
	'Deborah Smith', 		-- p_judge1
	'Marilyn Booth', 		-- p_judge2
	'Julian Barnes', 		-- p_judge3
	'Gwendoline Riley', 	-- p_judge4
	'Charlotte Collins' 	-- p_judge5
);

-- 2.
call new_nominated_book
('2027','Yáng Shuāng-zǐ','Taiwan','Mandarin','花開時節','Seasons of Bloom','Lin King','And Other Stories','2017-10-04','2027-03-21');
call new_nominated_book
('2027','Żabq Ślimaczewskie','Poland','Polish','Wielka Księga Żabich Mądrości','The Great Book of Frog Wisdom','Sluggy Stardust','Amphibian Publishing','2025-06-13','2026-06-13');
call new_nominated_book
('2027','Mubarak Rabi','Morocco','Arabic','رفقة السلاح والقمر','The Company of Arms and Moon','Denys Johnson-Davies','Saqi Books','1976-01-01','2027-02-10');
call new_nominated_book
('2027','Aga Goldstein','Israel','Hebrew','מפציץ כשר','Kosher Bomber','Ina Akina','Das Luft','1989-09-07','2026-12-24');
call new_nominated_book
('2027','Julia Sanches','Brazil, Portugal','Portuguese','Autor invisível','Invisible Author','Julia Sanches','Scribe','2026-11-27','2026-11-30');

call new_nominated_book
(
	'2027', 						-- p_award_year
	'Julia Cichoń', 				-- p_author
	'Poland', 						-- p_country
	'Polish', 						-- p_language
	'Lubię truskawki', 				-- p_original_title
	'I Like Strawberries', 			-- p_english_title
	'Antoine Nicolas Duchesne', 	-- p_translator
	'Berries and Other Stories', 	-- p_english_publisher
	'1995-10-31', 					-- p_publishing_date_original
	'2026-06-21' 					-- p_publishing_date_english
);

call new_nominated_book
('2027','Gerardo Oso','Bolivia','Spanish','Reglas del juego Magic: The Gathering','Magic the Gathering Game Rules','Lucia Graves','Harvill Secker','2009-09-20','2027-03-11');
call new_nominated_book
('2027','Dok Ket','Laos','Laotian','ເດັກ​ກຳພ້າ​ນ້ອຍ​ແລະ​ວິນຍານ','The Little Orphan and the Spirit','Roger Warner, Eleanor Hayes','Tilted Axis Press','1990-01-01','2026-08-24');
call new_nominated_book
('2027','Jan Tichy','Poland/Ukraine','Byelorussian','цішыня','Quiet','Vladimir Paparaparać','Liberty','1997-02-02','2026-04-10');
call new_nominated_book
('2027','Peter Pan','Philippines','Filipino','Neverland, Doon at Muli','Neverland, There and Back Again','Kapitan Hook','Tinker Bell Co.','2004-01-01','2026-05-30');
call new_nominated_book
('2027','Katsi yeKitsi','Zimbabwe','Shona','Kuti katsi ibude mubhegi','To Let the Cat Out of the Bag','Liam Briefcase','Luggage Storage','2024-10-26','2026-10-25');
call new_nominated_book
('2027','Rimantas Kmita','Lithuania','Lithuanian','Pietinia kronikas','Southern Chronicles','Kotryna Garanašvili','Fitzcarraldo Editions','2016-01-01','2027-01-01');
call new_nominated_book
('2027','Guillermo Saccomanno','Argentina','Spanish','Arderá el viento','The Wind Gonna Burn','Sam Carter & Trevor Grove','Charco Press','2025-05-20','2026-09-18');

-- 3.
call shortlist_announcement
(
	'2027-04-13', 				-- shortlist_announcement_date
	'Żabq Ślimaczewskie', 		-- shortlisted_author1 
	'Aga Goldstein', 			-- shortlisted_author2 
	'Julia Cichoń', 			-- shortlisted_author3 
	'Jan Tichy', 				-- shortlisted_author4 
	'Katsi yeKitsi', 			-- shortlisted_author5
	'Guillermo Saccomanno' 		-- shortlisted_author6 
);

-- 4.
call winner_announcement
(
	'2027-05-25', 			-- winner_announcement_date
	'Julia Cichoń', 		-- winner_author 
	null					-- optional_winner_author2
);

-- 4.2.
/** Symulacja, gdyby ogłoszono dwóch zwycięzców: **//
call winner_announcement
(
	'2027-05-25', 			-- winner_announcement_date
	'Julia Cichoń', 		-- winner_author 
	'Żabq Ślimaczewskie'	-- optional_winner_author2
);

select * from awards
