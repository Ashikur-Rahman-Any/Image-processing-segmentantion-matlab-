

clc
clear all
close all
photo=imread('capture.png');

[or,ap]=fruitSeller(photo);

function [oranges, apples] = fruitSeller(immmgg)

%% hsv thresholding ,orange

image = immmgg;
%subplot(221), imshow(image)
image=rgb2hsv(image);


tempimg = image(:,:,1); 
%%


orange = tempimg < 0.1;
%subplot(222), imshow(orange)

s=strel('disk',15);
orange=imerode(orange,s);
%subplot(223),imshow(orange);
orange=imdilate(orange,s);
%subplot(224),imshow(orange);


%subplot(223), imshow(orange)


%%
%apple
apple1 = tempimg>0.4 ;
apple2 = tempimg > 0.1;
%subplot(222), imshow(apple1)

%subplot(223), imshow(apple2)



finalaple = ((~apple1) & apple2 ) ;
%subplot(224), imshow(finalaple)

s=strel('disk',15);
finalaple=imerode(finalaple,s);
%subplot(223),imshow(finalaple);
finalaple=imdilate(finalaple,s);
%subplot(224),imshow(finalaple);


%subplot(223), imshow(finalaple)



%% Applying regionprops over an image

image=hsv2rgb(image);
figure, imshow(image);
title('Drawing Bounding Box over original image')
hold on;
%%
%apple
stats = regionprops(finalaple);
for apples=1:length(stats)
    rectangle('Position', stats(apples).BoundingBox, 'LineWidth', 2, 'EdgeColor', 'g');
end

%%
stats = regionprops(orange);
for oranges=1:length(stats)
    rectangle('Position', stats(oranges).BoundingBox, 'LineWidth', 2, 'EdgeColor', 'r');
end

end
