rootFolder=fullfile('labelled_data');
categories = {'cataract','normal_fundus'};

imds = imageDatastore(fullfile(rootFolder,categories),'LabelSource','foldernames');

tbl = countEachLabel(imds);
Count = min(tbl{:,2});

imds =splitEachLabel(imds,Count,'randomize');
countEachLabel(imds);

cataract = find(imds.Labels == 'cataract',1);
normal_fundus = find(imds.Labels=='normal_fundus',1);
net = resnet50();

net.Layers(1);
net.Layers(end);

[trainingSet,testSet] = splitEachLabel(imds,0.3,'randomize');

imagesize =net.Layers(1).InputSize;

augmentedTrainingSet=augmentedImageDatastore(imagesize, ...
    trainingSet,"ColorPreprocessing","gray2rgb");

augmentedTestSet=augmentedImageDatastore(imagesize, ...
    testSet,"ColorPreprocessing","gray2rgb");

w1= net.Layers(2).Weights;

w1 = mat2gray(w1);

% figure
% montage(w1)
% title('First cl weight');

featureLayer ='fc1000';
trainingFeatures = activations(net, ...
    augmentedTrainingSet,featureLayer,'MiniBatchSize',32,'OutputAs','columns');

trainingLabels=trainingSet.Labels;
classifier =fitcecoc(trainingFeatures,trainingLabels,...
    'Learner','Linear','Coding','onevsall','ObservationsIn','columns');

testFeatures = activations(net,...
    augmentedTestSet,featureLayer,'MiniBatchSize',32,'OutputAs','columns');
predictLabels = predict(classifier,testFeatures,'ObservationsIn','columns');

testLabels = testSet.Labels;
confMat = confusionmat(testLabels,predictLabels)

confMat= bsxfun(@rdivide,confMat,sum(confMat,2));

mean(diag(confMat))

newImage = imread(fullfile('188_right.jpg'));
 
ds = augmentedImageDatastore(imagesize, ...
     newImage,"ColorPreprocessing","gray2rgb");
 
imageFeatures = activations(net, ...
     ds ,featureLayer,'MiniBatchSize',32,'OutputAs','columns');
 
label = predict(classifier,imageFeatures,'ObservationsIn','columns');
 
sprintf('The loaded image belongs to %s class',label);
 
