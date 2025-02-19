*
* $Id: q_sbyt.inc,v 1.2 2018/06/28 16:02:51 fisyak Exp $
*
* $Log: q_sbyt.inc,v $
* Revision 1.2  2018/06/28 16:02:51  fisyak
* Merge with geant3
*
* Revision 1.1.1.1  2002/07/24 15:56:28  rdm
* initial import into CVS
*
* Revision 1.1.1.1  2002/06/16 15:18:50  hristov
* Separate distribution  of Geant3
*
* Revision 1.1.1.1  1999/05/18 15:55:27  fca
* AliRoot sources
*
* Revision 1.1.1.1  1996/03/06 10:46:52  mclareni
* Zebra
*
*
#ifndef CERNLIB_ZEBRA_Q_SBYT_INC
#define CERNLIB_ZEBRA_Q_SBYT_INC
*
*
* q_sbyt.inc
*
#if defined(CERNLIB_APOLLO)
     MSBYT (MZ,IZW,IZP,NZB) = OR (
     +      AND (IZW, NOT(LSHFT (RSHFT(NOT(INT4(0)),32-NZB), IZP-1)))
     +    , RSHFT (LSHFT(MZ,32-NZB), 33-IZP-NZB) )

#elif defined(CERNLIB_CDC)
      MSBYT (MZ,IZW,IZP,NZB) = SHIFT (
     +            (SHIFT(IZW,61-IZP-NZB) .AND. .NOT.MASK(NZB))
     +         .OR.   (SHIFT (MZ,60-NZB) .AND. MASK(NZB)), IZP+NZB-1)

#elif defined(CERNLIB_CRAY)
      MSBYT (MZ,IZW,IZP,NZB) = (IZW .AND. SHIFT(MASK(64-NZB),IZP-1))
     +                       .OR. SHIFT(MZ.AND.MASK(128-NZB),IZP-1)

#elif defined(CERNLIB_MSDOS)

#if defined(CERNLIB_QF_NDP)
      MSBYT (MZZ,IZZW,IZZP,NZZB) = IOR (
     +         IAND (IZZW, NOT(ISHFT (ISHFT(NOT(0),-32+NZZB), IZZP-1)))
     +       , ISHFT (ISHFT(MZZ,32-NZZB), -33+IZZP+NZZB) )
#elif defined(CERNLIB_QF_F2C)
C      MSBYT (MZ,IZW,IZP,NZB) = OR (
C     +          AND (IZW, NOT(LSHIFT (ISHFTR(NOT(0),32-NZB), IZP-1)))
C     +        , ISHFTR (LSHIFT(MZ,32-NZB), 33-IZP-NZB) )
#endif

#elif defined(CERNLIB_QF_SIEM)
      MSBYT (MZ,IZW,IZP,NZB) = LOR (
     +            LAND (IZW, LCOMPL(SHFTL (SHFTR(-1,32-NZB), IZP-1)))
     +          , SHFTR (SHFTL(MZ,32-NZB), 33-IZP-NZB) )

#elif (defined(CERNLIB_LINUX))&&(!(defined(__G95__)||defined(CERNLIB_GFORTRAN)))
      MSBYT (MZ,IZW,IZP,NZB) = OR (
     +       AND (IZW, NOT(LSHIFT (ISHFTR(NOT(0),32-NZB),IZP-1)))
     +      ,ISHFTR (LSHIFT(MZ,32-NZB), 33-IZP-NZB) )

#elif defined(CERNLIB_PDP)
      MSBYT (MZ,IZW,IZP,NZB) = IOR (
     +          IAND (IZW, NOT(ISHFT (ISHFT(NOT(0),-36+NZB), IZP-1)))
     +        , ISHFT (ISHFT(MZ, 36-NZB), -37+IZP+NZB) )

#elif defined(CERNLIB_VAXVMS)

#elif defined(CERNLIB_QMVDS)
      MSBYT (MZ,IZW,IZP,NZB) = OR (
     +            AND (IZW, NOT(LSHFT (RSHFT(NOT(0),32-NZB), IZP-1)))
     +          , RSHFT (LSHFT(MZ,32-NZB), 33-IZP-NZB) )

#elif 1
      MSBYT (MZ,IZW,IZP,NZB) = IOR (
     +          IAND (IZW, NOT(ISHFT (ISHFT(NOT(0),-32+NZB), IZP-1)))
     +        , ISHFT (ISHFT(MZ,32-NZB), -33+IZP+NZB) )
#endif

#endif
