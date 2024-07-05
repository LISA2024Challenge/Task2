#!/bin/bash

#SBATCH -J F0_nn_Gli
#SBATCH -p gpu
#SBATCH --nodes=1
#SBATCH --ntasks=32
#SBATCH --gres=gpu:1
##SBATCH –nodelist=pphpcgpu[01]
#SBATCH --mem=32G
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

nnUNetv2_train 999 3d_fullres 0 --npz

echo 'End--------------'
date
echo '-----------------'

