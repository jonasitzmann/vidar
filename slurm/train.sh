#!/bin/bash
#SBATCH --time=200:00:0
#SBATCH --gres=gpu:1
#SBATCH --mem=10G
#SBATCH --partition=gpu
#SBATCH --out=log/%j.out

srun --unbuffered  /beegfs/work/sitzmann/anaconda3/envs/vidar/bin/python scripts/run.py configs/sitzmann/cluster/training_kitti.yaml
