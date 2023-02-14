       >>SOURCE FORMAT FREE
IDENTIFICATION DIVISION.
PROGRAM-ID. colboltut.
AUTHOR. ANDY SONG.
DATE-WRITTEN. April 18th 2022.
ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
       SELECT CustomerReport ASSIGN TO "CustReport.rpt"
           ORGANIZATION IS LINE SEQUENTIAL.
       SELECT CustomerFile ASSIGN TO "Customer.dat"
           ORGANIZATION IS LINE SEQUENTIAL.
*>     ACCESS IS SEQUENTIAL.   

DATA DIVISION.
FILE SECTION.
FD CustomerReport.
01 PrintLine PIC X(44).

FD CustomerFile.
01 CustomerData.
       02 IDNum    PIC 9(5).
       02 CustName.
           03 FirstName PIC X(15).
           03 LastName PIC X(15).
       88 WSEOF VALUE HIGH-VALUE.
WORKING-STORAGE SECTION.
01 PageHeading.
       02 FILLER PIC X(13) VALUE "Customer List".
01 PageFooting.
       02 FILLER PIC X(15) VALUE SPACE.
       02 FILLER PIC X(7) VALUE "Page : ".
       02 PrnPageNum PIC Z9 VALUE ZERO.

01 Heads PIC X(36) VALUE "IDNum    FirstName        LastName".
01 CustomerDetailLine.
       02 FILLER PIC X VALUE SPACE.
       02 PrnCustID PIC 9(5).
       02 FILLER PIC X(4) VALUE SPACE.
       02 PrnFirstName PIC X(15).
       02 FILLER PIC XX VALUE SPACE.
       02 PrnLastName PIC X(15).
01 ReportFooting PIC X(13) VALUE "END OF REPORT".
01 LineCount PIC 99 VALUE ZERO.
       88 NewPageRequired VALUE 40 THRU 99.
01 PageCount PIC 99 VALUE zeros.

01 WSCustomer.
       02 WSIDNum    PIC 9(5).
       02 WSCustName.
           03 WSFirstName PIC X(15).
           03 WSLastName PIC X(15).
PROCEDURE DIVISION. 
*> OPEN EXTEND CustomerFile.
*>        DISPLAY "Customer ID " WITH NO ADVANCING
*>        ACCEPT IDNum
*>        DISPLAY "Customer First Name " WITH NO ADVANCING
*>        ACCEPT FirstName
*>        DISPLAY "Customer Last Name " WITH NO ADVANCING
*>        ACCEPT LastName
*>        WRITE CustomerData
*>        END-WRITE.
*> CLOSE CustomerFile.     

*> OPEN INPUT CustomerFile.
*>        PERFORM UNTIL WSEOF = 'Y'
*>            READ CustomerFile INTO WSCustomer
*>                AT END MOVE 'Y' TO WSEOF
*>                NOT AT END DISPLAY WSCustomer
*>            END-READ       
*>        END-PERFORM.
*> CLOSE CustomerFile.     

OPEN INPUT CustomerFile.
OPEN OUTPUT CustomerReport
PERFORM PrintPageHeading
READ CustomerFile
       AT END SET WSEOF TO TRUE 
END-READ
PERFORM PrintReportBody UNTIL WSEOF
WRITE PrintLine FROM PageFooting AFTER ADVANCING 4 LINES
WRITE PrintLine FROM ReportFooting AFTER ADVANCING 9 LINES


CLOSE CustomerFile, CustomerReport.
STOP RUN.       

PrintPageHeading.
WRITE PrintLine FROM PageHeading AFTER ADVANCING Page
WRITE PrintLine FROM Heads AFTER ADVANCING 2 LINES
MOVE 3 TO LineCount
ADD 1 TO PageCount
MOVE PageCount TO PrnPageNum. 

PrintReportBody.
IF NewPageRequired
       MOVE PageCount TO PrnPageNum
       WRITE PrintLine FROM PageFooting AFTER ADVANCING 5 LINES 
       PERFORM PrintPageHeading
END-IF 
MOVE IDNum TO PrnCustID
MOVE FirstName TO PrnFirstName
MOVE LastName TO PrnLastName
WRITE PrintLine FROM CustomerDetailLine AFTER ADVANCING 1 LINE 
ADD 1 TO LineCount.
READ CustomerFile
      AT END SET WSEOF TO TRUE 
END-READ.
