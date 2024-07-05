#!/bin/bash

#SBATCH -J nnUNet_SS_PP
#SBATCH -p cpu
#SBATCH --nodes=1
#SBATCH --ntasks=24
#SBATCH --mem=32G
#SBATCH --time=200

module load anaconda3
module load cuda
conda activate nnUNet

cd /groups/lingurarugrp/LISA/Task2

export nnUNet_raw='/groups/lingurarugrp/LISA/Task2/nnUNet_raw'
export nnUNet_preprocessed='preprocessed'
export nnUNet_results='results'

echo 'Start------------'
date
echo '-----------------'

nnUNetv2_plan_and_preprocess -d 999 --verify_dataset_integrity -c 3d_fullres --verbose

echo 'End--------------'
date
echo '-----------------'

