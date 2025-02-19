* $Id: zfatal.F,v 1.1.1.1 2004/01/12 23:49:39 potekhin Exp $
* $Log: zfatal.F,v $
* Revision 1.1.1.1  2004/01/12 23:49:39  potekhin
*
*
* Revision 1.2  2001/03/02 21:08:33  nevski
* 95a version conditioned
*
* Revision 1.1  2001/02/27 10:15:29  nevski
*  first working release
*
*
#include "zebra/pilot.h"
*CMZ :  1.30/00 01/04/97  18.15.21  by  Pavel Nevski
*-- Author :    Pavel Nevski   16/03/97
      SUBROUTINE ZFATAL

C-    FATAL PROGRAM TERMINATION

#include "zebra/zmach.inc"
#include "zebra/zstate.inc"
#include "zebra/zunit.inc"
#if !defined(CERNLIB_95A)
#include "zebra/zvfaut.inc"
#endif
#include "zebra/mqsys.inc"
#include "zebra/fzci.inc"
C--------------    END CDE                             --------------
#include "zebra/zfatalch.inc"
#include "zebra/zfatalre.inc"

      IF (NQERR.GT.0)              GO TO 71
      NQERR = NQERR+1
      LUN   = IQTYPE
      IF (LUN.NE.0)                GO TO 22

   21 LUN  = IQLOG
   22 IF (NQTRAC.EQ.0)             GO TO 31

C----              PRINT ZEBRA TRACE-BACK

#if (defined(CERNLIB_QPRINT))&&(!defined(CERNLIB_QTRHOLL)||defined(CERNLIB_A6M))
      JT = NQTRAC - 1
      WRITE (LUN,9024) MQTRAC(JT+1)
 9024 FORMAT (1X/' !!!!! ZFATAL called from ',A6)
      GO TO 28

   25 WRITE (LUN,9025) MQTRAC(JT+1)
 9025 FORMAT (14X,'called from ',A6)
   28 JT = JT - 1

#endif
#if (defined(CERNLIB_QPRINT))&&(defined(CERNLIB_QTRHOLL))&&(!defined(CERNLIB_A6M))
      JT = NQTRAC - 2
      WRITE (LUN,9024) MQTRAC(JT+1),MQTRAC(JT+2)
 9024 FORMAT (1X/' !!!!! ZFATAL called from ',2A4)
      GO TO 28

   25 WRITE (LUN,9025) MQTRAC(JT+1),MQTRAC(JT+2)
 9025 FORMAT (14X,'called from ',2A4)
   28 JT = JT - 2
#endif
#if defined(CERNLIB_QPRINT)
      IF (JT.GE.0)                 GO TO 25
      IF (NQFATA.EQ.0)             GO TO 49
      GO TO 41
#endif

C--                EXTERNAL CALL TO ZFATAL

   31 IF (NQFATA.NE.0)             GO TO 41
#if defined(CERNLIB_QPRINT)
      WRITE (LUN,9031)
 9031 FORMAT (1X/' !!!!! ZFATAL reached.')
#endif
      GO TO 49

C--                ZEBRA INTERNAL CALL TO ZFATAL

   41 CONTINUE
#if (defined(CERNLIB_QPRINT))&&(defined(CERNLIB_QTRHOLL))&&(defined(CERNLIB_A6M))
      WRITE (LUN,9041) IQUEST(10),NQCASE
 9041 FORMAT (1X/' !!!!! ZFATAL reached from ',A6,'  for Case=',I3/1X)
#endif
#if (defined(CERNLIB_QPRINT))&&(defined(CERNLIB_QTRHOLL))&&(!defined(CERNLIB_A6M))
      WRITE (LUN,9041) IQUEST(9),IQUEST(10),NQCASE
 9041 FORMAT (1X/' !!!!! ZFATAL reached from ',2A4,'  for Case=',I3/1X)
#endif
#if (defined(CERNLIB_QPRINT))&&(!defined(CERNLIB_QTRHOLL))
      WRITE (LUN,9041) IQUEST(9),IQUEST(10),NQCASE
 9041 FORMAT (1X/' !!!!! ZFATAL reached from ',2A4,'  for Case=',I3/1X)
#endif
#if defined(CERNLIB_QPRINT)


      DO 47  JW=11,10+NQFATA
        IT = IQUEST(JW)
        JT = IT
        do JPOS=1,IQBITW,8
          J  = JBYT (IT,JPOS,8)
          IF (J.LT.32 .or. J.EQ.255) CALL SBYT(32,JT,JPOS,8)
        enddo
       WRITE (LUN,9043,ERR=47)  JW,IT,IT,JT
#endif
#if (defined(CERNLIB_QPRINT))&&(!defined(CERNLIB_HEX))
 9043  FORMAT (10X,'IQUEST(',I2,') = ',I9,1X,O22,1X,A6)
#endif
#if (defined(CERNLIB_QPRINT))&&(defined(CERNLIB_HEX))
 9043  FORMAT (10X,'IQUEST(',I2,') = ',I9,1X,Z16,1X,A6)
#endif

   47 CONTINUE

   49 WRITE (LUN,9049) JQSTOR,JQDIVI
 9049 FORMAT (1X/10X,'Current Store number =',I3,'  (JQDIVI=',I2,')')

      IF (IQVID(2).EQ.0)           GO TO 59

      WRITE (LUN,9051) IQVID
      WRITE (LUN,9052) (J,IQVREM(1,J),IQVREM(2,J),J=1,6)

 9051 FORMAT (1X/10X,'Automatic Verification Identifiers :'
     F/10X,'Current :',2X,2I11)
 9052 FORMAT (10X,'Stacked, J =',I2,' :',I6,I11,5(/22X,I2,' :',I6,I11))

   59 IF (LUN.NE.IQLOG)            GO TO 21

*PN: trying to do something, at least provide an extended diagnostoc
      CALL ZABEND (NQCASE,LQSYSR(KQT+1))
*     print *,' ==> NQCASE,NQERR after ZABEND =',NQCASE,NQERR
      JRETCD = -3
      IF (NQCASE.EQ.0) RETURN
*
      NQCASE = 0
      NQFATA = 0


C----              RECOVERY LOOP

   71 NQERR = NQERR + 1
      IF (NQERR.GE.4)              GO TO 79
      WRITE (IQLOG,9071)
      IF (IQTYPE.EQ.0)             GO TO 79
      IF (IQTYPE.EQ.IQLOG)         GO TO 79
      WRITE (IQTYPE,9071)
 9071 FORMAT (1X/' !!!!! break for re-entry to ZFATAL !!!!!')
   79 CONTINUE
*
* PN: regain control as in arithmetic trap
      CALL TRACEQ
      CALL ABEND
* PN: never reached, for reference only
      CALL ZPHASE(0)
      END

