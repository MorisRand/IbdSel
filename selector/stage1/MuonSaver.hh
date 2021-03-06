#pragma once

#include "EventReader.hh"

#include "MuonTree.hh"

#include "SimpleAlg.hh"
#include "TreeWriter.hh"

class MuonSaver : public SimpleAlg<EventReader> {
  static constexpr int WP_MIN_NHIT = 12;
  static constexpr float AD_MIN_CHG = 3000;

public:
  MuonSaver();
  void connect(Pipeline& pipeline) override;
  Status consume(const EventReader::Data& e) override;
  bool isMuon() const { return isMuon_; }

private:
  TreeWriter<MuonTree> outTree;
  bool isMuon_;
};
