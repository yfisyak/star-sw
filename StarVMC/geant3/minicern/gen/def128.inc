*
* $Id: def128.inc,v 1.2 2018/06/28 16:16:30 fisyak Exp $
*
* $Log: def128.inc,v $
* Revision 1.2  2018/06/28 16:16:30  fisyak
* Merge with geant3
*
* Revision 1.1.1.1  2002/06/16 15:18:46  hristov
* Separate distribution  of Geant3
*
* Revision 1.1.1.1  1999/05/18 15:55:35  fca
* AliRoot sources
*
* Revision 1.1.1.1  1996/04/01 15:02:59  mclareni
* Mathlib gen
*
*
*
* def128.inc
*
#if (defined(CERNLIB_DOUBLE))&&(defined(CERNLIB_F90))
      REAL(4)

#elif (!defined(CERNLIB_DOUBLE))&&(defined(CERNLIB_F90))
      REAL(2)

#elif (!defined(CERNLIB_F90))&&(defined(CERNLIB_NOQUAD)||!defined(CERNLIB_DOUBLE))
      DOUBLE PRECISION

#elif 1
      REAL*16
 
#endif
