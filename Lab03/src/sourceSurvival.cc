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
#include "sourceSurvival.h"
#include "bitmessage_m.h"
#include "KS.h"

Define_Module(SourceSurvival);

void SourceSurvival::initialize()
{
   lifetime_matrix.resize(100,0.0);
   lt_count=0;
   brt_time=0.0;
   KS_result=false;
   update_flg_up = false;
   update_flg_dwn = false;
   ks = 0.0;
   mean_avl_time_vect.setName("mean_available_time");
   total_avl_time = 0.0;
   mean_time = 0.0;

   WATCH(KS_result);
   WATCH(lt_count);
   WATCH(ks);
}

void SourceSurvival::handleMessage(cMessage *msg)
{
 EV<<"arrived msg"<< (static_cast<bittype *>(msg)->getBitval());
   if(lt_count<100){
        if(static_cast<bittype *>(msg)->getBitval()){
            if(!update_flg_up){
                brt_time = simTime();
                update_flg_up = true;
                update_flg_dwn = false;
            }
        }else{
           if(!update_flg_dwn) {
               update_flg_dwn = true;
               update_flg_up = false;
               lt_count++;
               lifetime_matrix[(lt_count-1)]= operator-(simTime(),brt_time).dbl();
               total_avl_time = total_avl_time + lifetime_matrix[(lt_count-1)];
               mean_time = total_avl_time/lt_count;
               mean_avl_time_vect.record(mean_time);
               }
           }
        }
    if(lt_count==100){
        //call KS test
        ks = KSExp(lifetime_matrix,par("lambda"));
        KS_result = ks<0.13 ?true:false;
        EV<<"KS test evaluated "<< KS_result;
        lt_count++;
    }
    delete msg;
}
