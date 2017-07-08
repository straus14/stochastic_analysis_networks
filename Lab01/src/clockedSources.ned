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


//
// TODO documentation
//
network clockedSources
{
    @display("bgb=418,235");
    submodules:
        clockXY_inst: ClockXY {
            @display("p=86,103");
        }
        D_X: Destination {
            @display("p=293,53");
        }
        D_Y: Destination {
            @display("p=303,142");
        }
    connections:
        clockXY_inst.outX --> D_X.in;
        clockXY_inst.outY --> D_Y.in;
}

