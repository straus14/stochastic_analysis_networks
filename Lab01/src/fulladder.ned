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

network fulladder
{
    @display("bgb=577,326;bgl=2");
    submodules:
        ha2: HA {
            @display("p=291,241");
        }
        ha1: HA {
            @display("is=l;p=223,69");
        }
        orGate: OrGate {
            @display("p=382,84");
        }
        Cout: Destination {
            @display("p=493,51");
        }
        S: Destination {
            @display("p=493,247");
        }
        clockXYC: ClockXYC {
            @display("p=41,108");
        }
    connections:
        clockXYC.outX --> ha1.inX;
        clockXYC.outY --> ha1.inY;
        ha1.carry --> orGate.in1;
        ha1.sum --> ha2.inX;
        clockXYC.outCin --> ha2.inY;
        ha2.carry --> orGate.in2;
        ha2.sum --> S.in;
        orGate.out --> Cout.in;
}
