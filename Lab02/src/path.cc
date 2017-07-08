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

#include "path.h"
#include <algorithm>


Define_Module(Path);

void Path::initialize()
{
    gS = gateSize("in");
    input_bool.assign(gS,false);
    input_cntr.assign(gS,false);

}

void Path::handleMessage(cMessage *msg)
{
    bool temp_cntr = true;             // temporary counter to evaluate all gates are updated
    bool temp_result = true;                // evaluate the alpha function
    input_bool[msg->getArrivalGate()->getIndex()] = static_cast<bittype *>(msg)->getBitval();
    EV << "msg arrived on " << msg->getArrivalGate()->getIndex() <<"\n";
    input_cntr[msg->getArrivalGate()->getIndex()] = true;
    for (int i=0; i < gS; i++){
       temp_cntr = temp_cntr & input_cntr[i];
    }
    /*     std::vector<bool>::const_iterator itBegin = input_cntr.begin(), itEnd = input_cntr.end();

   if(std::find (itBegin,itEnd,false) == itEnd){
      input_cntr.assign(gS,false);
       for (int i=0; i<gS; i++){
             temp_result = temp_result & input_bool[i];
          }
        bmsg->setBitval(temp_result);
        send(bmsg,"out");
  }*/


    if (temp_cntr){                   // if all gates are updated
        EV << "all gates are updated \n";
        input_cntr.assign(gS, false);  // reinitialize the gates update flags
        for (int i=0; i<gS; i++){
            temp_result = temp_result & input_bool[i];
        }
        bittype *bmsg = new bittype();
        bmsg->setBitval(temp_result);
        send(bmsg,"out");
        //delete bmsg;
    }
   delete msg;

}
