X = collect(Cint,1:10);
println("x = ", X);

value = ccall((:vector_mean, "myC.so"), Float64, (Ptr{Cint},Cint), X, 10);
println("value = ", value);