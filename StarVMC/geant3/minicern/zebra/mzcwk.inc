*
* $Id: mzcwk.inc,v 1.2 2018/06/28 16:02:50 fisyak Exp $
*
* $Log: mzcwk.inc,v $
* Revision 1.2  2018/06/28 16:02:50  fisyak
* Merge with geant3
*
* Revision 1.1.1.1  2002/06/16 15:18:49  hristov
* Separate distribution  of Geant3
*
* Revision 1.1.1.1  1999/05/18 15:55:27  fca
* AliRoot sources
*
* Revision 1.1.1.1  1996/03/06 10:46:53  mclareni
* Zebra
*
*
#ifndef CERNLIB_ZEBRA_MZCWK_INC
#define CERNLIB_ZEBRA_MZCWK_INC
*
*                MQ Working area
*
* mzcwk.inc
*
      PARAMETER            (NQWKTT=2560)
      COMMON /MZCWK/ IQWKTB(NQWKTT), IQWKFZ(NQWKTT)

#endif
