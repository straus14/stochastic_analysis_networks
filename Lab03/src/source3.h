/*
 * source.h
 *
 *  Created on: Nov 23, 2015
 *      Author: straus14
 */

#ifndef SOURCE_H_
#define SOURCE_H_

#include <omnetpp.h>
#include "bitmessage2_m.h"

class Source3 : public cSimpleModule
{
private:
   simtime_t lifetime;
   simtime_t repairtime;
   bool state;
   int gS;
   bool first_eval;
   bittype *bmsg;
  protected:
    virtual void initialize();
    virtual void handleMessage(cMessage *msg);
    virtual void forward_status();
    virtual void toggle_status();
};



#endif /* SOURCE_H_ */
