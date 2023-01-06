# Code snippet to initiate download of CLIP models
# Taken from examples on https://github.com/openai/CLIP

import torch
import clip
from PIL import Image

model, preprocess = clip.load("ViT-B/32", device="cpu")
