#pragma once

#include "EventReader.hh"

#include "SimpleAlg.hh"

class FlasherCut : public SimpleAlg<EventReader, int> {
public:
  Algorithm::Status consume(const EventReader::Data& e) override
  {
#define SQ(x) pow(x, 2)
      bool flasher = SQ(e.Quadrant) + SQ(e.MaxQ / 0.45) > 1
        || 4*SQ(1 - e.time_PSD) + 1.8*SQ(1 - e.time_PSD1) > 1
        || e.MaxQ_2inchPMT > 100;

      return vetoIf(flasher);
#undef SQ
  };
};
