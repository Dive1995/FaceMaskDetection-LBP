imds = imageDatastore('testing','IncludeSubFolders',true,'LabelSource','foldernames');
trainingFeatures=[];
trainingLabels=imds.Labels;

for i=1:numel(imds.Files)
    img=readimage(imds,i);
    trainingFeatures(i,:)=extractLBPFeatures(rgb2gray(img));
end
Classifier = fitcecoc(trainingFeatures,trainingLabels);
save Classifier Classifier