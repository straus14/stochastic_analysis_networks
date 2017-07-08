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


network MensaVita
{
    @display("bgb=656,537");
    submodules:

        sourceMensa: SourceMensa {
            @display("p=50,157");
        }
        routerMeal: RouterMeal {
            @display("p=143,155");
        }
        TellerGericht: Queue {
            @display("p=238,24");
        }
        Vegetarisch: Queue {
            @display("p=238,88");
        }
        Pasta: Queue {
            @display("p=238,155");
        }
        Klassisch: Queue {
            @display("p=238,223");
        }
        TagesEmpfehlung: Queue {
            @display("p=238,291");
        }
        Pizza: Queue {
            @display("p=238,362");
        }
        Grill: Queue {
            @display("p=238,430");
        }
        Buffet: Queue {
            @display("p=244,500");
        }
        routerPaydesk: RouterPaydesk {
            @display("p=411,243");
        }
        KasseBar: Queue {
            @display("p=508,38");
        }
        KasseBC1: Queue {
            @display("p=508,143");
        }
        KasseBC2: Queue {
            @display("p=508,313");
        }
        KasseBC3: Queue {
            @display("p=508,446");
        }
        sink: Sink {
            @display("p=621,243");
        }
    connections:

        sourceMensa.out --> routerMeal.in++;
        routerMeal.out_tellergericht --> TellerGericht.in++;
        routerMeal.out_vegetarish --> Vegetarisch.in++;
        routerMeal.out_pasta --> Pasta.in++;
        routerMeal.out_klassisch --> Klassisch.in++;
        routerMeal.out_tagesempfehlung --> TagesEmpfehlung.in++;
        routerMeal.out_pizza --> Pizza.in++;
        routerMeal.out_grill --> Grill.in++;
        routerMeal.out_buffet --> Buffet.in++;
        TellerGericht.out --> routerPaydesk.in++;
        Vegetarisch.out --> routerPaydesk.in++;
        Pasta.out --> routerPaydesk.in++;
        Klassisch.out --> routerPaydesk.in++;
        TagesEmpfehlung.out --> routerPaydesk.in++;
        Pizza.out --> routerPaydesk.in++;
        Grill.out --> routerPaydesk.in++;
        Buffet.out --> routerPaydesk.in++;
        routerPaydesk.out++ --> KasseBar.in++;
        routerPaydesk.out++ --> KasseBC1.in++;
        routerPaydesk.out++ --> KasseBC2.in++;
        routerPaydesk.out++ --> KasseBC3.in++;
        KasseBar.out --> sink.in++;
        KasseBC1.out --> sink.in++;
        KasseBC2.out --> sink.in++;
        KasseBC3.out --> sink.in++;
}
