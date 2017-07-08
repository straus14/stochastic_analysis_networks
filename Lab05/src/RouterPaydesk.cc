//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
// 

#include "RouterPaydesk.h"


Define_Module(RouterPaydesk);

void RouterPaydesk::initialize()
{
    const char *algName = par("routingAlgorithm");
    if (strcmp(algName, "random") == 0) {
            routingAlgorithm = ALG_RANDOM;
        } else if (strcmp(algName, "OTHER") == 0) {
            routingAlgorithm = ALG_OTHER;
    }
}

void RouterPaydesk::handleMessage(cMessage *msg)
{
  int outGateIndex = -1;
  Job* job = check_and_cast<Job *>(msg);
  if (!(job->getKind())){            // if job kind is zero pay with bar
      outGateIndex = 0;
  } else {
      switch(routingAlgorithm)    // otherwise route the job to corresponding queue
      {
      case ALG_RANDOM:
        outGateIndex = intuniform(1, gateSize("out")-1);
        break;
      case ALG_OTHER:
        outGateIndex = intuniform(1, gateSize("out")-1);
        break;
      }
  }

  send(msg,"out",outGateIndex);
}
