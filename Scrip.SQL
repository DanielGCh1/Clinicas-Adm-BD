/*
Created: 24/9/2022
Modified: 30/9/2022
Model: Oracle 19c
Database: Oracle 19c
*/


-- Create tables section -------------------------------------------------

-- Table Clinicas_Locales

CREATE TABLE "Clinicas_Locales"(
  "Loc_ID" Number NOT NULL,
  "Loc_Nombre" Varchar2(30 ) NOT NULL,
  "Enf_ID" Number
)
/

-- Create indexes for table Clinicas_Locales

CREATE INDEX "IX_Relationship3" ON "Clinicas_Locales" ("Enf_ID")
/

-- Add keys for table Clinicas_Locales

ALTER TABLE "Clinicas_Locales" ADD CONSTRAINT "PK_Clinicas_Locales" PRIMARY KEY ("Loc_ID")
/

ALTER TABLE "Clinicas_Locales" ADD CONSTRAINT "Cli_ID" UNIQUE ("Loc_ID")
/

-- Table Clinicas_Medicos

CREATE TABLE "Clinicas_Medicos"(
  "Med_Numero" Number NOT NULL,
  "Loc_ID" Number NOT NULL,
  "Attribute1" Char(20 ) NOT NULL,
  "Usu_ID" Number
)
/

-- Create indexes for table Clinicas_Medicos

CREATE INDEX "IX_Relationship1" ON "Clinicas_Medicos" ("Loc_ID")
/

CREATE INDEX "IX_Relationship58" ON "Clinicas_Medicos" ("Usu_ID")
/

-- Add keys for table Clinicas_Medicos

ALTER TABLE "Clinicas_Medicos" ADD CONSTRAINT "PK_Clinicas_Medicos" PRIMARY KEY ("Med_Numero")
/

ALTER TABLE "Clinicas_Medicos" ADD CONSTRAINT "Med_ID" UNIQUE ("Med_Numero")
/

-- Table Clinicas_Pacientes

CREATE TABLE "Clinicas_Pacientes"(
  "Pac_Codigo" Number NOT NULL,
  "Pac_Primer_Nombre" Varchar2(30 ) NOT NULL,
  "Pac_Primer_Apellido" Varchar2(30 ) NOT NULL,
  "Pac_Segundo_Apellido" Varchar2(30 ) NOT NULL,
  "Pac_Cedula" Varchar2(30 ) NOT NULL,
  "Pac_Edad" Number NOT NULL,
  "Pac_Genero" Varchar2(1 ) NOT NULL,
  "Pac_Fecha_Nacimiento" Timestamp(6) NOT NULL,
  "Pac_Estado_Civil" Varchar2(1 ) NOT NULL,
  "Pac_Telefono" Number NOT NULL,
  "Pac_Ocupacion" Varchar2(30 ) NOT NULL,
  "Pac_Escolaridad" Varchar2(30 ) NOT NULL,
  "Pac_Residencia" Varchar2(50 ) NOT NULL,
  "Pac_Correo" Varchar2(40 ) NOT NULL,
  "Loc_ID" Number NOT NULL,
  "Pac_Tipo_Persona" Varchar2(1 ) NOT NULL,
  "Pac_Direccion" Varchar2(200 ) NOT NULL,
  "Pac_Nacionalidad" Varchar2(30 ) NOT NULL,
  "Pac_Fax" Varchar2(30 ) NOT NULL,
  "Pac_Email" Varchar2(30 ) NOT NULL,
  "Pac_Empresa_Labora" Varchar2(30 ) NOT NULL,
  "Pac_Es_Asegurado" Varchar2(1 ) NOT NULL,
  "Pac_Paga_Propio_Seguro" Varchar2(1 ) NOT NULL,
  "Pac_Fecha_Ingreso_Empresa_Cliente" Timestamp(6) NOT NULL,
  "Pac_Estado_Cliente" Varchar2(30 ) NOT NULL
)
/

-- Create indexes for table Clinicas_Pacientes

CREATE INDEX "IX_Relationship2" ON "Clinicas_Pacientes" ("Loc_ID")
/

-- Add keys for table Clinicas_Pacientes

ALTER TABLE "Clinicas_Pacientes" ADD CONSTRAINT "PK_Clinicas_Pacientes" PRIMARY KEY ("Pac_Codigo")
/

ALTER TABLE "Clinicas_Pacientes" ADD CONSTRAINT "Pac_ID" UNIQUE ("Pac_Codigo")
/

-- Table and Columns comments section

COMMENT ON COLUMN "Clinicas_Pacientes"."Pac_Genero" IS '"
F= Femenino
M=Masculino
"'
/
COMMENT ON COLUMN "Clinicas_Pacientes"."Pac_Estado_Civil" IS '"
S=Soltero
C=Casado
D=Divorciado
S=Separacion en Proceso Judicioal
V=Viudo
b=Concubinato"'
/
COMMENT ON COLUMN "Clinicas_Pacientes"."Pac_Tipo_Persona" IS '"
N=Nacional
E=Extranjero
E=Empresa
"'
/
COMMENT ON COLUMN "Clinicas_Pacientes"."Pac_Empresa_Labora" IS '"
Es la empresa donde labora
"'
/
COMMENT ON COLUMN "Clinicas_Pacientes"."Pac_Es_Asegurado" IS '"
S=SI
N=No
"'
/
COMMENT ON COLUMN "Clinicas_Pacientes"."Pac_Paga_Propio_Seguro" IS '"
S=Si
N=No
"'
/
COMMENT ON COLUMN "Clinicas_Pacientes"."Pac_Fecha_Ingreso_Empresa_Cliente" IS '"
Es la fecha de ingreso a la empresa como paciente
"'
/
COMMENT ON COLUMN "Clinicas_Pacientes"."Pac_Estado_Cliente" IS '"
A=Activo
I=Inactivo
"'
/

-- Table Clinicas_Enfermedades

CREATE TABLE "Clinicas_Enfermedades"(
  "Enf_ID" Number NOT NULL,
  "Enf_Nombre" Varchar2(30 ) NOT NULL,
  "Enf_Descripcion" Varchar2(300 ) NOT NULL,
  "Enf_Cantidad" Number(10,0) NOT NULL
)
/

-- Add keys for table Clinicas_Enfermedades

ALTER TABLE "Clinicas_Enfermedades" ADD CONSTRAINT "PK_Clinicas_Enfermedades" PRIMARY KEY ("Enf_ID")
/

ALTER TABLE "Clinicas_Enfermedades" ADD CONSTRAINT "Enf_ID" UNIQUE ("Enf_ID")
/

-- Table and Columns comments section

COMMENT ON COLUMN "Clinicas_Enfermedades"."Enf_Cantidad" IS '"
Es la cantidad de veces, que esta enfermedad, se a dectectado en los pacientes.
"'
/

-- Table Clinicas_Enfermedades_x_Locales

CREATE TABLE "Clinicas_Enfermedades_x_Locales"(
  "Loc_ID" Number NOT NULL,
  "Enf_ID" Number NOT NULL
)
/

-- Add keys for table Clinicas_Enfermedades_x_Locales

ALTER TABLE "Clinicas_Enfermedades_x_Locales" ADD CONSTRAINT "PK_Clinicas_Enfermedades_x_Locales" PRIMARY KEY ("Loc_ID","Enf_ID")
/

-- Table Clinicas_Especialidades

CREATE TABLE "Clinicas_Especialidades"(
  "Esp_ID" Varchar2(30 ) NOT NULL,
  "Esp_Nombre" Varchar2(60 ) NOT NULL,
  "Loc_ID" Number NOT NULL,
  "Esp_Descripcion" Varchar2(200 ) NOT NULL,
  "Esp_Costo" Number(10,2) NOT NULL
)
/

-- Create indexes for table Clinicas_Especialidades

CREATE INDEX "IX_Relationship6" ON "Clinicas_Especialidades" ("Loc_ID")
/

-- Add keys for table Clinicas_Especialidades

ALTER TABLE "Clinicas_Especialidades" ADD CONSTRAINT "PK_Clinicas_Especialidades" PRIMARY KEY ("Esp_ID")
/

ALTER TABLE "Clinicas_Especialidades" ADD CONSTRAINT "Esp_ID" UNIQUE ("Esp_ID")
/

ALTER TABLE "Clinicas_Especialidades" ADD CONSTRAINT "Esp_Nombre" UNIQUE ("Esp_Nombre")
/

-- Table Clinicas_Citas

CREATE TABLE "Clinicas_Citas"(
  "Cit_ID" Number NOT NULL,
  "Cit_Hor_FechaInicio" Timestamp(6) NOT NULL,
  "Cit_Hor_FechaFinal" Timestamp(6) NOT NULL,
  "Age_E_ID" Number,
  "Age_M_ID" Number NOT NULL,
  "Cit_Tamano_Cita" Varchar2(1 ) NOT NULL,
  "Cit_Estado" Varchar2(1 ) NOT NULL,
  "Cit_Pac_Correo" Varchar2(40 ),
  "Cit_Pac_Telefono" Number,
  "Cit_Pac_Motivo" Varchar2(200 ),
  "Pac_Codigo" Number,
  "Cit_Analisis_Enfermeria" Varchar2(200 ),
  "Cit_Observaciones" Varchar2(200 ),
  "Exp_ID" Number,
  "Pla_T_ID" Number,
  "Med_G_ID" Number(10,0)
)
/

-- Create indexes for table Clinicas_Citas

CREATE INDEX "IX_Relationship19" ON "Clinicas_Citas" ("Age_E_ID")
/

CREATE INDEX "IX_Relationship20" ON "Clinicas_Citas" ("Age_M_ID")
/

CREATE INDEX "IX_Relationship21" ON "Clinicas_Citas" ("Pac_Codigo")
/

CREATE INDEX "IX_Relationship49" ON "Clinicas_Citas" ("Exp_ID")
/

CREATE INDEX "IX_Relationship53" ON "Clinicas_Citas" ("Pla_T_ID")
/

CREATE INDEX "IX_Relationship56" ON "Clinicas_Citas" ("Med_G_ID")
/

-- Add keys for table Clinicas_Citas

ALTER TABLE "Clinicas_Citas" ADD CONSTRAINT "PK_Clinicas_Citas" PRIMARY KEY ("Cit_ID")
/

ALTER TABLE "Clinicas_Citas" ADD CONSTRAINT "Cit_ID" UNIQUE ("Cit_ID")
/

-- Table and Columns comments section

COMMENT ON COLUMN "Clinicas_Citas"."Cit_Tamano_Cita" IS '"
1=  60 minutos
2 = 30 minutos
3 = 20 minutos
4 = 15 minutos
6 = 10 minutos"'
/
COMMENT ON COLUMN "Clinicas_Citas"."Cit_Estado" IS '"
r = realizada
e= espera
c= cancelada
n = no realizada
"'
/
COMMENT ON COLUMN "Clinicas_Citas"."Cit_Pac_Motivo" IS '"Es el motivo o la razon de la consulta, por el cual el paciente obtuvo la  cita"'
/

-- Table Clinicas_Usuarios

CREATE TABLE "Clinicas_Usuarios"(
  "Usu_ID" Number NOT NULL,
  "Usu_PrimerNombre" Varchar2(30 ) NOT NULL,
  "Dep_S_ID" Number NOT NULL,
  "Dep_E_ID" Number(10,0) NOT NULL,
  "Usu_Primer_Apellido" Varchar2(30 ) NOT NULL,
  "Usu_Segundo_Apellido" Varchar2(30 ) NOT NULL,
  "Usu_Annos_Experiencia" Number NOT NULL,
  "Usu_Cantidad_Doctorados" Number(10,0) NOT NULL
)
/

-- Create indexes for table Clinicas_Usuarios

CREATE INDEX "IX_Relationship43" ON "Clinicas_Usuarios" ("Dep_S_ID")
/

CREATE INDEX "IX_Relationship45" ON "Clinicas_Usuarios" ("Dep_E_ID")
/

-- Add keys for table Clinicas_Usuarios

ALTER TABLE "Clinicas_Usuarios" ADD CONSTRAINT "PK_Clinicas_Usuarios" PRIMARY KEY ("Usu_ID")
/

ALTER TABLE "Clinicas_Usuarios" ADD CONSTRAINT "Usu_ID" UNIQUE ("Usu_ID")
/

-- Table Clinicas_Usuarios_Roles

CREATE TABLE "Clinicas_Usuarios_Roles"(
  "Loc_ID" Number NOT NULL,
  "Usu_ID" Number NOT NULL,
  "Rol_ID" Number
)
/

-- Create indexes for table Clinicas_Usuarios_Roles

CREATE INDEX "IX_Relationship11" ON "Clinicas_Usuarios_Roles" ("Rol_ID")
/

-- Add keys for table Clinicas_Usuarios_Roles

ALTER TABLE "Clinicas_Usuarios_Roles" ADD CONSTRAINT "PK_Clinicas_Usuarios_Roles" PRIMARY KEY ("Loc_ID","Usu_ID")
/

-- Table Clinicas_Roles

CREATE TABLE "Clinicas_Roles"(
  "Rol_ID" Number NOT NULL,
  "Rol_Nombre" Varchar2(30 ) NOT NULL,
  "Rol_Descripcion" Varchar2(200 ) NOT NULL
)
/

-- Add keys for table Clinicas_Roles

ALTER TABLE "Clinicas_Roles" ADD CONSTRAINT "PK_Clinicas_Roles" PRIMARY KEY ("Rol_ID")
/

ALTER TABLE "Clinicas_Roles" ADD CONSTRAINT "Rol_ID" UNIQUE ("Rol_ID")
/

-- Table Clinicas_Agenda_Especialidades

CREATE TABLE "Clinicas_Agenda_Especialidades"(
  "Age_E_ID" Number NOT NULL,
  "Age_E_Hora_Fecha_Inicio" Timestamp(6) NOT NULL,
  "Age_E_Hora_Fecha_Final" Timestamp(6) NOT NULL,
  "Age_E_Tamano_Citas" Varchar2(1 ) NOT NULL,
  "Esp_ID" Varchar2(30 ) NOT NULL
)
/

-- Create indexes for table Clinicas_Agenda_Especialidades

CREATE INDEX "IX_Relationship12" ON "Clinicas_Agenda_Especialidades" ("Esp_ID")
/

-- Add keys for table Clinicas_Agenda_Especialidades

ALTER TABLE "Clinicas_Agenda_Especialidades" ADD CONSTRAINT "PK_Clinicas_Agenda_Especialidades" PRIMARY KEY ("Age_E_ID")
/

ALTER TABLE "Clinicas_Agenda_Especialidades" ADD CONSTRAINT "Age_E" UNIQUE ("Age_E_ID")
/

-- Table and Columns comments section

COMMENT ON COLUMN "Clinicas_Agenda_Especialidades"."Age_E_Tamano_Citas" IS '"
1=  60 minutos
2 = 30 minutos
3 = 20 minutos
4 = 15 minutos
6 = 10 minutos"'
/

-- Table Clinicas_Agenda_Medicos

CREATE TABLE "Clinicas_Agenda_Medicos"(
  "Age_M_ID" Number NOT NULL,
  "Age_M_Hora_Fecha_Inicio" Timestamp(6) NOT NULL,
  "Age_E_Hora_Fecha_Final" Timestamp(6) NOT NULL,
  "Age_M_Tamano_Citas" Varchar2(1 ) NOT NULL,
  "Med_Numero" Number
)
/

-- Create indexes for table Clinicas_Agenda_Medicos

CREATE INDEX "IX_Relationship16" ON "Clinicas_Agenda_Medicos" ("Med_Numero")
/

-- Add keys for table Clinicas_Agenda_Medicos

ALTER TABLE "Clinicas_Agenda_Medicos" ADD CONSTRAINT "PK_Clinicas_Agenda_Medicos" PRIMARY KEY ("Age_M_ID")
/

ALTER TABLE "Clinicas_Agenda_Medicos" ADD CONSTRAINT "Age_M_ID" UNIQUE ("Age_M_ID")
/

-- Table and Columns comments section

COMMENT ON COLUMN "Clinicas_Agenda_Medicos"."Age_M_Tamano_Citas" IS '"
1=  60 minutos
2 = 30 minutos
3 = 20 minutos
4 = 15 minutos
6 = 10 minutos"'
/

-- Table Clinicas_Hospitalizaciones

CREATE TABLE "Clinicas_Hospitalizaciones"(
  "Hos_ID" Number NOT NULL,
  "Hos_Hora_Fecha" Timestamp(6) NOT NULL,
  "Hos_Motivo" Varchar2(200 ) NOT NULL,
  "Exp_ID" Number
)
/

-- Create indexes for table Clinicas_Hospitalizaciones

CREATE INDEX "IX_Relationship28" ON "Clinicas_Hospitalizaciones" ("Exp_ID")
/

-- Add keys for table Clinicas_Hospitalizaciones

ALTER TABLE "Clinicas_Hospitalizaciones" ADD CONSTRAINT "PK_Clinicas_Hospitalizaciones" PRIMARY KEY ("Hos_ID")
/

ALTER TABLE "Clinicas_Hospitalizaciones" ADD CONSTRAINT "Hos_ID" UNIQUE ("Hos_ID")
/

-- Table Clinicas_Operaciones

CREATE TABLE "Clinicas_Operaciones"(
  "Ope_ID" Number NOT NULL,
  "Ope_Hora_Fecha" Timestamp(6) NOT NULL,
  "Ope_Motivo" Char(20 ) NOT NULL,
  "Exp_ID" Number
)
/

-- Create indexes for table Clinicas_Operaciones

CREATE INDEX "IX_Relationship29" ON "Clinicas_Operaciones" ("Exp_ID")
/

-- Add keys for table Clinicas_Operaciones

ALTER TABLE "Clinicas_Operaciones" ADD CONSTRAINT "PK_Clinicas_Operaciones" PRIMARY KEY ("Ope_ID")
/

ALTER TABLE "Clinicas_Operaciones" ADD CONSTRAINT "Ope_ID" UNIQUE ("Ope_ID")
/

-- Table Clinicas_Tratamientos

CREATE TABLE "Clinicas_Tratamientos"(
  "Tra_ID" Number NOT NULL,
  "Tra_Descripcion" Varchar2(400 ) NOT NULL,
  "Exp_ID" Number
)
/

-- Create indexes for table Clinicas_Tratamientos

CREATE INDEX "IX_Relationship30" ON "Clinicas_Tratamientos" ("Exp_ID")
/

-- Add keys for table Clinicas_Tratamientos

ALTER TABLE "Clinicas_Tratamientos" ADD CONSTRAINT "PK_Clinicas_Tratamientos" PRIMARY KEY ("Tra_ID")
/

ALTER TABLE "Clinicas_Tratamientos" ADD CONSTRAINT "Tra_ID" UNIQUE ("Tra_ID")
/

-- Table Clinicas_Expedientes

CREATE TABLE "Clinicas_Expedientes"(
  "Exp_ID" Number NOT NULL,
  "Pac_Codigo" Number
)
/

-- Create indexes for table Clinicas_Expedientes

CREATE INDEX "IX_Relationship27" ON "Clinicas_Expedientes" ("Pac_Codigo")
/

-- Add keys for table Clinicas_Expedientes

ALTER TABLE "Clinicas_Expedientes" ADD CONSTRAINT "PK_Clinicas_Expedientes" PRIMARY KEY ("Exp_ID")
/

ALTER TABLE "Clinicas_Expedientes" ADD CONSTRAINT "Exp_ID" UNIQUE ("Exp_ID")
/

-- Table Clinicas_Pac_Patologias

CREATE TABLE "Clinicas_Pac_Patologias"(
  "Enf_ID" Number NOT NULL,
  "Exp_ID" Number NOT NULL
)
/

-- Add keys for table Clinicas_Pac_Patologias

ALTER TABLE "Clinicas_Pac_Patologias" ADD CONSTRAINT "PK_Clinicas_Pac_Patologias" PRIMARY KEY ("Enf_ID","Exp_ID")
/

-- Table Clinicas_Ginescobsteticos

CREATE TABLE "Clinicas_Ginescobsteticos"(
  "Gin_ID" Number NOT NULL,
  "Gin_Ciclo_Mestrual" Varchar2(30 ) NOT NULL,
  "Gin_Fecha_Ultima_Regla" Timestamp(6) NOT NULL,
  "Gin_Gesta" Varchar2(30 ) NOT NULL,
  "Gin_Parto" Varchar2(1 ) NOT NULL,
  "Gin_Aborto" Varchar2(1 ) NOT NULL,
  "Gin_Cesarias" Varchar2(1 ) NOT NULL,
  "Gin_Ultimo_Parto" Timestamp(6) NOT NULL,
  "Gin_Ultimo_Papanicolauo" Timestamp(6) NOT NULL,
  "Gin_Planificacion" Varchar2(1 ) NOT NULL,
  "Gin_Primera_Relacion_Sexual" Timestamp(6) NOT NULL,
  "Gin_Compañeros_Sexuales" Varchar2(300 ) NOT NULL,
  "Exp_ID" Number NOT NULL
)
/

-- Create indexes for table Clinicas_Ginescobsteticos

CREATE INDEX "IX_Relationship35" ON "Clinicas_Ginescobsteticos" ("Exp_ID")
/

-- Add keys for table Clinicas_Ginescobsteticos

ALTER TABLE "Clinicas_Ginescobsteticos" ADD CONSTRAINT "PK_Clinicas_Ginescobsteticos" PRIMARY KEY ("Gin_ID")
/

ALTER TABLE "Clinicas_Ginescobsteticos" ADD CONSTRAINT "Gin_ID" UNIQUE ("Gin_ID")
/

-- Table and Columns comments section

COMMENT ON COLUMN "Clinicas_Ginescobsteticos"."Gin_Parto" IS '"
S= Si ha tenido
N= No ha tenido
"'
/
COMMENT ON COLUMN "Clinicas_Ginescobsteticos"."Gin_Aborto" IS '"
S= Si ha tenido
N= No ha tenido
"'
/
COMMENT ON COLUMN "Clinicas_Ginescobsteticos"."Gin_Cesarias" IS '"
S= Si ha tenido
N= No ha tenido
"'
/
COMMENT ON COLUMN "Clinicas_Ginescobsteticos"."Gin_Planificacion" IS '"
S=SI planifica
N=No planifica
"'
/

-- Table Clinicas_Archivos

CREATE TABLE "Clinicas_Archivos"(
  "Arc_ID" Number NOT NULL,
  "Arc_Nombre" Varchar2(30 ) NOT NULL,
  "Arc_Documento" Blob NOT NULL,
  "Exp_ID" Number NOT NULL,
  "Pac_Codigo" Number NOT NULL,
  "Arc_Fecha" Timestamp(6) NOT NULL
)
/

-- Create indexes for table Clinicas_Archivos

CREATE INDEX "IX_Relationship36" ON "Clinicas_Archivos" ("Exp_ID")
/

CREATE INDEX "IX_Relationship61" ON "Clinicas_Archivos" ("Pac_Codigo")
/

-- Add keys for table Clinicas_Archivos

ALTER TABLE "Clinicas_Archivos" ADD CONSTRAINT "PK_Clinicas_Archivos" PRIMARY KEY ("Arc_ID")
/

ALTER TABLE "Clinicas_Archivos" ADD CONSTRAINT "Arc_ID" UNIQUE ("Arc_ID")
/

-- Table Clinicas_Heredero_Familiares

CREATE TABLE "Clinicas_Heredero_Familiares"(
  "Her" Number NOT NULL,
  "Her_Parentesco_Familiar" Varchar2(30 ) NOT NULL,
  "Her_Primer_Nombre" Varchar2(30 ) NOT NULL,
  "Her_Primer_Apellido" Varchar2(30 ) NOT NULL,
  "Enf_ID" Number,
  "Exp_ID" Number
)
/

-- Create indexes for table Clinicas_Heredero_Familiares

CREATE INDEX "IX_Relationship37" ON "Clinicas_Heredero_Familiares" ("Enf_ID")
/

CREATE INDEX "IX_Relationship38" ON "Clinicas_Heredero_Familiares" ("Exp_ID")
/

-- Add keys for table Clinicas_Heredero_Familiares

ALTER TABLE "Clinicas_Heredero_Familiares" ADD CONSTRAINT "PK_Clinicas_Heredero_Familiares" PRIMARY KEY ("Her")
/

ALTER TABLE "Clinicas_Heredero_Familiares" ADD CONSTRAINT "HerF" UNIQUE ("Her")
/

-- Table Clinicas_Examenes

CREATE TABLE "Clinicas_Examenes"(
  "Exa_Temperatura" Number NOT NULL,
  "Exa_ID" Number NOT NULL,
  "Exa_Presion" Varchar2(30 ) NOT NULL,
  "Exa_Fecuencia_Cardiaca" Number NOT NULL,
  "Exa_Peso" Number(10,3) NOT NULL,
  "Exa_Talla" Char(20 ) NOT NULL,
  "Cit_ID" Number,
  "Pac_Codigo" Number
)
/

-- Create indexes for table Clinicas_Examenes

CREATE INDEX "IX_Relationship39" ON "Clinicas_Examenes" ("Cit_ID")
/

CREATE INDEX "IX_Relationship40" ON "Clinicas_Examenes" ("Pac_Codigo")
/

-- Add keys for table Clinicas_Examenes

ALTER TABLE "Clinicas_Examenes" ADD CONSTRAINT "PK_Clinicas_Examenes" PRIMARY KEY ("Exa_ID")
/

ALTER TABLE "Clinicas_Examenes" ADD CONSTRAINT "Exa_ID" UNIQUE ("Exa_ID")
/

-- Table and Columns comments section

COMMENT ON COLUMN "Clinicas_Examenes"."Exa_Temperatura" IS '"
La temperatura es en grados centigrados
"'
/
COMMENT ON COLUMN "Clinicas_Examenes"."Exa_Talla" IS '"
Es la atura de una persona
"'
/

-- Table Clinicas_Indice_Masa

CREATE TABLE "Clinicas_Indice_Masa"(
  "Indice_M_ID" Number NOT NULL,
  "Indice_M_Corporal" Number(10,2) NOT NULL,
  "Pac_Codigo" Number
)
/

-- Create indexes for table Clinicas_Indice_Masa

CREATE INDEX "IX_Relationship41" ON "Clinicas_Indice_Masa" ("Pac_Codigo")
/

-- Add keys for table Clinicas_Indice_Masa

ALTER TABLE "Clinicas_Indice_Masa" ADD CONSTRAINT "PK_Clinicas_Indice_Masa" PRIMARY KEY ("Indice_M_ID")
/

ALTER TABLE "Clinicas_Indice_Masa" ADD CONSTRAINT "Indice_M_ID" UNIQUE ("Indice_M_ID")
/

-- Table Clinicas_Departamento_Secretariado

CREATE TABLE "Clinicas_Departamento_Secretariado"(
  "Dep_S_ID" Number NOT NULL,
  "Loc_ID" Number
)
/

-- Create indexes for table Clinicas_Departamento_Secretariado

CREATE INDEX "IX_Relationship42" ON "Clinicas_Departamento_Secretariado" ("Loc_ID")
/

-- Add keys for table Clinicas_Departamento_Secretariado

ALTER TABLE "Clinicas_Departamento_Secretariado" ADD CONSTRAINT "PK_Clinicas_Departamento_Secretariado" PRIMARY KEY ("Dep_S_ID")
/

ALTER TABLE "Clinicas_Departamento_Secretariado" ADD CONSTRAINT "Dep_S_ID" UNIQUE ("Dep_S_ID")
/

-- Table Clinicas_Anotaciones_Especiales

CREATE TABLE "Clinicas_Anotaciones_Especiales"(
  "Anot_E_ID" Number NOT NULL,
  "Anot_E_Descripcion" Varchar2(100 ) NOT NULL,
  "Anot_E_Fecha" Timestamp(6) NOT NULL,
  "Exp_ID" Number NOT NULL
)
/

-- Create indexes for table Clinicas_Anotaciones_Especiales

CREATE INDEX "IX_Relationship46" ON "Clinicas_Anotaciones_Especiales" ("Exp_ID")
/

-- Add keys for table Clinicas_Anotaciones_Especiales

ALTER TABLE "Clinicas_Anotaciones_Especiales" ADD CONSTRAINT "PK_Clinicas_Anotaciones_Especiales" PRIMARY KEY ("Anot_E_ID")
/

ALTER TABLE "Clinicas_Anotaciones_Especiales" ADD CONSTRAINT "Anot_E_ID" UNIQUE ("Anot_E_ID")
/

-- Table Clinicas_Departamento_Enfermeria

CREATE TABLE "Clinicas_Departamento_Enfermeria"(
  "Dep_E_ID" Number(10,0) NOT NULL,
  "Loc_ID" Number
)
/

-- Create indexes for table Clinicas_Departamento_Enfermeria

CREATE INDEX "IX_Relationship44" ON "Clinicas_Departamento_Enfermeria" ("Loc_ID")
/

-- Add keys for table Clinicas_Departamento_Enfermeria

ALTER TABLE "Clinicas_Departamento_Enfermeria" ADD CONSTRAINT "PK_Clinicas_Departamento_Enfermeria" PRIMARY KEY ("Dep_E_ID")
/

ALTER TABLE "Clinicas_Departamento_Enfermeria" ADD CONSTRAINT "Dep_E_ID" UNIQUE ("Dep_E_ID")
/

-- Table Clinicas_Examen_Fisico

CREATE TABLE "Clinicas_Examen_Fisico"(
  "Exa_F_ID" Number NOT NULL,
  "Exa_F_Tipo" Varchar2(1 ) NOT NULL,
  "Exa_F_Resultado" Varchar2(200 ) NOT NULL,
  "Cit_ID" Number
)
/

-- Create indexes for table Clinicas_Examen_Fisico

CREATE INDEX "IX_Relationship47" ON "Clinicas_Examen_Fisico" ("Cit_ID")
/

-- Add keys for table Clinicas_Examen_Fisico

ALTER TABLE "Clinicas_Examen_Fisico" ADD CONSTRAINT "PK_Clinicas_Examen_Fisico" PRIMARY KEY ("Exa_F_ID")
/

ALTER TABLE "Clinicas_Examen_Fisico" ADD CONSTRAINT "Exa_F_ID" UNIQUE ("Exa_F_ID")
/

-- Table and Columns comments section

COMMENT ON COLUMN "Clinicas_Examen_Fisico"."Exa_F_Tipo" IS '"
C=Cabeza
O=ORL
U=Cuello
T=Torax
A=Abdomen
S=Sistema Neurologico
P=Piel
M=Musculo esqueletico
G=Genitales
R=Recto
"'
/

-- Table Clinicas_Citologicas_Ginescobsteticos

CREATE TABLE "Clinicas_Citologicas_Ginescobsteticos"(
  "Cit_G_ID" Number NOT NULL,
  "Cit_G_Ciclo_Mestrual" Varchar2(30 ) NOT NULL,
  "Cit_G_Fecha_Ultima_Regla" Timestamp(6) NOT NULL,
  "Cit_G_Gesta" Varchar2(30 ) NOT NULL,
  "Cit_G_Parto" Varchar2(1 ) NOT NULL,
  "Cit_G_Aborto" Varchar2(1 ) NOT NULL,
  "Cit_G_Cesarias" Varchar2(1 ) NOT NULL,
  "Cit_G_Ultimo_Parto" Timestamp(6) NOT NULL,
  "Cit_G_Ultimo_Papanicolauo" Timestamp(6) NOT NULL,
  "Cit_G_Planificacion" Varchar2(1 ) NOT NULL,
  "Cit_G_Primera_Relacion_Sexual" Timestamp(6) NOT NULL,
  "Cit_G_Compañeros_Sexuales" Varchar2(300 ) NOT NULL,
  "Exp_ID" Number NOT NULL,
  "Cit_G_Fecha" Timestamp(6) NOT NULL,
  "Cit_G_Observaciones" Varchar2(200 ) NOT NULL,
  "Cit_ID" Number
)
/

-- Create indexes for table Clinicas_Citologicas_Ginescobsteticos

CREATE INDEX "IX_Relationship35" ON "Clinicas_Citologicas_Ginescobsteticos" ()
/

CREATE INDEX "IX_Relationship51" ON "Clinicas_Citologicas_Ginescobsteticos" ("Exp_ID")
/

CREATE INDEX "IX_Relationship52" ON "Clinicas_Citologicas_Ginescobsteticos" ("Cit_ID")
/

-- Add keys for table Clinicas_Citologicas_Ginescobsteticos

ALTER TABLE "Clinicas_Citologicas_Ginescobsteticos" ADD CONSTRAINT "PK_Clinicas_Citologicas_Ginescobsteticos" PRIMARY KEY ("Cit_G_ID")
/

ALTER TABLE "Clinicas_Citologicas_Ginescobsteticos" ADD CONSTRAINT "Gin_ID" UNIQUE ("Cit_G_ID")
/

-- Table and Columns comments section

COMMENT ON COLUMN "Clinicas_Citologicas_Ginescobsteticos"."Cit_G_Parto" IS '"
S= Si ha tenido
N= No ha tenido
"'
/
COMMENT ON COLUMN "Clinicas_Citologicas_Ginescobsteticos"."Cit_G_Aborto" IS '"
S= Si ha tenido
N= No ha tenido
"'
/
COMMENT ON COLUMN "Clinicas_Citologicas_Ginescobsteticos"."Cit_G_Cesarias" IS '"
S= Si ha tenido
N= No ha tenido
"'
/
COMMENT ON COLUMN "Clinicas_Citologicas_Ginescobsteticos"."Cit_G_Planificacion" IS '"
S=SI planifica
N=No planifica
"'
/

-- Table Clinicas_Plan_Tratamiento

CREATE TABLE "Clinicas_Plan_Tratamiento"(
  "Pla_T_ID" Number NOT NULL,
  "Pla_T_Nombre" Varchar2(30 ) NOT NULL,
  "Pla_T_Descripcion" Varchar2(200 ) NOT NULL
)
/

-- Add keys for table Clinicas_Plan_Tratamiento

ALTER TABLE "Clinicas_Plan_Tratamiento" ADD CONSTRAINT "PK_Clinicas_Plan_Tratamiento" PRIMARY KEY ("Pla_T_ID")
/

ALTER TABLE "Clinicas_Plan_Tratamiento" ADD CONSTRAINT "Pla_T_ID" UNIQUE ("Pla_T_ID")
/

-- Table Clinicas_Tratamiestos_X_Medico

CREATE TABLE "Clinicas_Tratamiestos_X_Medico"(
  "Pla_T_ID" Number NOT NULL,
  "Tra_M_Cantidad" Number(10,0) NOT NULL,
  "Med_Numero" Number NOT NULL
)
/

-- Add keys for table Clinicas_Tratamiestos_X_Medico

ALTER TABLE "Clinicas_Tratamiestos_X_Medico" ADD CONSTRAINT "PK_Clinicas_Tratamiestos_X_Medico" PRIMARY KEY ("Pla_T_ID","Med_Numero")
/

-- Table Clinicas_Medicina_General

CREATE TABLE "Clinicas_Medicina_General"(
  "Med_G_ID" Number(10,0) NOT NULL,
  "Med_G_Nombre" Varchar2(30 ) NOT NULL,
  "Med_G_Descripcion" Varchar2(200 ) NOT NULL,
  "Med_G_Costo" Number(10,2) NOT NULL
)
/

-- Add keys for table Clinicas_Medicina_General

ALTER TABLE "Clinicas_Medicina_General" ADD CONSTRAINT "PK_Clinicas_Medicina_General" PRIMARY KEY ("Med_G_ID")
/

ALTER TABLE "Clinicas_Medicina_General" ADD CONSTRAINT "Med_G_ID" UNIQUE ("Med_G_ID")
/

-- Table Clinicas_Facturas

CREATE TABLE "Clinicas_Facturas"(
  "Fac_ID" Number NOT NULL,
  "Fac_Descripcion" Varchar2(200 ) NOT NULL,
  "Fac_Costo_Total" Number(10,2) NOT NULL,
  "Fac_Forma_Pago" Varchar2(1 ) NOT NULL,
  "Fac_Pendiente" Varchar2(1 ) NOT NULL,
  "Fac_Total_Cancelado" Number(10,2) NOT NULL,
  "Cit_ID" Number NOT NULL
)
/

-- Create indexes for table Clinicas_Facturas

CREATE INDEX "IX_Relationship59" ON "Clinicas_Facturas" ("Cit_ID")
/

-- Add keys for table Clinicas_Facturas

ALTER TABLE "Clinicas_Facturas" ADD CONSTRAINT "PK_Clinicas_Facturas" PRIMARY KEY ("Fac_ID")
/

ALTER TABLE "Clinicas_Facturas" ADD CONSTRAINT "Fac_ID" UNIQUE ("Fac_ID")
/

-- Table and Columns comments section

COMMENT ON COLUMN "Clinicas_Facturas"."Fac_Forma_Pago" IS '"
E=Efectivo
T=Tarjeta
C=Cheche
"'
/
COMMENT ON COLUMN "Clinicas_Facturas"."Fac_Pendiente" IS '"
S=Si
N=No
"'
/

-- Table Clinicas_Factura_Servicios

CREATE TABLE "Clinicas_Factura_Servicios"(
  "Fac_S_ID" Number(10,0) NOT NULL,
  "Fac_S_Descripcion" Varchar2(200 ) NOT NULL,
  "Fac_S_Costo" Number(10,2) NOT NULL,
  "Fac_ID" Number
)
/

-- Create indexes for table Clinicas_Factura_Servicios

CREATE INDEX "IX_Relationship60" ON "Clinicas_Factura_Servicios" ("Fac_ID")
/

-- Add keys for table Clinicas_Factura_Servicios

ALTER TABLE "Clinicas_Factura_Servicios" ADD CONSTRAINT "PK_Clinicas_Factura_Servicios" PRIMARY KEY ("Fac_S_ID")
/

ALTER TABLE "Clinicas_Factura_Servicios" ADD CONSTRAINT "Fac_S_ID" UNIQUE ("Fac_S_ID")
/


-- Create foreign keys (relationships) section ------------------------------------------------- 

ALTER TABLE "Clinicas_Medicos" ADD CONSTRAINT "Medicos_x_local" FOREIGN KEY ("Loc_ID") REFERENCES "Clinicas_Locales" ("Loc_ID")
/



ALTER TABLE "Clinicas_Pacientes" ADD CONSTRAINT "Pacientes_x_local" FOREIGN KEY ("Loc_ID") REFERENCES "Clinicas_Locales" ("Loc_ID")
/



ALTER TABLE "Clinicas_Locales" ADD CONSTRAINT "Relationship3" FOREIGN KEY ("Enf_ID") REFERENCES "Clinicas_Enfermedades" ("Enf_ID")
/



ALTER TABLE "Clinicas_Enfermedades_x_Locales" ADD CONSTRAINT "Relationship4" FOREIGN KEY ("Loc_ID") REFERENCES "Clinicas_Locales" ("Loc_ID")
/



ALTER TABLE "Clinicas_Enfermedades_x_Locales" ADD CONSTRAINT "Relationship5" FOREIGN KEY ("Enf_ID") REFERENCES "Clinicas_Enfermedades" ("Enf_ID")
/



ALTER TABLE "Clinicas_Especialidades" ADD CONSTRAINT "Especialidades_x_local" FOREIGN KEY ("Loc_ID") REFERENCES "Clinicas_Locales" ("Loc_ID")
/



ALTER TABLE "Clinicas_Usuarios_Roles" ADD CONSTRAINT "Roles_x_local" FOREIGN KEY ("Loc_ID") REFERENCES "Clinicas_Locales" ("Loc_ID")
/



ALTER TABLE "Clinicas_Usuarios_Roles" ADD CONSTRAINT "Roles_x_usuario" FOREIGN KEY ("Usu_ID") REFERENCES "Clinicas_Usuarios" ("Usu_ID")
/



ALTER TABLE "Clinicas_Usuarios_Roles" ADD CONSTRAINT "Rol_x_usuario" FOREIGN KEY ("Rol_ID") REFERENCES "Clinicas_Roles" ("Rol_ID")
/



ALTER TABLE "Clinicas_Agenda_Especialidades" ADD CONSTRAINT "Agenda_espacialidades_x_especialidad" FOREIGN KEY ("Esp_ID") REFERENCES "Clinicas_Especialidades" ("Esp_ID")
/



ALTER TABLE "Clinicas_Agenda_Medicos" ADD CONSTRAINT "Medico_x_agenda" FOREIGN KEY ("Med_Numero") REFERENCES "Clinicas_Medicos" ("Med_Numero")
/



ALTER TABLE "Clinicas_Citas" ADD CONSTRAINT "Relationship19" FOREIGN KEY ("Age_E_ID") REFERENCES "Clinicas_Agenda_Especialidades" ("Age_E_ID")
/



ALTER TABLE "Clinicas_Citas" ADD CONSTRAINT "Agenda_medico_x_cita" FOREIGN KEY ("Age_M_ID") REFERENCES "Clinicas_Agenda_Medicos" ("Age_M_ID")
/



ALTER TABLE "Clinicas_Citas" ADD CONSTRAINT "Paciente_x_cita" FOREIGN KEY ("Pac_Codigo") REFERENCES "Clinicas_Pacientes" ("Pac_Codigo")
/



ALTER TABLE "Clinicas_Expedientes" ADD CONSTRAINT "Expediente_x_paciente" FOREIGN KEY ("Pac_Codigo") REFERENCES "Clinicas_Pacientes" ("Pac_Codigo")
/



ALTER TABLE "Clinicas_Hospitalizaciones" ADD CONSTRAINT "Hospitalizaciones_x_paciente" FOREIGN KEY ("Exp_ID") REFERENCES "Clinicas_Expedientes" ("Exp_ID")
/



ALTER TABLE "Clinicas_Operaciones" ADD CONSTRAINT "Operaciones_x_paciente" FOREIGN KEY ("Exp_ID") REFERENCES "Clinicas_Expedientes" ("Exp_ID")
/



ALTER TABLE "Clinicas_Tratamientos" ADD CONSTRAINT "Tratamientos_x_usuario" FOREIGN KEY ("Exp_ID") REFERENCES "Clinicas_Expedientes" ("Exp_ID")
/



ALTER TABLE "Clinicas_Pac_Patologias" ADD CONSTRAINT "Patologias_x_expediente" FOREIGN KEY ("Enf_ID") REFERENCES "Clinicas_Enfermedades" ("Enf_ID")
/



ALTER TABLE "Clinicas_Pac_Patologias" ADD CONSTRAINT "Expediente_x_patologias" FOREIGN KEY ("Exp_ID") REFERENCES "Clinicas_Expedientes" ("Exp_ID")
/



ALTER TABLE "Clinicas_Ginescobsteticos" ADD CONSTRAINT "Ginescobsteticos_x_paciente" FOREIGN KEY ("Exp_ID") REFERENCES "Clinicas_Expedientes" ("Exp_ID")
/



ALTER TABLE "Clinicas_Archivos" ADD CONSTRAINT "Archivos_x_paciente_expediente" FOREIGN KEY ("Exp_ID") REFERENCES "Clinicas_Expedientes" ("Exp_ID")
/



ALTER TABLE "Clinicas_Heredero_Familiares" ADD CONSTRAINT "Patologia_x_heredo_familiar" FOREIGN KEY ("Enf_ID") REFERENCES "Clinicas_Enfermedades" ("Enf_ID")
/



ALTER TABLE "Clinicas_Heredero_Familiares" ADD CONSTRAINT "Patologias_familiares_x_paciente" FOREIGN KEY ("Exp_ID") REFERENCES "Clinicas_Expedientes" ("Exp_ID")
/



ALTER TABLE "Clinicas_Examenes" ADD CONSTRAINT "Examenes_x_cita" FOREIGN KEY ("Cit_ID") REFERENCES "Clinicas_Citas" ("Cit_ID")
/



ALTER TABLE "Clinicas_Examenes" ADD CONSTRAINT "Examenes_x_paciente" FOREIGN KEY ("Pac_Codigo") REFERENCES "Clinicas_Pacientes" ("Pac_Codigo")
/



ALTER TABLE "Clinicas_Indice_Masa" ADD CONSTRAINT "Indice_masa_x_paciente" FOREIGN KEY ("Pac_Codigo") REFERENCES "Clinicas_Pacientes" ("Pac_Codigo")
/



ALTER TABLE "Clinicas_Departamento_Secretariado" ADD CONSTRAINT "Departamento_secretariado_x_local" FOREIGN KEY ("Loc_ID") REFERENCES "Clinicas_Locales" ("Loc_ID")
/



ALTER TABLE "Clinicas_Usuarios" ADD CONSTRAINT "Empleados_secretariado" FOREIGN KEY ("Dep_S_ID") REFERENCES "Clinicas_Departamento_Secretariado" ("Dep_S_ID")
/



ALTER TABLE "Clinicas_Departamento_Enfermeria" ADD CONSTRAINT "Departamento_enfermeria_x_local" FOREIGN KEY ("Loc_ID") REFERENCES "Clinicas_Locales" ("Loc_ID")
/



ALTER TABLE "Clinicas_Usuarios" ADD CONSTRAINT "Empleados_enfermeria" FOREIGN KEY ("Dep_E_ID") REFERENCES "Clinicas_Departamento_Enfermeria" ("Dep_E_ID")
/



ALTER TABLE "Clinicas_Anotaciones_Especiales" ADD CONSTRAINT "Anotaciones_especiales_x_paciente" FOREIGN KEY ("Exp_ID") REFERENCES "Clinicas_Expedientes" ("Exp_ID")
/



ALTER TABLE "Clinicas_Examen_Fisico" ADD CONSTRAINT "Examenes_Fisicos_x_cita" FOREIGN KEY ("Cit_ID") REFERENCES "Clinicas_Citas" ("Cit_ID")
/



ALTER TABLE "Clinicas_Citas" ADD CONSTRAINT "Exp_x_cita" FOREIGN KEY ("Exp_ID") REFERENCES "Clinicas_Expedientes" ("Exp_ID")
/



ALTER TABLE "Clinicas_Citologicas_Ginescobsteticos" ADD CONSTRAINT "Relationship51" FOREIGN KEY ("Exp_ID") REFERENCES "Clinicas_Expedientes" ("Exp_ID")
/



ALTER TABLE "Clinicas_Citologicas_Ginescobsteticos" ADD CONSTRAINT "Citas_x_Ginescobsteticos" FOREIGN KEY ("Cit_ID") REFERENCES "Clinicas_Citas" ("Cit_ID")
/



ALTER TABLE "Clinicas_Citas" ADD CONSTRAINT "Plan_Tratamiento_x_cita" FOREIGN KEY ("Pla_T_ID") REFERENCES "Clinicas_Plan_Tratamiento" ("Pla_T_ID")
/



ALTER TABLE "Clinicas_Tratamiestos_X_Medico" ADD CONSTRAINT "Relationship54" FOREIGN KEY ("Pla_T_ID") REFERENCES "Clinicas_Plan_Tratamiento" ("Pla_T_ID")
/



ALTER TABLE "Clinicas_Citas" ADD CONSTRAINT "Medicina_general_x_cita" FOREIGN KEY ("Med_G_ID") REFERENCES "Clinicas_Medicina_General" ("Med_G_ID")
/



ALTER TABLE "Clinicas_Tratamiestos_X_Medico" ADD CONSTRAINT "Tratamientos_usados_x_medico" FOREIGN KEY ("Med_Numero") REFERENCES "Clinicas_Medicos" ("Med_Numero")
/



ALTER TABLE "Clinicas_Medicos" ADD CONSTRAINT "Usuario_x_medico" FOREIGN KEY ("Usu_ID") REFERENCES "Clinicas_Usuarios" ("Usu_ID")
/



ALTER TABLE "Clinicas_Facturas" ADD CONSTRAINT "Factura_x_cita" FOREIGN KEY ("Cit_ID") REFERENCES "Clinicas_Citas" ("Cit_ID")
/



ALTER TABLE "Clinicas_Factura_Servicios" ADD CONSTRAINT "Servicios_x_factura" FOREIGN KEY ("Fac_ID") REFERENCES "Clinicas_Facturas" ("Fac_ID")
/



ALTER TABLE "Clinicas_Archivos" ADD CONSTRAINT "Archivos_x_paciente" FOREIGN KEY ("Pac_Codigo") REFERENCES "Clinicas_Pacientes" ("Pac_Codigo")
/





