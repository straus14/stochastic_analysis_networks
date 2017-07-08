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

#include "phiCut.h"
#include "bitmessage_m.h"

Define_Module(PhiCut);

void PhiCut::initialize()
{
   gS = gateSize("in");
   beta.assign(gS,false);
   beta_cntr.assign(gS,false);
   total_cntr = 0;
   work_cntr = 0;
   work_rate = 0;
   WATCH(work_rate);
}

void PhiCut::handleMessage(cMessage *msg)
{
     bool temp_update_chk = true;
     bool temp_result = true;
     beta[msg->getArrivalGate()->getIndex()] = static_cast<bittype *>(msg)->getBitval();
     beta_cntr[msg->getArrivalGate()->getIndex()] = true;

     for(int i=0;i<gS;i++){
         temp_update_chk = temp_update_chk & beta_cntr[i];
     }
     if(temp_update_chk){
       beta_cntr.assign(gS,false);
       total_cntr++;
       for(int i=0; i<gS;i++){
           temp_result = temp_result & beta[i];
       }
       if(temp_result) work_cntr++;

       if (total_cntr){
        work_rate = (float)work_cntr/(float)total_cntr;
        }
     }

     if (ev.isGUI()){
         char buf[40];
         sprintf(buf, "work rate: %f total rounds: %ld", work_rate, total_cntr);
         getDisplayString().setTagArg("t",0,buf);
     }
     delete msg;
}
