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

package lab05;

import org.omnetpp.queueing.Queue;
import org.omnetpp.queueing.Router;
import org.omnetpp.queueing.Sink;
import org.omnetpp.queueing.Source;
import org.omnetpp.queueing.Dot;



network Jackson
{
    @display("bgb=702,317");
    submodules:

        source: Source {
            @display("p=67,161");
        }
        queue1: Queue {
            @display("p=170,161");
        }
        queue2: Queue {
            @display("p=365,161");
        }
        router1: Router {
            @display("p=261,161");
        }
        router2: Router {
            @display("p=486,161");
        }
        dot1: Dot {
            @display("p=542,255");
        }
        dot2: Dot {
            @display("p=97,255");
        }
        sink: Sink {
            @display("p=334,52");
        }
        sink1: Sink {
            @display("p=619,158");
        }
    connections:
        source.out --> queue1.in++;
        queue1.out --> router1.in++;
        queue2.out --> router2.in++;
        dot1.out --> dot2.in;
        dot2.out --> queue1.in++;
        router1.out++ --> sink.in++;
        router1.out++ --> queue2.in++;
        router2.out++ --> sink1.in++;
        router2.out++ --> dot1.in;
}
