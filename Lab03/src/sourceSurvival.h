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

#ifndef __LAB3_SOURCESURVIVAL_H_
#define __LAB3_SOURCESURVIVAL_H_

#include <omnetpp.h>
#include <vector>

class SourceSurvival : public cSimpleModule
{
  private:
   std::vector<double> lifetime_matrix;
   int lt_count;
   simtime_t brt_time;
   bool KS_result;
   bool update_flg_up;
   bool update_flg_dwn;
   double ks;
   cOutVector mean_avl_time_vect;
   double mean_time;
   double total_avl_time;
  protected:
    virtual void initialize();
    virtual void handleMessage(cMessage *msg);

};

#endif
