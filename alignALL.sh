#!/usr/bin/env bash
# alignAll.sh

inputPath="Paired/"
leftSuffix=".R1.fastq"
rightSuffix=".R2.fastq"
samOutPath="sam/"
samSuffix=".sam"
# Make sure the output path exists
mkdir -p $samOutPath

# Declare alignAll function

function alignAll {
    for trimmedFile in $inputPath*$leftSuffix
    do
          # removes path from filename with no replacement
          removePath="${trimmedFile/$inputPath/}"
          # removes the suffix and only gives the sample names
          sampleName="${removePath/$leftSuffix/}"
          nice -n19 gsnap \
          -A sam \
          -D . \
          -d AiptasiaGmapDb \
          -s AiptasiaGmapIIT.iit \
          $inputPath$sampleName$leftSuffix \
          $inputPath$sampleName$rightSuffix \
          1>$samOutPath$sampleName$samSuffix
     done
}

alignAll 1>alignAll.log 2>alignAll.err
