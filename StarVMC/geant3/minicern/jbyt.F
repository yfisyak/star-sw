*
* $Id: jbyt.F,v 1.2 2018/06/28 19:26:59 fisyak Exp $
*
* $Log: jbyt.F,v $
* Revision 1.2  2018/06/28 19:26:59  fisyak
* Merge with geant3
*
* Revision 1.1.1.1  2002/06/16 15:18:47  hristov
* Separate distribution  of Geant3
*
* Revision 1.1.1.1  1999/05/18 15:55:32  fca
* AliRoot sources
*
* Revision 1.1.1.1  1996/02/15 17:50:11  mclareni
* Kernlib
*
*
#include "kerngen/pilot.h"
#if defined(CERNLIB_QMSUN)
#include "sungs/jbyt.F"
#else
      FUNCTION JBYT (IZW,IZP,NZB)
C
C CERN PROGLIB# M421    JBYT            .VERSION KERNFOR  4.23  891215
C ORIG. 13/03/89  JZ
C
C     This non-ANSI code is a default which may be slow, if so
C     it should be replaced by a machine-specific fast routine
#include "kerngen/wordsize.inc"
#if !defined(CERNLIB_QISASTD)
#include "kerngen/q_andor.inc"
#include "kerngen/q_shift.inc"
* Ignoring t=pass
#endif

#if !defined(CERNLIB_QISASTD)
      JBYT = ISHFTR(ISHFTL(IZW,NBITPW+1-IZP-NZB), NBITPW-NZB)
#endif
#if (defined(CERNLIB_QISASTD))&&(!defined(CERNLIB_QMILSTD))
      JBYT = ISHFT (ISHFT (IZW,NBITPW+1-IZP-NZB),-NBITPW+NZB)
#endif
#if defined(CERNLIB_QMILSTD)
      JBYT = IBITS (IZW,IZP-1,NZB)
#endif
      RETURN
      END
#endif
