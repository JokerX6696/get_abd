#!/bin/bash
# 常用处理 cleandata_list 命令
set -e
cleandata_dir='/storge1/automation/projects/storge1/2bRAD-M/DZOE20230778972-b1/Suppl_2/cleandata'
paste -d '\t' \
<(ls ${cleandata_dir}/*|sed 's|\S*/||g;s/.BcgI.fq.gz//g;s/.fq.gz//g') \
<(ls ${cleandata_dir}/*)  \
> cleandata_list.txt