*
* $Id: decayc.inc,v 1.1.1.1 2004/01/15 00:12:23 potekhin Exp $
*
* $Log: decayc.inc,v $
* Revision 1.1.1.1  2004/01/15 00:12:23  potekhin
*
*
* Revision 1.1.1.1  1997/11/03 15:29:45  atlascvs
* Importing CERNLIB version 08.21.
*
* Revision 1.1.1.1  1995/10/24 10:20:38  cernlib
* Geant
*
*
#ifndef CERNLIB_GEANT321_DECAYC_INC
#define CERNLIB_GEANT321_DECAYC_INC
*
*
* decayc.inc
*
C***********************************************************************
C     INCLUDE FILE: DECAYC COPY                   CREATED 12/12/86 BY PA
C     NOTE: SEE ALSO DECAYC2 COPY
C     CHANGES: NONE
C     INCLUDED IN THE FOLLOWING SUBROUTINES OR FUNCTIONS: NOT UPDATED
C
C     DESCRIPTION OF THE COMMON BLOCK(S) AND VARIABLE(S)
C
C***********************************************************************
      PARAMETER (IDMAX9=540)
      CHARACTER*8 ZKNAME
      COMMON/FKDECC/ NZK(IDMAX9,3),WT(IDMAX9)
      COMMON/FKDECH/ ZKNAME(IDMAX9)
 

#endif
