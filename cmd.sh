#!/bin/bash -e


python3 scripts/MAP2B.py -i {input.datalist} -o MAP2B -e {params.enzyme_site} -s {params.database} -d database/micro -p 6 -g 5 {params.host} >{log.o} 2>{log.e}
python3 scripts/update_mapping_file_after_MAP2B.py -i MAP2B/none_micro_smp.txt -d ./ >{log.o} 2>{log.e}
