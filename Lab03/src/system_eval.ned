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
import lab2.Path;
import lab2.PhiPath;


//
// TODO documentation
//
network system_eval
{
    @display("bgb=621,322");
    submodules:
        c1: Coordinator {
            @display("p=30,163");
        }
        x1: Source3 {
            @display("p=113,34");
        }
        x2: Source3 {
            @display("p=113,94");
        }
        x3: Source3 {
            @display("p=113,163");
        }
        x4: Source3 {
            @display("p=113,223");
        }
        x5: Source3 {
            @display("p=113,284");
        }
        ss1: SourceSurvival {
            @display("p=197,28");
        }
        ss2: SourceSurvival {
            @display("p=197,94");
        }
        ss3: SourceSurvival {
            @display("p=197,163");
        }
        ss4: SourceSurvival {
            @display("p=197,223");
        }
        ss5: SourceSurvival {
            @display("p=197,284");
        }
        p1: Path {
            @display("p=318,57");
        }
        p2: Path {
            @display("p=318,133");
        }
        p3: Path {
            @display("p=318,202");
        }
        p4: Path {
            @display("p=318,278");
        }
        pp: PhiPath {
            @display("p=428,144");
        }
        avl: availabiltiy {
            @display("p=533,143");
        }
    connections:
        c1.gate++ <--> x1.gate;
        c1.gate++ <--> x2.gate;
        c1.gate++ <--> x3.gate;
        c1.gate++ <--> x4.gate;
        c1.gate++ <--> x5.gate;
        x1.out++ --> ss1.source_in;
        x2.out++ --> ss2.source_in;
        x3.out++ --> ss3.source_in;
        x4.out++ --> ss4.source_in;
        x5.out++ --> ss5.source_in;
        x1.out++ --> p1.in++;
        x4.out++ --> p1.in++;
        x1.out++ --> p2.in++;
        x3.out++ --> p2.in++;
        x5.out++ --> p2.in++;
        x2.out++ --> p3.in++;
        x5.out++ --> p3.in++;
        x2.out++ --> p4.in++;
        x3.out++ --> p4.in++;
        x4.out++ --> p4.in++;
        p1.out --> pp.in++;
        p2.out --> pp.in++;
        p3.out --> pp.in++;
        p4.out --> pp.in++;
        pp.out --> avl.in;
}

