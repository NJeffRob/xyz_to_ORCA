-- This is Lua practice for me - the idea is to be able to take an xyz file and turn it into an ORCA input file by formatting with some options. At the moment, stick to making it work for opts, freqs and sps, with some basic functionality like charge/mult, basis sets, functionals, cpu count, memory
-- Oh yea this is SPECIFIC to compute canada btw

-- extra files that are the "libraries"
require "sh_maker"
require "xyz_converter"


-- Getting user input
print("Please input the following information:")

print("Type of calculation (i.e. opt, freq or sp):")
calc_type = io.read()

print("File name:")
io_name = io.read()


print("Would you like to make a custom input, or use some defaults? c/d")
choice = io.read()

if choice == "c" then
    print("Functional to use:")
    functional = io.read()

    print("Basis set to use")
    basis_set = io.read()

    print("Dispersion correction:")
    dispersion = io.read()

    print("Charge:")
    charge = io.read()

    print("Mutliplicity:")
    mult = io.read()
    
    io.write("DRAC Account:")
    account = io.read()

    print("Number of CPUS:")
    ntasks = io.read()

    print("Memory (in GB):")
    mem_per_cpu = io.read()

    print("Job time:")
    time = io.read()

    print("Stdenv environment:")
    stdenv = io.read()

    print("GCC version:")
    gcc = io.read()

    print("Openmpi version:")
    openmpi = io.read()

    print("ORCA version:")
    orca = io.read()

    print("Generating input files...")
    sh_maker(account, ntasks, mem_per_cpu, time, calc_type, stdenv, gcc, openmpi, orca, io_name)
    xyz_converter(calc_type, io_name, functional, basis_set, dispersion, ntasks, mem_per_cpu, charge, mult)
else
    print("Generating input files...")
    sh_defaults(calc_type, io_name)
    inp_defaults(calc_type, io_name)
end
