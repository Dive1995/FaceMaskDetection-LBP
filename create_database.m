% create seperate folder for each class with image and do this for every
% class

cd with-mask; % get inside a class image folder

images = dir('*.png') ;  % Get all images of the folder 
N = length(images) ;     % number o fimages 

facedetector=vision.CascadeObjectDetector; 

% loop through every image and do face detection, resize, save image to a
% new folder
for i = 1:N
    I = imread(images(i).name) ;   % Read image 
    I = medfilt3(I); %med filter
    
    % from theepag code
%     I=imresize(I,[200 300]);
%     [cleanimg] = NoiseRemoval(I);
%     I = ShadowRemoval(cleanimg);

    facebox = facedetector(I);
    mkdir 'mask weared'; % reate new dir to save images
    
    if(sum(sum(facebox))~=0) % if face detected
        I=imcrop(I,facebox(1, :)); % crop detected face
        I=imresize(I,[128 128]); % resize image
        fullFileName = fullfile('mask weared', strcat(num2str(i),'.jpeg'));
        imwrite(I,fullFileName);   % Save image
    end
    
end