# PNLS — Matlab Implementation 
This repository contains the Matlab implementation of the following paper:
> **Non-local Image Smoothing with Objective Evaluation**
>
> **Abstract:** With the rapid development of image processing techniques, image smoothing has gained increasing attention due to its important role in other image processing tasks, e.g., image editing and enhancement.
However, the evaluation of image smoothing methods is subjectively performed on datasets without proper ground truth images. Therefore, an image smoothing benchmark with reasonable ground-truths is essential to prosper the image smoothing community.
In this paper, we construct a new Nankai Smoothing (NKS) dataset containing $200$ versatile images blended by natural textures and structure images.
The structure images are inherent smooth and can be safely taken as ground truths. On our NKS dataset, we comprehensively evaluate 14 popular image smoothing algorithms.
Moreover, we propose a novel Pixel-level Non-Local Smoothing (PNLS) method, exploiting better the non-local self-similarity of natural images to well preserve the structure of the smoothed images. Extensive experiments on several benchmark datasets demonstrate that our PNLS is very effective on the image smoothing task.
Comprehensive ablation studies also reveal the work mechanism of our PNLS on image smoothing.To further show its effectiveness, we apply the proposed PNLS on semantic region smoothing, detail/edge enhancement, and image abstraction. The benchmark and code will be publicly released. 

## Resources
Material related to our paper is available via the following links:
- Code: https://github.com/zal0302/PNLS
- NKS dataset (Baidu Netdisk): https://pan.baidu.com/s/1bd0TlpZV1Nl71ziSYwG2Gg (**Extracted Code: ect6**)
- NKS dataset (Google Drive): https://drive.google.com/drive/folders/1rsWLc7kpyM2VfGwY_Gu94TH2bnt3ywfV?usp=sharing

## System requirements
Both Linux and Windows are supported.

## NKS dataset
We observe that vector images can be safely regarded as smooth structure images, and construct our NKS dataset by blending vector images and texture images. To generate mixed structure and texture images, we blend each of the 20 structure images and each of the 10 natural textures in a reasonable manner. Each structure image can be safely taken as the ground truth for the corresponding images blended by that structure image and the 10 natural textures. We first mix the structure vector images and natural textures. Since directly adding structure and texture images together would result in overflow of pixel values, we mix the two components in proper proportions. Directly adding the natural color textures to the structure images would produce severe color distortion in the blended images, and existing image smoothing methods would suffer from poor performance on the directly blended images. Therefore, we need to adjust separately the brightness of the Red, Green, and Blue channels of the blended images, to attenuate the color distortion from the corresponding structure images.
<div align=center><img src="https://github.com/zal0302/PNLS/blob/master/figs/data.png" width="1000"  /></div>
Examples of our NKS dataset.
<div align=center><img src="https://github.com/zal0302/PNLS/blob/master/figs/gt.png" width="1000"  /></div>
The 20 structure images we used in NKS dataset.
<div align=center><img src="https://github.com/zal0302/PNLS/blob/master/figs/texture.png" width="1000"  /></div>
The 10 natural texture images we used in NKS dataset.
<div align=center><img src="https://github.com/zal0302/PNLS/blob/master/figs/fusion.png" width="1000"  /></div>
Flowchart of the image blending process.

## Benchmarking Image Smoothing on our NKS dataset
<div align=center><img src="https://github.com/zal0302/PNLS/blob/master/figs/benchmark.png" width="650"  /></div>

## Visual Results
<div align=center><img src="https://github.com/zal0302/PNLS/blob/master/figs/nks.png" width="1000"  /></div>
Comparison of smoothed images and PSNR(dB)/SSIM/FSIM results by different methods on the image S15T1 from our NKS dataset.
<div align=center><img src="https://github.com/zal0302/PNLS/blob/master/figs/div.png" width="1000"  /></div>
Comparison of smoothed images by different methods on the image 0117 from DIV2K dataset.
<div align=center><img src="https://github.com/zal0302/PNLS/blob/master/figs/rtv.png" width="1000"  /></div>
Comparison of smoothed images by different methods on the image 03_11 from RTV dataset.
<div align=center><img src="https://github.com/zal0302/PNLS/blob/master/figs/500.png" width="1000"  /></div>
Comparison of smoothed images by different methods on the image 0334 from 500images dataset.

## Citation
If you find the code helpful in your resarch or work, please cite the following papers.
```
@Misc{pnls,
title = {Non-local Image Smoothing with Objective Evaluation},
author = {Z.-A. Liu and Y.-K. Hou and J. Xu and X.-T. Zhen and L. Shao and M.-M. Cheng},
year={2020}
}
```
