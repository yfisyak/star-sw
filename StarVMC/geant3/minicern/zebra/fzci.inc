*
* $Id: fzci.inc,v 1.2 2018/06/28 16:02:49 fisyak Exp $
*
* $Log: fzci.inc,v $
* Revision 1.2  2018/06/28 16:02:49  fisyak
* Merge with geant3
*
* Revision 1.1.1.1  2002/06/16 15:18:49  hristov
* Separate distribution  of Geant3
*
* Revision 1.1.1.1  1999/05/18 15:55:27  fca
* AliRoot sources
*
* Revision 1.1.1.1  1996/03/06 10:46:54  mclareni
* Zebra
*
*
#ifndef CERNLIB_ZEBRA_FZCI_INC
#define CERNLIB_ZEBRA_FZCI_INC
*
*
* fzci.inc
*
      COMMON /FZCI/  LUNI,LUNNI,IXDIVI,LTEMPI,IEVFLI
     +,              MSTATI,MEDIUI,IFIFOI,IDAFOI,IACMOI,IUPAKI
     +,              IADOPI,IACTVI,INCBPI,LOGLVI,MAXREI,  ISTENI
     +,              LBPARI, L4STOI,L4STAI,L4CURI,L4ENDI
     +,              IFLAGI,NFASTI,N4SKII,N4RESI,N4DONI,N4ENDI
     +,              IOPTIE,IOPTIR,IOPTIS,IOPTIA,IOPTIT,IOPTID
     +,                     IOPTIF,IOPTIG,IOPTIH,IOPTI2(4)
     +,              IDI(2),IPILI(4),NWTXI,NWSEGI,NWTABI,NWBKI,LENTRI
     +,              NWUHCI,IOCHI(16),NWUMXI,NWUHI,NWIOI
     +,              NWRDAI,NRECAI,LUHEAI,JRETCD,JERROR,NWERR
      PARAMETER      (JAUIOC=50, JAUSEG=68, JAUEAR=130)

#endif
