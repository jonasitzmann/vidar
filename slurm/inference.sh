#!/bin/bash
#SBATCH --time=20:0
#SBATCH --gres=gpu:1
#SBATCH --mem=10G
#SBATCH --partition=debug
#SBATCH --out=log/%j.out

echo checkpoint path: $1
srun --unbuffered  /beegfs/work/sitzmann/anaconda3/envs/vidar/bin/python scripts/run.py configs/sitzmann/cluster/inference_kitti.yaml --arch.model.checkpoint $1
