*
* $Id: q_mbytor.inc,v 1.2 2018/06/28 16:02:51 fisyak Exp $
*
* $Log: q_mbytor.inc,v $
* Revision 1.2  2018/06/28 16:02:51  fisyak
* Merge with geant3
*
* Revision 1.1.1.1  2002/07/24 15:56:28  rdm
* initial import into CVS
*
* Revision 1.1.1.1  2002/06/16 15:18:49  hristov
* Separate distribution  of Geant3
*
* Revision 1.1.1.1  1999/05/18 15:55:27  fca
* AliRoot sources
*
* Revision 1.1  1996/04/18 16:15:12  mclareni
* Incorporate changes from J.Zoll for version 3.77
*
*
*
#ifndef CERNLIB_ZEBRA_Q_MBYTOR_INC
#define CERNLIB_ZEBRA_Q_MBYTOR_INC
*
*
* q_mbytor.inc
*
#if defined(CERNLIB_ALLIANT)
      MBYTOR (MZ,IZW,IZP,NZB) = IOR (IZW,
     +                    ishft (ISHFT(MZ,32-NZB),-33+IZP+NZB) )

#elif defined(CERNLIB_APOLLO)
      MBYTOR (MZ,IZW,IZP,NZB) = OR (IZW, RSHFT (
     +                               LSHFT(MZ,32-NZB), 33-IZP-NZB) )

#elif defined(CERNLIB_CDC)
      MBYTOR (MZ,IZW,IZP,NZB) = IZW .OR.
     +                       SHIFT (MZ .AND. .NOT.MASK(60-NZB),IZP-1)

#elif defined(CERNLIB_CRAY)
      MBYTOR (MZ,IZW,IZP,NZB) = IZW .OR.
     +                             SHIFT (MZ.AND.MASK(128-NZB),IZP-1)

#elif (defined(CERNLIB_CONVEX))&&(!defined(CERNLIB_DOUBLE))

#elif (defined(CERNLIB_CONVEX))&&(defined(CERNLIB_DOUBLE))

#elif defined(CERNLIB_MSDOS)

#if defined(CERNLIB_QF_NDP)
      MBYTOR (MZZ,IZZW,IZZP,NZZB) = IOR (IZZW,
     +                    ishft (ISHFT(MZZ,32-NZZB),-33+IZZP+NZZB) )
#elif defined(CERNLIB_QF_F2C)
      MBYTOR (MZ,IZW,IZP,NZB) = OR (IZW,
     +                    ishftr (LSHIFT(MZ,32-NZB),33-IZP-NZB) )
#endif

#elif defined(CERNLIB_HPUX)
      MBYTOR (MZ,IZW,IZP,NZB) = IOR (IZW,
     +                    ishft (ISHFT(MZ,32-NZB),-33+IZP+NZB) )

#elif defined(CERNLIB_QF_SIEM)
      MBYTOR (MZ,IZW,IZP,NZB) = LOR (IZW, SHFTR (
     +                               SHFTL(MZ,32-NZB), 33-IZP-NZB) )

#elif (defined(CERNLIB_LINUX))&&(!(defined(__G95__)||defined(CERNLIB_GFORTRAN)))
      MBYTOR (MZ,IZW,IZP,NZB) = OR (IZW,
     +       ISHFTR (LSHIFT(MZ,32-NZB),33-IZP-NZB))

#elif defined(CERNLIB_OS9)
      MBYTOR (MZ,IZW,IZP,NZB) = IOR (IZW,
     +                    ishft (ISHFT(MZ,32-NZB),-33+IZP+NZB) )

#elif defined(CERNLIB_PDP)
      MBYTOR (MZ,IZW,IZP,NZB) = IOR (IZW, ISHFT (
     +                               ISHFT(MZ,36-NZB),-37+IZP+NZB)  )

#elif (defined(CERNLIB_SUN))&&(!defined(CERNLIB_BUGLRSHFT))
      MBYTOR (MZ,IZW,IZP,NZB) = OR (IZW, lrshft (
     +                               LSHIFT(MZ,32-NZB), 33-IZP-NZB))

#elif defined(CERNLIB_QMVDS)
      MBYTOR (MZ,IZW,IZP,NZB) = OR (IZW, RSHFT (
     +                               LSHFT(MZ,32-NZB), 33-IZP-NZB) )

#elif 1
      MBYTOR (MZ,IZW,IZP,NZB) = IOR (IZW,
     +                    ISHFT (ISHFT(MZ,32-NZB),-33+IZP+NZB) )
#endif

#endif
