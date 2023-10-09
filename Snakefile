rule map2b:
    input:
        datalist = "cleandata_list.txt"
    output:
        abd = 'MAP2B/4.stat/Abundance.filtered.xls',
        abd_anno_utf8 = 'MAP2B/4.stat/Abundance.filtered.anno.utf8.xls',
        abd_anno = 'MAP2B/4.stat/Abundance.filtered.anno.xls'
    log:
        o = "logs/map2b/map2b.log.o",
        e = "logs/map2b/map2b.log.e"
    benchmark:
        "benchmarks/map2b/map2b.txt"
    params:
        enzyme_site = 5,
        database = 'GTDB',
        host = ''
    shell:
        """
	python3 /oeK8S/public/automation/projects/qingdao/DNA/dna/2bRAD-M/2023/08/DZQD20230777906-b4/Basic/scripts/MAP2B.py -i cleandata_list.txt -o MAP2B -e 5 -s GTDB -d /oeK8S/public/automation/projects/qingdao/DNA/dna/2bRAD-M/2023/08/DZQD20230777906-b4/Basic/database/micro -p 6 -g 5 1>log.o 2>log.e        
        python3 /oeK8S/public/automation/projects/qingdao/DNA/dna/2bRAD-M/2023/08/DZQD20230777906-b4/Basic/scripts/update_mapping_file_after_MAP2B.py -i MAP2B/none_micro_smp.txt -d ./ 1>log.o2 2>log.e2
	"""
