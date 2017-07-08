package lab2;

network MinPathNetwork
{
    @display("bgb=479,374");
    submodules:
        clock_min: Clock {
            @display("p=53,134");
        }
        x1: Source {
            @display("p=150,31");
        }
        x2: Source {
            @display("p=150,95");
        }
        x3: Source {
            @display("p=150,161");
        }
        x4: Source {
            @display("p=150,222");
        }
        x5: Source {
            @display("p=150,289");
        }
        alpha1: Path {
            @display("p=255,56");
        }
        alpha2: Path {
            @display("p=253,147");
        }
        alpha3: Path {
            @display("p=251,219");
        }
        alpha4: Path {
            @display("p=255,289");
        }
        phiPath_min: PhiPath {
            @display("p=408,169");
        }
    connections:
        clock_min.out++ --> x1.in;
        clock_min.out++ --> x2.in;
        clock_min.out++ --> x3.in;
        clock_min.out++ --> x4.in;
        clock_min.out++ --> x5.in;
        x1.out++ --> alpha1.in++;
        x4.out++ --> alpha1.in++;
        x1.out++ --> alpha2.in++;
        x3.out++ --> alpha2.in++;
        x5.out++ --> alpha2.in++;
        x2.out++ --> alpha3.in++;
        x5.out++ --> alpha3.in++;
        x2.out++ --> alpha4.in++;
        x3.out++ --> alpha4.in++;
        x4.out++ --> alpha4.in++;
        alpha1.out --> phiPath_min.in++;
        alpha2.out --> phiPath_min.in++;
        alpha3.out --> phiPath_min.in++;
        alpha4.out --> phiPath_min.in++;
}
