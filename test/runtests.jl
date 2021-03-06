using CardinalDicts
using Base.Test

#=
  create an CardinalDict with indices 1:20 that holds Int64 values
  check length
  confirm keymax
  populate it
  use it
  unset an index
  check it
  reassign an indexable value
=#

FactorialDict = CardinalDict{Int64}(20);

@test length(FactorialDict) == 0
@test keymax(FactorialDict) == 20

for i in 1:20
    setindex!(FactorialDict, factorial(i), i)
end

@test length(FactorialDict) == 20

@test haskey(FactorialDict, 17) == true
@test FactorialDict[17] == factorial(17)

clearindex!(FactorialDict, 17)
@test haskey(FactorialDict, 17) == false
@test get(FactorialDict, 17, 0) == 0
FactorialDict[17] = factorial(17)
@test FactorialDict[17] == factorial(17)

avector = [1.0, 3.0, 2.0]
DictFromVector = CardinalDict(avector)
@test DictFromVector[2] == 3.0
