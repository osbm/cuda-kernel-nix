#include <unistd.h>
#include <iostream>


int main(){

    size_t mf, ma;
    cudaMemGetInfo(&mf, &ma);
    std::cout << "Free memory (gb): " << mf/1024/1024/1024 << std::endl;
    std::cout << "Total memory (gb): " << ma/1024/1024/1024 << std::endl;

    return 0;
}
