*
* $Id: gchvir.inc,v 1.1.1.3 2009/02/18 20:33:07 fisyak Exp $
*
* $Log: gchvir.inc,v $
* Revision 1.1.1.3  2009/02/18 20:33:07  fisyak
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
#ifndef CERNLIB_GEANT321_GCHVIR_INC
#define CERNLIB_GEANT321_GCHVIR_INC
*
*
* gchvir.inc
*
#if !defined(CERNLIB_INCLUDE)
      COMMON/GCHVIR/JVIRT,JVDIV,JCONT2,JCONT
C
#if defined(CERNLIB_TYPE)
#include "geant321/gthvir.inc"
#endif
C
#endif

#endif
