*
* $Id: s_curpar.inc,v 1.1.1.1 2004/01/15 00:12:30 potekhin Exp $
*
* $Log: s_curpar.inc,v $
* Revision 1.1.1.1  2004/01/15 00:12:30  potekhin
*
*
* Revision 1.1.1.1  1997/11/03 15:29:55  atlascvs
* Importing CERNLIB version 08.21.
*
* Revision 1.1.1.1  1995/10/24 10:20:43  cernlib
* Geant
*
*
#ifndef CERNLIB_GEANT321_S_CURPAR_INC
#define CERNLIB_GEANT321_S_CURPAR_INC
*
*
* s_curpar.inc
*
      PARAMETER (MXGKCU=MXGKGH)
      COMMON/CURPAR/WEIGHT(10),DDELTN,IFILE,IRUN,NEVT,NEVENT,SHFLAG,
     *              ITHST,ITTOT,ITLST,IFRND,TOFCUT,CMOM(5),CENG(5),
     *              RS,S,ENP(10),NP,NM,NN,NR,NO,NZ,IPA(MXGKCU),
     *              ATNO2,ZNO2
C

#endif
