using Metal

function vadd(a, b, c)
    i = thread_position_in_grid_1d()
    c[i] = a[i] + b[i]
    return
end

a = MtlArray([1]); b = MtlArray([2]); c = similar(a);

@metal threads=length(c) vadd(a, b, c)

Array(c)
