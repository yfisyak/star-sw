*
* $Id: gzinit.F,v 1.1.1.1 2004/01/12 23:49:41 potekhin Exp $
*
* $Log: gzinit.F,v $
* Revision 1.1.1.1  2004/01/12 23:49:41  potekhin
*
*
* Revision 1.1  2001/02/27 10:15:47  nevski
*  first working release
*
* Revision 1.2  2000/01/06 22:09:19  nevski
* unlimited track/vertex version
*
* Revision 1.1  1998/10/31 22:20:02  nevski
* initialization for very big GCBANK corrected (sign was flopped)
*
* Revision 1.1.1.1  1995/10/24 10:20:11  cernlib
* Geant
*
*
#include "geant321/pilot.h"
*CMZ :  3.21/02 29/03/94  17.18.27  by  S.Giani
*-- Author :
      SUBROUTINE GZINIT
C.
C.    ******************************************************************
C.    *                                                                *
C.    *       Routine to initialise GEANT/ZEBRA data structures        *
C.    *                                                                *
C.    *    ==>Called by : <USER>, UGINIT                               *
C.    *       Author    R.Brun  *********                              *
C.    *                                                                *
C.    * Modifications:                                                 *
C.    * PN, 31.10.98 - prevent sign flop in MAXCON calculation         *
C.    ******************************************************************
C.
#include "geant321/gcbank.inc"
#include "geant321/gcflag.inc"
#include "geant321/gcjloc.inc"
#include "geant321/gctime.inc"
#include "geant321/gcmzfo.inc"
#include "geant321/gcscal.inc"
      COMMON/GCLOCA/NLOCAL(2),LOCAL(20)
C.
C.    ------------------------------------------------------------------
C.
      IF(IFINIT(2).NE.0)RETURN
      IFINIT(2)=1
C
C                 Create one long range division (reverse)
C                 to store all constants
C                 The event structures are created in division 2
C                 of the store
C
      MINCON=2000
      MAXCON=0.8*NZEBRA
      CALL MZDIV(IXSTOR,IXCONS,'Constants',MINCON,MAXCON,'LRC')
      IXDIV=IXSTOR+2
C
C                 IXDIV and IXCONS are two self contained divisions.
C                 To gain time we specify that to ZEBRA
C
      CALL MZXREF(IXCONS,IXDIV,'C')
      CALL MZXREF(IXDIV,IXCONS,'C')
C
C                 Define a default work space of KWWORK words
C
      CALL GWORK(KWWORK)
C
C                 Create a permanent link area for master pointers
C
      CALL MZLINK(IXSTOR,'/GCLINK/',JDIGI,JSKLT,JDIGI)
C
C                 Create a permanent link area for param. pointers
C
      CALL MZLINK(IXSTOR,'/GCSLNK/',LSCAN,LSLAST,LSCAN)
C
C                 Create temporary link areas
C
      CALL MZLINT(IXSTOR,'/GCLOCA/',NLOCAL,LOCAL(1),LOCAL(20))
      CALL MZLINT(IXSTOR,'/GCJLOC/',NJLOC ,JTM,JRANG)
      CALL MZLINT(IXSTOR,'/GCJLCK/',NJLCK ,JTCKOV,JTASHO)
C
C             Define IO descriptors of GEANT banks
C
      CALL MZFORM('MATE','5H -F'      ,IOMATE)
      CALL MZFORM('PART','5H -F'      ,IOPART)
      CALL MZFORM('TMED','5H -F'      ,IOTMED)
      CALL MZFORM('SEJD','10I / 1H 1I',IOSEJD)
      CALL MZFORM('SJDD','/ 1H 1I'    ,IOSJDD)
      CALL MZFORM('SJDH','/ 1H 1I 2F' ,IOSJDH)
      CALL MZFORM ('STAK', '3I / 3I 9F',IOSTAK)
      CALL MZFORM('RUNG','20I 8F 2I'   ,IORUNG)
C
C             Create RUN header bank
C
      CALL MZBOOK(IXCONS,JRUNG,JRUNG,1,'RUNG',1,1,30,IORUNG,0)
      IQ(JRUNG-5)=1
      IQ(JRUNG+1)=IDRUN
C
C             Fill header with default date,time,Geant and Zebra
C             version numbers for the 4 main GEANT data structures
C             INIT,KINE,HITS,DIGI
C
       DO 10 I=1,4
         IQ(JRUNG+2*I+ 9)=IGDATE
         IQ(JRUNG+2*I+10)=IGTIME
          Q(JRUNG+2*I+19)=GVERSN
          Q(JRUNG+2*I+20)=ZVERSN
  10  CONTINUE
C
  99  RETURN
      END

