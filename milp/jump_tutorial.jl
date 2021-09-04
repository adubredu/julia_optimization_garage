#=
GUROBI
using JuMP
using Gurobi
using Juniper
using Ipopt

model = Model(Gurobi.Optimizer)

@variable(model, x>=0)
@variable(model, 0<=y<=3)

@objective(model, Min, 12x + 20y)

@constraint(model, c1, 6x + 8y >= 100)
@constraint(model, c2, 7x + 12y >= 120)

print(model)

optimize!(model)

# @show termination_status(model)
# @show primal_status(model)
# @show dual_status(model)
@show objective_value(model)
@show value(x)
@show value(y)
=#



#LINEAR PROGRAM
using JuMP
using Juniper
using Ipopt


nl_solver = optimizer_with_attributes(Ipopt.Optimizer, "print_level"=>0)
model = Model(optimizer_with_attributes(Juniper.Optimizer, "nl_solver"=>nl_solver))

@variable(model, x>=0)
@variable(model, 0<=y<=3)

@objective(model, Min, 12x + 20y)

@constraint(model, c1, 6x + 8y >= 100)
@constraint(model, c2, 7x + 12y >= 120)

print(model)

optimize!(model) 

@show objective_value(model)
@show value(x)
@show value(y)
