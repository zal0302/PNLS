function imr_final = PNLS_DT(im_texture)

   im_n = im_texture;  %% read a image
    
   [M1,M2,M3]=size(im_n);
   
  
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%  Colorspace in which we perform smoothing. Patch matching is applied to the first
%%%%  component and the matching information is re-used for the other two.
%%%%
if (exist('colorspace') ~= 1),
    colorspace              = 'opp'; %%% (valid colorspaces are: 'yCbCr' and 'opp')
end
   
    
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Change colorspace, compute the l2-norms of the new color channels
%%
[zColSpace l2normLumChrom] = function_rgb2LumChrom(im_n, colorspace);
im=zColSpace; 

impp(:,:) = max(im(:,:,2),im(:,:,3));

LAB = RGB2Lab(im_n);

%%%%% Parameters 
R = 9;      % window size
s = 4;      % step of extracting reference patches
m = 4;      % patch size
N = 9;      % iteration number
Thr = 0.4;  % threshold

      
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

imp1 = LAB(:,:,1)/255;
imp2 = LAB(:,:,2)/255;
imp3 = LAB(:,:,3)/255;
imr1 = imp1;
imr2 = imp2;
imr3 = imp3;

%%%%%% Main function


for ll = 1:N 


        [imr1,imr2,imr3] = PNLS_Detexture(m,R,s,double(imr1),double(imr2),double(imr3),single(Thr),double(impp));
        fprintf('Iteration step %d\n',ll);
end 

im_basic = zeros(M1,M2,M3);
im_basic(:,:,1)=imr1(:,:);
im_basic(:,:,2)=imr2(:,:);
im_basic(:,:,3)=imr3(:,:);

im_basic = double(im_basic)*255.0;

im_b = Lab2RGB(im_basic);

imr_final = double(im_b)/255;


end

