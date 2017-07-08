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

network halfadder
{
    @display("bgb=589,182");
    submodules:
        half_adder1: HA {
            @display("p=351,60;is=vl");
        }
        clockXY_1: ClockXY {
            @display("p=116,60;is=l");
        }
        S: Destination {
            @display("p=485,35");
        }
        C: Destination {
            @display("p=477,116");
        }
    connections:
        clockXY_1.outX --> half_adder1.inX;
        clockXY_1.outY --> half_adder1.inY;
        half_adder1.sum --> S.in;
        half_adder1.carry --> C.in;
}
