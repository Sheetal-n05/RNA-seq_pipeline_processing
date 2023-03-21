#!/usr/bin/env bash
# indexAll.sh

bamPath="bam/"
bamSuffix=".sorted.bam"

function indexAll {
    for sortedFile in $bamPath*$bamSuffix
    do
          #removes path from filename with no replacement
          removePath="${sortedFile/$bamPath/}"
          #removes the suffix and only gives the sample names
          sampleName="${removePath/$bamSuffix/}"
          nice -n19 samtools index \
          $bamPath$sampleName$bamSuffix
    done
}
indexAll 1>indexAll.log 2>indexAll.err
