*
* $Id: lrnorm.F,v 1.1.1.3 2009/02/18 20:32:00 fisyak Exp $
*
* $Log: lrnorm.F,v $
* Revision 1.1.1.3  2009/02/18 20:32:00  fisyak
* *** empty log message ***
*
* Revision 1.1.1.1  2002/06/16 15:18:43  hristov
* Separate distribution  of Geant3
*
* Revision 1.1.1.1  1999/05/18 15:55:21  fca
* AliRoot sources
*
* Revision 1.1.1.1  1995/10/24 10:21:57  cernlib
* Geant
*
*
#include "geant321/pilot.h"
*CMZ :  3.21/02 29/03/94  15.41.48  by  S.Giani
*-- Author :
      SUBROUTINE LRNORM(D,LD,IDICTS,LDICT,LR,EOLD,MT,IIN,XSLR)
C       THIS ROUTINE IS DESIGNED TO ADJUST THE NEUTRON CROSS SECTION
C       USED TO CALCULATE THE PHOTON MULTIPLICITY WHEN THE
C       INELASTIC RESOLVED DATA CONTAINS LR-FLAGS DESIGNATING
C       CHARGED PARTICLE EMISSION
#include "geant321/minput.inc"
#include "geant321/mconst.inc"
#include "geant321/mcross.inc"
#include "geant321/mmicab.inc"
      DIMENSION D(*),LD(*),IDICTS(NNR,NNUC),LDICT(NNR,NNUC),
     +LR(NQ,NNUC)
#if __GNUC__ < 7
      SAVE
#endif
C       INITIALIZE VARIABLES USED IN THE CALCULATION
      SUM=0.0
      SUM4=SIGNIS
C       DETERMINE (N,N") CROSS SECTION AND LR-FLAG
      DO 10 I=14,54
         L1=LDICT(I,IIN)
         IF(L1.EQ.0)GO TO 10
         LS1=IDICTS(I,IIN)+LMOX2
         LEN=L1/2
         CALL XSECNU(D,LEN,EOLD,SIG,LS1,L1)
         LRI=LR(I,IIN)
         IF(LRI.EQ.MT)SUM=SUM+SIG
         IF(LRI.EQ.22)SUM4=SUM4-SIG
         IF(LRI.EQ.23)SUM4=SUM4-SIG
         IF(LRI.EQ.28)SUM4=SUM4-SIG
   10 CONTINUE
      XSLR=SUM
      IF(MT.EQ.4)XSLR=SUM4
      RETURN
      END
