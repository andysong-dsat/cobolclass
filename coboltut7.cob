       >>SOURCE FORMAT FREE
IDENTIFICATION DIVISION.
PROGRAM-ID. colboltut.

environment division.
input-output section.
file-control.
       select WorkFile Assign to 'work.tmp'.
       select OrgFile assign to 'student.dat'
           organization is line sequential. 
       select SortedFile assign to 'student2.dat'
           organization is line sequential. 

DATA DIVISION.
File section.
FD OrgFile.
01 StudentDat.
       02 IDNum PIC 9.
       02 StudName PIC X(10).
SD WorkFile.
01 WStudentDat.
       02 WIDNum PIC 9.
       02 WStudName PIC X(10).
FD SortedFile.
01 SStudentDat.
       02 SIDNum PIC 9.
       02 SStudName PIC X(10). 
WORKING-STORAGE SECTION.

PROCEDURE DIVISION. 
SORT WorkFile ON ascending key WIDNum
       Using OrgFile
       giving SortedFile

STOP RUN.    

