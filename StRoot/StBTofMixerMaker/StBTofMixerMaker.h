//
//  StBTofMixerMaker.h
//  
//
//  Created by Nickolas Luttrell on 6/3/16.
//
//
#ifndef StBTofMixerMaker_HH
#define StBTofMixerMaker_HH
#include "StMaker.h"
#include "St_DataSet.h"
#include <vector>
class StEvent;
class StBTofCollection;
class StBTofHit;
class StBTofMixerMaker : public StMaker{
 public:
  StBTofMixerMaker(const char *name="BTofMixer");
  virtual ~StBTofMixerMaker() {}
  virtual int  Make();
  virtual const char *GetCVS() const
  {static const char cvs[]="Tag $Name:  $ $Id: StBTofMixerMaker.h,v 1.2 2017/10/20 17:50:33 smirnovd Exp $ built " __DATE__ " " __TIME__ ; return cvs;}
  ClassDef(StBTofMixerMaker,2)
protected:
  // All the internal definitions should be placed here.
  StEvent            *mEvent;                     //!< The StEvent info from previous Makers
  StBTofCollection   *mEventCollection = nullptr; //!< BtofCollection from StEvent
  StBTofCollection   *mBTofSimCollection = nullptr;   //!< BTofCollection produced by BTofSimMaker
  StBTofCollection    *mNewCollection = nullptr;      //!< BTofCollection to be assembled by embedding
  bool mIsEmbedding = kFALSE;                     //!< Embedding flag
  //! Find duplicate hits between the BTofCollections
  void findDuplicates(std::vector<StBTofHit*> eventHits, StBTofCollection *simHits);
};
#endif /* StBTofMixerMaker_h */

