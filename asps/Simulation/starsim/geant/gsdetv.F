*
* $Id: gsdetv.F,v 1.1.1.1 2004/01/12 23:49:40 potekhin Exp $
*
* $Log: gsdetv.F,v $
* Revision 1.1.1.1  2004/01/12 23:49:40  potekhin
*
*
* Revision 1.1  2001/02/27 10:15:41  nevski
*  first working release
*
* Revision 1.4  2000/01/06 22:09:17  nevski
* unlimited track/vertex version
*
* Revision 1.3  1998/10/18 23:24:17  nevski
* make it re-entrant and overwrite old banks
*
* Revision 1.2  1998/04/16 16:59:40  fisyak
* 2nd pass with gstar
*
*
#include "geant321/pilot.h"
*CMZ :  1.30/00 24/05/96  21.28.46  by  Pavel Nevski
*CMZ :  3.21/02 29/03/94  15.41.20  by  S.Giani
*-- Author :
      SUBROUTINE GSDETV (IUSET, IUDET, IDTYPE, NWHI, NWDI, ISET, IDET)
C.
C.    ******************************************************************
C.    *                                                                *
C.    *       Defines detector IUDET as a member of set IUSET          *
C.    *     and prepares the DETector structure                        *
C.    *                                                                *
C.    *             Input parameters                                   *
C.    * IUSET     set identifier (4 characters), user defined          *
C.    * IUDET     detector identifier  (4 characters),   name of  an   *
C.    *           existing volume                                      *
C.    * IDTYPE    detector type, user defined                          *
C.    * NWHI      number of words for primary allocation of HITS banks *
C.    * NWDI      number of words for primary allocation of DIGI banks *
C.    *                                                                *
C.    *             Output parameters                                  *
C.    * ISET      position of set in bank JSET                         *
C.    * IDET      position of detector in bank JS=IB(JSET-ISET)        *
C.    *              If ISET=0 or IDET=0  error                        *
C.    * Remarks:                                                       *
C.    * - The path through the volume tree will be automatically set   *
C.    *   in GGDETV,called by GGCLOS, after all volumes have been      *
C.    *   positionned.                                                 *
C.    * - The detector type  IDTYPE is not used  internally by GEANT   *
C.    *   and  can be  defined by  the user  to distinguish  quickly   *
C.    *   between various kinds of detectors,  in the routine GUSTEP   *
C.    *   for example.                                                 *
C.    *                                                                *
C.    *       IQ(JSET+ISET) = IUSET                                    *
C.    *       JS = LQ(JSET-ISET) = pointer to set IUSET                *
C.    *       IQ(JS+IDET)=IUDET                                        *
C.    *       JD= LQ(JS-1)  = pointer to detector IUDET                *
C.    *       IQ(JD+1)=Number of words to store packed volume numbers  *
C.    *       IQ(JD+2)=Number of volume descriptors                    *
C.    *       IQ(JD+3)=Number of words per hit                         *
C.    *       IQ(JD+4)=Number of elements per hit                      *
C.    *       IQ(JD+5)=Number of words per digitisation                *
C.    *       IQ(JD+6)=Number of elements per digitisation             *
C.    *       IQ(JD+7)=NWHI, primary size of hit bank                  *
C.    *       IQ(JD+8)=NWDI, primary size of digitisation bank         *
C.    *       IQ(JD+9)=Number of paths through the JVOLUM tree         *
C.    *       IQ(JD+10)=For aliases only, IDET of mother detector      *
C.    *       IQ(JD+11)=Name of first volume descriptor                *
C.    *       IQ(JD+12)=Number of bits for packing its number          *
C.    *       ...                                                      *
C.    *       IQ(JD+9+2*NV)=Name of last volume descriptor             *
C.    *       IQ(JD+10+2*NV)=Number of bits for packing its number     *
C.    *       then for each possible path                              *
C.    *       list of names and numbers for all levels                 *
C.    *       (The number of levels is entered as number attached to   *
C.    *       the first name which is the top of the JVOLUM tree)      *
C.    *                                                                *
C.    *            The Detector Set data structure JSET                *
C.    *            ------------------------------------                *
C.    *                                                                *
C.    *                                        | JSET                  *
C.    *    NSET            ISET                v         NSET          *
C.    *     ................................................           *
C.    *     |              | |               |  | Set names|           *
C.    *     ................................................           *
C.    *                     | JS                                       *
C.    *                     |                                          *
C.    *    NDET       IDET  v                    NDET                  *
C.    *     ........................................                   *
C.    *     |        |  |  | | Detector names      |                   *
C.    *     ........................................                   *
C.    *                  | JD                                          *
C.    *       -3  -2  -1 v                                             *
C.    *     ................................................           *
C.    *     |   |   |   |  | Volume parameters, in GGDETV  |           *
C.    *     ................................................           *
C.    *              JDH                                               *
C.    *          JDD                                                   *
C.    *      JDU                                                       *
C.    *                                                                *
C.    * The JSET structure is filled by GSDETV + GGDETV, and by        *
C.    *      GSDETH, GSDETD and GSDETU, eventually by GSDETA.          *
C.    *                                                                *
C.    *    ==>Called by : <USER>, UGEOM                                *
C.    *       Authors   R.Brun, F.Bruyant    **********                *
C.    *                                                                *
C.    * Modifications:                                                 *
C.    *  PN, 20.04.96:  warning on non-sensetive volume in DEBUG only  *
C.    *  PN, 07.09.98:  make it re-entrant and overwrite old banks     *
C.    ******************************************************************
C.
#include "geant321/gcbank.inc"
#include "geant321/gcunit.inc"
#include "geant321/gcmzfo.inc"
#include "geant321/gcflag.inc"
      CHARACTER*4 IUSET,IUDET
C.
C.    ------------------------------------------------------------------
C.
      ISET = 0
      IDET = 0
C
C     Check if volume IUDET has been defined
C
      IF (JVOLUM.LE.0) GO TO 920
      NVOLUM = IQ(JVOLUM-1)
      CALL GLOOK (IUDET, IQ(JVOLUM+1), NVOLUM, IVOL)
      IF (IVOL.EQ.0) GO TO 920
C
C     Check that volume IVOL is a sensitive medium
C
      JVO = LQ(JVOLUM-IVOL)
      ITM = Q(JVO+4)
      JTM = LQ(JTMED-ITM)
      IF (Q(JTM+7).EQ.0. .AND. IDEBUG.GT.0) THEN
         WRITE (CHMAIL,1000) IUDET
         CALL GMAIL(0,0)
      ENDIF
C
      IF (JSET.EQ.0)THEN
C
C     Create mother JSET bank
C
         CALL MZBOOK (IXCONS, JSET, JSET, 1, 'SETS', 0,0,0, 5, 0)
         IQ(JSET-5)=0
      ENDIF
C
      ISET = 0
      NSET = IQ(JSET-1)
      CALL GLOOK (IUSET, IQ(JSET+1), NSET, ISET)
C
C     Create JSET bank
C
      IF (ISET.EQ.0) THEN
         CALL MZPUSH (IXCONS, JSET, 1, 1, 'I')
         NSET = NSET +1
         ISET = NSET
      ENDIF
C
      CALL UCTOH  (IUSET, IQ(JSET+ISET), 4, 4)
      IF (LQ(JSET-ISET).LE.0) THEN
         CALL MZBOOK (IXCONS, JS, JSET, -ISET, 'SETS', 0,0,0, 5, 0)
         IQ(JS-5) = ISET
      ENDIF
C
C     Check if detector has already been defined
C
  30  JS = LQ(JSET-ISET)
      IDET = 0
      NDET = IQ(JS-1)
      IF (NDET.NE.0) CALL GLOOK (IUDET, IQ(JS+1), NDET, IDET)
C
C     If not, create detector bank
C
      IF (IDET.EQ.0) THEN
         CALL MZPUSH (IXCONS, JS, 1, 1, 'I')
         NDET = NDET +1
         IDET = NDET
      ENDIF

      CALL UCTOH (IUDET, IQ(JS+IDET), 4, 4)
      IF (LQ(JS-IDET).LE.0) THEN
         CALL MZBOOK (IXCONS, JD, JS, -IDET, 'SEJD', 4,4,100, IOSEJD, 0)
         IQ(JD-5) = IDET
      ENDIF
C
      JD = LQ(JS-IDET)
      IQ(JD+7) = NWHI
      IQ(JD+8) = NWDI
      IQ(JD+9) = -1
C
C     Now enter Set/Det into JVOLUM data structure
C
      CALL GSATT (IUDET, 'SET ', ISET)
      CALL GSATT (IUDET, 'DET ', IDET)
      CALL GSATT (IUDET, 'DTYP', IDTYPE)
      GO TO 999
C
C     Errors
C
  920 WRITE (CHMAIL,2000) IUDET
      CALL GMAIL(0,0)
      GO TO 999
C
  930 WRITE (CHMAIL,3000)  IUSET, IUDET
      CALL GMAIL(0,0)
C
 1000 FORMAT (' ***** GSDETV - ISVOL=0 FOR DETECTOR ',A4,' - WARNING!')
 2000 FORMAT (' ***** GSDETV ERROR, VOLUME ',A4,' NOT DEFINED')
 3000 FORMAT (' ***** GSDETV ERROR ,SET ',A4, ' DETECTOR ',A4,
     +        ' ALREADY DEFINED')
C
  999 RETURN
      END
