*
* $Id: gcspee.inc,v 1.1.1.3 2009/02/18 20:33:07 fisyak Exp $
*
* $Log: gcspee.inc,v $
* Revision 1.1.1.3  2009/02/18 20:33:07  fisyak
* *** empty log message ***
*
* Revision 1.1.1.1  2002/06/16 15:18:38  hristov
* Separate distribution  of Geant3
*
* Revision 1.1.1.1  1999/05/18 15:55:16  fca
* AliRoot sources
*
* Revision 1.1.1.1  1995/10/24 10:20:34  cernlib
* Geant
*
*
#ifndef CERNLIB_GEANT321_GCSPEE_INC
#define CERNLIB_GEANT321_GCSPEE_INC
*
*
* gcspee.inc
*
#if !defined(CERNLIB_INCLUDE)
#if defined(CERNLIB_TYPE)
#include "geant321/gtspee.inc"
#endif
      COMMON/GCSPEE/S1,S2,S3,SS1,SS2,SS3,LEP,IPORLI,ISUBLI,
     +              SRAGMX,SRAGMN,RAINT1,RAINT2,RMIN1,RMIN2,
     +              RMAX1,RMAX2,JPORJJ,ITSTCU,IOLDCU,ISCOP,
     +              NTIM,NTFLAG,LPASS,JSC
*
#endif
*
* gcspee.inc
*
#if defined(CERNLIB_INCLUDE)
*
#include "geant321/incbeg.inc"
     +   gcspee
#include "geant321/incend.inc"
#endif

#endif
