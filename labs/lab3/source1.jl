#вариант 26

using Plots
using DifferentialEquations

#начальные условия
x0 = 80000 #численность первой армии
y0 = 115000 #численность второй армии

a = 0.3 #константа, характеризующая степень влияния различных факторов на потери
b = 0.56 #эффективность боевых действий армии у
c = 0.68 #эффективность боевых действий армии х
h = 0.33 #константа, характеризующая степень влияния различных факторов на потери

function P(t)
    sin(t+10)
end

function Q(t)
    cos(t+10)
end

tspan=(0.0, 1)

#Система дифференциальных уравнений
function syst!(du,y,p,t)
    du[1] = -a*y[1]-b*y[2]+P(t) #изменение численности первой армии
    du[2] = -c*y[1]-h*y[2]+Q(t) #изменение численности второй армии
end

v0 = [x0,y0] #Вектор начальных условий

#Решение системы
problem = ODEProblem(syst!, v0, tspan, 0)
y = solve(problem)

u1=Vector{Float64}()
u2=Vector{Float64}()

for i in range(1, length(y.t))
    push!(u1, y.u[i][1])
    push!(u2, y.u[i][2])
end    

plot(y.t, u1, label = "X side", title = "Model")
plot!(y.t, u2, label = "Y side", xlimit=[0, 1])