#include <iostream>

int main()
{
        int run_version, driver_version;
        std::cout<< "Return Code Runtime Version: ";
        std::cout<<cudaRuntimeGetVersion(&run_version);
        std::cout<<"\nReturn Code Driver Version: ";
        std::cout<<cudaDriverGetVersion(&driver_version);
        std::cout << "\nRuntime Version: ";
        std::cout << run_version;
        std::cout << "\n Driver Version: ";
        std::cout << driver_version;
        return 0;
}

