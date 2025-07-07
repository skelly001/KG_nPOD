# Make unified peaks for nPOD peak call

This is code is based off of Emily Griffin's [methods](https://navy-printer-6b6.notion.site/Generating-Unified-Peaks-95de7d8458e048efae4eda0efd84a80c)

This was run in my multiome_fin conda env: `/.conda/envs/multiome_fin`

## directories
- peak calls: `/downstream_files/ATAC/final_peakcall/peakCallOutput_qvalue05_UNparallelized_20230118`
- unionified output dir: `/marker_CREs/012924_markerCREs_unionPeaks/CorrectedUnionPeaks_052724`
## Make union peak code
```bash
#First in bash to remove GIANT header
mapfile -t cells < /marker_CREs/012924_markerCREs_unionPeaks/celltypes.txt
for cell in ${cells[@]}; do tail -n +22 /downstream_files/ATAC/final_peakcall/peakCallOutput_qvalue05_UNparallelized_20230118/${cell}_peaks.xls > /marker_CREs/012924_markerCREs_unionPeaks/${cell}.noheader.bed; done
```

R component in [notebook](https://github.com/Gaulton-Lab/nPOD/blob/main/notebooks/downstream_analysis/ATAC/Union_peaks/FixingMaxPeakSize_Emily.ipynb)

```bash
for cell in ${cells[@]}; do awk '{print $1,$2,$3,$10,$6}' OFS="\t" /marker_CREs/012924_markerCREs_unionPeaks/CorrectedUnionPeaks_052724/${cell}.shrunkpeaks.bed | tail -n +2 > /marker_CREs/012924_markerCREs_unionPeaks/CorrectedUnionPeaks_052724/inputs/${cell}.mod.shrunkpeaks.bed; done
```
Make union peak bash [script](https://github.com/Gaulton-Lab/nPOD/blob/main/notebooks/downstream_analysis/ATAC/Union_peaks/findUnionPeaks.sh)

## make long format matrix for downstream analysis (LFM)
[script](https://github.com/Gaulton-Lab/nPOD/blob/main/notebooks/downstream_analysis/ATAC/Union_peaks/makeLFM.sh) <br>
