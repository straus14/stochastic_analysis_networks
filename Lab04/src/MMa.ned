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

package lab04;
import org.omnetpp.queueing.PassiveQueue;
import org.omnetpp.queueing.Server;
import org.omnetpp.queueing.Sink;
import org.omnetpp.queueing.Source;


//
// TODO documentation
//
network MMa
{
    @display("bgb=504,281");
    submodules:
        src1: Source {
            @display("p=48,124");
        }
        snk1: Sink {
            @display("p=439,122");
        }
        pq1: PassiveQueue {
            @display("p=167,118");
        }
        srv1: Server {
            @display("p=287,71");
        }
        srv2: Server {
            @display("p=295,138");
        }
        srv3: Server {
            @display("p=295,208");
        }
    connections:
        src1.out --> pq1.in++;
        pq1.out++ --> srv1.in++;
        pq1.out++ --> srv2.in++;
        pq1.out++ --> srv3.in++;
        srv1.out --> snk1.in++;
        srv2.out --> snk1.in++;
        srv3.out --> snk1.in++;
}

