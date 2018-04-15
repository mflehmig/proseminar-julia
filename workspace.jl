foo = A -> .+ 1
addprocs(2);
#=
A = rand(2,2)
remotecall_fetch(() -> foo(A),2)
A = rand(2,2)
remotecall_fetch(() -> foo(A),3)
@spawnat 1 whos();
@spawnat 2 whos();
@spawnat 3 whos();

x = remotecall_fetch(()-> A, 2)
y = remotecall_fetch(()-> A, 3)
=#
println(A);
println("///////////////////")
remotecall_fetch(()-> A,2)
B = rand(2,2)
let B = B
    remotecall_fetch(()-> B,2)
end;
@spawnat 2 whos();

nheads = @parallel (+) for i = 1:200000000
    Int(rand(Bool))
end
f = (() -> + 1)
a = zeros(100000)
@parallel for i = 1:100000
    a[i] = i
end
a = randn(1000)
@parallel (+) for i = 1:100000
    f(a[rand(1:end)])
end

a[rand(1:end)]
M = Matrix{Float64}[rand(1000,1000) for i = 1:10];

pmap(svd,M);
