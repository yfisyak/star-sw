*
* $Id: locatf.F,v 1.2 2018/06/28 19:26:59 fisyak Exp $
*
* $Log: locatf.F,v $
* Revision 1.2  2018/06/28 19:26:59  fisyak
* Merge with geant3
*
* Revision 1.1.1.1  2002/06/16 15:18:48  hristov
* Separate distribution  of Geant3
*
* Revision 1.1.1.1  1999/05/18 15:55:33  fca
* AliRoot sources
*
* Revision 1.2  1996/05/24 10:56:52  jamie
* add locatr entry for consistency with wrup
*
* Revision 1.1.1.1  1996/02/15 17:48:49  mclareni
* Kernlib
*
*
#if !defined(CERNLIB_QMIBMVF)
#include "kernnum/pilot.h"
*
*     Name change (consistancy)
*
      FUNCTION LOCATR(ARRAY,LENGTH,OBJECT)
      DIMENSION ARRAY(*)
      LOCATR=LOCATF(ARRAY,LENGTH,OBJECT)
      END

      FUNCTION LOCATF(ARRAY,LENGTH,OBJECT)
C         BINARY SEARCH THRU 'ARRAY'  TO FIND  'OBJECT'
C         'ARRAY' IS ASSUMED TO BE SORTED PRIOR TO CALL
C         IF MATCH IS FOUND, FUNCTION RETURNS POSITION OF ELEMENT
C         IF NO MATCH FOUND, FUNCTION GIVES NEGATIVE OF NEAREST ELEMENT
C                                SMALLER THAN OBJECT
C         F. JAMES ,  SEPT.,1974
      DIMENSION ARRAY(2)
      NABOVE = LENGTH + 1
      NBELOW = 0
   10 IF (NABOVE-NBELOW .LE. 1)  GO TO 200
      MIDDLE = (NABOVE+NBELOW) / 2
      IF (OBJECT - ARRAY(MIDDLE))  100, 180, 140
  100 NABOVE = MIDDLE
      GO TO 10
  140 NBELOW = MIDDLE
      GO TO 10
  180 LOCATF = MIDDLE
      GO TO 300
  200 LOCATF = -NBELOW
  300 RETURN
      END
#endif
