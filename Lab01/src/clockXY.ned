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

package lab1;

//
// TODO documentation
//
module ClockXY
{
    gates:
        output outX;
        output outY;
   // @display("bgb=501,213");
    submodules:
        X: Source {
            @display("p=322,50");
        }
        Y: Source {
            @display("p=326,149");
        }
        clock_inst: Clock {
            @display("p=126,96");
        }
    connections:
        clock_inst.out++ --> X.in;
        clock_inst.out++ --> Y.in;
        X.out --> outX;
        Y.out --> outY;
}

