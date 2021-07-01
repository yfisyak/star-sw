#ifndef ROOT_TH1Helper
#define ROOT_TH1Helper


//////////////////////////////////////////////////////////////////////////
//                                                                      //
// TH1Helper                                                             //
//                                                                      //
//                                                                      //
//////////////////////////////////////////////////////////////////////////
#include "TH1.h"

class TH1Helper: public TObject
{
public:
   TH1Helper(const TH1 *h=0, int binMin=0, int binMax=0);
   TH1Helper(const TH1 *h, double xMin, double xMax);
  ~TH1Helper();

void   Set(const TH1 *h, int binMin, int binMax);
void   Set(const TH1 *h, double xMin, double xMax);
double GetMean()     ; 
double GetMeanErr()  ; 
double GetRMS    ()  ;
double GetRMSErr ()  ;
int    GetNonZeros() const; 
double GetIntegral() ; 
double GetIntegErr() ;

///@{
/**
 * A set of overloads to address the change in the API of ROOT's TH1
 * See https://github.com/root-project/root/blob/87a998d48803bc207288d90038e60ff148827664/hist/hist/inc/TH1.h#L166
 * and https://github.com/root-project/root/blob/87a998d48803bc207288d90038e60ff148827664/hist/doc/v600/index.md#taxis
 *
 * The respective overload is selected when TH1 has either `TH1::SetBit()` or `TH1::SetCanExtend()` method.
 */
template<typename T>
static auto SetCanRebin(T* h, int axis=0) -> decltype(h->SetBit(), void()) { h->SetBit(TH1::kCanRebin); }

template<typename T>
static auto SetCanRebin(T* h, int axis=0) -> decltype(h->SetCanExtend(), void()) { h->SetCanExtend(axis ? axis : TH1::kAllAxes); }

static void SetCanRebin(...) { }
///@}

private:
void   Build();
void   Aver ();

//              Data members
   const TH1* fH1;
   int        fBMin;
   int        fBMax;
   double     fXMin;
   double     fXMax;
   int        fNonZeros;
   double     fMom[5];
   ClassDef(TH1Helper,0)

};
#endif //ROOT_TH1Helper
