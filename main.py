import os
import sys
import math

# !export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64/

import time
from Demic.util.parse_config import parse_config
from test import model_test
import tensorflow as tf

import os

data_folder = 'data/'  # Change this to your data folder path

input_files = [file for file in os.listdir(data_folder) if file.endswith('.nii.gz')]

data_config = {}
for input_file in input_files:
    input_path = os.path.join(data_folder, input_file)
    segment_output = os.path.splitext(input_file)[0] + '_segment.nii.gz'
    segment_output_path = os.path.join(data_folder, segment_output)
    
    data_config[input_file] = {
        'input': input_path,
        'segment_output': segment_output_path
    }

    
net_config_file = 'cfg_net.txt'
net_config = parse_config(net_config_file)
model_test(net_config, data_config)