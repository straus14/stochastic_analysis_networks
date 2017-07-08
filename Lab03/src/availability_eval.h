/*
 * availability_eval.h
 *
 *  Created on: Nov 25, 2015
 *      Author: stolab5
 */

#ifndef AVAILABILITY_EVAL_H_
#define AVAILABILITY_EVAL_H_

#include <omnetpp.h>
#include "bitmessage2_m.h"

class availabiltiy : public cSimpleModule
{
private:
    //std::vector<simtime_t> mean_availabiltiy;
    double tmp_avl_time;
    cOutVector avail_time_vect;
    simtime_t birth_time;
    int lt_count;
    bool update_flg_up;
    bool update_flg_dwn;
    double mean_avl_time;
  protected:
    virtual void initialize();
    virtual void handleMessage(cMessage *msg);
};




#endif /* AVAILABILITY_EVAL_H_ */
