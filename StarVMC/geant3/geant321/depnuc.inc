*
* $Id: depnuc.inc,v 1.1.1.3 2009/02/18 20:33:09 fisyak Exp $
*
* $Log: depnuc.inc,v $
* Revision 1.1.1.3  2009/02/18 20:33:09  fisyak
* *** empty log message ***
*
* Revision 1.1.1.1  2002/06/16 15:18:38  hristov
* Separate distribution  of Geant3
*
* Revision 1.1.1.1  1999/05/18 15:55:16  fca
* AliRoot sources
*
* Revision 1.1.1.1  1995/10/24 10:20:38  cernlib
* Geant
*
*
#ifndef CERNLIB_GEANT321_DEPNUC_INC
#define CERNLIB_GEANT321_DEPNUC_INC
*
*
* depnuc.inc
*
*                                                                     *
*=== depnuc ==========================================================*
*                                                                     *
      LOGICAL LLASTN, LLAST1
      COMMON /FKDEPN/    EKLAST, AMLAST, PXLAST, PYLAST, PZLAST,
     &                   EKINC , AMINC , PXXINC, PYYINC, PZZINC,
     &                   KTLAST, KTINC , LLASTN, LLAST1
 

#endif
