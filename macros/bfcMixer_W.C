//////////////////////////////////////////////////////////////////////////
//
// $Id: bfcMixer_W.C,v 1.3 2013/06/24 23:40:00 fisyak Exp $
//
// $Log: bfcMixer_W.C,v $
// Revision 1.3  2013/06/24 23:40:00  fisyak
// Freeze
//
// Revision 1.2  2013/03/31 18:26:28  fisyak
// Freeze
//
// Revision 1.1  2013/02/02 18:04:56  fisyak
// Freeze
//
// Revision 1.1  2012/11/14 14:30:15  fisyak
// Freeze
//
// Revision 1.1  2012/08/27 22:43:27  pibero
// From PDSF
//
//
// JET EMBEDDING MACRO
//
// Pibero Djawotho <pibero@tamu.edu>
// Texas A&M University
// 27 July 2011
//
//////////////////////////////////////////////////////////////////////////
#define  __FILTER__
#define __NO_DAQ_CLUSTERS__
class StChain;
StChain* Chain = 0;

class StBFChain;
StBFChain* chain1 = 0;
StBFChain* chain2 = 0;
StBFChain* chain3 = 0;

//_____________________________________________________________________
void bfcMixer_W(Int_t First = 1, Int_t Last = 100, const Char_t *opt = "",
		     const Char_t* daqfile = "/star/data03/daq/2012/099/13099025/st_zerobias_adc_13099025_raw_1570001.daq",
		const Char_t* output  = 0, Int_t ranseed=1, const Char_t *geom = "y2012b") {
  TString Opt(opt);
  TString chain1Opt("in,daq,magF,tpcDb,NoDefault,NoOutput");
#ifndef __NO_DAQ_CLUSTERS__
  chain1Opt += ",TpxRaw";
#endif
  TString chain2Opt(Form("pythiaEmbed,Wenu,gen_T,geomT,sim_T,TpcRS,fgtMc,nodefault,Rung.%i",ranseed));
  TString chain3Opt("noInput,useInTracker,StiCA,VFPPVnoCTB,useBTOF4Vtx,BEmcChkStat,btof,fmsdat,Corr4,OSpaceZ2,OGridLeakFull,-hitfilt");
  chain2Opt += ",";
  chain2Opt += geom;
  chain3Opt += ",";
  chain3Opt += geom;
  if      (chain3Opt.Contains("y2012",TString::kIgnoreCase)) {chain3Opt += ",pp2012b";}
  else if (chain3Opt.Contains("y2011",TString::kIgnoreCase)) {chain3Opt += ",pp2011a";}
  else {
    cout << "Geometry tag\t" << geom << " is illegal. STOP! " << endl;
    return;
  }
  //  TString chain3Opt("noInput,useInTracker,pp2012b,StiCA,VFPPVnoCTB,BEmcChkStat,btof,fmsdat,-hitfilt");
  chain3Opt += ",TpcMixer"; 
  chain3Opt += ",TpxClu,-VFMinuit,VFPPVnoCTB,beamLine,-hitfilt";
  chain2Opt += ",beamLine";
  chain3Opt += ",beamLine";
#if 1
  chain3Opt += ",btofSim,emcSim,EEss"; // EEfs
  chain3Opt += ",BEmcMixer,EEmcMixer,eemcA2E"; //,emcAtoE
#endif
  chain3Opt += ",NoHistos,NoRunco,-EvOut";
  if (Opt != "") {chain3Opt += ","; chain3Opt += Opt;}
  //  chain3Opt += ",KFVertex";
  //  chain3Opt += ",AgML,UseXgeom";
  // Dynamically link some shared libs
  gROOT->LoadMacro("bfc.C");
  if (gClassTable->GetID("StBFChain") < 0) Load();
  //______________Create the main chain object______________________________________
  Chain = new StChain("Embedding");
  //________________________________________________________________________________
  bfc(-1,chain1Opt,daqfile);
  chain1 = chain;
  chain1->SetName("One");
  //  chain1->SetAttr(".call","SetActive(0)","St_db_Maker::"); // Use DB cache to reduce overhead
  Chain->cd();
  //________________________________________________________________________________  
  bfc(-1,chain2Opt);
  chain2 = chain;
  chain2->SetName("Two");
  Chain->cd();
  //________________________________________________________________________________
  //  gSystem->Load("StFtpcMixerMaker");
  //  StFtpcMixerMaker  *ftpcmixer = new StFtpcMixerMaker("FtpcMixer","daq","trs");
  //________________________________________________________________________________
  TString OutputFileName(gSystem->BaseName(daqfile));
  if (output != 0) {OutputFileName = output;}
  else {
    OutputFileName.ReplaceAll("*","");
    OutputFileName.ReplaceAll(".daq","");
    //  OutputFileName.Append("_emb.root");
    OutputFileName.Append(".root");
  }
  bfc(-1,chain3Opt,0,OutputFileName);
  chain3 = chain;
  chain3->SetName("Three"); 
  Chain->cd();
#if 1
  //------------------------------------ EMC MIXERS ------------------------------------
  // Add BEMC mixer to chain3
  StMaker* emcRaw = Chain->GetMaker("emcRaw");
  if (emcRaw) ((StEmcRawMaker*) emcRaw)->getBemcRaw()->saveAllStEvent(true); // use all 4800 BEMC towers
  // Set EEMC fast and slow simulator in embedding mode
  StMaker* eefs = Chain->GetMaker("eefs");
  if (eefs) {
    ((StEEmcFastMaker*)eefs)->SetEmbeddingMode(); // Use local StEmcCollection
    ((StEEmcFastMaker*)eefs)->UseFullTower(true); // Use full ETOW detector
  }
  StMaker* eess = Chain->GetMaker("EEss");
  if (eess) ((StEEmcSlowMaker*) eess)->setEmbeddingMode(true);
#endif
  //--------------------------------------------------------------------------
  StMaker::lsMakers(Chain);
  // Initialize chain
  if (Last < 0) return;
  Chain->Init();
  St_geant_Maker * geant = (  St_geant_Maker * ) Chain->Maker("geant");
#ifdef __FILTER__
  // Filter
  gSystem->Load("StMCFilter");
  geant->Do("GFILTER MCCaloFilter");
#endif
  geant->Do("rndm");
  if (Last <= 0) return;
  Chain->EventLoop(First,Last);
}
//________________________________________________________________________________
void bfcMixer_W(Int_t Nevents = 100, const Char_t *opt = "",
		const Char_t* daqfile = "/star/data03/daq/2012/099/13099025/st_zerobias_adc_13099025_raw_1570001.daq",
		const Char_t* output = 0, Int_t ranseed=1,const Char_t *geom = "y2012b") {
  bfcMixer_W(1,Nevents,opt,daqfile, output,ranseed,geom);
}
