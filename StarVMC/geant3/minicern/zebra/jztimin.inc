*
* $Id: jztimin.inc,v 1.2 2018/06/28 16:02:50 fisyak Exp $
*
* $Log: jztimin.inc,v $
* Revision 1.2  2018/06/28 16:02:50  fisyak
* Merge with geant3
*
* Revision 1.1.1.1  2002/06/16 15:18:49  hristov
* Separate distribution  of Geant3
*
* Revision 1.1.1.1  1999/05/18 15:55:27  fca
* AliRoot sources
*
* Revision 1.1.1.1  1996/03/06 10:46:55  mclareni
* Zebra
*
*
#ifndef CERNLIB_ZEBRA_JZTIMIN_INC
#define CERNLIB_ZEBRA_JZTIMIN_INC
*
*
* jztimin.inc
*
#if defined(CERNLIB_JZTIME)
      IF (JQTIME.NE.0)  THEN
          CALL TIMED (DELTAT)
          Q(KQS+LQSV+5) = Q(KQS+LQSV+5) + DELTAT
        ENDIF
#endif

#endif
