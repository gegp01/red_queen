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

nms = mx$accession_id

no_nms = v$tip.label[is.na(match(v$tip.label, nms))]
# prune phylogeny

mx_tree = drop.tip(v, no_nms)
# mx_tree = keep.tip(v, nms)


L = list(
  may_2020 = mx$accession_id[grep("2020-05", mx$collection_date)]
  , jun_2020 = mx$accession_id[grep("2020-06", mx$collection_date)]
  , jul_2020 = mx$accession_id[grep("2020-07", mx$collection_date)]
  , ago_2020 = mx$accession_id[grep("2020-08", mx$collection_date)]
  , sep_2020 = mx$accession_id[grep("2020-09", mx$collection_date)]
  , oct_2020 = mx$accession_id[grep("2020-10", mx$collection_date)]
  , nov_2020 = mx$accession_id[grep("2020-11", mx$collection_date)]
  , dic_2020 = mx$accession_id[grep("2020-12", mx$collection_date)]
  , ene_2021 = mx$accession_id[grep("2021-01", mx$collection_date)]
  , feb_2021 = mx$accession_id[grep("2021-02", mx$collection_date)]
  , mar_2021 = mx$accession_id[grep("2021-03", mx$collection_date)]
  , abr_2021 = mx$accession_id[grep("2021-04", mx$collection_date)]
  , may_2021 = mx$accession_id[grep("2021-05", mx$collection_date)]
  , jun_2021 = mx$accession_id[grep("2021-06", mx$collection_date)]
  , jul_2021 = mx$accession_id[grep("2021-07", mx$collection_date)]
  , ago_2021 = mx$accession_id[grep("2021-08", mx$collection_date)]
  , sep_2021 = mx$accession_id[grep("2021-09", mx$collection_date)]
  , oct_2021 = mx$accession_id[grep("2021-10", mx$collection_date)]
  , nov_2021 = mx$accession_id[grep("2021-11", mx$collection_date)]
  , dic_2021 = mx$accession_id[grep("2021-12", mx$collection_date)]
  , ene_2022 = mx$accession_id[grep("2022-01", mx$collection_date)]
)

f.sampler = function(x){sample(L[[x]], 50)}
L_100 = lapply(1:length(L), f.sampler)
names(L_100) = names(L)

plot.function = function(x) {
  t1 = keep.tip(mx_tree, L_100[[x]])
  d = cophenetic(t1)
  d_ = 1-d/max(d) # la distancia se transforma como una proporción y se le resta a 1, para representar la conectividad en cada vertice
  
  svg(paste(names(L_100[x]), ".svg", sep=""))
  qgraph(d_, layout='spring', vsize=3)
#  text(0,1, names(L_100[x]))
  legend("bottomleft", cex = 0.7, ncol=1, text.width = 0.5, bg ="transparent"
         , box.lwd=0, x.intersp= 0.05, y.intersp = 0.7, inset=0.01
         , c( paste(names(quantile(d)), "<", quantile(d)))
         , title = paste(names(L_100[x]),"\n phylogenetic distances")) # legend=quantile(d))
  dev.off()
}

# lapply(1, plot.function)

lapply(1:length(L_100), plot.function)



# By specifying layout="spring" the Fruchterman-
#  reingold algorithm (Fruchterman & Reingold, 1991), which has been ported from the SNA package
# (Butts, 2010), can be used to create a force-directed layout. In principle, what this function does
# is that each node (connected and unconnected) repulse each other, and connected nodes also attract
# each other. Then after a number of iterations (500 by default) in which the maximum displacement
# of each node becomes smaller a layout is achieved in which the distance between nodes correspond
# very well to the absolute edge weight between those nodes
# Perform phylogeographic analyses (coalescence) with the sequences.











