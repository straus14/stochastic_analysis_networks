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

#include "SourceMensa.h"

Define_Module(SourceMensa);

void SourceMensa::initialize()
{
    fileName = par("fileName").stringValue();  //understand this function
    Created = registerSignal("created");
    bar_pay_percentage = par("bar_pay");
   // IATimes.CInterArrivalTimes(&fileName);
   //open the file

   // read the first arrival time - send the self message
    interArrivalTime = 5;
    scheduleAt(interArrivalTime, new cMessage("newJobTimer"));

}

Job *SourceMensa::createJob()
{
    Job *job = new Job(); // TODO this line is also incomplete yet
    int rand = (intuniform(1,100));
    if ( rand < bar_pay_percentage+1){
       job->setKind(0);            // 0 - denotes pay by cash
    } else {
       job->setKind(1);           //  1 - denotes pay by blue card
    }

    return job;
}

void SourceMensa::handleMessage(cMessage *msg)
{
    ASSERT(msg->isSelfMessage());  // what does this mean ?????

    // read the interarrival time
    interArrivalTime = 5;                   // TODO read from the file
    // set the self message for the time
    scheduleAt(simTime() + interArrivalTime,msg);
    // send the job
    Job *job = createJob();
    send(job, "out");
}

