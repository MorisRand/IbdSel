#!/bin/bash
#SBATCH -N 1 -A dayabay -C knl -L project,projecta,SCRATCH -q regular

$@
