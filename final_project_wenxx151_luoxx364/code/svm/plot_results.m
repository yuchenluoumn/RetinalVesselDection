% compute classified error and show the result
N_row = 584;
N_col = 565;  
  
% read classfied label
fid = fopen('predicted_label','r');
formatSpec = '%d';
classified_label = fscanf(fid,formatSpec);

% read test label
fid = fopen('test_label','r');
formatSpec = '%d';
test_label = fscanf(fid,formatSpec);

  
%% compute classification error
error = classify_error(classified_label, test_label);
fprintf('There are %d pixels mis-classfied.',error);


%% show the classfied image 
grey_img = reshape(classified_label, [N_col, N_row]);
grey_img = transpose(grey_img);

figure
imshow(grey_img);
