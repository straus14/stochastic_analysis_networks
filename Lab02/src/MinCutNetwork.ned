package lab2;

network MinCutNetwork
{
    @display("bgb=431,377");
    submodules:
        clock_inst: Clock {
            @display("p=41,172");
        }
        x1: Source {
            @display("p=135,40");
        }
        x2: Source {
            @display("p=135,114");
        }
        x3: Source {
            @display("p=135,181");
        }
        x4: Source {
            @display("p=135,239");
        }
        x5: Source {
            @display("p=135,312");
        }
        beta1: Cut {
            @display("p=248,62");
        }
        beta2: Cut {
            @display("p=248,133");
        }
        beta3: Cut {
            @display("p=248,211");
        }
        beta4: Cut {
            @display("p=248,282");
        }
        phiCut_inst: PhiCut {
            @display("p=361,177");
        }
    connections:
        clock_inst.out++ --> x1.in;
        clock_inst.out++ --> x2.in;
        clock_inst.out++ --> x3.in;
        clock_inst.out++ --> x4.in;
        clock_inst.out++ --> x5.in;
        x1.out++ --> beta1.in++;
        x2.out++ --> beta1.in++;
        x2.out++ --> beta2.in++;
        x3.out++ --> beta2.in++;
        x4.out++ --> beta2.in++;
        x1.out++ --> beta3.in++;
        x3.out++ --> beta3.in++;
        x5.out++ --> beta3.in++;
        x4.out++ --> beta4.in++;
        x5.out++ --> beta4.in++;
        beta1.out --> phiCut_inst.in++;
        beta2.out --> phiCut_inst.in++;
        beta3.out --> phiCut_inst.in++;
        beta4.out --> phiCut_inst.in++;
}
