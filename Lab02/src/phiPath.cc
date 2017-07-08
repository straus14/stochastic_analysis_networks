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

#include "phiPath.h"
#include "bitmessage_m.h"

Define_Module(PhiPath);

void PhiPath::initialize()
{
    gS = gateSize("in");
    alpha.assign(gS,false);
    alpha_cntr.assign(gS,false);
    total_cntr = 0;
    work_cntr = 0;
    work_rate = 0;
    WATCH(work_rate);
}

void PhiPath::handleMessage(cMessage *msg)
{
     alpha[msg->getArrivalGate()->getIndex()] = static_cast<bittype *>(msg)->getBitval();
     alpha_cntr[msg->getArrivalGate()->getIndex()] = true;
     bool temp_update_chk = true;         // to check all alpha are updated
     bool temp_result = false;
      for (int i=0; i < gS; i++){
          temp_update_chk = temp_update_chk & alpha_cntr[i];
      }


     if(temp_update_chk){                                    // evaluate stucture function if all alpha are updated
         alpha_cntr.assign(gS,false);       // reinitializing the flags
         total_cntr++;
         EV << "all flags are updated\n";
        for (int i=0;i<gS;i++){
            temp_result = temp_result | alpha[i];
        }
        if(temp_result) {
            work_cntr++;
        }
       if (total_cntr){
        work_rate = (float)work_cntr/(float)total_cntr;
        }
       //update
       bittype *result = new bittype();
       result->setBitval(temp_result);
       send(result,"out");
     }

     if (ev.isGUI()){
         char buf[40];
         sprintf(buf, "work rate: %f total rounds: %ld", work_rate, total_cntr);
         getDisplayString().setTagArg("t",0,buf);

     }
     EV << "work rate is " << work_rate;
     delete msg;
}
