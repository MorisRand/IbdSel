#!/bin/bash

tag=$1; shift
sbatch_extra=$@

export IBDSEL_CHUNKSIZE=25
export IBDSEL_WALLTIME=00:10:00
export IBDSEL_CHUNK_MARGIN_SECS=60
export IBDSEL_FILE_MARGIN_SECS=30
export IBDSEL_STARTUP_SLEEP_SECS=10
export IBDSEL_NTASKS=40
export IBDSEL_SLURMFILE=slurm/run_hsw.sl.sh
export IBDSEL_LOGFMT_EXTRA=_hsw_dbg

njob=1
source bash/do_submit_stage1.inc.sh $tag $njob $sbatch_extra -q debug
