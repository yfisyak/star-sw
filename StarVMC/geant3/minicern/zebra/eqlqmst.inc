*
* $Id: eqlqmst.inc,v 1.2 2018/06/28 16:02:49 fisyak Exp $
*
* $Log: eqlqmst.inc,v $
* Revision 1.2  2018/06/28 16:02:49  fisyak
* Merge with geant3
*
* Revision 1.1.1.1  2002/06/16 15:18:49  hristov
* Separate distribution  of Geant3
*
* Revision 1.1.1.1  1999/05/18 15:55:27  fca
* AliRoot sources
*
* Revision 1.1.1.1  1996/03/06 10:46:53  mclareni
* Zebra
*
*
#ifndef CERNLIB_ZEBRA_EQLQMST_INC
#define CERNLIB_ZEBRA_EQLQMST_INC
*
*        MZ - 1 structural link (only)
*
* eqlqmst.inc
*
                   DIMENSION    LQMST(9)
                   EQUIVALENCE (LQMST(1),LQSYSS(2))

#endif
