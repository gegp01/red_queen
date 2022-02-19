# The script requires:
# 1 global CoV phylogeny (global.tree) of GISAID and metadata
# 2 the name of the tree defines as tree_name
# 3 a path to the data (nexus)

setwd(path)

# libraires
require(ape)

# Read global phylogeny obtained from GISAID. 
v = read.tree(global.tree)

# Read metadata
m = read.csv("metadata.csv")

# Select a country, e.g. Mexico
mx = m[grep("Mexico", m$virus_name),]

# Cut the tree from the global phylogeny

nms = mx$accesion_id

no_nms = v$tip.label[is.na(match(v$tip.label, nms))]
# prune phylogeny

mx_tree = drop.tip(v, no_nms)
# mx_tree = keep.tip(v, nms)


may_2020 = mx$accession_id[grep("2020-05", mx$collection_date)]
jun_2020 = mx$accession_id[grep("2020-06", mx$collection_date)]
jul_2020 = mx$accession_id[grep("2020-07", mx$collection_date)]
ago_2020 = mx$accession_id[grep("2020-08", mx$collection_date)]
sep_2020 = mx$accession_id[grep("2020-09", mx$collection_date)]
oct_2020 = mx$accession_id[grep("2020-10", mx$collection_date)]
nov_2020 = mx$accession_id[grep("2020-11", mx$collection_date)]
dic_2020 = mx$accession_id[grep("2020-12", mx$collection_date)]
ene_2021 = mx$accession_id[grep("2021-01", mx$collection_date)]
feb_2021 = mx$accession_id[grep("2021-02", mx$collection_date)]
mar_2021 = mx$accession_id[grep("2021-03", mx$collection_date)]
abr_2021 = mx$accession_id[grep("2021-04", mx$collection_date)]
may_2021 = mx$accession_id[grep("2021-05", mx$collection_date)]
jun_2021 = mx$accession_id[grep("2021-06", mx$collection_date)]
jul_2021 = mx$accession_id[grep("2021-07", mx$collection_date)]
ago_2021 = mx$accession_id[grep("2021-08", mx$collection_date)]
sep_2021 = mx$accession_id[grep("2021-09", mx$collection_date)]
oct_2021 = mx$accession_id[grep("2021-10", mx$collection_date)]
nov_2021 = mx$accession_id[grep("2021-11", mx$collection_date)]
dic_2021 = mx$accession_id[grep("2021-12", mx$collection_date)]
ene_2022 = mx$accession_id[grep("2022-01", mx$collection_date)]










# genetic distance between samples, but tree is too big.
d = cophenetic(mx_tree)
Error in dist.nodes(x) : tree too big









# Perform phylogeographic analyses (coalescence) with the sequences.











