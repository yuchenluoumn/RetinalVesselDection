% get the green chanels of the input image and the corresponding label (the 
% hand drawn vessel image) 

function  [I_green] = read_img_mask(fin_img)

 % read image 
 [X,map] = imread(fin_img);
 I_rgb = X;
 % convert indexed image to RGB 
 if ~isempty(map)
    I_rgb = ind2rgb(X,map);
 end
 I_green = I_rgb(:,:,2);
  
end


