*
* $Id: jztimout.inc,v 1.2 2018/06/28 16:02:50 fisyak Exp $
*
* $Log: jztimout.inc,v $
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
#ifndef CERNLIB_ZEBRA_JZTIMOUT_INC
#define CERNLIB_ZEBRA_JZTIMOUT_INC
*
*
* jztimout.inc
*
#if defined(CERNLIB_JZTIME)
      IF (JQTIME.NE.0)   THEN
      IF (LQSV.NE.0)     THEN
          CALL TIMED (DELTAT)
          Q(KQS+LQSV+5) = Q(KQS+LQSV+5) + DELTAT
          Q(KQS+LQSV+6) = MAX (Q(KQS+LQSV+6),Q(KQS+LQSV+5))
          Q(KQS+LQSV+8) = Q(KQS+LQSV+8) + Q(KQS+LQSV+5)
          Q(KQS+LQSV+5) = 0.
          IF (32*Q(KQS+LQSV+8) .GT. Q(KQS+LQSV+7)) THEN
              Q(KQS+LQSV+7) = Q(KQS+LQSV+7) + Q(KQS+LQSV+8)
              Q(KQS+LQSV+8) = 0.
            ENDIF
        ENDIF
        ENDIF
#endif

#endif
