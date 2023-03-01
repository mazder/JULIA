using BenchmarkTools
using Metal

A = rand(2^3, 2^3);
B = rand(2^3, 2^4)

A_d = MtlArray(Float32.(A));
B_d = MtlArray(Float32.(B));

@btime $A * $B;
@btime $A_d * $B_d;