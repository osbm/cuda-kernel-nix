#include <stdio.h>
#include "cuda.h"
extern "C"

void checkGpuMem() {
    float free_m, total_m, used_m;
    size_t free_t,total_t;
    cudaMemGetInfo(&free_t,&total_t);
    free_m =(uint)free_t/1048576.0 ;
    total_m=(uint)total_t/1048576.0;
    used_m=total_m-free_m;
    printf("GPU memory usage: used = %f, free = %f MB, total = %f MB\n",used_m,free_m,total_m);
}