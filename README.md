# xyz_to_ORCA
This is a basic Lua script to turn xyz coordinate files into ORCA input files.

### Requirements
Script will work with Lua 5.4 and above. All three files must be in the same directory as the xyz coordinates in question.

### Use
To use, download the files, and type


<code> lua xyz_to_ORCA_inp.lua </code>.

into the command line. This will prompt the user with some questions pertaining to their [ORCA](https://pubs.aip.org/aip/jcp/article/152/22/224108/1061982/The-ORCA-quantum-chemistry-program-package) job, and then ask if the user wants to set custom parameters or use some defaults. **Note: your molecule name has to be the same as what you've titled your xyz file.**

The default parameters are as follows:
| Parameter   | Default     |
| ----------- | ----------- |
| Functional  | PBE0        |
| Basis Set   | def2-SVP    |
| Dispersion  | D3BJ        |
| cpus        | 4           |
| memory      | 2GB         |
| charge      | 0           |
| mult        | 1           |

These defaults were chosen with molecular geometries in mind (sorry materials folks). You can of course specify custom inputs instead should you need something more specific, or modify the defaults as you wish.

Custom parameters are anything the user specicies. **If your input contains gibberish, the output will be gibberish. There are no checks that the user has input something sensible. Always double check your inputs.**

Whether the user selects custom (c) or default (d), the script will output two files: a submission shell script for the [Digital Research Alliance of Canada](https://docs.alliancecan.ca/wiki/Technical_documentation), and a .inp file that contains relevant ORCA code. It is encouraged that you double check that these files are both correct before you submit further jobs.
