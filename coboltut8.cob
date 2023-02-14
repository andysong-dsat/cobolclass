       >>SOURCE FORMAT FREE
IDENTIFICATION DIVISION.
PROGRAM-ID. colboltut.

environment division.
input-output section.
file-control.
       select WorkFile Assign to 'work.tmp'.
       select File1 assign to 'student.dat'
           organization is line sequential. 
       select File2 assign to 'student3.dat'
           organization is line sequential. 
       select NewFile assign to 'student4.dat'
           organization is line sequential.

DATA DIVISION.
File section.
FD File1.
01 StudentDat.
       02 IDNum PIC 9.
       02 StudName PIC X(10).
FD File2.
01 StudentDat2.
       02 IDNum2 PIC 9.
       02 StudName2 PIC X(10).
SD WorkFile.
01 WStudentDat.
       02 WIDNum PIC 9.
       02 WStudName PIC X(10).
FD NewFile.
01 NStudentDat.
       02 NIDNum PIC 9.
       02 NStudName PIC X(10). 
WORKING-STORAGE SECTION.

PROCEDURE DIVISION. 
MERGE WorkFile ON ascending key WIDNum
       Using File1, File2
       giving NewFile

STOP RUN.    

