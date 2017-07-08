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

#include "random.h"
#include "source.h"

Define_Module(Source);

void Source::initialize()
{

}

void Source::handleMessage(cMessage *msg)
{
    bittype *bmsg = new bittype();
    bmsg->setBitval((bool)bernoulli(par("p")));
    for (int i=0; i < gateSize("out");i++) {
            send(bmsg->dup(),"out",i);
        }

    EV << "sent bit" << bmsg->getBitval();
    delete bmsg;
    delete msg;
}
