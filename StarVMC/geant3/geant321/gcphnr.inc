*
* $Id: gcphnr.inc,v 1.1.1.3 2009/02/18 20:33:09 fisyak Exp $
*
* $Log: gcphnr.inc,v $
* Revision 1.1.1.3  2009/02/18 20:33:09  fisyak
* *** empty log message ***
*
* Revision 1.1.1.1  2002/06/16 15:18:38  hristov
* Separate distribution  of Geant3
*
* Revision 1.1.1.1  1999/05/18 15:55:16  fca
* AliRoot sources
*
* Revision 1.1.1.1  1995/10/24 10:20:35  cernlib
* Geant
*
*
#ifndef CERNLIB_GEANT321_GCPHNR_INC
#define CERNLIB_GEANT321_GCPHNR_INC
*
*
* gcphnr.inc
*
#if !defined(CERNLIB_INCLUDE)
C  INRFIN - nonradiative decay mode
      INTEGER IGNRFN
      COMMON /GCPHNR/ IGNRFN(8,MAXELZ)
C
#endif
*
* gcphnr.inc
*
#if defined(CERNLIB_INCLUDE)
*
#include "geant321/incbeg.inc"
     +   gcphnr
#include "geant321/incend.inc"
#endif

#endif
