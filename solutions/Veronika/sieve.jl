L=[]
M=[]
for i in (2:500)
    j=2
    for j in (2:div(500,i))
        push!(M,i*j)
        j = j+1
    end
end

for i in (2:500)
    if !(i in M)
        push!(L,i)  
    end
end

K=GF(2,1,"a")
R,(x,y)=polynomial_ring(K,[:x,:y])
I=ideal(R,[y^2-x^3+3x+2])
A=quo(R,I)

I=ideal(P4,[x^3+y^3+z^3+x*y*z,v^4+w^4+x*v*z*w])

R,(x,y,z,v,w)=polynomial_ring(K,[:x,:y,:z,:v,:w])

P4=projective_space(QQ,[:x,:y,:z,:v,:w])
V=variety(ideal([x^3+y^3+z^3+x*y*z,v^4+w^4+x*v*z*w]))
dim(V)
