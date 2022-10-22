# TRI-VIDAR - Copyright 2022 Toyota Research Institute.  All rights reserved.

import os

import fire
import torch

import sys
sys.path.append('../vidar')
from vidar.core.trainer import Trainer
from vidar.core.wrapper import Wrapper
from vidar.utils.config import read_config


def train(cfg, **kwargs):
    cfg = read_config(cfg, **kwargs)
    use_cpu = vars(cfg).get('use_cpu', False)
    os.environ['DIST_MODE'] = 'gpu' if (torch.cuda.is_available() and not use_cpu) else 'cpu'
    wrapper = Wrapper(cfg, verbose=True)
    trainer = Trainer(cfg)
    trainer.learn(wrapper)


if __name__ == '__main__':
    normal_repr = torch.Tensor.__repr__
    torch.Tensor.__repr__ = lambda x: f"{list(x.shape)}_{normal_repr(x)}"
    fire.Fire(train)
