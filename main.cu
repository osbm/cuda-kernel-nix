#include <unistd.h>
#include <iostream>


int main(){

    size_t mf, ma;
    cudaMemGetInfo(&mf, &ma);
    std::cout << "Free memory (mb): " << mf/1024/1024 << std::endl;
    std::cout << "Total memory (mb): " << ma/1024/1024 << std::endl;

    return 0;
}
