clc
clear all
close all
load Classifier; % load the trained image classifier
img = imread('741.png'); % testing image goes here

facedetector = vision.CascadeObjectDetector;
img = medfilt3(img);
facebox=facedetector(img);

if(~isempty(facebox)) % if face detected :)
    img=imcrop(img,facebox(1, :));
    img=imresize(img,[128 128]);
    img=rgb2gray(img);
    
    %% theepag code
%     [cleanimg] = NoiseRemoval(img);
%     img = ShadowRemoval(cleanimg);
%%
    [Features]=extractLBPFeatures(img);
    PredictedClass=predict(Classifier,Features);
    PredictedClass=char(PredictedClass);
    imshow(img)
    title(PredictedClass);
else % if face not detected in image :(
    imshow(img)
    title("face not detected");
end
    