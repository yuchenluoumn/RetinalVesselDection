% image preprocess

function I_ve = bg_homo(I_green,I_mask)

  se = strel('disk',3,8);
  I_r = imopen(I_green,se);
  
  % applying 3X3 filter
  h = 1/3*ones(3,1);
  H = h*h';
  
  % im be your image
  imfilt = filter2(H,I_r);

  % further filter the image
  imfilt_1 = imgaussfilt(imfilt,1.8);
  h = 1/13*ones(13,1);
  H = h*h';
  
  % imfilter_1 be your image
  I_B = filter2(H,imfilt_1);

  % find the differences
  D= double(I_r)-I_B;

  % processing the D information by removing black background and
  % black boundary between white and black area
  iteration=6;

  for iteration_ii=1: iteration
    [Gx,Gy] = imgradientxy(I_mask);
    G_mag = (Gx.^2 + Gy.^2).^0.5;
    % reshape the matrix
    I_mask_array= reshape(I_mask,[],1);
    D_array= reshape(D,[],1);
    G_mag_array= reshape(G_mag,[],1);
    D_array_1= D_array;

    % manipulate the value of mask plot
    I_mask_array_1= I_mask_array; 
    % Use the mask to set the area outside the eyeball to be bright
    %D_array_1(I_mask_array==0)=max(D_array);
    D_array_1(I_mask_array==0)=20;
    D_array_2= D_array_1;
    I_mask_array_1 (G_mag_array~=0) = min(I_mask_array); % remove the boundary between bright area and dark area
    D2= reshape(D_array_2, size(D,1), size(D,2));
    I_mask1= reshape(I_mask_array_1, size(I_mask,1),size(I_mask,2)); % new mask has been generated
    I_mask= I_mask1;
  end

  I_ve= D2;


end

