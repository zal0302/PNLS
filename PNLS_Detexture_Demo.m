clear;close all;clc

Itexture = im2double(imread('0383.png'));

tic,
 
Idetexture = PNLS_DT(Itexture);
 
toc,
 
figure,imshow(Itexture);
 
figure,imshow(Idetexture);
 
