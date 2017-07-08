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

#include "RouterMeal.h"

Define_Module(RouterMeal);

void RouterMeal::initialize()
{

}

void RouterMeal::handleMessage(cMessage *msg)
{
  int rand_num = intuniform(1,100);

  // route the students to particular food menu
  if (rand_num <= 10){
     send(msg,"out_tellergericht");
  } else if (rand_num <= 20){
      send(msg,"out_vegetarish");
  } else if (rand_num <= 30){
      send(msg,"out_pasta");
  } else if (rand_num <= 60){
      send(msg,"out_klassisch");
  } else if (rand_num <= 75){
      send(msg,"out_tagesempfehlung");
  } else if (rand_num <= 80){
      send(msg,"out_pizza");
  } else if (rand_num <= 90){
      send(msg,"out_grill");
  } else {
      send(msg,"out_buffet");
  }
}
