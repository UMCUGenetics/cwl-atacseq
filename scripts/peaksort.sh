#!/bin/bash



DIR_OUTPUT=$1
FILE_OUTPUT=$2
SAMPLELIST=$3



FILE_LIST=""
for SUBSAMPLE in $SAMPLELIST
do
	FILE_LIST=$FILE_LIST" "$DIR_OUTPUT/$SUBSAMPLE/$SUBSAMPLE"_peaks.narrowPeak"
done


# Combine samples using cat
cat $FILE_LIST > $FILE_OUTPUT.narrowPeak_cat.txt


# Cut out columns
cut -f 1-3,5 \
	$FILE_OUTPUT.narrowPeak_cat.txt \
		> $FILE_OUTPUT.narrowPeak.bed


# Nasty sort to force specific order of chromosomes
for CHR in `seq 1 22` X Y MT;
do
	pcregrep "^$CHR |^$CHR\t|^chr$CHR |^chr$CHR\t" $FILE_OUTPUT.narrowPeak.bed | sort -k2,2n;
done > $DIR_OUTPUT/$FILE_OUTPUT/$FILE_OUTPUT.narrowPeak_sort.bed
