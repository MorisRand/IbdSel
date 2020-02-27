#!/bin/bash

source bash/stage2_vars.inc.sh

while getopts "f:cb:" opt; do
    case $opt in
        f)
            filter_cmd=$OPTARG
            ;;
        c)
            create_config=1
            ;;
        b)
            based_on=$OPTARG
            ;;
        *)
            exit 1
            ;;
    esac
done
shift $((OPTIND-1))

tag=$1; shift
if [ -z $tag ]; then
    echo "Specify a tag!"
    exit 1
fi

configname=$1; shift
if [ -z $configname ]; then
    echo "Specify a config!"
    exit 1
fi

stage2_vars $tag $configname

mkdir -p $indir $logdir $trueOutdir
mkdir -p $(dirname $outdir)
ln -s $trueOutdir $outdir

if [ -n "$create_config" ]; then
    cp $IBDSEL_CONFIGDIR/config.nominal.txt $indir/config.$configname.txt
else
    cp $IBDSEL_CONFIGDIR/config.$configname.txt $indir
fi

if [ -n "$based_on" ]; then
    src_infile=$indir/../$tag@$based_on/$(basename $infile)
    cp $src_infile $infile
else
    filter_cmd=${filter_cmd:-cat}
    python/dump_days.py | $filter_cmd > $infile
fi