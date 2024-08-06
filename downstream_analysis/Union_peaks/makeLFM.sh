#!/bin/bash
Pyscript_fp=/nfs/lab/rlmelton/npod/notebooks/sherlock/Downstream_analysis_nPOD_april2022/Publication/Final_Downstream/marker_CREs/012924_markerCREs_unionPeaks/CorrectedUnionPeaks_052724/Josh_10XPipeline_withPeaks_justLFM_markerCRE_union.py
samples=(Acinar_1_2_6 Acinar_3 Acinar_5 Acinar_4 Activated_Stellate Endothelial Schwann Alpha Delta Beta Macrophage Tcells Mast Quiescent_Stellate LymphEndo Ductal)
N=5
for sample in ${samples[@]}; do
        ((i=i%N)); ((i++==0)) && wait
        (
                
                outs_dir=/nfs/lab/rlmelton/npod/notebooks/sherlock/Downstream_analysis_nPOD_april2022/Publication/Final_Downstream/marker_CREs/012924_markerCREs_unionPeaks/CorrectedUnionPeaks_052724/${sample}
                keep_dir=/nfs/lab/projects/nPOD/downstream_files/ATAC/final_peakcall/peakCallOutput_qvalue05_UNparallelized_20230118/${sample}

                tagAlign=/nfs/lab/rlmelton/npod/notebooks/sherlock/Downstream_analysis_nPOD_april2022/Publication/Final_Downstream/marker_CREs/012924_markerCREs_unionPeaks/LFM/inputs/nPOD_spiltTagAlign.${sample}

                /usr/bin/python3 $Pyscript_fp  -o $outs_dir -k ${keep_dir}.barcodes -n ${sample} -a ${tagAlign}.filt.rmdup.2024-01-30.broad.tagAlign.gz -t 24 -m 2 > ${sample}_log_file.txt
        ) &
done
