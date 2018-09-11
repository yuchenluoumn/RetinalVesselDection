# RetinalVesselDection
Retinal vessel examination plays an important role in the diagnosis of diabetes, a lead
ing cause of blindness in the western countries. The examination employs the optical
diagnostic method by taking digital images of the eyeball without intruding or harming
peoples body. The task remains to separate the retinal vessels from the digital images.
It is time-consuming and challenging even for trained specialists. Machine learning
methods have been introduced to automate the separation procedure so as to increase
the efficiency of the examination process. In this report, we explored the retinal 
vessel separation process with a combination of image processing and machine learning
methods. Image preprocessing is used to reduce the noise in the raw eyeball image.
Machine learning algorithm is used to construct a classifier which takes advantage of
specialist’s hand-drawn retinal vessels as training label to separate the vessel from
the background efficiently. K-nearest neighbor (K-NN) and Support Vector Machine
(SVM) are implemented, and a modified K-NN method is used to improve the result.
Different definitions of distance in the K-NN methods are used to find the importance
of different features of eye vessel image. The errors are estimated by comparing the
algorithm classified labels with the specialist’s hand-drawn image. K-NN is self-coded
Matlab program by using the knowledge learned in the class, and SVM is understood
in the theoretical level and implemented with PyML (a python based machine learning
package). The error rate of both methods are around 6%. K-NN yields slightly better
results compared SVM, and a better result is achieved by modified K-NN. Different
distance definition influences the result of the segmentation slightly. Possible 
Improvement of the strategies of the machine learning methods are discussed in the report as
well.
