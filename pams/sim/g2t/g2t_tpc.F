* $Id: g2t_tpc.F,v 1.4 2009/11/10 19:54:54 fisyak Exp $
* $Log: g2t_tpc.F,v $
* Revision 1.4  2009/11/10 19:54:54  fisyak
* pams Cleanup
*
* Revision 1.3  2004/03/31 20:16:27  fisyak
* Add lgam =  log10(GEKin/AMass) field
*
* Revision 1.2  2004/03/01 18:03:17  fisyak
* Clean up for starsim
*
* Revision 1.1  2000/01/24 14:48:46  nevski
*  combined g2t+g2r version
*
* Revision 1.10  2000/01/12 00:10:45  nevski
* add cvs headers
*
*
      FUNCTION  G2T_TPC (g2t_track_h,   g2t_track , 
     >                   g2t_tpc_hit_h, g2t_tpc_hit ) 
      IMPLICIT  NONE
#include "g2t_tpc.inc"
#include "geant321/gckine.inc"
#include "genhit.h"
      INTEGER         G2T_TPC,G2R_GET_HIT,Iprin,Idigi,Ip0,N,ish,npar,n0,i,jtra
      REAL            G2T_FIELD,par(50),U(100),Pt,Vr,dphi,dtr,FieldZ
      logical         Local /.false./
      Character       Cp*20
      Equivalence     (NAPART,cp)
*
      G2T_TPC=STAFCV_OK
      if (g2t_tpc_hit_h.maxlen.le.0) return
*
      call G2R_GET_SYS ('TPCE','TPAD',Iprin,Idigi)
      if (Iprin.lt.0) return
      FieldZ = G2T_FIELD (0.)
*!yf      Local  = Idigi.ge.2
*
      i    = 0
      itra = 0
      jtra = 0
      ip0  = 0
      n0   = 0
      g2t_tpc_hit_h.nok = 0
*
      Do While (G2R_GET_HIT('tpc') .eq. 0)
*
*        skip short after-steps
         If (Volume.eq.n0 .and. trac.eq.jtra .and. step.lt.0.01) go to 90
*
         If (Volume.ne.n0) call Agfpara(ish,npar,par)
         If (Ish.ne.1)     print *,' Awful error in TPC, shape=',Ish,Npar
         n0   = Volume
         jtra = trac
*                             correct old straight line parametrization
         if (Elos.lt.0) then
            if(trac.ne.itra)call gfkine(trac,vert,pvert,ipart,ivert,U,n)
            if(ipart.ne.ip0)call gfpart(ipart,cp,itrtyp,amass,charge,tlife,U,n)
            itra = trac
            ip0  = ipart
            Vr   = 1.e9
            Pt   = p(4)*sqrt(c(1)**2+c(2)**2)
            if (Pt.gt.0)  Vr = 0.0003*FieldZ/Pt
            dphi = min (Step*Vr,1.0)
            dtr  = dphi/8*charge*Sign(Step,XX(3))
            x(1) = min(max(-par(1),x(1)+c(2)*dtr),par(1))
            x(2) = min(max(-par(2),x(2)-c(1)*dtr),par(2))              
            if (.not.local) call GDTOM(x,xx,1)
         endif
*                              flag uncomplete segments
         if (abs(Step*c(1)) .lt. 2*par(1)-0.1) Elos=-abs(Elos)
*
            i=i+1
            g2t_tpc_hit_h.nok            = i
            g2t_tpc_hit(i).id            = i

            If (local) then
              g2t_tpc_hit(i).x(1)        = x(1)
              g2t_tpc_hit(i).x(2)        = x(2)
              g2t_tpc_hit(i).x(3)        = x(3)
              g2t_tpc_hit(i).p(1)        = c(1)*p(4)
              g2t_tpc_hit(i).p(2)        = c(2)*p(4)
              g2t_tpc_hit(i).p(3)        = c(3)*p(4)
            else
              g2t_tpc_hit(i).x(1)        = xx(1)
              g2t_tpc_hit(i).x(2)        = xx(2)
              g2t_tpc_hit(i).x(3)        = xx(3)
              g2t_tpc_hit(i).p(1)        = p(1)
              g2t_tpc_hit(i).p(2)        = p(2)
              g2t_tpc_hit(i).p(3)        = p(3)
            endif
            g2t_tpc_hit(i).tof           = tof
            g2t_tpc_hit(i).de            = Elos
            g2t_tpc_hit(i).ds            = Step
            g2t_tpc_hit(i).track_p       = trac
            g2t_tpc_hit(i).volume_id     = volume
            g2t_tpc_hit(i).lgam          = lgam
            g2t_tpc_hit(i).length        = Slen
*     
*                  add to track linked list 
*
            g2t_tpc_hit(i).next_tr_hit_p = g2t_track(trac).hit_tpc_p
            g2t_track(trac).hit_tpc_p    = i
            g2t_track(trac).n_tpc_hit    = g2t_track(trac).n_tpc_hit + 1

 90   enddo
      RETURN
      END



