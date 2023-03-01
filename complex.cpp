//g++ mytest.cpp -std=c++0x

# include <cmath>
# include <complex>
# include <cstdlib>
# include <ctime>
# include <iomanip>
# include <iostream>

using namespace std;

int main(int argc, char* argv[])
{
 complex<double> a = complex<double>(1.0,2.0);

 //cout<< a + 1<<endl;
 cout<< a + complex <double>(0,5)<<endl;


return 0;
}
