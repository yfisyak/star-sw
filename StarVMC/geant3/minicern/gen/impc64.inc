*
* $Id: impc64.inc,v 1.2 2018/06/28 16:16:30 fisyak Exp $
*
* $Log: impc64.inc,v $
* Revision 1.2  2018/06/28 16:16:30  fisyak
* Merge with geant3
*
* Revision 1.1.1.1  2002/06/16 15:18:46  hristov
* Separate distribution  of Geant3
*
* Revision 1.1.1.1  1999/05/18 15:55:36  fca
* AliRoot sources
*
* Revision 1.1.1.1  1996/04/01 15:02:59  mclareni
* Mathlib gen
*
*
*
* impc64.inc
*
#if (defined(CERNLIB_DOUBLE))&&(defined(CERNLIB_F90))
      IMPLICIT COMPLEX(2) (A-H,I,O-Z)

#elif !defined(CERNLIB_DOUBLE)
      IMPLICIT COMPLEX    (A-H,I,O-Z)

#elif 1
      IMPLICIT COMPLEX*16 (A-H,I,O-Z)

#endif
