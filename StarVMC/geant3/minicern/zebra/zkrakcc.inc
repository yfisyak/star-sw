*
* $Id: zkrakcc.inc,v 1.2 2018/06/28 16:02:53 fisyak Exp $
*
* $Log: zkrakcc.inc,v $
* Revision 1.2  2018/06/28 16:02:53  fisyak
* Merge with geant3
*
* Revision 1.1.1.1  2002/06/16 15:18:50  hristov
* Separate distribution  of Geant3
*
* Revision 1.1.1.1  1999/05/18 15:55:28  fca
* AliRoot sources
*
* Revision 1.1.1.1  1996/03/06 10:46:52  mclareni
* Zebra
*
*
#ifndef CERNLIB_ZEBRA_ZKRAKCC_INC
#define CERNLIB_ZEBRA_ZKRAKCC_INC
*
*
* zkrakcc.inc
*
#if defined(CERNLIB_EQUHOLCH)
      COMMON /ZKRAKC/IQHOLK(120), IQKRAK(80), IQCETK(122)
                     CHARACTER    CQHOLK*120
                     EQUIVALENCE (CQHOLK,IQHOLK)
#else
      COMMON /ZKRAKC/IQHOLK(120), IQKRAK(80), IQCETK(122)
      COMMON /ZCRAKC/CQHOLK
                     CHARACTER    CQHOLK*120
#endif

#endif
