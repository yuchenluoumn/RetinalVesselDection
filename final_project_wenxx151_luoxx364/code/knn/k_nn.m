% k-nn classfication 

function clf_label = k_nn(train_set, train_label, test_set, k)
  
  fprintf('The number of points in each img is: %d\n',size(test_set,1));
  
  for i = 1:size(test_set,1)    % loop over test set
    
    % show running status
    if mod(i,500) == 1
      fprintf('We are running point %d\n',i);
    end
    
    % find nearest neighbors
    test_set_mat = repmat(test_set(i,:),size(train_set,1),1);
    difference = test_set_mat - train_set;
    neigh = sum(difference.^2,2); % sum of squares of each row
    neigh = [neigh,train_label];
    
    
    neigh = sortrows(neigh);     % sort the distance and labels according to distance
    label_first_k = neigh(1:k,2);  % the first k labels
   
    % for KNN use the following two lines
    M = mode(label_first_k);       % find the label M with max count
    clf_label(i) = M;            % record the classfication label
     
    % for modified KNN use the following line
%    clf_label(i) = mean(label_first_k);

  end
  
end