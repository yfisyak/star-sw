*
* $Id: isotop.inc,v 1.1.1.3 2009/02/18 20:33:10 fisyak Exp $
*
* $Log: isotop.inc,v $
* Revision 1.1.1.3  2009/02/18 20:33:10  fisyak
* *** empty log message ***
*
* Revision 1.1.1.1  2002/06/16 15:18:38  hristov
* Separate distribution  of Geant3
*
* Revision 1.1.1.1  1999/05/18 15:55:16  fca
* AliRoot sources
*
* Revision 1.1.1.1  1995/10/24 10:20:40  cernlib
* Geant
*
*
#ifndef CERNLIB_GEANT321_ISOTOP_INC
#define CERNLIB_GEANT321_ISOTOP_INC
*
*
* isotop.inc
*
*----------------------------------------------------------------------*
*     include file: isotop          created by A. Ferrari on 23-9-90   *
*                                                                      *
*     description of the common block(s) and variable(s)               *
*                                                                      *
*                                                                      *
*        isondx = initial and final indexes in the abuiso and isomnm   *
*                 for a given atomic number                            *
*        isomnm = mass numbers of the isotopes                         *
*        abuiso = natural abundances of the isotopes                   *
*        astlin(1,iz) = "average" A of the stability line versus the   *
*                       atomic number Z                                *
*        astlin(2,iz) = dispersion of A of the stability line versus   *
*                       the atomic number Z                            *
*        zstlin(1,ia) = "average" Z of the stability line versus the   *
*                       mass number A                                  *
*        zstlin(2,ia) = dispersion of Z of the stability line versus   *
*                       the mass number A                              *
*                                                                      *
*----------------------------------------------------------------------*
*
      COMMON / FKISOT / ABUISO (NSTBIS), ASTLIN (2,100), ZSTLIN (2,260),
     &                  ISOMNM (NSTBIS), ISONDX (2,100)
 

#endif
