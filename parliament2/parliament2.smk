rule run_parliament2:
  input:
    BAM=config["input"],
    REF=config["reference"]
  output:
    "parliament2/lumpy.vcf",
    "parliament2/lumpy.disconcordant.bam",
    "parliament2/lumpy.splitters.bam",
    "parliament2/manta.diploidSV.vcf",
    "parliament2/manta.alignmentStats.txt",
    "parliament2/breakdancer.ctx",
    "parliament2/cnvnator.output",
    "parliament2/cnvnator.vcf",
    "parliament2/delly.deletion.vcf",
    "parliament2/delly.insertion.vcf",
    "parliament2/delly.inversion.vcf",
    "parliament2/delly.duplication.vcf",
    "parliament2/delly.translocation.vcf",
    "parliament2/delly.svtyped.vcf",
    "parliament2/cnvnator.svtyped.vcf",
    "parliament2/lumpy.svtyped.vcf",
    "parliament2/manta.svtyped.vcf",
    "parliament2/breakdancer.svtyped.vcf",
    "parliament2/combined.genotyped.vcf",
    "parliament2/svviz_outputs.tar.gz"
  message:
    "Running Parliament on {input.BAM}"
  container:
    "docker://dnanexus/parliament2:0.1.11"
  shell:
    "/home/dnanexus/parliament2.py --bam {input.BAM} --bai {input.BAM}.bai -r {input.REF} --fai {input.REF}.fai --breakdancer --cnvnator --manta --genotype --svviz --lumpy --delly_deletion --delly_insertion --delly_inversion --delly_duplication"
