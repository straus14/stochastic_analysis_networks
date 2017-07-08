#ifndef __CINTERARRIVALTIMES_H
#define __CINTERARRIVALTIMES_H

#include <fstream>
#include <iostream>
#include <string>
#include <vector>

static const double C_EOIAT = -1; // No more InteArrivalTimes given

class CInterArrivalTimes {

public:
	CInterArrivalTimes(const std::string& FN); // Constructor with filename of data file
	CInterArrivalTimes() {};
	void openFile(const std::string& FN);
	const double getNextInterArrivalTime() const;

private:

	std::vector<double> m_InterArrivalTimes;
	mutable size_t m_index;
	size_t m_maxIndex;
};

void CInterArrivalTimes::openFile(const std::string& FN) {
    std::ifstream in(FN.c_str());

        if (in.is_open()) {
            double d;
            in >> d;
            while ( !in.eof() ) {
                m_InterArrivalTimes.push_back(d);
                in >> d;
            }
            in.close();
        }
        else {
            std::cerr << "ERROR! Couldn't open file " << FN.c_str() << std::endl;
        }
        m_maxIndex = m_InterArrivalTimes.size();
        m_index = 0;

}

CInterArrivalTimes::CInterArrivalTimes(const std::string& FN) {

    openFile(FN);
}

const double CInterArrivalTimes::getNextInterArrivalTime() const {

	if (m_index < m_maxIndex) {
		return m_InterArrivalTimes[m_index++];
	}
	else {
		return C_EOIAT;
	}
}

#endif
