*
* $Id: zebq.inc,v 1.2 2018/06/28 16:02:53 fisyak Exp $
*
* $Log: zebq.inc,v $
* Revision 1.2  2018/06/28 16:02:53  fisyak
* Merge with geant3
*
* Revision 1.1.1.1  2002/06/16 15:18:50  hristov
* Separate distribution  of Geant3
*
* Revision 1.1.1.1  1999/05/18 15:55:28  fca
* AliRoot sources
*
* Revision 1.1.1.1  1996/03/06 10:46:53  mclareni
* Zebra
*
*
#ifndef CERNLIB_ZEBRA_ZEBQ_INC
#define CERNLIB_ZEBRA_ZEBQ_INC
*
*
* zebq.inc
*
      COMMON /ZEBQ/  IQFENC(4), LQ(100)
                              DIMENSION    IQ(92),        Q(92)
                              EQUIVALENCE (IQ(1),LQ(9)), (Q(1),IQ(1))

#endif
