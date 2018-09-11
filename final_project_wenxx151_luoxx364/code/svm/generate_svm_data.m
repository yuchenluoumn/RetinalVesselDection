% generating data to be used in svm

function generate_svm_data(train_set, train_label, test_set, test_label)

  numAttribute = size(train_set,2);
  numExamples =  size(train_set,1);

  fprintf('generating data for svm use.\n');

  % generate training data (including label)
  fid = fopen('train_data_svm','w')
  fprintf(fid,'#vessel recognition data generated from matlab\n');
  for i = 1:numExamples
    fprintf(fid, '%d 1:%-13.5e 2:%-13.5e 3:%-13.5e\n', train_label(i),train_set(i,1), train_set(i,2), train_set(i,3) );
  end
  
  
  numAttribute = size(test_set,2);
  numExamples =  size(test_set,1);
  % generate test data 
  fid = fopen('test_data_svm','w')
  fprintf(fid,'#vessel recognition data generated from matlab\n');
  for i = 1:numExamples
    fprintf(fid, '0 1:%-13.5e 2:%-13.5e 3:%-13.5e\n', test_set(i,1), test_set(i,2), test_set(i,3) );
  end
    
  % generate test label
  fid = fopen('test_label','w')
  for i = 1:numExamples
    fprintf(fid, '%d\n', test_label(i));
  end
     
end