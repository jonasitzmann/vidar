#!/bin/bash
#SBATCH --time=20:0
#SBATCH --gres=gpu:1
#SBATCH --mem=10G
#SBATCH --partition=debug
#SBATCH --out=log/%j.out

source activate vidar
which python
srun --unbuffered  python scripts/run.py configs/overfit/kitti_tiny.yaml
