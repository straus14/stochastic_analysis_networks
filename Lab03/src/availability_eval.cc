/*
 * availability_eval.cc
 *
 *  Created on: Nov 25, 2015
 *      Author: stolab5
 */

#include "availability_eval.h"

Define_Module(availabiltiy);

void availabiltiy::initialize()
{
    avail_time_vect.setName("mean available time");
    lt_count = 0;
    birth_time = 0.0;
    tmp_avl_time = 0.0;
    update_flg_up = false;
    update_flg_dwn = false;
    mean_avl_time = 0.0;
    WATCH(mean_avl_time);
}

void availabiltiy::handleMessage(cMessage *msg)
{

    //store the mean availability in cOutVector
    if(static_cast<bittype *>(msg)->getBitval()){
        if(!update_flg_up){
            birth_time = simTime();
            update_flg_up = true;
            update_flg_dwn = false;
        }

    }else{
        if(!update_flg_dwn){
            update_flg_dwn = true;
            update_flg_up = false;
            lt_count++;
            tmp_avl_time = tmp_avl_time + operator-(simTime(),birth_time).dbl();
            mean_avl_time = tmp_avl_time/lt_count;
            avail_time_vect.record(mean_avl_time);
        }
    }

delete msg;
}



