# To run /Applications/Julia-1.8.app/Contents/Resources/julia/bin/julia -t 4 plot.jl

function juliaSetPixel(z0, c)
    z = z0
    niter = 255
    for i in 1:niter
        abs2(z)> 4.0 && return (i - 1)%UInt8
        z = z*z + c
    end
    return niter%UInt8
end

function calcColumn!(pic, c, n, j)
    x = -2.0 + (j-1)*4.0/(n-1)
    for i in 1:n
        y = -2.0 + (i-1)*4.0/(n-1)
        @inbounds pic[i,j] = juliaSetPixel(x+im*y, c)
    end
    nothing
end

function juliaSetCalc!(pic, c, n)
    for j in 1:n
        calcColumn!(pic, c, n, j)
    end
    nothing
end

function juliaSet(x, y, n=1000, method = juliaSetCalc!, extra...)
    c = x + y*im
    pic = Array{UInt8,2}(undef,n,n)
    method(pic, c, n, extra...)
    return pic
end

frac = juliaSet(-0.79,0.15)
#using Plots
#plot(heatmap(1:size(frac,1),1:size(frac,2), frac, color=:Spectral))
using BenchmarkTools
@btime juliaSet(-0.79,0.15)

@show Threads.nthreads()


import Base.Threads.@threads
function juliaSetCalcThread!(pic, c, n)
    @threads for j in 1:n
        calcColumn!(pic, c, n, j)
    end
    nothing
end

fracP1 = juliaSet(-0.79,0.15,1000,juliaSetCalcThread!)

@show frac==fracP1

@btime juliaSet(-0.79,0.15,1000,juliaSetCalcThread!)




