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

package lab3;
//
// TODO documentation
//
network survival
{
    @display("bgb=444,330");
    submodules:
        coordinator1: Coordinator {
            @display("p=55,131");
        }
        x2: Source3 {
            @display("p=200,103");
        }
        x1: Source3 {
            @display("p=200,30");
        }
        x3: Source3 {
            @display("p=200,170");
        }
        x4: Source3 {
            @display("p=200,229");
        }
        x5: Source3 {
            @display("p=200,291");
        }
    connections:
        coordinator1.gate++ <--> x1.gate;
        coordinator1.gate++ <--> x2.gate;
        coordinator1.gate++ <--> x3.gate;
        coordinator1.gate++ <--> x4.gate;
        coordinator1.gate++ <--> x5.gate;
}

