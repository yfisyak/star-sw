*
* $Id: gcmzfo.inc,v 1.1.1.1 2004/01/15 00:12:23 potekhin Exp $
*
* $Log: gcmzfo.inc,v $
* Revision 1.1.1.1  2004/01/15 00:12:23  potekhin
*
*
* Revision 1.1.1.1  1997/11/03 15:29:48  atlascvs
* Importing CERNLIB version 08.21.
*
* Revision 1.1.1.1  1995/10/24 10:20:32  cernlib
* Geant
*
*
#ifndef CERNLIB_GEANT321_GCMZFO_INC
#define CERNLIB_GEANT321_GCMZFO_INC
*
*
* gcmzfo.inc
*
#if !defined(CERNLIB_INCLUDE)
      COMMON/GCMZFO/IOMATE,IOPART,IOTMED,IOSEJD,IOSJDD,IOSJDH,IOSTAK
     +             ,IOMZFO(13)
C
      INTEGER       IOMATE,IOPART,IOTMED,IOSEJD,IOSJDD,IOSJDH,IOSTAK
     +             ,IOMZFO
C
#endif
*
* gcmzfo.inc
*
#if defined(CERNLIB_INCLUDE)
*
#include "geant321/incbeg.inc"
     +   gcmzfo
#include "geant321/incend.inc"
#endif

#endif
