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

import org.omnetpp.queueing.Queue;
import org.omnetpp.queueing.Router;
import org.omnetpp.queueing.Sink;
import org.omnetpp.queueing.Source;


network MM11_3
{
    @display("bgb=418,232");
    submodules:
        src1: Source {
            @display("p=41,77");
        }
        router1: Router {
            @display("p=133,77");
        }
        queue1: Queue {
            @display("p=251,30");
        }
        queue2: Queue {
            @display("p=257,104");
        }
        queue3: Queue {
            @display("p=257,179");
        }
        snk1: Sink {
            @display("p=358,84");
        }
    connections:
        src1.out --> router1.in++;
        router1.out++ --> queue1.in++;
        router1.out++ --> queue2.in++;
        router1.out++ --> queue3.in++;
        queue1.out --> snk1.in++;
        queue2.out --> snk1.in++;
        queue3.out --> snk1.in++;
}
