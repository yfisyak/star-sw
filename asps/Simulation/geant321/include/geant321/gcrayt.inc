*
* $Id: gcrayt.inc,v 1.1.1.1 2004/01/15 00:12:23 potekhin Exp $
*
* $Log: gcrayt.inc,v $
* Revision 1.1.1.1  2004/01/15 00:12:23  potekhin
*
*
* Revision 1.1.1.1  1997/11/03 15:29:49  atlascvs
* Importing CERNLIB version 08.21.
*
* Revision 1.1.1.1  1995/10/24 10:20:36  cernlib
* Geant
*
*
#ifndef CERNLIB_GEANT321_GCRAYT_INC
#define CERNLIB_GEANT321_GCRAYT_INC
*
*
* gcrayt.inc
*
#if !defined(CERNLIB_INCLUDE)
      COMMON/GCRAYT/INTEN,IOMBRA,IXYFLA,NOFLAG,
     +XLPOS,YLPOS,ZLPOS,XLDIR,YLDIR,ZLDIR,APFLAH,
     +CCXX(4),CCYY(4),CCZZ(4),BOFLAG,APFLAG,
     +XCOSXS,YCOSYS,ZCOSZS,VDX,VDY,VDZ,SSLENG,
     +XPINTS,YPINTS,ZPINTS,FPINTX,FPINTY,FPINTZ,
     +AROTS(4,4),ZROTS(4,4),RRR(4)
C
#if defined(CERNLIB_TYPE)
#include "geant321/gtrayt.inc"
#endif
C
#endif

#endif
