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

#include "orGate.h"

Define_Module(OrGate);

void OrGate::initialize()
{
    in1 = false;
    in2 = false;
    out = false;
    count = 0;
}

void OrGate::handleMessage(cMessage *msg)
{
    if(msg->arrivedOn("in1")){
      in1 = static_cast<bitmessage *>(msg)->getSource();
      count++;
    }
    else if(msg->arrivedOn("in2")){
           in2 = static_cast<bitmessage *>(msg)->getSource();
           count++;
    }
    if (count == 2)
    {
    static_cast<bitmessage *>(msg)->setSource(in1|in2);
    send(msg,"out");
    count = 0;
    }
}
