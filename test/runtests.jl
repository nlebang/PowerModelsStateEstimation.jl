################################################################################
#  Copyright 2020, Vanin Marta, Tom Van Acker                                  #
################################################################################
# PowerModelsSE.jl                                                             #
# An extention package of PowerModels(Distribution).jl for Static Power System #
# State Estimation.                                                            #
################################################################################

# using pkgs
using Distributions
using Ipopt, SCS
using JuMP
using PowerModels, PowerModelsDistribution
using PowerModelsSE
using Test

# pkg const
const _DST = Distributions
const _JMP = JuMP
const _PMs = PowerModels
const _PMD = PowerModelsDistribution
const _PMS = PowerModelsSE

#network and feeder from ENWL for tests
ntw, fdr = 4, 2

# set solvers
ipopt_solver = _JMP.optimizer_with_attributes(Ipopt.Optimizer,"max_cpu_time"=>300.0,
                                                              "tol"=>1e-10,
                                                              "print_level"=>0)

scs_solver = optimizer_with_attributes(SCS.Optimizer, "max_iters"=>20000, "eps"=>1e-5,
                                                            "alpha"=>0.4, "verbose"=>0)



@testset "PowerModelsSE" begin

    include("distributions.jl")
    include("estimation_criteria.jl")
    include("mixed_measurements.jl")
    include("non_exact_forms.jl")
    include("power_flow.jl")
    include("with_errors.jl")
    

end
