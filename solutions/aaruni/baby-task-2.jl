list1 = collect(2:500)

function divides_and_not_equals(i,e)
    # if e, the list iterator divides i, the current list element
    if divides(e,i)[1]
        # if i is not equal to e
        if i != e
            return true
        end
    end
    return false
end

for i in 2:Int(floor(sqrt(length(list1))))
    filter!(e -> !divides_and_not_equals(i,e), list1)
end

list1
