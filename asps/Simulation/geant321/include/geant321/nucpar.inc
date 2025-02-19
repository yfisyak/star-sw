*
* $Id: nucpar.inc,v 1.1.1.1 2004/01/15 00:12:30 potekhin Exp $
*
* $Log: nucpar.inc,v $
* Revision 1.1.1.1  2004/01/15 00:12:30  potekhin
*
*
* Revision 1.1.1.1  1997/11/03 15:29:53  atlascvs
* Importing CERNLIB version 08.21.
*
* Revision 1.1.1.1  1995/10/24 10:20:41  cernlib
* Geant
*
*
#ifndef CERNLIB_GEANT321_NUCPAR_INC
#define CERNLIB_GEANT321_NUCPAR_INC
*
*
* nucpar.inc
*
*
*=== nucpar ===========================================================*
*
*
*----------------------------------------------------------------------*
*     Created on 6-9-89 by A. Ferrari                                  *
*                       included in:                                   *
*                                    nucevt                            *
*                                    evxtes                            *
*                                    distnu                            *
*                                    eventq                            *
*----------------------------------------------------------------------*
 
      PARAMETER (MXPNUC=600)
      CHARACTER*8 ANNU
      COMMON /FKNUPA/  PXNU(MXPNUC),   PYNU(MXPNUC),   PZNU(MXPNUC),
     &                HEPNU(MXPNUC),   AMNU(MXPNUC),   ANNU(MXPNUC),
     &                ICHNU(MXPNUC), IBARNU(MXPNUC),  NRENU(MXPNUC)
 
 

#endif
