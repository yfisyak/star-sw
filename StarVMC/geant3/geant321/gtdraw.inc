*
* $Id: gtdraw.inc,v 1.1.1.3 2009/02/18 20:33:07 fisyak Exp $
*
* $Log: gtdraw.inc,v $
* Revision 1.1.1.3  2009/02/18 20:33:07  fisyak
* *** empty log message ***
*
* Revision 1.1.1.1  2002/06/16 15:18:38  hristov
* Separate distribution  of Geant3
*
* Revision 1.1.1.1  1999/05/18 15:55:17  fca
* AliRoot sources
*
* Revision 1.2  1998/02/06 15:17:29  japost
*  Added the type of three variables (ZZFU,ZZFV,MYISEL).
*
*   Omission reported by Andrea Dell'Acqua <diceman@mail.cern.ch>, Fri, 6 Feb 1998
*
* Revision 1.1.1.1  1995/10/24 10:20:34  cernlib
* Geant
*
*
#ifndef CERNLIB_GEANT321_GTDRAW_INC
#define CERNLIB_GEANT321_GTDRAW_INC
*
*
* gtdraw.inc
*
#if !defined(CERNLIB_INCLUDE)
      INTEGER NUMNOD,MAXNOD,NUMND1,LEVVER,LEVHOR,MAXV,IPICK,
     + MLEVV,MLEVH,NWCUT,JNAM,JMOT,JXON,JBRO,JDUP,JSCA,JDVM,JPSM,
     + JNAM1,JMOT1,JXON1,JBRO1,JDUP1,JSCA1,JULEV,JVLEV,
     + LOOKTB,IDRNUM,NGVIEW,ICUTFL,ICUT,NSURF,ISURF,LINATT,LINATP,
     + ITXATT,ITHRZ,IPRJ,ITR3D,IPKHIT,IOBJ,LINBUF,
     + MAXGU,MORGU,MAXGS,MORGS,MAXTU,MORTU,MAXTS,MORTS,
     + IGU,IGS,ITU,ITS,NKVIEW,IDVIEW,
     + NOPEN,IGMR,IPIONS,ITRKOP,IHIDEN,MYISEL
      REAL GRMAT0,GTRAN0,GSIN,GCOS,SINPSI,COSPSI,GTHETA,GPHI,GPSI,
     + GU0,GV0,GSCU,GSCV,CTHETA,CPHI,DCUT,GZUA,GZVA,GZUB,GZVB,GZUC,
     + GZVC,PLTRNX,PLTRNY,DPERS,ZZFU,ZZFV,DDUMMY
#endif

#endif
