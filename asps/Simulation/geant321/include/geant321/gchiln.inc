*
* $Id: gchiln.inc,v 1.1.1.1 2004/01/15 00:12:23 potekhin Exp $
*
* $Log: gchiln.inc,v $
* Revision 1.1.1.1  2004/01/15 00:12:23  potekhin
*
*
* Revision 1.1.1.1  1997/11/03 15:29:47  atlascvs
* Importing CERNLIB version 08.21.
*
* Revision 1.1.1.1  1995/10/24 10:20:34  cernlib
* Geant
*
*
#ifndef CERNLIB_GEANT321_GCHILN_INC
#define CERNLIB_GEANT321_GCHILN_INC
*
*
* gchiln.inc
*
#if !defined(CERNLIB_INCLUDE)
#if defined(CERNLIB_TYPE)
#include "geant321/gthiln.inc"
#endif
      COMMON/GCHILN/LARECG(2), JCGOBJ, JCGCOL, JCOUNT, JCLIPS,
     +              IMPOIN, IMCOUN, JSIX, JSIY, JSIZ,
     +              JPXC, JPYC, JPZC, ICLIP1, ICLIP2
*
#endif
*
* gchiln.inc
*
#if defined(CERNLIB_INCLUDE)
*
#include "geant321/incbeg.inc"
     +   gchiln
#include "geant321/incend.inc"
#endif

#endif
