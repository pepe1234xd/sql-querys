CREATE DATABASE school;

create table school.Teacher (
    id integer Not null primary key,
    Name varchar(25),
    MiddleName varchar(25),
    LastName varchar(25),
    SecondLastName varchar(25)    
);

ALTER TABLE `school`.`Teacher` 
ADD UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE;
;

CREATE TABLE `school`.`Classroom` (
  `Id` INT NOT NULL,
  `Name` VARCHAR(25) NOT NULL,
  `Chairs_No` INT NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Id_UNIQUE` (`Id` ASC) VISIBLE);

CREATE TABLE `school`.`Classroom_Teacher` (
  `id` INT NOT NULL,
  `Teacher_id` INT NOT NULL,
  `Classroom_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE);

CREATE TABLE `school`.`SchoolSubject` (
  `id` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Score` DECIMAL(2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE);

CREATE TABLE `school`.`Student` (
  `Id` INT NOT NULL,
  `FirstName` VARCHAR(25) NOT NULL,
  `MiddleName` VARCHAR(25) NULL,
  `LastName` VARCHAR(25) NOT NULL,
  `SecondLastName` VARCHAR(25) NOT NULL,
  `Matricula` VARCHAR(10) NOT NULL,
  `Generation` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Id_UNIQUE` (`Id` ASC) VISIBLE);

CREATE TABLE `school`.`Student_Subject` (
  `Id` INT NOT NULL,
  `SchoolSubject_id` INT NOT NULL,
  `Student_id` INT NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Id_UNIQUE` (`Id` ASC) VISIBLE);

CREATE TABLE `school`.`SchoolSubject_Classroom` (
  `Id` INT NOT NULL,
  `SchoolSubject_id` INT NOT NULL,
  `Classroom_id` INT NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Id_UNIQUE` (`Id` ASC) VISIBLE);

INSERT INTO `school`.`Student` (`Id`, `FirstName`, `MiddleName`, `LastName`, `SecondLastName`, `Matricula`, `Generation`) VALUES ('1', 'Jose', 'Alfredo', 'Figueroa', 'Sanchez', '43241543', '2021-2022');

INSERT INTO `school`.`SchoolSubject` (`id`, `Name`, `Score`) VALUES ('1', 'History', '80');

INSERT INTO `school`.`Classroom` (`Id`, `Name`, `Chairs_No`) VALUES ('1', 'Room-11', '15');

INSERT INTO `school`.`Teacher` (`id`, `Name`, `MiddleName`, `LastName`, `SecondLastName`) VALUES ('1', 'Antonio', 'De Jesus', 'Lopez', 'Medina');

INSERT INTO `school`.`Classroom_Teacher` (`id`, `Teacher_id`, `Classroom_id`) VALUES ('1', '1', '1');

INSERT INTO `school`.`SchoolSubject_Classroom` (`Id`, `SchoolSubject_id`, `Classroom_id`) VALUES ('1', '1', '1');

INSERT INTO `school`.`Student_Subject` (`Id`, `SchoolSubject_id`, `Student_id`) VALUES ('1', '1', '1');

alter table school.Classroom_Teacher
add constraint Fk_ClassroomId foreign key (Classroom_id) references school.Classroom(id),
add constraint Fk_TeacherId foreign key (Teacher_id) references school.Teacher(id);

alter table school.SchoolSubject_Classroom
add constraint Fk_SubjectClassroom foreign key (Classroom_id) references school.Classroom(Id),
add constraint Fk_SchoolSubjectId foreign key (SchoolSubject_id) references school.SchoolSubject(Id);

alter table school.Student_Subject
add constraint Fk_StudentsId foreign key (Student_id) references school.Student(Id),
add constraint Fk_SubjectsId foreign key (SchoolSubject_id) references school.SchoolSubject(id);


Server=localhost\SQLEXPRESS01;Database=master;Trusted_Connection=True;