cd with-mask;
mkdir 'mask weared';
images = dir('*.jpeg') ;  % Get all images of the folder 
N = length(images) ;     % number o fimages 
facedetector=vision.CascadeObjectDetector;

% folder=dir('images');

for i = 1:N
    I = imread(images(i).name) ;   % Read image 
    facebox = facedetector(I);
    
    if(sum(sum(facebox))~=0)
        I=imcrop(I,facebox(1, :)); % crop detected face
        I=imresize(I,[128 128]); % resize image
        fullFileName = fullfile('mask weared', strcat(num2str(i),'.jpeg'));
        imwrite(I,fullFileName);   % Save image
    end
    
%     I = insertObjectAnnotation(I,'rectangle',facebox,'Face'); 

%      for j = 1 : size(facebox, 1) 
%        I = imcrop(I, facebox(j, :));
%      end
    
end