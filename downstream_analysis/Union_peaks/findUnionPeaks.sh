#!/bin/bash
##Define directory locations
#input directory must contain files with .bed extension to be analyzed
#Each .bed file needs to have NO HEADER and must contain Chr, Start, End, PeakID, Score <-- IN THAT ORDER (score is read pile up)
indir=/nfs/lab/rlmelton/npod/notebooks/sherlock/Downstream_analysis_nPOD_april2022/Publication/Final_Downstream/marker_CREs/012924_markerCREs_unionPeaks/CorrectedUnionPeaks_052724
tmpdir=/nfs/lab/rlmelton/npod/notebooks/sherlock/Downstream_analysis_nPOD_april2022/Publication/Final_Downstream/marker_CREs/012924_markerCREs_unionPeaks/CorrectedUnionPeaks_052724/unified_peak_tmp
outdir=/nfs/lab/rlmelton/npod/notebooks/sherlock/Downstream_analysis_nPOD_april2022/Publication/Final_Downstream/marker_CREs/012924_markerCREs_unionPeaks/CorrectedUnionPeaks_052724/unified_peaks_output
#Name your output
outfile=nPOD_UnionPeaks.bed
#Initialize iteration, output and stop clause
touch ${outdir}/${outfile}
iters=1
stop=0

#Make tmp directory
if [ ! -d $tmpdir ]; then
mkdir $tmpdir;
fi

#Combine all bedfiles into one file
bedops -u ${indir}/*.bed > ${tmpdir}/tmp.bed

while [ $stop == 0 ]
do 
echo "merge steps..."
#Merge overlapping peaks in this input file
bedops -m $tmpdir/tmp.bed > ${tmpdir}/tmpmerge.bed

#Find the peak in each merged cluster with the highest read
bedmap --max-element $tmpdir/tmpmerge.bed $tmpdir/tmp.bed \
| sort-bed - \
> $tmpdir/${iters}.bed \

#Add recent iteration to final bed
#Used to write each of these outputs out individually and then merge but it takes up WAY too much space
cat ${outdir}/${outfile} $tmpdir/${iters}.bed > ${outdir}/tmp && mv ${outdir}/tmp ${outdir}/${outfile}

num=$(wc -l $tmpdir/${iters}.bed | awk '{print $1}')
echo "Adding ${num} elements"
#Find which peaks don't overlap the previously defined "true" peak for each merged cluster
bedops -n 1 $tmpdir/tmp.bed $tmpdir/${iters}.bed \
> $tmpdir/tmp2.bed
#Make these peaks your new starting file
mv $tmpdir/tmp2.bed $tmpdir/tmp.bed
#Clean up tmp file (if I let it go this tmp directory gets MASSIVE AF)
rm $tmpdir/${iters}.bed

#Checks if the file is empty
if [ $num == 0 ]
then
stop=1
fi

((iters++))
done

#Add headers back in
echo -e "Chr\tStart\tEnd\tPeakID\tPileup_Score" > header && cat header ${outdir}/${outfile} > tmp && mv tmp ${outdir}/${outfile}

rm -r $tmpdir header
