*
* $Id: jztimed.inc,v 1.2 2018/06/28 16:02:49 fisyak Exp $
*
* $Log: jztimed.inc,v $
* Revision 1.2  2018/06/28 16:02:49  fisyak
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
#ifndef CERNLIB_ZEBRA_JZTIMED_INC
#define CERNLIB_ZEBRA_JZTIMED_INC
*
*
* jztimed.inc
*
#if defined(CERNLIB_JZTIME)
      IF (JQTIME.NE.0)  CALL TIMED (DELTAT)
#endif

#endif
