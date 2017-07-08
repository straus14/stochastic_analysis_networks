package lab3;
import lab2.Path;
import lab2.PhiPath;

network MinPathSurvival
{
    @display("bgb=531,335");
    submodules:
        coordinator1: Coordinator {
            @display("p=57,145");
        }
        x1: Source3 {
            @display("p=172,36");
        }
        x2: Source3 {
            @display("p=172,100");
        }
        x3: Source3 {
            @display("p=172,171");
        }
        x4: Source3 {
            @display("p=172,235");
        }
        x5: Source3 {
            @display("p=172,296");
        }
        ss1: SourceSurvival {
            @display("p=334,36");
        }
        ss2: SourceSurvival {
            @display("p=334,100");
        }
        ss3: SourceSurvival {
            @display("p=334,165");
        }
        ss4: SourceSurvival {
            @display("p=334,229");
        }
        ss5: SourceSurvival {
            @display("p=334,296");
        }
    connections:
        coordinator1.gate++ <--> x1.gate;
        coordinator1.gate++ <--> x2.gate;
        coordinator1.gate++ <--> x3.gate;
        coordinator1.gate++ <--> x4.gate;
        coordinator1.gate++ <--> x5.gate;
        x1.out++ --> ss1.source_in;
        x2.out++ --> ss2.source_in;
        x3.out++ --> ss3.source_in;
        x4.out++ --> ss4.source_in;
        x5.out++ --> ss5.source_in;
}
