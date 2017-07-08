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

#ifndef __LAB1_ANDGATE_H_
#define __LAB1_ANDGATE_H_

#include <omnetpp.h>
#include "bitmessage_m.h"

class AndGate : public cSimpleModule
{
  private:
   bool in1,in2;
   bool out;
   int count;
  protected:
    virtual void initialize();
    virtual void handleMessage(cMessage *msg);
};

#endif
