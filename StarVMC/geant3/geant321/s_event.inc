*
* $Id: s_event.inc,v 1.1.1.3 2009/02/18 20:33:10 fisyak Exp $
*
* $Log: s_event.inc,v $
* Revision 1.1.1.3  2009/02/18 20:33:10  fisyak
* *** empty log message ***
*
* Revision 1.1.1.1  2002/06/16 15:18:38  hristov
* Separate distribution  of Geant3
*
* Revision 1.1.1.1  1999/05/18 15:55:17  fca
* AliRoot sources
*
* Revision 1.1.1.1  1995/10/24 10:20:44  cernlib
* Geant
*
*
#ifndef CERNLIB_GEANT321_S_EVENT_INC
#define CERNLIB_GEANT321_S_EVENT_INC
*
*
* s_event.inc
*
      PARAMETER (MXEVEN=12*MXGKGH)
      COMMON/EVENT / NSIZE,NCUR,NEXT,NTOT,EVE(MXEVEN)
C

#endif
