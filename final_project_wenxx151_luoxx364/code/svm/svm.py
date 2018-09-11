from PyML import *

# read training data
train_data = SparseDataSet('train_data_svm') 
test_data = SparseDataSet('test_data_svm')

# get to know some statistics of the training data
print train_data

# get the svm kenal

s = SVM()

#s.C = [0.4, 0.5]

# train 
s.train(train_data)

# test
s.save('model')
new_svm = SVM()
new_svm.load('model', train_data)

results = new_svm.test(test_data)

# get predicted labels
labels = results.getPredictedLabels()

#print results
with open('predicted_label','w') as fout:
  for i in labels:
    fout.write(i+'\n')

