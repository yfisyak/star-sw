*
* $Id: rzover.inc,v 1.2 2018/06/28 16:02:52 fisyak Exp $
*
* $Log: rzover.inc,v $
* Revision 1.2  2018/06/28 16:02:52  fisyak
* Merge with geant3
*
* Revision 1.1.1.1  2002/06/16 15:18:50  hristov
* Separate distribution  of Geant3
*
* Revision 1.1.1.1  1999/05/18 15:55:28  fca
* AliRoot sources
*
* Revision 1.1.1.1  1996/03/06 10:46:55  mclareni
* Zebra
*
*
#ifndef CERNLIB_ZEBRA_RZOVER_INC
#define CERNLIB_ZEBRA_RZOVER_INC
*
*
* rzover.inc
*
*
*     List of overwritten records
*
      PARAMETER(MAXBAD=100)
      COMMON/RZOVER/NBAD,IBAD(MAXBAD)
*

#endif
