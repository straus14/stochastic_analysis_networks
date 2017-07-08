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

module HA
{
  //  @display("bgb=401,214");
    gates:
        input inX;
        input inY;
        output sum;
        output carry;
    types:
    submodules:
        andGate_inst: AndGate {
            @display("p=250,51");
        }
        xorGate_inst: XorGate {
            @display("p=256,140");
        }
        fork1: ForkGate {
            @display("p=52,51");
        }
        fork2: ForkGate {
            @display("p=52,134");
        }
    connections:
        inX-->fork1.in;
        inY-->fork2.in;
        fork1.out++ --> andGate_inst.in1;
        fork1.out++ --> xorGate_inst.in1;
        fork2.out++ --> andGate_inst.in2;
        fork2.out++ --> xorGate_inst.in2;
        andGate_inst.out --> carry;
        xorGate_inst.out --> sum;
}
