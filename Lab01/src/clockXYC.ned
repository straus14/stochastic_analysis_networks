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

module ClockXYC
{
    gates:
        output outX;
        output outY;
        output outCin;
   // @display("bgb=419,222");
    submodules:
        clock1: Clock {
            @display("p=82,100");
        }
        X: Source {
            @display("p=274,32");
        }
        Y: Source {
            @display("p=274,100");
        }
        Cin: Source {
            @display("p=272,173");
        }
    connections:
        clock1.out++ --> X.in;
        clock1.out++ --> Y.in;
        clock1.out++ --> Cin.in;
        X.out --> outX;
        Y.out --> outY;
        Cin.out --> outCin;
}
