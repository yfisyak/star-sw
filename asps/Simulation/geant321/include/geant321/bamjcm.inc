*
* $Id: bamjcm.inc,v 1.1.1.1 2004/01/15 00:12:22 potekhin Exp $
*
* $Log: bamjcm.inc,v $
* Revision 1.1.1.1  2004/01/15 00:12:22  potekhin
*
*
* Revision 1.1.1.1  1997/11/03 15:29:44  atlascvs
* Importing CERNLIB version 08.21.
*
* Revision 1.1.1.1  1995/10/24 10:20:37  cernlib
* Geant
*
*
#ifndef CERNLIB_GEANT321_BAMJCM_INC
#define CERNLIB_GEANT321_BAMJCM_INC
*
*
* bamjcm.inc
*
*
*=== bamjcm ===========================================================*
*
 
*                                                                      *
*----------------------------------------------------------------------*
*                                                                      *
*     Bamjcm by A. Ferrari                                             *
*                           included in:                               *
*                                        bamjet                        *
*     When changing kmxjcm dimension look also at verein!!!!!          *
*----------------------------------------------------------------------*
*                                                                      *
      PARAMETER (KMXJCM = 100)
      COMMON /FKBAMJ/  RPX(KMXJCM),  RPY(KMXJCM),   RE(KMXJCM),
     &                KFR1(KMXJCM), KFR2(KMXJCM),   IV(KMXJCM)
 
 

#endif
