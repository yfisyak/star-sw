*
* $Id: rzcycle.inc,v 1.2 2018/06/28 16:02:52 fisyak Exp $
*
* $Log: rzcycle.inc,v $
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
#ifndef CERNLIB_ZEBRA_RZCYCLE_INC
#define CERNLIB_ZEBRA_RZCYCLE_INC
*
*
* rzcycle.inc
*
*
*     Pointers to cycle content
*
*     KLCYCL : length of cycle block (4,7)
*     KPPCYC : pointer to previous cycle
*     KFRCYC : first record number
*     KSRCYC : secord record number
*     KFLCYC : creation date/time and other stuff
*     KORCYC : offset in first record to data
*     KCNCYC : cycle number
*     KNWCYC : number of words in d/s
*     KKYCYC : key number to which this cycle belongs (only for version 1)
*     KVSCYC : version of RZ cycles structure (0, 1)
*
      INTEGER        KLCYCL, KPPCYC, KFRCYC, KSRCYC, KFLCYC, KORCYC,
     +               KCNCYC, KNWCYC, KKYCYC, KVSCYC
      COMMON/RZCYCLE/KLCYCL, KPPCYC, KFRCYC, KSRCYC, KFLCYC, KORCYC,
     +               KCNCYC, KNWCYC, KKYCYC, KVSCYC

#endif
