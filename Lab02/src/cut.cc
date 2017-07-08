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

#include "cut.h"
#include "bitmessage_m.h"

Define_Module(Cut);

void Cut::initialize()
{
    gS = gateSize("in");
    input_bool.assign(gS,false);
    input_cntr.assign(gS,false);

}

void Cut::handleMessage(cMessage *msg)
{
    bool temp_cntr = true;              //gate update flag
    bool temp_result = false;            //result evaluation flag
    input_bool[msg->getArrivalGate()->getIndex()] = static_cast<bittype *>(msg)->getBitval();
    EV << "msg arrived on gate" << msg->getArrivalGate()->getIndex() << "\n";
    input_cntr[msg->getArrivalGate()->getIndex()] = true;

    for(int i=0; i<gS; i++){
        temp_cntr = temp_cntr & input_cntr[i];
    }
    if(temp_cntr){
        input_cntr.assign(gS,false);
        for(int i=0; i<gS; i++){
            temp_result = temp_result | input_bool[i];
        }
       bittype *bmsg = new bittype();
       bmsg->setBitval(temp_result);
       send(bmsg,"out");
    }
    delete msg;
}
