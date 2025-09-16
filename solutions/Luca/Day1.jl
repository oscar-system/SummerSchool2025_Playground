using Pkg;
using Oscar;

############################
# First steps with Oscar
############################

#---------------------------
# TASK 1: Verify that sum_{i=1}^n i = n(n+1)/2
n = 2

function verify_equation(val::Int64)
    right = val*(val+1) / 2
    left = sum(1:val)
    return right == left
end

verify_equation(n)

#---------------------------
# TASK 2: Create a list of all primes up to 500 by implementing the sieve of Eratosthenes

primes = collect(1:500)

for i in 2:500
    for j in 1:500
        if i != j
            check = divides(j,i)[1]
            if check
                filter!(x -> x != j, primes)
            end
        end
    end 
end

primes

# One Solution
w = (Int64)[]
v = [a for a in 2:500]

while !(first(v)^2 > last(v))
    a = popfirst!(v); push!(w,a)
    v = [b for b in v if !divides(b,a)[1]]; println(v)
end


w;
v;

#---------------------------
# TASK 3: Verify in two different ways that x^7 - x = \prod_{i=0}^6 (x-i) \in F_7[x]

Fp = GF(7)
Fx, x = polynomial_ring(Fp, "x")

h_left = x^7 - x
factor(h_left)

h_right = prod(x-i for i in 0:6)


#---------------------------
# TASK 4: Consider the Klein 4-group V as a subgroup of the symmetric group Sym_4 and verify the theorem of Lagrange |Sym_4| = |Sym_4:V| \cdot |V|

sym4 = symmetric_group(4)
sym4_size = length(sym4)

collect(sym4)
g1 = collect(sym4)[1]
g2 = collect(sym4)[15]
g3 = collect(sym4)[2]
g4 = collect(sym4)[16]


H, _ = sub(sym4,[g1,g2,g3,g4]);
H_size = length(H)


C = left_cosets(sym4, H)
C_size = length(C)

sym4_size == C_size*H_size


############################
# Exercises
############################

#---------------------------
# How many different algorithms for determinants are implemented?
# What rings do they cover?
# Where are they defined?

# For matrices over different rings e.g. Integers
M = ZZ[1 2 3; 4 5 6; 7 8 9]
det(M)


#---------------------------
# Let K be Q[t]/f for f=t^4-2. This field is not normal.
# Find the normal closure
# Find the Galois group 
# Compare the Galois group to the automorphism group 
# Demonstrate the Galois-Correspondence

Kt, t = QQ["t"]
K, b = number_field(t^4-2, "b")
is_normal(K)

NC, NC_emb = normal_closure(K)

G, c = galois_group(NC)
AG_C, ca = automorphism_group(K)

Ag1, Ag2 = automorphism_group(NC)

NC_sf = subfields(NC)
G_sg = subgroups(G)

#---------------------------
# Construct all group extensions of C2 by C2 
# What are the possible Galois groups for a field K/Q of degree 4 that has
# a subfield of degree 2 as well? Can you match this to the grup extensions?

C2 = cyclic_group(2)

#---------------------------
# Find a cubic cyclic field where the discriminant has 10 digits.
Q, x = QQ["x"]
k = 2
f = x^3 - 3*k*x + (k^3 - 1)

NF, b = number_field(f, "b")

G, c = galois_group(NF)
is_cyclic(G)
order(G)

discriminant(NF)

p, q = -7, 1
-4*p^3 - 27*q^2


