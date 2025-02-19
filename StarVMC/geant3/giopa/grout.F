*
* $Id: grout.F,v 1.1.1.3 2009/02/18 20:33:19 fisyak Exp $
*
* $Log: grout.F,v $
* Revision 1.1.1.3  2009/02/18 20:33:19  fisyak
* *** empty log message ***
*
* Revision 1.1.1.1  2002/06/16 15:18:40  hristov
* Separate distribution  of Geant3
*
* Revision 1.1.1.1  1999/05/18 15:55:20  fca
* AliRoot sources
*
* Revision 1.1.1.1  1995/10/24 10:21:17  cernlib
* Geant
*
*
#include "geant321/pilot.h"
*CMZ :  3.21/02 29/03/94  15.41.21  by  S.Giani
*FCA :          05/01/99  12:33:28  by  Federico Carminati
*               Modified output options so that the complete linear
*               structure is output
*-- Author :
      SUBROUTINE GROUT(CHOBJT,IDVERS,CHOPT)
C.
C.    ******************************************************************
C.    *                                                                *
C.    *       Routine to write GEANT object(s) in the RZ file          *
C.    *         at the Current Working Directory (See RZCDIR)          *
C.    *       Input is taken from the data structures in memory        *
C.    *           (VOLU,ROTM,TMED,MATE,SETS,PART,SCAN)                 *
C.    *                                                                *
C.    *       CHOBJ  The type of object to be written:                 *
C.    *              MATE write JMATE structure                        *
C.    *              TMED write JTMED structure                        *
C.    *              VOLU write JVOLUM structure                       *
C.    *              ROTM write JROTM structure                        *
C.    *              SETS write JSET  structure                        *
C.    *              PART write JPART structure                        *
C.    *              SCAN write LSCAN structure                       *
C.    *              INIT write all initialisation structures          *
C.    *                                                                *
C.    *       IDVERS is a positive integer which specifies the version *
C.    *           number of the object(s).                             *
C.    *                                                                *
C.    *       CHOPT List of options (none for the time being)          *
C.    *                                                                *
C.    *    Note that if the cross-sections and energy loss tables      *
C.    *       are available in the data structure JMATE, then they are *
C.    *       saved on the data base.                                  *
C.    *                                                                *
C.    *                                                                *
C.    *    The data structures saved by this routine can be retrieved  *
C.    *    with the routine GRIN.                                      *
C.    *                                                                *
C.    *    Before calling this routine a RZ data base must have been   *
C.    *    created using GRFILE.                                       *
C.    *    The data base must be closed with RZEND.                    *
C.    *                                                                *
C.    *    The RZ data base can be transported between different       *
C.    *    machines in using the ZEBRA RZ utility RZTOFZ.              *
C.    *                                                                *
C.    *    The interactive version of GEANT provides facilities        *
C.    *    to interactively update, create and display objects.        *
C.    *                                                                *
C.    *      Example.                                                  *
C.    *                                                                *
C.    *      CALL GRFILE(1,'Geometry.dat','N')                         *
C.    *      CALL GROUT('VOLU',1,' ')                                  *
C.    *      CALL GROUT('MATE',1,' ')                                  *
C.    *      CALL GROUT('TMED',1,' ')                                  *
C.    *      CALL GROUT('ROTM',1,' ')                                  *
C.    *      CALL GROUT('PART',1,' ')                                  *
C.    *      CALL GROUT('SCAN',1,' ')                                  *
C.    *      CALL GROUT('SETS',1,' ')                                  *
C.    *                                                                *
C.    *      The same result can be achieved by:                       *
C.    *      CALL GRFILE(1,'Geometry.dat','NO')                        *
C.    *                                                                *
C.    *    ==>Called by : <USER>,GRFILE                                *
C.    *       Author    R.Brun  *********                              *
C.    *                                                                *
C.    ******************************************************************
C.
#include "geant321/gcbank.inc"
#include "geant321/gcflag.inc"
#include "geant321/gcnum.inc"
#include "geant321/gccuts.inc"
#include "geant321/gcscal.inc"
#include "geant321/gcdraw.inc"
#include "geant321/gcunit.inc"
*      COMMON/GCLINK/JDIGI ,JDRAW ,JHEAD ,JHITS ,JKINE ,JMATE ,JPART
*     +      ,JROTM ,JRUNG ,JSET  ,JSTAK ,JGSTAT,JTMED ,JTRACK,JVERTX
*     +      ,JVOLUM,JXYZ  ,JGPAR ,JGPAR2,JSKLT
      COMMON/QUEST/IQUEST(100)
      PARAMETER (NLINIT=9,NLKINE=2,NLTRIG=6,NMKEY=22)
      DIMENSION JNAMES(20),KEYS(2)
      DIMENSION LINIT(NLINIT),LKINE(NLKINE),LTRIG(NLTRIG),IXD(NMKEY)
      DIMENSION LINK(NMKEY),LDIV(2)
      EQUIVALENCE (JNAMES(1),JDIGI)
      CHARACTER*4 CHOBJ,NAMES(NMKEY)
      CHARACTER*(*) CHOPT,CHOBJT
      DATA NAMES/'DIGI','DRAW','HEAD','HITS','KINE','MATE','PART',
     +    'ROTM','RUNG','SETS','STAK','STAT','TMED','NULL','VERT',
     +    'VOLU','JXYZ','NULL','NULL','NULL','SCAN','NULL'/
      DATA IXD/2,1,2,2,2,8*1,2,2,1,2,3*0,1,0/
      DATA LINIT/2,6,7,8,9,10,13,16,21/
      DATA LKINE/5,15/
      DATA LTRIG/1,3,4,5,15,17/
C.
C.    ------------------------------------------------------------------
C.
      IQUEST(1)=0
      LDIV(1)  =IXCONS
      LDIV(2)  =IXDIV
      CHOBJ=CHOBJT
*
      IOPTI=INDEX(CHOPT,'i')+INDEX(CHOPT,'I')
      IOPTT=INDEX(CHOPT,'t')+INDEX(CHOPT,'T')
      IOPTK=INDEX(CHOPT,'k')+INDEX(CHOPT,'K')
      IOPTQ=INDEX(CHOPT,'q')+INDEX(CHOPT,'Q')
*
      IF(CHOBJ.EQ.'INIT') THEN
         CHOBJ='*'
         IOPTI=1
         IOPTT=0
         IOPTK=0
      ELSEIF(CHOBJ.EQ.'TRIG') THEN
         CHOBJ='*'
         IOPTI=0
         IOPTT=1
         IOPTK=0
      ELSEIF(CHOBJ.EQ.'KINE') THEN
         CHOBJ='*'
         IOPTI=0
         IOPTT=0
         IOPTK=1
      ENDIF
*
      IF(CHOBJ.EQ.'*') THEN
         IF(IOPTI.NE.0) THEN
            DO 10 J=1, NLINIT
               LINK(J)=LINIT(J)
   10       CONTINUE
            NLINK=NLINIT
         ELSEIF(IOPTT.NE.0) THEN
            DO 20 J=1, NLTRIG
               LINK(J)=LTRIG(J)
   20       CONTINUE
            NLINK=NLTRIG
         ELSEIF(IOPTK.NE.0) THEN
            DO 30 J=1, NLKINE
               LINK(J)=LKINE(J)
   30       CONTINUE
            NLINK=NLKINE
         ENDIF
      ELSE
         NLINK=0
         DO 90 J=1, NMKEY
            IF(CHOBJ.EQ.NAMES(J)) THEN
               IF(IOPTI.NE.0) THEN
                  DO 40 L=1, NLINIT
                     IF(LINIT(L).EQ.J) GOTO 70
   40             CONTINUE
                  GOTO 80
               ELSEIF(IOPTT.NE.0) THEN
                  DO 50 L=1, NLTRIG
                     IF(LTRIG(L).EQ.J) GOTO 70
   50             CONTINUE
                  GOTO 80
               ELSEIF(IOPTK.NE.0) THEN
                  DO 60 L=1, NLKINE
                     IF(LKINE(L).EQ.J) GOTO 70
   60             CONTINUE
                  GOTO 80
               ENDIF
   70          NLINK=1
               LINK(1)=J
               GOTO 100
*
   80          WRITE(CHMAIL,10000) CHOBJ, CHOPT
               CALL GMAIL(0,0)
               GOTO 999
*
            ENDIF
   90    CONTINUE
      ENDIF
*
  100 IF(NLINK.EQ.0) THEN
         WRITE(CHMAIL,10100) CHOBJ
         CALL GMAIL(0,0)
         GOTO 999
      ENDIF
*
      NOUT=0
      DO 110 I=1,NLINK
         NKEY=LINK(I)
         CALL UCTOH(NAMES(NKEY),KEYS,4,4)
         KEYS(2)=IDVERS
         IDIV=LDIV(IXD(NKEY))
         IF(NKEY.LE.20)THEN
            IF(JNAMES(NKEY).GT.0)    THEN
               CALL RZOUT(IDIV,JNAMES(NKEY),KEYS,ICYCLE,'L')
               LINK(I)=-LINK(I)
            ENDIF
         ELSE
            IF(ISLINK(NKEY-20).GT.0)    THEN
               CALL RZOUT(IDIV,ISLINK(NKEY-20),KEYS,ICYCLE,'L')
               LINK(I)=-LINK(I)
            ENDIF
         ENDIF
         IF(LINK(I).GT.0) THEN
            IF(IOPTQ.EQ.0) THEN
            WRITE(CHMAIL,10200) NAMES(LINK(I))
            CALL GMAIL(0,0)
            ENDIF
            GOTO 110
         ELSEIF(LINK(I).LT.0) THEN
            IF(IQUEST(1).EQ.0) THEN
            IF(IOPTQ.EQ.0) THEN
               WRITE(CHMAIL,10300) NAMES(-LINK(I)), IDVERS
               CALL GMAIL(0,0)
            ENDIF
               NOUT=NOUT+1
            ELSE
               WRITE(CHMAIL,10400) NAMES(-LINK(I))
               CALL GMAIL(0,0)
            ENDIF
         ENDIF
  110 CONTINUE
*
      IF(NOUT.EQ.0) THEN
         WRITE(CHMAIL,10500)
         CALL GMAIL(0,0)
      ENDIF
*
10000 FORMAT(' *** GROUT *** Data structure ',A4,' not written ',
     +       'in phase ',A)
10100 FORMAT(' *** GROUT *** Unknown key ',A4)
10200 FORMAT(' *** GROUT *** Data structure ',A4,' was not found')
10300 FORMAT(' *** GROUT *** Data structure ',A4,' version ',I10,
     +       ' saved to disk')
10400 FORMAT(' *** GROUT *** Error in writing data structure ',
     +        A4,' to disk')
10500 FORMAT(' *** GROUT *** Nothing written to disk !')
  999 END
