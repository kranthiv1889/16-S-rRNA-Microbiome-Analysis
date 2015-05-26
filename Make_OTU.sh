TOP_DIR=${PWD}
: ${MOTHUR_REF_DATA:=$TOP_DIR}
if [ ! -d "$MOTHUR_REF_DATA" ] ; then
echo Missing stability.files in the directory $MOTHUR_REF_DATA
exit 1
fi
$MOTHUR_REF_DATA/mothur "#make.contigs(file=stability.files, processors=10)"
$MOTHUR_REF_DATA/mothur "#summary.seqs(fasta=stability.trim.contigs.fasta)"
$MOTHUR_REF_DATA/mothur "#screen.seqs(fasta=stability.trim.contigs.fasta, group=stability.contigs.groups, maxambig=0, maxlength=295)"
$MOTHUR_REF_DATA/mothur "#summary.seqs(fasta=stability.trim.contigs.good.fasta)"
$MOTHUR_REF_DATA/mothur "#unique.seqs(fasta=stability.trim.contigs.good.fasta)"
$MOTHUR_REF_DATA/mothur "#count.seqs(name=stability.trim.contigs.good.names, group=stability.contigs.good.groups)"
$MOTHUR_REF_DATA/mothur "#pcr.seqs(fasta=$MOTHUR_REF_DATA/silva.nr_v119.align, start=13862, end=23444, keepdots=F, processors=10)"
$MOTHUR_REF_DATA/mothur "#system(mv $MOTHUR_REF_DATA/silva.nr_v119.pcr.align silva.v4.fasta)"
$MOTHUR_REF_DATA/mothur "#align.seqs(fasta=stability.trim.contigs.good.unique.fasta, reference=silva.v4.fasta)"
$MOTHUR_REF_DATA/mothur "#summary.seqs(fasta=stability.trim.contigs.good.unique.align, count=stability.trim.contigs.good.count_table)"
$MOTHUR_REF_DATA/mothur "#screen.seqs(fasta=stability.trim.contigs.good.unique.align, count=stability.trim.contigs.good.count_table, summary=stability.trim.contigs.good.unique.summary, start=8, end=9582, maxhomop=8)"
$MOTHUR_REF_DATA/mothur "#summary.seqs(fasta=stability.trim.contigs.good.unique.good.align)"
$MOTHUR_REF_DATA/mothur "#filter.seqs(fasta=stability.trim.contigs.good.unique.good.align, vertical=T, trump=.)"
$MOTHUR_REF_DATA/mothur "#unique.seqs(fasta=stability.trim.contigs.good.unique.good.filter.fasta, count=stability.trim.contigs.good.good.count_table)"
$MOTHUR_REF_DATA/mothur "#classify.seqs(fasta=stability.trim.contigs.good.unique.good.filter.unique.fasta, count=stability.trim.contigs.good.unique.good.filter.count_table, reference=$MOTHUR_REF_DATA/silva.nr_v119.align, taxonomy=$MOTHUR_REF_DATA/silva.nr_v119.tax, cutoff=80)"
$MOTHUR_REF_DATA/mothur "#remove.lineage(fasta=stability.trim.contigs.good.unique.good.filter.unique.fasta, count=stability.trim.contigs.good.unique.good.filter.count_table, taxonomy=stability.trim.contigs.good.unique.good.filter.unique.nr_v119.wang.taxonomy, taxon=Chloroplast-Mitochondria-unknown-Archaea-Eukaryota)"
$MOTHUR_REF_DATA/mothur "#dist.seqs(fasta=stability.trim.contigs.good.unique.good.filter.unique.pick.fasta, cutoff=0.20)"
$MOTHUR_REF_DATA/mothur "#cluster(column=stability.trim.contigs.good.unique.good.filter.unique.pick.dist, count=stability.trim.contigs.good.unique.good.filter.pick.count_table)"
$MOTHUR_REF_DATA/mothur "#make.shared(list=stability.trim.contigs.good.unique.good.filter.unique.pick.an.unique_list.list, count=stability.trim.contigs.good.unique.good.filter.pick.count_table, label=0.03)"
$MOTHUR_REF_DATA/mothur "#classify.otu(list=stability.trim.contigs.good.unique.good.filter.unique.pick.an.unique_list.list, count=stability.trim.contigs.good.unique.good.filter.pick.count_table, taxonomy=stability.trim.contigs.good.unique.good.filter.unique.nr_v119.wang.pick.taxonomy, label=0.03)"
$MOTHUR_REF_DATA/mothur "#make.biom(shared=stability.trim.contigs.good.unique.good.filter.unique.precluster.pick.pick.an.unique_list.shared, constaxonomy=stability.trim.contigs.good.unique.good.filter.unique.precluster.pick.pick.an.unique_list.0.03.cons.taxonomy)"