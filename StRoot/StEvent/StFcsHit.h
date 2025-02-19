/***************************************************************************
 *
 * $Id: StFcsHit.h,v 1.10 2021/01/11 14:42:09 akio Exp $
 *
 * Author: Akio Ogawaa, Aug 2018
 ***************************************************************************
 *
 * Description: StFcsHit is data for individual cell 
 *
 ***************************************************************************
 *
 * $Log: StFcsHit.h,v $
 * Revision 1.10  2021/01/11 14:42:09  akio
 * Adding nPeak
 *
 * Revision 1.9  2020/12/17 21:08:05  akio
 * Switching from F to D for LorentVector
 *
 * Revision 1.8  2020/09/03 19:30:57  akio
 * adding fit chi2
 *
 * Revision 1.7  2019/07/15 16:58:09  akio
 * Adding hit->cluster pointer
 *
 * Revision 1.6  2019/07/10 06:12:20  akio
 * adding pointer to cluster it belongs
 *
 * Revision 1.5  2019/06/26 17:59:39  akio
 * Added StFcsHit constructor for MC
 *
 * Revision 1.4  2019/06/07 18:20:47  akio
 * StFcsHit holds all timebins now
 *
 * Revision 1.3  2019/05/16 16:03:45  akio
 * add .includes_for_export.flg and also compress dep/ch
 *
 * Revision 1.2  2019/05/10 19:40:13  akio
 * Adding flag
 *
 * Revision 1.1  2018/11/14 16:49:00  akio
 * FCS codes in offline/upgrade/akio
 *
 *
 **************************************************************************/
#ifndef StFcsHit_hh
#define StFcsHit_hh

#include "Stiostream.h"
#include "StObject.h"
#include "TArrayS.h"
class StFcsCluster;

class StFcsHit : public StObject {
public:
    StFcsHit();
    StFcsHit(unsigned short zs, unsigned short det, unsigned short id,
             unsigned short ns, unsigned short ehp, unsigned short dep, unsigned short ch, 
             int ntimebin, unsigned short* data);
    StFcsHit(unsigned short zs, unsigned short det, unsigned short id,
             unsigned short ns, unsigned short ehp, unsigned short dep, unsigned short ch, 
             float e);
    ~StFcsHit();
    
    unsigned short zs() const;
    unsigned short detectorId() const;
    unsigned short id() const; 
    unsigned short ns() const;         //from DEP
    unsigned short ehp() const;        //from DEP
    unsigned short dep() const;        //from DEP
    unsigned short channel() const;    //from DEP
    unsigned int   nTimeBin() const;
    unsigned short timebin(int i) const;
    unsigned short data(int i) const;
    unsigned short adc(int i) const;
    unsigned short flag(int i) const;
    int   adcSum() const;
    float fitPeak() const;
    float fitSigma() const;
    float fitChi2() const;
    int   nPeak() const;
    float energy() const;
    
    void setDepCh(unsigned short ns, unsigned short ehp, unsigned short dep, unsigned short ch);
    void setNS(unsigned short val);
    void setEHP(unsigned short val);
    void setDep(unsigned short val);
    void setChannel(unsigned short val);

    void setDetId(unsigned short zs, unsigned short det, unsigned short id);
    void setZS(unsigned short val);
    void setDetId(unsigned short val);
    void setDetectorId(unsigned short val);
    void setId(unsigned short val);

    void setData(int n, const unsigned short* d);
    void setDataAt(int tb, unsigned short val);
    void setAdcFlag(int tb, unsigned short adc, unsigned short flag);
    void setAdc(int tb, unsigned short val);
    void setFlag(int tb, unsigned short val);

    void setAdcSum(int v);
    void setFitPeak(float v);
    void setFitSigma(float v);
    void setFitChi2(float v);
    void setNPeak(int v);
    void setEnergy(float v);

    void setFcsHit(unsigned short zs, unsigned short det, unsigned short id,
                   unsigned short ns, unsigned short ehp, unsigned short dep, unsigned short ch, 
		   int ntimebin, unsigned short* data);
    void setFcsHit(unsigned short zs, unsigned short det, unsigned short id,
                   unsigned short ns, unsigned short ehp, unsigned short dep, unsigned short ch, 
		   float e);
    
    void setCluster(StFcsCluster* clu) {mCluster = clu;}
    StFcsCluster *cluster() {return mCluster;}

    void print(Option_t *option="") const;

protected:
    UShort_t mDetId=0;        // 1 bit ZS, 3 bits DetectorId, 12 bits id
    UShort_t mDepCh=0;        // 1 bit for NS, 2 bits for EHP, 5 bits for DEP, 8 bits for channal
    UInt_t   mAdcSum=0;       // ADC sum 
    Float_t  mFitPeak=0.0;    // fit peak position
    Float_t  mFitSigma=0.0;   // fit sigma
    Float_t  mFitChi2=0.0;    // fit chi2
    UInt_t   mNPeak=0;        // number of peaks found
    Float_t  mEnergy=0.0;     // corrected energy
    StFcsCluster* mCluster=0; // pointer to cluster this hit belongs
    TArrayS* mData=0;         // 12bit ADC values + flag at highest 4 bits, array of timebin
    
    ClassDef(StFcsHit,5)

};

#endif
