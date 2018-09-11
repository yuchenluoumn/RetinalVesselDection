clear
clc

%% generate training data (including label)

% number of classes
num_class = 2;
  
% read data
% image name
f_img = 'train_set.tif';
% label name
f_label = 'train_label.gif';
% mask name
f_mask = 'train_mask.gif';

% get image and the corresponding label data
[I_img] = read_img(f_img); 
[I_label] = read_img(f_label);
[I_mask] = read_img(f_mask);  

% preprocess igmage to get homogenerous background
I_bghomo = bg_homo(I_img,I_mask);

% get training set (pixel based gray scale, gradient magnitude, and 
% eigenvalue of hessian)
train_set = generate_data_set(I_bghomo);

% generate label
train_label = generate_label(I_label,num_class);



%% generate test data (including label)

% image name
f_img = 'test_set.tif';
% label name
f_label = 'test_label.gif';
% mask name
f_mask ='test_mask.gif';

% get image and the corresponding label data
[I_img] = read_img(f_img);
[I_label] = read_img(f_label);
[I_mask] = read_img(f_mask);  

% preprocess igmage to get homogenerous background
I_bghomo = bg_homo(I_img,I_mask);
figure
imshow(I_bghomo,[])

% get test set (pixel based gray scale, gradient magnitude, and 
% eigenvalue of hessian)
test_set = generate_data_set(I_bghomo);

% generate label
test_label = generate_label(I_label, num_class);



%%  k-nn classification 

% number of neighbors
k = 800;
classified_label = k_nn(train_set, train_label, test_set, k);

%% compute classification error
error = classify_error(classified_label, test_label);
fprintf('There are %d pixels mis-classfied.',error);

%% show the classfied image 
N_row = size(I_img,1);
N_col = size(I_img,2);
grey_img = reshape(classified_label, [N_col, N_row]);
grey_img = transpose(grey_img);

figure
imshow(grey_img);


