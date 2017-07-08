/*
 * source.cc
 *
 *  Created on: Nov 23, 2015
 *      Author: straus14
 */

#include "random.h"
#include "source3.h"

Define_Module(Source3);

void Source3::initialize()
{
    lifetime = par("lifetime");
    repairtime = par("repairtime");
    state = true;
    gS = gateSize("out");
    first_eval = true;
    bmsg = new bittype();
    bmsg->setBitval(state);
    WATCH(state);

}

void Source3::handleMessage(cMessage *msg)
{


    if(first_eval){
        first_eval = false;
        //forward_status();
        toggle_status();
    }
    if(msg->isSelfMessage()){
        EV<<"system was   "<< state;
        state = !state;
        EV<<"system is   "<< state;
        toggle_status();
        bmsg->setBitval(state);
        send(bmsg->dup(),"gate$o");
    }else{
        forward_status();
    }

  delete msg;
  //delete bmsg;
}

void Source3::forward_status(){
    bmsg->setBitval(state);
       for (int i=0;i<gS;i++){
           send(bmsg->dup(),"out",i);
       }
}

void Source3::toggle_status(){
    if(state){
        simtime_t d_time = exponential(lifetime);
        EV << "life time" << d_time;
        cMessage *smsg = new cMessage("self");
        scheduleAt(simTime()+d_time,smsg);
    }else{
        simtime_t d_time = exponential(repairtime);
        EV << "repair time" << d_time;
        cMessage *smsg = new cMessage("self");
        scheduleAt(simTime()+d_time,smsg);

    }
}


