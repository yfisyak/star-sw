*
* $Id: rzdir.inc,v 1.2 2018/06/28 16:02:52 fisyak Exp $
*
* $Log: rzdir.inc,v $
* Revision 1.2  2018/06/28 16:02:52  fisyak
* Merge with geant3
*
* Revision 1.1.1.1  2002/06/16 15:18:50  hristov
* Separate distribution  of Geant3
*
* Revision 1.1.1.1  1999/05/18 15:55:28  fca
* AliRoot sources
*
* Revision 1.1.1.1  1996/03/06 10:46:54  mclareni
* Zebra
*
*
#ifndef CERNLIB_ZEBRA_RZDIR_INC
#define CERNLIB_ZEBRA_RZDIR_INC
*
*
* rzdir.inc
*
      PARAMETER (NLPATM=100)
      COMMON /RZDIRN/NLCDIR,NLNDIR,NLPAT
      COMMON /RZDIRC/CHCDIR(NLPATM),CHNDIR(NLPATM),CHPAT(NLPATM)
      CHARACTER*16   CHNDIR,    CHCDIR,    CHPAT
C

#endif
