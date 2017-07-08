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
import org.omnetpp.queueing.Sink;


//
// TODO documentation
//
network test_net
{
    @display("bgb=570,290");
    submodules:
        sourceMensa: SourceMensa {
            @display("p=50,79");
        }
        queue: Queue {
            @display("p=311,79");
        }
        sink: Sink {
            @display("p=430,79");
        }
        routerMeal: RouterMeal {
            @display("p=186,79");
        }
    connections:
        queue.out --> sink.in++;
        sourceMensa.out --> routerMeal.in++;
        routerMeal.out_vegetarish --> queue.in++;
        routerMeal.out_tellergericht --> queue.in++;
        routerMeal.out_tagesempfehlung --> queue.in++;
        routerMeal.out_pizza --> queue.in++;
        routerMeal.out_buffet --> queue.in++;
        routerMeal.out_grill --> queue.in++;
        routerMeal.out_pasta --> queue.in++;
        routerMeal.out_klassisch --> queue.in++;
}

