#!/bin/bash

#SBATCH -J F4_nnUNet_SS
#SBATCH -p gpu
#SBATCH --nodes=1
#SBATCH --ntasks=16
#SBATCH --gres=gpu:1
#SBATCH --mem=64G
#SBATCH --time=4000

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

nnUNetv2_predict -d Dataset999_LISA -i T2_Val/Inputs -o T2_Val/Outputs -f  0 -tr nnUNetTrainer -c 3d_fullres -p nnUNetPlans

echo 'End--------------'
date
echo '-----------------'

