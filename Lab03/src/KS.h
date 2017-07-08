#ifndef __KSEXP_H_
#define __KSEXP_H_
#include <algorithm>

inline double KSExp(const std::vector<double>& datOrig, const double lambda) {

    // Calculates the Kolmogorov-Smirnov Test of the vector dat against an exponential distribution with parameter(expectation value!) lambda

    std::vector<double> dat = datOrig; // Copy original data vector
    std::sort(dat.begin(),dat.end()); // Sort data vector

    double stepSize = 1./double(dat.size()), step=stepSize-1; // Calculate stepSize and first step of empirical distribution, -1 from distribution function is already included
    double maxDist, dist,dist2; // Stores the value of test statistic
    double invLambda = 1./lambda; // Precalculate exponential parameter

    EV << dat.size() << " " << stepSize << std::endl;

    std::vector<double>::const_iterator it=dat.begin(),itEnd=dat.end(); // Initializes iterators
    while (it != itEnd) { // Add difference of empirical and theoretical distribution on each data point

        double arg = step+exp(-invLambda*(*it)); // exponential distribution

        dist = fabs(arg);
        if (dist > maxDist) maxDist = dist;
        dist2 = fabs(arg-stepSize);
        if (dist2 > maxDist) maxDist = dist2;

        EV << *it << " " << step+1 << " " << fabs(1 - exp(-invLambda*(*it))) << " " << dist << " " << dist2 << " " << maxDist << std::endl;

        step += stepSize;
        ++it;
    }

    EV << "Lambda = " << lambda << " maxDist = " << maxDist << std::endl;

    return maxDist;
}

#ifndef GETINTINSTRING_FUNCTION
#define GETINTINSTRING_FUNCTION
int getIntInString(const std::string& text, size_t& pos) {

  int val = 0;
  while ( (pos < text.length()) && (isdigit(text[pos]) ) ) {
    val = val*10+static_cast<int>(text[pos])-static_cast<int>('0');
    ++pos;
  }
  return val;
}
#endif

#ifndef SEARCHFORWARDNUMBER_FUNCTION
#define SEARCHFORWARDNUMBER_FUNCTION
size_t searchForwardNumber(const std::string& text) {
    size_t pos = 0, posEnd = text.size();
    while ( (pos < posEnd) && ( (text[pos] < '0') || (text[pos] > '9') ) ) {
        ++pos;
    }
    return pos;
}
#endif

inline double KSExp(const std::vector<double>& datOrig, const cPar& par) {

    std::string parStr = par.str();
    size_t pos = searchForwardNumber(parStr);
    return KSExp(datOrig,double(getIntInString(parStr,pos)));
 }


#endif
