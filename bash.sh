#!/bin/bash
#SBATCH --job-name=ebner
#SBATCH --account=lcnrtx  #lcn
#SBATCH --partition=rtx6000 #rtx6000    #lcnv100    # Specify the partition name (e.g., main, gpu, etc.)
#SBATCH --nodes=1                 # Number of nodes (1 for a single node)
#SBATCH --ntasks-per-node=1       # Number of tasks per node (1 for a single task)
#SBATCH --cpus-per-task=3         # Number of CPU cores per task (adjust as needed)
#SBATCH --gres=gpu:1     # Request GPU resources if needed
#SBATCH --time=0-04:00:00       # Requested time limit (e.g., 1:00:00 for 1 hour)
#SBATCH --mem=10G      # Requested memory per node (e.g., 4G for 4 gigabytes)
#SBATCH --output=jupyterlab.log

# Load necessary modules (adjust as needed)
#imodule load anaconda/3.7  # Load Anaconda module

# Activate a conda environment if needed
source ~/.bashrc

source activate py3.6

# Launch JupyterLab

#export PYTHONPATH=$PYTHONPATH:/autofs/space/bal_004/users/jd1677/neurite-sandbox/:/autofs/space/bal_004/users/jd1677/voxelmorph-sandbox:/autofs/space/bal_004/users/jd1677/neurite

export PYTHONPATH=$PYTHONPATH:/autofs/space/bal_004/users/jd1677/ebner-2020/Demic

jupyter-lab --ip=0.0.0.0 --port=8888 --no-browse \
--num_gpus=1 --batch_size=32 --model=vgg19 --data_format=NHWC


