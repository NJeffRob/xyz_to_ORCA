-- function to make a custom submission script
function sh_maker(account, ntasks, mem_per_cpu, time, calc_type, stdenv, gcc, openmpi, orca, io_name)
    sh_file = io.open(io_name .. ".sh", "w")

    io.output(sh_file)

    io.write(
        "#!/bin/bash", "\n",
        "#SBATCH --account=" .. account, "\n",
        "#SBATCH --ntasks=" .. ntasks, "\n",
        "#SBATCH --mem-per-cpu=" .. mem_per_cpu .. "G", "\n",
        "#SBATCH --time=" .. time, "\n",
        "#SBATCH --output=%j-" .. calc_type, "\n",
        "", "\n",
        "module purge", "\n",
        "module load StdEnv/" .. stdenv .. "  gcc/" .. gcc .. "  openmpi/" .. openmpi, "\n",
        "module load orca/" .. orca, "\n",
        "$EBROOTORCA/orca " .. io_name .. ".inp > " .. io_name .. ".out"
    )

    io.close(sh_file)
end

-- function to make a default submission script (bread n butter)
function sh_defaults(calc_type, io_name)
    sh_file = io.open(io_name .. ".sh", "w")

    io.output(sh_file)

    io.write(
        "#!/bin/bash", "\n",
        "#SBATCH --account=def-ipaci", "\n",
        "#SBATCH --ntasks=4", "\n",
        "#SBATCH --mem-per-cpu=2G", "\n",
        "#SBATCH --time=3-00:00", "\n",
        "#SBATCH --output=%j-" .. calc_type, "\n",
        "", "\n",
        "module purge", "\n",
        "module load StdEnv/2020  gcc/10.3.0  openmpi/4.1.1", "\n",
        "module load orca/5.0.4", "\n",
        "$EBROOTORCA/orca " .. io_name .. ".inp > " .. io_name .. ".out"
    )

    io.close(sh_file) 
end
