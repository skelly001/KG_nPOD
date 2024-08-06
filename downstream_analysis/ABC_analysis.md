# ABC analysis

For this paper, activity-by-contact (ABC) was ran using version 0.2 which was only had a hg19 HiC reference. Therefore we had to perform multiple liftover analysis to convert our hg38 peaks calls and data into hg19 to be run with ABC. Since then ABC has released hg38 reference files, we recommend using these new methods

### (ABC github)[https://github.com/broadinstitute/ABC-Enhancer-Gene-Prediction]
Installation directions: https://abc-enhancer-gene-prediction.readthedocs.io/en/latest/usage/getting_started.html

We used hg19 chip-seq data to improve the analysis for 5 cell types with publicly available data. That data can be found [here](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE79468) from [Arda et. al](https://www.sciencedirect.com/science/article/pii/S2405471218303156?via%3Dihub#appsec2)