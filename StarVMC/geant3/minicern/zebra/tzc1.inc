*
* $Id: tzc1.inc,v 1.2 2018/06/28 16:02:52 fisyak Exp $
*
* $Log: tzc1.inc,v $
* Revision 1.2  2018/06/28 16:02:52  fisyak
* Merge with geant3
*
* Revision 1.1.1.1  2002/06/16 15:18:50  hristov
* Separate distribution  of Geant3
*
* Revision 1.1.1.1  1999/05/18 15:55:28  fca
* AliRoot sources
*
* Revision 1.2  1996/04/18 16:15:28  mclareni
* Incorporate changes from J.Zoll for version 3.77
*
* Revision 1.1.1.1  1996/03/06 10:46:56  mclareni
* Zebra
*
*
#ifndef CERNLIB_ZEBRA_TZC1_INC
#define CERNLIB_ZEBRA_TZC1_INC
*
*
* tzc1.inc
*
                     PARAMETER  (LGL=240)
                     CHARACTER   LINE*(LGL), LHEAD*80, BLANK*(LGL)
      COMMON /TZC1/  LUNTQ,  NREADY, NFATAL, IGNORE
     +,              IFLLOG, IFLPRI, IFLUSE, IFLKIL, IFLANY
     +,              IFLEXA, IFLSIZ, IFLTZU, IVALUS, JFMTC1, JFMTC2
     +,              JCOLA,  JCOLE,  NCHPW,  IFLHC,  IFLHW,  IFLDBL
     +,              IFLPRE, NFAULT, LPUTA,  LPUTX,  LPUTE
     +,              NCHORG, NHEAD,  LINE,  LHEAD,  BLANK

#endif
