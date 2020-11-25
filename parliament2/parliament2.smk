rule run_parliament2:
  input:
    BAM=config["input"],
    REF=config["reference"]
  output:
    directory("parliament2")
  message:
    "Running Parliament on bam files"
  container:
    "docker://dnanexus/parliament2:0.1.11"
  script:
    "/home/dnanexus/parliament2.py --bam {input.BAM} --bai {input.BAM}.bai -r {input.REF} --fai {input.REF}.fai --breakdancer --cnvnator --manta --genotype --svviz --lumpy --delly_deletion --delly_insertion --delly_inversion --delly_duplication"
