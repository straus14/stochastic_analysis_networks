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

//
// TODO auto-generated module
//
simple SourceMensa
{
      parameters:
       @signal[created](type="long");
        @statistic[created](title="the number of jobs created";record=last;interpolationmode=none);
        string jobName = default("MensaJob");         // the base name of the generated job (will be the module name if left empty)
        volatile int jobType = default(0);       // the type attribute of the created job (used by classifers and other modules)
        volatile int jobPriority = default(0);
        @display("i=block/source");
        volatile string fileName = default("IATimes.txt");
        int bar_pay = default(13); // percentage of studenty to pay by cash
        gates:
        output out;
}
