*
* $Id: debugvf1.inc,v 1.2 2018/06/28 16:02:48 fisyak Exp $
*
* $Log: debugvf1.inc,v $
* Revision 1.2  2018/06/28 16:02:48  fisyak
* Merge with geant3
*
* Revision 1.1.1.1  2002/06/16 15:18:49  hristov
* Separate distribution  of Geant3
*
* Revision 1.1.1.1  1999/05/18 15:55:27  fca
* AliRoot sources
*
* Revision 1.1.1.1  1996/03/06 10:46:56  mclareni
* Zebra
*
*
#ifndef CERNLIB_ZEBRA_DEBUGVF1_INC
#define CERNLIB_ZEBRA_DEBUGVF1_INC
*
*   VFORT (Put just in front of SUBROUTINE st.)
*
* debugvf1.inc
*
#if defined(CERNLIB_QMIBM)
      DEBUG TRACE,SUBTRACE,INIT
      AT 1001
      TRACE ON
      END DEBUG
#endif

#endif
