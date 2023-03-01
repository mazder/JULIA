double vector_mean(int* A, int n){
    int i, sum=0; 
    for (i=0; i<n; i++){
        sum+=A[i];
    }
    return sum/(double)n;
}