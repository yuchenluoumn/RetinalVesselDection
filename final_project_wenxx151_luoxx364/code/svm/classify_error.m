% compute classification error 

function err = classify_error(clf_label, test_label)

  err = 0;
  for i = 1:size(test_label,1)  
    if clf_label(i) ~= test_label(i)
      err = err + 1;             % mis-classified
    end
  end
  
end
