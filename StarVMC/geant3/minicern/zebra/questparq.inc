*
* $Id: questparq.inc,v 1.2 2018/06/28 16:02:52 fisyak Exp $
*
* $Log: questparq.inc,v $
* Revision 1.2  2018/06/28 16:02:52  fisyak
* Merge with geant3
*
* Revision 1.1.1.1  2002/06/16 15:18:50  hristov
* Separate distribution  of Geant3
*
* Revision 1.1.1.1  1999/05/18 15:55:27  fca
* AliRoot sources
*
* Revision 1.1.1.1  1996/03/06 10:46:57  mclareni
* Zebra
*
*
#ifndef CERNLIB_ZEBRA_QUESTPARQ_INC
#define CERNLIB_ZEBRA_QUESTPARQ_INC
*
*  Parameters defining the error handling in IQUEST
*
* questparq.inc
*
      PARAMETER (MARE1Q=-1      ,MARE2Q=MARE1Q-1,MARE3Q=MARE2Q-1,
     X           MARE4Q=MARE3Q-1,MARE5Q=MARE4Q-1,MARE6Q=MARE5Q-1,
     X           MARE7Q=MARE6Q-1,MBKD1Q=MARE7Q-1,MBKD2Q=MBKD1Q-1,
     X           MBKU1Q=MBKD2Q-1,MBKU2Q=MBKU1Q-1,MBKU3Q=MBKU2Q-1,
     X           MBKU4Q=MBKU3Q-1,MBKX1Q=MBKU4Q-1,MBKX2Q=MBKX1Q-1,
     X           MBKX3Q=MBKX2Q-1,MCHV1Q=MBKX3Q-1,MFOR1Q=MCHV1Q-1,
     X           MFOR2Q=MFOR1Q-1,MFOR3Q=MFOR2Q-1,MIOP1Q=MFOR3Q-1,
     X           MSHO1Q=MIOP1Q-1,MSHO2Q=MSHO1Q-1,MSHP1Q=MSHO2Q-1,
     X           MSNA1Q=MSHP1Q-1,MSNA2Q=MSNA1Q-1,MSNA3Q=MSNA2Q-1,
     X           MSNA4Q=MSNA3Q-1,MSNA5Q=MSNA4Q-1,MSNA6Q=MSNA5Q-1,
     X           MSNA7Q=MSNA6Q-1,MSNA8Q=MSNA7Q-1,
     X           MSUR1Q=MSNA8Q-1,MVER1Q=MSUR1Q-1,MVER2Q=MVER1Q-1,
     X           MVER3Q=MVER2Q-1,MVER4Q=MVER3Q-1,MVER5Q=MVER4Q-1,
     X           MVER6Q=MVER5Q-1,MVER7Q=MVER6Q-1,MVER8Q=MVER7Q-1,
     X           MVER9Q=MVER8Q-1,MVE10Q=MVER9Q-1)

#endif
