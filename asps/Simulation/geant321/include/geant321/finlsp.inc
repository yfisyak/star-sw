*
* $Id: finlsp.inc,v 1.1.1.1 2004/01/15 00:12:23 potekhin Exp $
*
* $Log: finlsp.inc,v $
* Revision 1.1.1.1  2004/01/15 00:12:23  potekhin
*
*
* Revision 1.1.1.1  1997/11/03 15:29:46  atlascvs
* Importing CERNLIB version 08.21.
*
* Revision 1.1.1.1  1995/10/24 10:20:38  cernlib
* Geant
*
*
#ifndef CERNLIB_GEANT321_FINLSP_INC
#define CERNLIB_GEANT321_FINLSP_INC
*
*
* finlsp.inc
*
C***********************************************************************
C     INCLUDE FILE: FINLSP COPY                   CREATED 11/12/86 BY PA
C     NOTE: SEE ALSO FILE FINLSP2 COPY
C     CHANGES: NONE
C     INCLUDED IN THE FOLLOWING SUBROUTINES OR FUNCTIONS: NOT UPDATED
C
C     DESCRIPTION OF THE COMMON BLOCK(S) AND VARIABLE(S)
C
C***********************************************************************
      PARAMETER (IDMAX7=100)
      COMMON/FKFINL/ CXR(IDMAX7),CYR(IDMAX7),CZR(IDMAX7),
     *ELR(IDMAX7),PLR(IDMAX7),IR,ITR(IDMAX7)
 

#endif
