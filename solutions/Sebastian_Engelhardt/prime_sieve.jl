using Oscar

m = 500
prime_list = [true for i in 1:m]
for i in 2:ceil(Int, sqrt(m))
    for n in (i+1):m
        if divides(n, i)[1]
            prime_list[n] = false
        end
    end
end
primes = [i for i in 2:m if prime_list[i]]
println(primes)
