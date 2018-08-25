-- **** RECORDAR POSICIONARSE EN LA BASE DONDE SE CREARÁ LA ESTRUCTURA ****
create database base_de_prueba

use base_de_prueba

CREATE TABLE provincia 
(
    codprovi	INT NOT NULL,
    nomprovi 	VARCHAR(60) NOT NULL,
    CONSTRAINT pk_provincia PRIMARY KEY CLUSTERED (codprovi)
)

CREATE TABLE departamento 
(
    codprovi	INT NOT NULL,
    coddepar	INT NOT NULL,
    nomdepar	VARCHAR(60) NOT NULL,
    CONSTRAINT pk_departamento PRIMARY KEY CLUSTERED (codprovi,coddepar),
    CONSTRAINT fk_departamento_provincia FOREIGN KEY (codprovi) REFERENCES dbo.provincia (codprovi)
)

CREATE TABLE distrito 
(
    coddist		INT NOT NULL,
    codprovi	INT NULL,
    coddepar	INT NULL,
    nomdist		VARCHAR(60) NOT NULL,
    CONSTRAINT pk_distrito  PRIMARY KEY CLUSTERED (coddist),
    CONSTRAINT fk_distrito_departamento FOREIGN KEY (codprovi,coddepar) REFERENCES dbo.departamento (codprovi,coddepar),
    CONSTRAINT fk_distrito_provincia FOREIGN KEY (codprovi) REFERENCES dbo.provincia (codprovi)
)

CREATE TABLE persona
(
idperso		NUMERIC IDENTITY NOT NULL,
nomperso	VARCHAR(60) NOT NULL,
domiperso	VARCHAR(60) NOT NULL,
coddist		INT NOT NULL,
CONSTRAINT pk_persona  PRIMARY KEY CLUSTERED (idperso),
CONSTRAINT fk_persona_distrito FOREIGN KEY (coddist) REFERENCES distrito (coddist)
)


-- Inserts tabla: provincia

INSERT INTO provincia VALUES (
	0,
	'No informada') 
INSERT INTO provincia VALUES (
	2,
	'Capital Federal') 
INSERT INTO provincia VALUES (
	6,
	'Buenos Aires') 
INSERT INTO provincia VALUES (
	10,
	'Catamarca') 
INSERT INTO provincia VALUES (
	14,
	'Córdoba') 
INSERT INTO provincia VALUES (
	18,
	'Corrientes') 
INSERT INTO provincia VALUES (
	22,
	'Chaco') 
INSERT INTO provincia VALUES (
	30,
	'Entre Ríos') 
INSERT INTO provincia VALUES (
	34,
	'Formosa') 
INSERT INTO provincia VALUES (
	38,
	'Jujuy') 
INSERT INTO provincia VALUES (
	42,
	'La Pampa') 
INSERT INTO provincia VALUES (
	46,
	'La Rioja') 
INSERT INTO provincia VALUES (
	50,
	'Mendoza') 
INSERT INTO provincia VALUES (
	54,
	'Misiones') 
INSERT INTO provincia VALUES (
	58,
	'Neuquén') 
INSERT INTO provincia VALUES (
	62,
	'Rio Negro') 
INSERT INTO provincia VALUES (
	66,
	'Salta') 
INSERT INTO provincia VALUES (
	70,
	'San Juan') 
INSERT INTO provincia VALUES (
	74,
	'San Luis') 
INSERT INTO provincia VALUES (
	78,
	'Santa Cruz') 
INSERT INTO provincia VALUES (
	82,
	'Santa Fe') 
INSERT INTO provincia VALUES (
	86,
	'Santia del Estero') 
INSERT INTO provincia VALUES (
	90,
	'Tucumán') 
INSERT INTO provincia VALUES (
	94,
	'Ter. Nac. Tierra del Fue, Antártida, Islas Atlántico Sur') 
INSERT INTO provincia VALUES (
	26,
	'Chubut') 

-- Inserts tabla: departamento

INSERT INTO departamento VALUES (
	82,
	7,
	'Belgrano') 
INSERT INTO departamento VALUES (
	82,
	14,
	'Caseros') 
INSERT INTO departamento VALUES (
	82,
	21,
	'Castellanos') 
INSERT INTO departamento VALUES (
	82,
	28,
	'Constitución') 
INSERT INTO departamento VALUES (
	82,
	35,
	'Garay') 
INSERT INTO departamento VALUES (
	82,
	42,
	'General Lopez') 
INSERT INTO departamento VALUES (
	82,
	49,
	'General Obligado') 
INSERT INTO departamento VALUES (
	82,
	56,
	'Iriondo') 
INSERT INTO departamento VALUES (
	82,
	63,
	'La Capital') 
INSERT INTO departamento VALUES (
	82,
	70,
	'Las Colonias') 
INSERT INTO departamento VALUES (
	82,
	77,
	'9 de Julio') 
INSERT INTO departamento VALUES (
	82,
	84,
	'Rosario') 
INSERT INTO departamento VALUES (
	82,
	91,
	'San Cristobal') 
INSERT INTO departamento VALUES (
	82,
	98,
	'San Javier') 
INSERT INTO departamento VALUES (
	82,
	105,
	'San Jerónimo') 
INSERT INTO departamento VALUES (
	82,
	112,
	'San Justo') 
INSERT INTO departamento VALUES (
	82,
	119,
	'San Lorenzo') 
INSERT INTO departamento VALUES (
	82,
	126,
	'San Martín') 
INSERT INTO departamento VALUES (
	82,
	133,
	'Vera') 
INSERT INTO departamento VALUES (
	86,
	7,
	'Aguirre') 
INSERT INTO departamento VALUES (
	86,
	14,
	'Alberdi') 

-- Inserts tabla: distrito

INSERT INTO distrito VALUES (
	1,
	82,
	42,
	'AARON CASTELLANOS') 
INSERT INTO distrito VALUES (
	2,
	82,
	84,
	'ACEBAL') 
INSERT INTO distrito VALUES (
	3,
	82,
	91,
	'AGUARA GRANDE') 
INSERT INTO distrito VALUES (
	4,
	82,
	84,
	'ALBARELLOS') 
INSERT INTO distrito VALUES (
	5,
	82,
	28,
	'ALCORTA') 
INSERT INTO distrito VALUES (
	6,
	82,
	119,
	'ALDAO') 
INSERT INTO distrito VALUES (
	7,
	82,
	98,
	'ALEJANDRA') 
INSERT INTO distrito VALUES (
	8,
	82,
	84,
	'ALVAREZ') 
INSERT INTO distrito VALUES (
	9,
	82,
	84,
	'ALVEAR') 
INSERT INTO distrito VALUES (
	10,
	82,
	91,
	'AMBROSETTI') 
INSERT INTO distrito VALUES (
	11,
	82,
	42,
	'AMENABAR') 
INSERT INTO distrito VALUES (
	12,
	82,
	21,
	'ANGELICA') 
INSERT INTO distrito VALUES (
	13,
	82,
	112,
	'ANGELONI') 
INSERT INTO distrito VALUES (
	14,
	82,
	14,
	'AREQUITO') 
INSERT INTO distrito VALUES (
	15,
	82,
	84,
	'ARMINDA') 
INSERT INTO distrito VALUES (
	16,
	82,
	7,
	'ARMSTRONG') 
INSERT INTO distrito VALUES (
	17,
	82,
	105,
	'AROCENA') 
INSERT INTO distrito VALUES (
	18,
	82,
	63,
	'ARROYO AGUIAR') 
INSERT INTO distrito VALUES (
	19,
	82,
	49,
	'ARROYO CEIBAL') 
INSERT INTO distrito VALUES (
	20,
	82,
	63,
	'ARROYO LEYES') 
INSERT INTO distrito VALUES (
	21,
	82,
	84,
	'ARROYO SECO') 
INSERT INTO distrito VALUES (
	22,
	82,
	91,
	'ARRUFO') 
INSERT INTO distrito VALUES (
	23,
	82,
	14,
	'ARTEAGA') 
INSERT INTO distrito VALUES (
	24,
	82,
	21,
	'ATALIVA') 
INSERT INTO distrito VALUES (
	25,
	82,
	21,
	'AURELIA') 
INSERT INTO distrito VALUES (
	26,
	82,
	49,
	'AVELLANEDA') 
INSERT INTO distrito VALUES (
	27,
	82,
	105,
	'BARRANCAS') 
INSERT INTO distrito VALUES (
	28,
	82,
	21,
	'BAUER Y SIGEL') 
INSERT INTO distrito VALUES (
	29,
	82,
	21,
	'BELLA ITALIA') 
INSERT INTO distrito VALUES (
	30,
	82,
	14,
	'BERABEVU') 
INSERT INTO distrito VALUES (
	31,
	82,
	49,
	'BERNA') 
INSERT INTO distrito VALUES (
	32,
	82,
	105,
	'BERNARDO DE IRIYEN') 
INSERT INTO distrito VALUES (
	33,
	82,
	14,
	'BIGAND') 
INSERT INTO distrito VALUES (
	34,
	82,
	28,
	'BOMBAL') 
INSERT INTO distrito VALUES (
	35,
	82,
	7,
	'BOUQUET') 
INSERT INTO distrito VALUES (
	36,
	82,
	56,
	'BUSTINZA') 
INSERT INTO distrito VALUES (
	37,
	82,
	63,
	'CABAL') 
INSERT INTO distrito VALUES (
	38,
	82,
	98,
	'CACIQUE ARIACAIQUIN') 
INSERT INTO distrito VALUES (
	39,
	82,
	42,
	'CAFFERATA') 
INSERT INTO distrito VALUES (
	40,
	82,
	133,
	'CALCHAQUI') 
INSERT INTO distrito VALUES (
	41,
	82,
	63,
	'CAMPO ANDINO') 
INSERT INTO distrito VALUES (
	42,
	82,
	105,
	'CAMPO PIAGGIO') 
INSERT INTO distrito VALUES (
	43,
	82,
	63,
	'CANDIOTI') 
INSERT INTO distrito VALUES (
	44,
	82,
	56,
	'CAÑADA DE MEZ') 
INSERT INTO distrito VALUES (
	45,
	82,
	42,
	'CAÑADA DEL UCLE') 
INSERT INTO distrito VALUES (
	46,
	82,
	133,
	'CAÑADA OMBU') 
INSERT INTO distrito VALUES (
	47,
	82,
	28,
	'CAÑADA RICA') 
INSERT INTO distrito VALUES (
	48,
	82,
	126,
	'CAÑADA ROSQUIN') 
INSERT INTO distrito VALUES (
	49,
	82,
	119,
	'CAPITAN BERMUDEZ') 
INSERT INTO distrito VALUES (
	50,
	82,
	91,
	'CAPIVARA') 
INSERT INTO distrito VALUES (
	51,
	82,
	119,
	'CARCARAÑA') 
INSERT INTO distrito VALUES (
	52,
	82,
	126,
	'CARLOS PELLEGRINI') 
INSERT INTO distrito VALUES (
	53,
	82,
	42,
	'CARMEN') 
INSERT INTO distrito VALUES (
	54,
	82,
	84,
	'CARMEN DEL SAUCE') 
INSERT INTO distrito VALUES (
	55,
	82,
	42,
	'CARRERAS') 
INSERT INTO distrito VALUES (
	56,
	82,
	56,
	'CARRIZALES') 
INSERT INTO distrito VALUES (
	57,
	82,
	105,
	'CASALEGNO') 
INSERT INTO distrito VALUES (
	58,
	82,
	126,
	'CASAS') 
INSERT INTO distrito VALUES (
	59,
	82,
	14,
	'CASILDA') 
INSERT INTO distrito VALUES (
	60,
	82,
	126,
	'CASTELAR') 
INSERT INTO distrito VALUES (
	61,
	82,
	21,
	'CASTELLANOS') 
INSERT INTO distrito VALUES (
	62,
	82,
	70,
	'CAVOUR') 
INSERT INTO distrito VALUES (
	63,
	82,
	35,
	'CAYASTA') 
INSERT INTO distrito VALUES (
	64,
	82,
	112,
	'CAYASTACITO') 
INSERT INTO distrito VALUES (
	65,
	82,
	105,
	'CENTENO') 
INSERT INTO distrito VALUES (
	66,
	82,
	28,
	'CEPEDA') 
INSERT INTO distrito VALUES (
	67,
	82,
	91,
	'CERES') 
INSERT INTO distrito VALUES (
	68,
	82,
	14,
	'CHABAS') 
INSERT INTO distrito VALUES (
	69,
	82,
	14,
	'CHAÑAR LADEADO') 
INSERT INTO distrito VALUES (
	70,
	82,
	42,
	'CHAPUY') 
INSERT INTO distrito VALUES (
	71,
	82,
	42,
	'CHOVET') 
INSERT INTO distrito VALUES (
	72,
	82,
	42,
	'CHRISTOPHERSEN') 
INSERT INTO distrito VALUES (
	73,
	82,
	56,
	'CLASSON') 
INSERT INTO distrito VALUES (
	74,
	82,
	21,
	'COLONIA ALDAO') 
INSERT INTO distrito VALUES (
	75,
	82,
	91,
	'COLONIA ANA') 
INSERT INTO distrito VALUES (
	76,
	82,
	126,
	'COLONIA BELGRANO') 
INSERT INTO distrito VALUES (
	77,
	82,
	21,
	'COLONIA BICHA') 
INSERT INTO distrito VALUES (
	78,
	82,
	21,
	'COLONIA BIGAND') 
INSERT INTO distrito VALUES (
	79,
	82,
	91,
	'COLONIA BOSSI') 
INSERT INTO distrito VALUES (
	80,
	82,
	21,
	'COLONIA CELLO') 
INSERT INTO distrito VALUES (
	81,
	82,
	91,
	'COLONIA CLARA') 
INSERT INTO distrito VALUES (
	82,
	82,
	112,
	'COLONIA DOLORES') 
INSERT INTO distrito VALUES (
	83,
	82,
	98,
	'COLONIA DURAN') 
INSERT INTO distrito VALUES (
	84,
	82,
	21,
	'COLONIA ITURRASPE') 
INSERT INTO distrito VALUES (
	85,
	82,
	21,
	'COLONIA MARGARITA') 
INSERT INTO distrito VALUES (
	86,
	82,
	35,
	'COLONIA MASCIAS') 
INSERT INTO distrito VALUES (
	87,
	82,
	21,
	'COLONIA RAQUEL') 
INSERT INTO distrito VALUES (
	88,
	82,
	91,
	'COLONIA ROSA') 
INSERT INTO distrito VALUES (
	89,
	82,
	91,
	'CONSTANZA') 
INSERT INTO distrito VALUES (
	90,
	82,
	105,
	'CORONDA') 
INSERT INTO distrito VALUES (
	91,
	82,
	119,
	'CORONEL ARNOLD') 
INSERT INTO distrito VALUES (
	92,
	82,
	84,
	'CORONEL BOGADO') 
INSERT INTO distrito VALUES (
	93,
	82,
	84,
	'CORONEL DOMINGUEZ') 
INSERT INTO distrito VALUES (
	94,
	82,
	21,
	'CORONEL FRAGA') 
INSERT INTO distrito VALUES (
	95,
	82,
	56,
	'CORREA') 
INSERT INTO distrito VALUES (
	96,
	82,
	126,
	'CRISPI') 
INSERT INTO distrito VALUES (
	97,
	82,
	70,
	'CULULU') 
INSERT INTO distrito VALUES (
	98,
	82,
	91,
	'CURUPAITY') 
INSERT INTO distrito VALUES (
	99,
	82,
	105,
	'DESVIO ARIJON') 
INSERT INTO distrito VALUES (
	100,
	82,
	105,
	'DIAZ') 
INSERT INTO distrito VALUES (
	101,
	82,
	42,
	'DIE DE ALVEAR') 
INSERT INTO distrito VALUES (
	102,
	82,
	91,
	'DOS ROSAS Y LA LEGUA') 
INSERT INTO distrito VALUES (
	103,
	82,
	21,
	'EGUSQUIZA') 
INSERT INTO distrito VALUES (
	104,
	82,
	49,
	'EL ARAZA') 
INSERT INTO distrito VALUES (
	105,
	82,
	49,
	'EL RABON') 
INSERT INTO distrito VALUES (
	106,
	82,
	49,
	'EL SOMBRERITO') 
INSERT INTO distrito VALUES (
	107,
	82,
	126,
	'EL TREBOL') 
INSERT INTO distrito VALUES (
	108,
	82,
	70,
	'ELISA') 
INSERT INTO distrito VALUES (
	109,
	82,
	42,
	'ELORTONDO') 
INSERT INTO distrito VALUES (
	110,
	82,
	63,
	'EMILIA') 
INSERT INTO distrito VALUES (
	111,
	82,
	70,
	'EMPALME SAN CARLOS') 
INSERT INTO distrito VALUES (
	112,
	82,
	28,
	'EMPALME VILLA CONSTITUCION') 
INSERT INTO distrito VALUES (
	113,
	82,
	21,
	'ESMERALDA') 
INSERT INTO distrito VALUES (
	114,
	82,
	70,
	'ESPERANZA') 
INSERT INTO distrito VALUES (
	115,
	82,
	21,
	'ESTACION CLUCELLAS') 
INSERT INTO distrito VALUES (
	116,
	82,
	77,
	'ESTEBAN RAMS') 
INSERT INTO distrito VALUES (
	117,
	82,
	112,
	'ESTHER') 
INSERT INTO distrito VALUES (
	118,
	82,
	21,
	'EUSEBIA Y CAROLINA') 
INSERT INTO distrito VALUES (
	119,
	82,
	21,
	'EUSTOLIA') 
INSERT INTO distrito VALUES (
	120,
	82,
	70,
	'FELICIA') 
INSERT INTO distrito VALUES (
	121,
	82,
	21,
	'FIDELA') 
INSERT INTO distrito VALUES (
	122,
	82,
	84,
	'FIGHIERA') 
INSERT INTO distrito VALUES (
	123,
	82,
	42,
	'FIRMAT') 
INSERT INTO distrito VALUES (
	124,
	82,
	49,
	'FLORENCIA') 
INSERT INTO distrito VALUES (
	125,
	82,
	133,
	'FORTIN OLMOS') 
INSERT INTO distrito VALUES (
	126,
	82,
	70,
	'FRANCK') 
INSERT INTO distrito VALUES (
	127,
	82,
	119,
	'FRAY LUIS BELTRAN') 
INSERT INTO distrito VALUES (
	128,
	82,
	21,
	'FRONTERA') 
INSERT INTO distrito VALUES (
	129,
	82,
	119,
	'FUENTES') 
INSERT INTO distrito VALUES (
	130,
	82,
	84,
	'FUNES') 
INSERT INTO distrito VALUES (
	131,
	82,
	105,
	'GABOTO') 
INSERT INTO distrito VALUES (
	132,
	82,
	21,
	'GALISTEO') 
INSERT INTO distrito VALUES (
	133,
	82,
	105,
	'GALVEZ') 
INSERT INTO distrito VALUES (
	134,
	82,
	133,
	'GARABATO') 
INSERT INTO distrito VALUES (
	135,
	82,
	21,
	'GARIBALDI') 
INSERT INTO distrito VALUES (
	136,
	82,
	77,
	'GATO COLORADO') 
INSERT INTO distrito VALUES (
	137,
	82,
	28,
	'GENERAL GELLY') 
INSERT INTO distrito VALUES (
	138,
	82,
	84,
	'GENERAL LAS') 
INSERT INTO distrito VALUES (
	139,
	82,
	105,
	'GESSLER') 
INSERT INTO distrito VALUES (
	140,
	82,
	112,
	'BERNADOR CRESPO') 
INSERT INTO distrito VALUES (
	141,
	82,
	14,
	'DEKEN') 
INSERT INTO distrito VALUES (
	142,
	82,
	28,
	'DOY') 
INSERT INTO distrito VALUES (
	143,
	82,
	133,
	'LONDRINA') 
INSERT INTO distrito VALUES (
	144,
	82,
	84,
	'GRANADERO BAIRRIA') 
INSERT INTO distrito VALUES (
	145,
	82,
	77,
	'GRERIA PEREZ DE DENIS') 
INSERT INTO distrito VALUES (
	146,
	82,
	70,
	'GRUTLY') 
INSERT INTO distrito VALUES (
	147,
	82,
	49,
	'GUADALUPE NORTE') 
INSERT INTO distrito VALUES (
	148,
	82,
	35,
	'HELVECIA') 
INSERT INTO distrito VALUES (
	149,
	82,
	91,
	'HERSILIA') 
INSERT INTO distrito VALUES (
	150,
	82,
	70,
	'HIPATIA') 
INSERT INTO distrito VALUES (
	151,
	82,
	91,
	'HUANQUEROS') 
INSERT INTO distrito VALUES (
	152,
	82,
	21,
	'HUGENTOBLER') 
INSERT INTO distrito VALUES (
	153,
	82,
	42,
	'HUGHES') 
INSERT INTO distrito VALUES (
	154,
	82,
	21,
	'HUMBERTO PRIMO') 
INSERT INTO distrito VALUES (
	155,
	82,
	70,
	'HUMBOLDT') 
INSERT INTO distrito VALUES (
	156,
	82,
	84,
	'IBARLUCEA') 
INSERT INTO distrito VALUES (
	157,
	82,
	49,
	'INGENIERO CHANOURDIE') 
INSERT INTO distrito VALUES (
	158,
	82,
	133,
	'INTIYACO') 
INSERT INTO distrito VALUES (
	159,
	82,
	105,
	'IRIYEN') 
INSERT INTO distrito VALUES (
	160,
	82,
	70,
	'ITUZAIN') 
INSERT INTO distrito VALUES (
	161,
	82,
	70,
	'JACINTO L. ARAUZ') 
INSERT INTO distrito VALUES (
	162,
	82,
	21,
	'JOSEFINA') 
INSERT INTO distrito VALUES (
	163,
	82,
	28,
	'JUAN B. MOLINA') 
INSERT INTO distrito VALUES (
	164,
	82,
	77,
	'JUAN DE GARAY') 
INSERT INTO distrito VALUES (
	165,
	82,
	28,
	'JUNCAL') 
INSERT INTO distrito VALUES (
	166,
	82,
	98,
	'LA BRAVA') 
INSERT INTO distrito VALUES (
	167,
	82,
	91,
	'LA CABRAL') 
INSERT INTO distrito VALUES (
	168,
	82,
	112,
	'LA CAMILA') 
INSERT INTO distrito VALUES (
	169,
	82,
	42,
	'LA CHISPA') 
INSERT INTO distrito VALUES (
	170,
	82,
	112,
	'LA CRIOLLA') 
INSERT INTO distrito VALUES (
	171,
	82,
	133,
	'LA GALLARETA') 
INSERT INTO distrito VALUES (
	172,
	82,
	91,
	'LA LUCILA') 
INSERT INTO distrito VALUES (
	173,
	82,
	70,
	'LA PELADA') 
INSERT INTO distrito VALUES (
	174,
	82,
	112,
	'LA PENCA Y CARAGUATA') 
INSERT INTO distrito VALUES (
	175,
	82,
	91,
	'LA RUBIA') 
INSERT INTO distrito VALUES (
	176,
	82,
	49,
	'LA SARITA') 
INSERT INTO distrito VALUES (
	177,
	82,
	28,
	'LA VANGUARDIA') 
INSERT INTO distrito VALUES (
	178,
	82,
	42,
	'LABORDEBOY') 
INSERT INTO distrito VALUES (
	179,
	82,
	63,
	'LAGUNA PAIVA') 
INSERT INTO distrito VALUES (
	180,
	82,
	126,
	'LANDETA') 
INSERT INTO distrito VALUES (
	181,
	82,
	49,
	'LANTERI') 
INSERT INTO distrito VALUES (
	182,
	82,
	105,
	'LARRECHEA') 
INSERT INTO distrito VALUES (
	183,
	82,
	91,
	'LAS AVISPAS') 
INSERT INTO distrito VALUES (
	184,
	82,
	126,
	'LAS BANDURRIAS') 
INSERT INTO distrito VALUES (
	185,
	82,
	49,
	'LAS GARZAS') 
INSERT INTO distrito VALUES (
	186,
	82,
	91,
	'LAS PALMERAS') 
INSERT INTO distrito VALUES (
	187,
	82,
	7,
	'LAS PAREJAS') 
INSERT INTO distrito VALUES (
	188,
	82,
	126,
	'LAS PETACAS') 
INSERT INTO distrito VALUES (
	189,
	82,
	7,
	'LAS ROSAS') 
INSERT INTO distrito VALUES (
	190,
	82,
	49,
	'LAS TOSCAS') 
INSERT INTO distrito VALUES (
	191,
	82,
	70,
	'LAS TUNAS') 
INSERT INTO distrito VALUES (
	192,
	82,
	42,
	'LAZZARINO') 
INSERT INTO distrito VALUES (
	193,
	82,
	21,
	'LEHMANN') 
INSERT INTO distrito VALUES (
	194,
	82,
	63,
	'LLAMBI CAMPBELL') 
INSERT INTO distrito VALUES (
	195,
	82,
	77,
	'LOGROÑO') 
INSERT INTO distrito VALUES (
	196,
	82,
	105,
	'LOMA ALTA') 
INSERT INTO distrito VALUES (
	197,
	82,
	105,
	'LOPEZ') 
INSERT INTO distrito VALUES (
	205,
	82,
	105,
	'MACIEL') 
INSERT INTO distrito VALUES (
	198,
	82,
	133,
	'LOS AMORES') 
INSERT INTO distrito VALUES (
	200,
	82,
	49,
	'LOS LAURELES') 
INSERT INTO distrito VALUES (
	202,
	82,
	14,
	'LOS QUIRQUINCHOS') 
INSERT INTO distrito VALUES (
	204,
	82,
	119,
	'LUIS PALACIOS') 
INSERT INTO distrito VALUES (
	206,
	82,
	42,
	'MAGGIOLO') 
INSERT INTO distrito VALUES (
	207,
	82,
	49,
	'MALABRI') 
INSERT INTO distrito VALUES (
	208,
	82,
	112,
	'MARCELINO ESCALADA') 
INSERT INTO distrito VALUES (
	209,
	82,
	133,
	'MARGARITA') 
INSERT INTO distrito VALUES (
	210,
	82,
	21,
	'MARIA JUANA') 
INSERT INTO distrito VALUES (
	211,
	82,
	70,
	'MARIA LUISA') 
INSERT INTO distrito VALUES (
	212,
	82,
	126,
	'MARIA SUSANA') 
INSERT INTO distrito VALUES (
	213,
	82,
	42,
	'MARIA TERESA') 
INSERT INTO distrito VALUES (
	214,
	82,
	70,
	'MATILDE') 
INSERT INTO distrito VALUES (
	215,
	82,
	21,
	'MAUA') 
INSERT INTO distrito VALUES (
	216,
	82,
	28,
	'MAXIMO PAZ') 
INSERT INTO distrito VALUES (
	217,
	82,
	42,
	'MELINCUE') 
INSERT INTO distrito VALUES (
	218,
	82,
	42,
	'MIGUEL TORRES') 
INSERT INTO distrito VALUES (
	219,
	82,
	91,
	'MOISES VILLE') 
INSERT INTO distrito VALUES (
	220,
	82,
	91,
	'MONITES') 
INSERT INTO distrito VALUES (
	221,
	82,
	105,
	'MONJE') 
INSERT INTO distrito VALUES (
	222,
	82,
	91,
	'MONTE OSCURIDAD') 
INSERT INTO distrito VALUES (
	223,
	82,
	63,
	'MONTE VERA') 
INSERT INTO distrito VALUES (
	224,
	82,
	77,
	'MONTEFIORE') 
INSERT INTO distrito VALUES (
	225,
	82,
	7,
	'MONTES DE OCA') 
INSERT INTO distrito VALUES (
	226,
	82,
	42,
	'MURPHY') 
INSERT INTO distrito VALUES (
	227,
	82,
	112,
	'NARE') 
INSERT INTO distrito VALUES (
	228,
	82,
	63,
	'NELSON') 
INSERT INTO distrito VALUES (
	229,
	82,
	49,
	'NICANOR MOLINAS') 
INSERT INTO distrito VALUES (
	230,
	82,
	70,
	'NUEVO TORINO') 
INSERT INTO distrito VALUES (
	231,
	82,
	91,
	'ÑANDUCITA') 
INSERT INTO distrito VALUES (
	232,
	82,
	56,
	'OLIVEROS') 
INSERT INTO distrito VALUES (
	233,
	82,
	91,
	'PALACIOS') 
INSERT INTO distrito VALUES (
	234,
	82,
	28,
	'PAVON') 
INSERT INTO distrito VALUES (
	235,
	82,
	28,
	'PAVON ARRIBA') 
INSERT INTO distrito VALUES (
	236,
	82,
	112,
	'PEDRO MEZ CELLO') 
INSERT INTO distrito VALUES (
	237,
	82,
	84,
	'PEREZ') 
INSERT INTO distrito VALUES (
	238,
	82,
	28,
	'PEYRANO') 
INSERT INTO distrito VALUES (
	239,
	82,
	126,
	'PIAMONTE') 
INSERT INTO distrito VALUES (
	240,
	82,
	70,
	'PILAR') 
INSERT INTO distrito VALUES (
	241,
	82,
	84,
	'PIÑERO') 
INSERT INTO distrito VALUES (
	242,
	82,
	21,
	'PLAZA CLUCELLAS') 
INSERT INTO distrito VALUES (
	243,
	82,
	91,
	'PORTUGALETE') 
INSERT INTO distrito VALUES (
	244,
	82,
	77,
	'POZO BORRADO') 
INSERT INTO distrito VALUES (
	245,
	82,
	21,
	'PRESIDENTE ROCA') 
INSERT INTO distrito VALUES (
	246,
	82,
	70,
	'PROGRESO') 
INSERT INTO distrito VALUES (
	247,
	82,
	70,
	'PROVIDENCIA') 
INSERT INTO distrito VALUES (
	248,
	82,
	56,
	'PUEBLO ANDINO') 
INSERT INTO distrito VALUES (
	249,
	82,
	84,
	'PUEBLO ESTHER') 
INSERT INTO distrito VALUES (
	250,
	82,
	21,
	'PUEBLO MARINI') 
INSERT INTO distrito VALUES (
	199,
	82,
	126,
	'LOS CARDOS') 
INSERT INTO distrito VALUES (
	201,
	82,
	14,
	'LOS MOLINOS') 
INSERT INTO distrito VALUES (
	203,
	82,
	56,
	'LUCIO V. LOPEZ') 
INSERT INTO distrito VALUES (
	251,
	82,
	84,
	'PUEBLO MUÑOZ') 
INSERT INTO distrito VALUES (
	299,
	82,
	126,
	'SAN MARTIN DE LAS ESCOBAS') 
INSERT INTO distrito VALUES (
	349,
	82,
	28,
	'VILLA CONSTITUCION') 
INSERT INTO distrito VALUES (
	252,
	82,
	119,
	'PUERTO GENERAL SAN MARTIN') 
INSERT INTO distrito VALUES (
	253,
	82,
	119,
	'PUJATO') 
INSERT INTO distrito VALUES (
	254,
	82,
	70,
	'PUJATO NORTE') 
INSERT INTO distrito VALUES (
	255,
	82,
	21,
	'RAFAELA') 
INSERT INTO distrito VALUES (
	256,
	82,
	112,
	'RAMAYON') 
INSERT INTO distrito VALUES (
	257,
	82,
	21,
	'RAMONA') 
INSERT INTO distrito VALUES (
	258,
	82,
	49,
	'RECONQUISTA') 
INSERT INTO distrito VALUES (
	259,
	82,
	63,
	'RECREO') 
INSERT INTO distrito VALUES (
	260,
	82,
	119,
	'RICARDONE') 
INSERT INTO distrito VALUES (
	261,
	82,
	70,
	'RIVADAVIA') 
INSERT INTO distrito VALUES (
	262,
	82,
	119,
	'ROLDAN') 
INSERT INTO distrito VALUES (
	263,
	82,
	98,
	'ROMANG') 
INSERT INTO distrito VALUES (
	264,
	82,
	84,
	'ROSARIO') 
INSERT INTO distrito VALUES (
	265,
	82,
	28,
	'RUEDA') 
INSERT INTO distrito VALUES (
	266,
	82,
	42,
	'RUFINO') 
INSERT INTO distrito VALUES (
	267,
	82,
	70,
	'SA PEREYRA') 
INSERT INTO distrito VALUES (
	268,
	82,
	21,
	'SAGUIER') 
INSERT INTO distrito VALUES (
	269,
	82,
	35,
	'SALADERO MARIANO CABAL') 
INSERT INTO distrito VALUES (
	270,
	82,
	56,
	'SALTO GRANDE') 
INSERT INTO distrito VALUES (
	271,
	82,
	70,
	'SAN AGUSTIN') 
INSERT INTO distrito VALUES (
	272,
	82,
	21,
	'SAN ANTONIO') 
INSERT INTO distrito VALUES (
	273,
	82,
	49,
	'SAN ANTONIO DE OBLIGADO') 
INSERT INTO distrito VALUES (
	274,
	82,
	77,
	'SAN BERNARDO') 
INSERT INTO distrito VALUES (
	275,
	82,
	112,
	'SAN BERNARDO') 
INSERT INTO distrito VALUES (
	276,
	82,
	70,
	'SAN CARLOS CENTRO') 
INSERT INTO distrito VALUES (
	277,
	82,
	70,
	'SAN CARLOS NORTE') 
INSERT INTO distrito VALUES (
	278,
	82,
	70,
	'SAN CARLOS SUD') 
INSERT INTO distrito VALUES (
	279,
	82,
	91,
	'SAN CRISTOBAL') 
INSERT INTO distrito VALUES (
	280,
	82,
	42,
	'SAN EDUARDO') 
INSERT INTO distrito VALUES (
	281,
	82,
	105,
	'SAN EUGENIO') 
INSERT INTO distrito VALUES (
	282,
	82,
	105,
	'SAN FABIAN') 
INSERT INTO distrito VALUES (
	283,
	82,
	42,
	'SAN FRANCISCO DE SANTA FE') 
INSERT INTO distrito VALUES (
	284,
	82,
	105,
	'SAN GENARO') 
INSERT INTO distrito VALUES (
	285,
	82,
	105,
	'SAN GENARO NORTE') 
INSERT INTO distrito VALUES (
	286,
	82,
	42,
	'SAN GRERIO') 
INSERT INTO distrito VALUES (
	287,
	82,
	91,
	'SAN GUILLERMO') 
INSERT INTO distrito VALUES (
	288,
	82,
	98,
	'SAN JAVIER') 
INSERT INTO distrito VALUES (
	289,
	82,
	70,
	'SAN JERONIMO DEL SAUCE') 
INSERT INTO distrito VALUES (
	290,
	82,
	70,
	'SAN JERONIMO NORTE') 
INSERT INTO distrito VALUES (
	291,
	82,
	119,
	'SAN JERONIMO SUD') 
INSERT INTO distrito VALUES (
	292,
	82,
	126,
	'SAN JORGE') 
INSERT INTO distrito VALUES (
	293,
	82,
	70,
	'SAN JOSE') 
INSERT INTO distrito VALUES (
	294,
	82,
	14,
	'SAN JOSE DE LA ESQUINA') 
INSERT INTO distrito VALUES (
	295,
	82,
	63,
	'SAN JOSE DEL RINCON') 
INSERT INTO distrito VALUES (
	296,
	82,
	112,
	'SAN JUSTO') 
INSERT INTO distrito VALUES (
	297,
	82,
	119,
	'SAN LORENZO') 
INSERT INTO distrito VALUES (
	298,
	82,
	70,
	'SAN MARIANO') 
INSERT INTO distrito VALUES (
	300,
	82,
	112,
	'SAN MARTIN NORTE') 
INSERT INTO distrito VALUES (
	301,
	82,
	21,
	'SAN VICENTE') 
INSERT INTO distrito VALUES (
	302,
	82,
	42,
	'SANCTI SPIRITU') 
INSERT INTO distrito VALUES (
	303,
	82,
	14,
	'SANFORD') 
INSERT INTO distrito VALUES (
	304,
	82,
	70,
	'SANTA CLARA DE BUENA VISTA') 
INSERT INTO distrito VALUES (
	305,
	82,
	21,
	'SANTA CLARA DE SAGUIER') 
INSERT INTO distrito VALUES (
	306,
	82,
	63,
	'SANTA FE') 
INSERT INTO distrito VALUES (
	307,
	82,
	42,
	'SANTA ISABEL') 
INSERT INTO distrito VALUES (
	308,
	82,
	77,
	'SANTA MARGARITA') 
INSERT INTO distrito VALUES (
	309,
	82,
	70,
	'SANTA MARIA CENTRO') 
INSERT INTO distrito VALUES (
	310,
	82,
	70,
	'SANTA MARIA NORTE') 
INSERT INTO distrito VALUES (
	311,
	82,
	35,
	'SANTA ROSA DE CALCHINES') 
INSERT INTO distrito VALUES (
	312,
	82,
	28,
	'SANTA TERESA') 
INSERT INTO distrito VALUES (
	313,
	82,
	70,
	'SANTO DOMIN') 
INSERT INTO distrito VALUES (
	314,
	82,
	63,
	'SANTO TOME') 
INSERT INTO distrito VALUES (
	315,
	82,
	91,
	'SANTURCE') 
INSERT INTO distrito VALUES (
	316,
	82,
	28,
	'SARGENTO CABRAL') 
INSERT INTO distrito VALUES (
	317,
	82,
	70,
	'SARMIENTO') 
INSERT INTO distrito VALUES (
	318,
	82,
	126,
	'SASTRE') 
INSERT INTO distrito VALUES (
	319,
	82,
	63,
	'SAUCE VIEJO') 
INSERT INTO distrito VALUES (
	320,
	82,
	56,
	'SERODINO') 
INSERT INTO distrito VALUES (
	321,
	82,
	112,
	'SILVA') 
INSERT INTO distrito VALUES (
	322,
	82,
	84,
	'SOLDINI') 
INSERT INTO distrito VALUES (
	323,
	82,
	91,
	'SOLEDAD') 
INSERT INTO distrito VALUES (
	324,
	82,
	70,
	'SOUTOMAYOR') 
INSERT INTO distrito VALUES (
	325,
	82,
	91,
	'SUARDI') 
INSERT INTO distrito VALUES (
	326,
	82,
	21,
	'SUNCHALES') 
INSERT INTO distrito VALUES (
	327,
	82,
	21,
	'SUSANA') 
INSERT INTO distrito VALUES (
	328,
	82,
	49,
	'TACUARENDI') 
INSERT INTO distrito VALUES (
	329,
	82,
	21,
	'TACURAL') 
INSERT INTO distrito VALUES (
	330,
	82,
	21,
	'TACURALES') 
INSERT INTO distrito VALUES (
	331,
	82,
	133,
	'TARTAGAL') 
INSERT INTO distrito VALUES (
	332,
	82,
	42,
	'TEODELINA') 
INSERT INTO distrito VALUES (
	333,
	82,
	28,
	'THEOBALD') 
INSERT INTO distrito VALUES (
	334,
	82,
	119,
	'TIMBUES') 
INSERT INTO distrito VALUES (
	335,
	82,
	133,
	'TOBA') 
INSERT INTO distrito VALUES (
	336,
	82,
	7,
	'TORTUGAS') 
INSERT INTO distrito VALUES (
	337,
	82,
	77,
	'TOSTADO') 
INSERT INTO distrito VALUES (
	338,
	82,
	56,
	'TOTORAS') 
INSERT INTO distrito VALUES (
	339,
	82,
	126,
	'TRAILL') 
INSERT INTO distrito VALUES (
	340,
	82,
	84,
	'URANGA') 
INSERT INTO distrito VALUES (
	341,
	82,
	42,
	'VENADO TUERTO') 
INSERT INTO distrito VALUES (
	342,
	82,
	133,
	'VERA') 
INSERT INTO distrito VALUES (
	343,
	82,
	112,
	'VERA Y PINTADO') 
INSERT INTO distrito VALUES (
	344,
	82,
	112,
	'VIDELA') 
INSERT INTO distrito VALUES (
	345,
	82,
	21,
	'VILA') 
INSERT INTO distrito VALUES (
	346,
	82,
	84,
	'VILLA AMELIA') 
INSERT INTO distrito VALUES (
	347,
	82,
	49,
	'VILLA ANA') 
INSERT INTO distrito VALUES (
	348,
	82,
	42,
	'VILLA CAÑAS') 
INSERT INTO distrito VALUES (
	350,
	82,
	56,
	'VILLA ELOISA') 
INSERT INTO distrito VALUES (
	351,
	82,
	84,
	'VILLA BERNADOR GALVEZ') 
INSERT INTO distrito VALUES (
	352,
	82,
	49,
	'VILLA GUILLERMINA') 
INSERT INTO distrito VALUES (
	353,
	82,
	77,
	'VILLA MINETTI') 
INSERT INTO distrito VALUES (
	354,
	82,
	119,
	'VILLA MUGUETA') 
INSERT INTO distrito VALUES (
	355,
	82,
	49,
	'VILLA OCAMPO') 
INSERT INTO distrito VALUES (
	356,
	82,
	21,
	'VILLA SAN JOSE') 
INSERT INTO distrito VALUES (
	357,
	82,
	91,
	'VILLA SARALEGUI') 
INSERT INTO distrito VALUES (
	358,
	82,
	91,
	'VILLA TRINIDAD') 
INSERT INTO distrito VALUES (
	359,
	82,
	14,
	'VILLADA') 
INSERT INTO distrito VALUES (
	360,
	82,
	21,
	'VIRGINIA') 
INSERT INTO distrito VALUES (
	361,
	82,
	42,
	'WHEELWRIGHT') 
INSERT INTO distrito VALUES (
	362,
	82,
	84,
	'ZAVALLA') 
INSERT INTO distrito VALUES (
	363,
	82,
	21,
	'ZENON PEREYRA') 
INSERT INTO distrito VALUES (
	364,
	6,
	NULL,
	'Localidad La Linda') 
INSERT INTO distrito VALUES (
	365,
	10,
	NULL,
	'Localidad La Fea') 
INSERT INTO distrito VALUES (
	366,
	22,
	NULL,
	'Localidad La Loca') 
INSERT INTO distrito VALUES (
	367,
	30,
	NULL,
	'Localidad La Perseverante') 
INSERT INTO distrito VALUES (
	368,
	66,
	NULL,
	'Localidad La Farsante') 

-- -- Inserts tabla: persona

set identity_insert persona on

INSERT INTO persona (idperso, nomperso, domiperso, coddist) VALUES (
	1,
	'Pepe',
	'Aqui nomás',
	291) 
INSERT INTO persona (idperso, nomperso, domiperso, coddist) VALUES (
	2,
	'Cacho',
	'Más allá',
	293) 
INSERT INTO persona (idperso, nomperso, domiperso, coddist) VALUES (
	3,
	'Tito',
	'Más cerquita',
	233) 
INSERT INTO persona (idperso, nomperso, domiperso, coddist) VALUES (
	4,
	'Polo',
	'Bien lejos',
	183) 
INSERT INTO persona (idperso, nomperso, domiperso, coddist) VALUES (
	5,
	'Pancho',
	'Lejísimo',
	1) 
INSERT INTO persona (idperso, nomperso, domiperso, coddist) VALUES (
	6,
	'Cholo',
	'A la vuelta de la esquina',
	2) 
INSERT INTO persona (idperso, nomperso, domiperso, coddist) VALUES (
	7,
	'Toto',
	'Ruta 11',
	3) 
